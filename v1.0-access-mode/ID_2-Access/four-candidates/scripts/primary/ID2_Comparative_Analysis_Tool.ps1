<#
ID2_Comparative_Analysis_Tool.ps1
Exploratory comparison of baseline vs one-or-many ID_2 Module 03 JSON sessions.

Outputs:
- Delta summary (added/removed/net + replacement detection)
- Beginner-friendly notes with concrete examples
- Cross-variant recurrence (net-new items across variants)
- Optional JSON export

Non-authoritative. Exploratory only.
Does not assert adequacy, compliance, certification, or readiness.
#>

param(
  [Parameter(Mandatory=$true)]
  [string]$BaselinePath,

  [Parameter(Mandatory=$true)]
  [string]$VariantsRoot,

  [string]$OutJson = ""
)

function Load-Json([string]$path) {
  if (-not (Test-Path $path)) { throw "Missing file: $path" }
  return (Get-Content -Raw $path | ConvertFrom-Json -Depth 200)
}

# ---------------------------
# HARDENING: arrays-only coercion
# ---------------------------
function Ensure-Array($value) {
  if ($null -eq $value) { return @() }

  if ($value -is [string]) {
    $s = $value.Trim()
    if ($s -eq "") { return @() }
    return @($s)
  }

  if ($value -is [System.Collections.IEnumerable] -and -not ($value -is [string])) {
    return @($value)
  }

  return @($value)
}

function Get-Array($obj, [string]$prop) {
  if ($null -eq $obj) { return @() }
  if (-not ($obj.PSObject.Properties.Name -contains $prop)) { return @() }
  return (Ensure-Array $obj.$prop)
}

function To-Set($arr) {
  $set = @{}
  foreach ($x in @($arr)) {
    if ($null -ne $x -and $x.ToString().Trim() -ne "") { $set[$x.ToString()] = $true }
  }
  return $set
}

function Diff-List($baseArr, $varArr) {
  $b = To-Set $baseArr
  $v = To-Set $varArr
  $added = @()
  $removed = @()

  foreach ($k in $v.Keys) { if (-not $b.ContainsKey($k)) { $added += $k } }
  foreach ($k in $b.Keys) { if (-not $v.ContainsKey($k)) { $removed += $k } }

  $added = ($added | Sort-Object)
  $removed = ($removed | Sort-Object)

  $replacement = ($added.Count -gt 0 -and $removed.Count -gt 0)

  return [pscustomobject]@{
    added = @($added)
    removed = @($removed)
    added_count = $added.Count
    removed_count = $removed.Count
    net_change = ($added.Count - $removed.Count)
    replacement_detected = $replacement
  }
}

function Inc-Count([hashtable]$h, [string]$k) {
  if ([string]::IsNullOrWhiteSpace($k)) { return }
  if ($h.ContainsKey($k)) { $h[$k] = [int]$h[$k] + 1 }
  else { $h[$k] = 1 }
}

function Top-N([hashtable]$h, [int]$n = 5) {
  $h.GetEnumerator() |
    Sort-Object -Property Value -Descending |
    Select-Object -First $n |
    ForEach-Object { [pscustomobject]@{ item = $_.Key; count = $_.Value } }
}

function Is-ArrayLike($value) {
  return ($null -ne $value -and $value -is [System.Collections.IEnumerable] -and -not ($value -is [string]))
}

# ---------------------------
# Load baseline
# ---------------------------
$baseline = Load-Json $BaselinePath

# One-line schema warning + coercion for simulation_runs
$wasArray = (Is-ArrayLike $baseline.simulation_runs); $baseline.simulation_runs = Ensure-Array $baseline.simulation_runs; if (-not $wasArray) { Write-Warning "Schema warning: coerced simulation_runs to array in baseline: $BaselinePath" }

if (-not $baseline.simulation_runs -or @($baseline.simulation_runs).Count -eq 0) {
  throw "Baseline missing simulation_runs[0]: $BaselinePath"
}
$baseRun = @($baseline.simulation_runs)[0]

# ---------------------------
# Find variants
# ---------------------------
$variantFiles = Get-ChildItem -Path $VariantsRoot -Recurse -Filter "module_03_sapp_simulation_stress_testing_ID_2.json" -File

