<#
Add-ID2StressCategoryTags.ps1
Adds (or updates) simulation_runs[*].stress_category_tags in an ID_2 Module 03 JSON file.

Usage:
  pwsh .\Add-ID2StressCategoryTags.ps1 -Path "...\module_03_sapp_simulation_stress_testing_ID_2.json"
  pwsh .\Add-ID2StressCategoryTags.ps1 -Path "...\module_03_sapp_simulation_stress_testing_ID_2.json" -Tags "authority,telemetry,incentive,ethical,delegation"

Notes:
- Safe: makes a timestamped backup before saving
- Robust: uses Add-Member -Force to ensure property exists
#>

param(
  [Parameter(Mandatory = $true)]
  [string]$Path,

  [string]$Tags = "authority,telemetry,incentive,ethical,delegation"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path $Path)) {
  throw "File not found: $Path"
}

# Parse tags (comma-separated)
$tagList = $Tags.Split(',') |
  ForEach-Object { $_.Trim().ToLower() } |
  Where-Object { $_ -ne "" } |
  Select-Object -Unique

# Load JSON
$j = Get-Content -Raw -Path $Path | ConvertFrom-Json -Depth 100

# Validate expected structure
if (-not $j.PSObject.Properties.Match("simulation_runs")) {
  throw "Missing 'simulation_runs' property in JSON: $Path"
}

if ($null -eq $j.simulation_runs) {
  throw "'simulation_runs' is null in JSON: $Path"
}

# Ensure array form
$simRuns = @($j.simulation_runs)
if ($simRuns.Count -eq 0) {
  throw "No simulation_runs found. This script expects Module 03 JSON with simulation_runs[]. Path: $Path"
}

# Apply tags to each run
for ($i = 0; $i -lt $simRuns.Count; $i++) {
  $run = $simRuns[$i]

  # Ensure property exists and set it
  $run | Add-Member -MemberType NoteProperty -Name "stress_category_tags" -Value @($tagList) -Force

  $simRuns[$i] = $run
}

# Write back
$j.simulation_runs = $simRuns

# Backup then save
$backup = "$Path.bak." + (Get-Date -Format "yyyyMMdd-HHmmss")
Copy-Item -Path $Path -Destination $backup -Force | Out-Null

$j | ConvertTo-Json -Depth 100 | Set-Content -Path $Path -Encoding UTF8

Write-Host "Updated stress_category_tags in $($simRuns.Count) run(s)." -ForegroundColor Green
Write-Host "Tags: $($tagList -join ', ')" -ForegroundColor DarkGray
Write-Host "Saved:  $Path"
Write-Host "Backup: $backup" -ForegroundColor DarkGray
