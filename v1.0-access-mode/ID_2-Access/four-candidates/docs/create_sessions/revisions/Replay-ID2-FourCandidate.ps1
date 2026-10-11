# PowerShell 7; pwsh must be available on PATH.
# Use a fresh working copy; preserve the collection source.
$ErrorActionPreference = 'Stop'
if ($PSVersionTable.PSVersion.Major -lt 7) {
  throw 'Run this example in PowerShell 7.'
}
$sourceRoot = Join-Path 'C:\access-pod-v1.0\v1.0-access-mode' `
  'ID_2-Access\four-candidates'
$assessmentRoot = 'C:\Anthony Siljeg\Access PoD assessment'
$workBase = Join-Path $assessmentRoot `
  'working\id2-word-guide-20261011\technical'
$workingRoot = Join-Path $workBase 'replay'
if (Test-Path -LiteralPath $workingRoot) {
  throw 'Working copy already exists. Choose a fresh folder.'
}
$pwshPath = (Get-Command pwsh -CommandType Application |
  Select-Object -First 1).Source
Copy-Item -LiteralPath $sourceRoot -Destination $workingRoot -Recurse

$dayRoot = Join-Path $workingRoot 'records\sessions\2026-04-11'
$baseId = 'ID2-20260411-1400-qpath-tr008-run'
$moduleName = 'module_03_sapp_simulation_stress_testing_ID_2.json'
$baselineFolder = Join-Path $dayRoot "baseline\$baseId\artifacts"
$baselinePath = Join-Path $baselineFolder $moduleName
$variantsRoot = Join-Path $dayRoot 'variants'
$outFolder = Join-Path $workingRoot 'records\comparisons\guide-replay'
$outJson = Join-Path $outFolder 'id2_comparison_summary.json'
$wrapper = Join-Path $workingRoot `
  'scripts\primary\Run-ID2-StressComparison.ps1'

# The wrapper normalizes Module 03 working files and creates backups.
# Do not use -MarkCompleted when replaying the supplied draft records.
& $pwshPath -NoProfile -File $wrapper `
  -BaselinePath $baselinePath `
  -VariantsRoot $variantsRoot `
  -RecordsRoot $dayRoot `
  -OutJson $outJson
if ($LASTEXITCODE -ne 0) {
  throw 'Comparison failed. Read the console output.'
}
if (-not (Test-Path -LiteralPath $outJson)) {
  throw 'Comparison output was not created.'
}
$summary = Get-Content -LiteralPath $outJson -Raw |
  ConvertFrom-Json -Depth 100
if ($summary.baseline -ne $baselinePath) {
  throw 'The output baseline is not the requested baseline.'
}
if (@($summary.results).Count -ne 3 -or
    $summary.aggregate.variants_count -ne 3) {
  throw 'Expected one baseline plus three variant results.'
}
$expectedVariants = foreach ($case in @(
  'ambiguity', 'lifecycleboundary', 'timepressure'
)) {
  $candidate = Join-Path $variantsRoot "$baseId-$case\artifacts"
  Join-Path $candidate $moduleName
}
$actualVariants = @($summary.results | ForEach-Object variant_file)
if (@(Compare-Object $expectedVariants $actualVariants).Count -ne 0) {
  throw 'The output does not contain all three expected variants.'
}
Write-Host 'Verified: baseline plus three variants.'
Write-Host "Summary: $outJson"