Write-Host "`n=== ID_2 Comparative Analysis Summary ==="
Write-Host "Baseline: $BaselinePath"
Write-Host "Variants found: $($variantFiles.Count)`n"

# Aggregate recurrence (net-new only)
$recStress = @{}
$recFrag   = @{}
$recDrift  = @{}
$recEsc    = @{}

$results = @()

foreach ($vf in $variantFiles) {

  # Skip baseline if it happens to be inside VariantsRoot
  try {
    if ((Resolve-Path $vf.FullName).Path -eq (Resolve-Path $BaselinePath).Path) { continue }
  } catch { }

  $variant = Load-Json $vf.FullName

  # One-line schema warning + coercion for simulation_runs (variant)
  $wasArray = (Is-ArrayLike $variant.simulation_runs); $variant.simulation_runs = Ensure-Array $variant.simulation_runs; if (-not $wasArray) { Write-Warning "Schema warning: coerced simulation_runs to array in variant: $($vf.FullName)" }

  if (-not $variant.simulation_runs -or @($variant.simulation_runs).Count -eq 0) {
    Write-Warning "Variant missing simulation_runs[0], skipping: $($vf.FullName)"
    continue
  }
  $vRun = @($variant.simulation_runs)[0]

  # Diffs (arrays-only enforced)
  $diffs = [pscustomobject]@{
    stress_conditions     = (Diff-List (Get-Array $baseRun "stress_conditions")     (Get-Array $vRun "stress_conditions"))
    fragility_points      = (Diff-List (Get-Array $baseRun "fragility_points")      (Get-Array $vRun "fragility_points"))
    authority_drift_flags = (Diff-List (Get-Array $baseRun "authority_drift_flags") (Get-Array $vRun "authority_drift_flags"))
    escalation_triggers   = (Diff-List (Get-Array $baseRun "escalation_triggers")   (Get-Array $vRun "escalation_triggers"))
  }

  # Recurrence counts (net-new)
  foreach ($x in @($diffs.stress_conditions.added))     { Inc-Count $recStress $x }
  foreach ($x in @($diffs.fragility_points.added))      { Inc-Count $recFrag   $x }
  foreach ($x in @($diffs.authority_drift_flags.added)) { Inc-Count $recDrift  $x }
  foreach ($x in @($diffs.escalation_triggers.added))   { Inc-Count $recEsc    $x }

  # Tags (hardened)
  $tags = Get-Array $vRun "stress_category_tags"

  # Console summary
  Write-Host "Variant: $($vf.FullName)"
  if ($tags.Count -gt 0) { Write-Host ("Tags: " + ($tags -join ", ")) }
  Write-Host ("Stress Conditions — Added: {0} | Removed: {1} | Net: {2} | Replacement: {3}" -f $diffs.stress_conditions.added_count, $diffs.stress_conditions.removed_count, $diffs.stress_conditions.net_change, $diffs.stress_conditions.replacement_detected)
  Write-Host ("Fragility Points  — Added: {0} | Removed: {1} | Net: {2} | Replacement: {3}" -f $diffs.fragility_points.added_count, $diffs.fragility_points.removed_count, $diffs.fragility_points.net_change, $diffs.fragility_points.replacement_detected)
  Write-Host ("Authority Drift   — Added: {0} | Removed: {1} | Net: {2} | Replacement: {3}" -f $diffs.authority_drift_flags.added_count, $diffs.authority_drift_flags.removed_count, $diffs.authority_drift_flags.net_change, $diffs.authority_drift_flags.replacement_detected)
  Write-Host ("Escalation Trig.  — Added: {0} | Removed: {1} | Net: {2} | Replacement: {3}" -f $diffs.escalation_triggers.added_count, $diffs.escalation_triggers.removed_count, $diffs.escalation_triggers.net_change, $diffs.escalation_triggers.replacement_detected)

  # -----------------------------
  # Beginner-friendly review notes
  # -----------------------------
  $reviewNotes = @()

  function Take-Top($arr, $n=3) {
    if (-not $arr) { return @() }
    $a = @($arr)
    if ($a.Count -le $n) { return $a }
    return $a[0..($n-1)]
  }

  # Stress conditions examples (added + removed/changed)
  if ($diffs.stress_conditions.added_count -gt 0 -or $diffs.stress_conditions.removed_count -gt 0) {
    $addedExamples = (Take-Top $diffs.stress_conditions.added 3) -join " | "
    $removedExamples = (Take-Top $diffs.stress_conditions.removed 3) -join " | "
    $reviewNotes += "Stress conditions changed vs baseline (exploratory). Added: $addedExamples"
    if ($removedExamples) { $reviewNotes += "Baseline stress conditions removed/changed: $removedExamples" }
  }

  if ($diffs.fragility_points.added_count -gt 0) {
    $fpExamples = (Take-Top $diffs.fragility_points.added 5) -join " | "
    $reviewNotes += "Net-new fragility points detected (exploratory): $fpExamples"
    $reviewNotes += "What to check: whether scope boundaries and guardrails still hold under this stress intensity."
  }

  if ($diffs.authority_drift_flags.added_count -gt 0) {
    $adExamples = (Take-Top $diffs.authority_drift_flags.added 5) -join " | "
    $reviewNotes += "Net-new authority drift flags detected (exploratory): $adExamples"
    $reviewNotes += "What to check: wording that implies endorsement, adequacy, thresholds, or recommendation tone under pressure."
  }

  if ($diffs.escalation_triggers.added_count -gt 0) {
    $etExamples = (Take-Top $diffs.escalation_triggers.added 5) -join " | "
    $reviewNotes += "Net-new escalation triggers detected (exploratory): $etExamples"
    $reviewNotes += "What to check: human review routing remains explicit and non-automated; escalation prompts are documented."
  }

  # Tag-aware reminder
  if ($tags.Count -gt 0) {
    $reviewNotes += "Stress category tags: $($tags -join ', '). Use tags to group recurring patterns across variants (visibility, not validation)."
  }

  # Always-safe reminder
  $reviewNotes += "Reminder: preserve uncertainty notes. Do not smooth uncertainty to meet stakeholder urgency."

  Write-Host "`nBeginner Summary:"
  foreach ($n in $reviewNotes) { Write-Host "  - $n" }
  Write-Host ""

  $results += [pscustomobject]@{
    variant_file = $vf.FullName
    scenario_summary = $vRun.scenario_summary
    stress_category_tags = @($tags)
    diffs = $diffs
    review_notes = $reviewNotes
  }
}

# Aggregate top recurring net-new items (arrays-only)
$aggregate = [pscustomobject]@{
  variants_count = $results.Count
  top_recurring_added = [pscustomobject]@{
    stress_conditions      = @(Top-N $recStress 5)
    fragility_points       = @(Top-N $recFrag   5)
    authority_drift_flags  = @(Top-N $recDrift  5)
    escalation_triggers    = @(Top-N $recEsc    5)
  }
}

Write-Host "=== Cross-Variant Recurrence (Top 5 net-new items) ==="
Write-Host "Stress Conditions:"
$aggregate.top_recurring_added.stress_conditions | ForEach-Object { Write-Host ("  {0} ({1})" -f $_.item, $_.count) }

Write-Host "Fragility Points:"
$aggregate.top_recurring_added.fragility_points | ForEach-Object { Write-Host ("  {0} ({1})" -f $_.item, $_.count) }

Write-Host "Authority Drift:"
$aggregate.top_recurring_added.authority_drift_flags | ForEach-Object { Write-Host ("  {0} ({1})" -f $_.item, $_.count) }

Write-Host "Escalation Triggers:"
$aggregate.top_recurring_added.escalation_triggers | ForEach-Object { Write-Host ("  {0} ({1})" -f $_.item, $_.count) }

# Optional JSON export
if ($OutJson -and $OutJson.Trim() -ne "") {
  $export = [pscustomobject]@{
    baseline = $BaselinePath
    variants_root = $VariantsRoot
    generated_utc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    results = @($results)
    aggregate = $aggregate
    notes = "Exploratory comparative summary only. Does not assert adequacy, compliance, certification, or readiness."
  }

  $export | ConvertTo-Json -Depth 100 | Set-Content -Path $OutJson -Encoding UTF8
  Write-Host "`nExported JSON summary to: $OutJson"
}
