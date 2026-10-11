<#
Normalize-ID2Module03.ps1
Normalizes ID_2 Module 03 JSON records to enforce arrays-only for key list fields.

- Converts null / missing / scalar string into arrays.
- Ensures required arrays exist at BOTH:
  a) root-level convenience fields (if used)
  b) simulation_runs[*] fields (the important ones for the comparative tool)

Non-authoritative. Safe structure normalization only.
#>

param(
  [Parameter(Mandatory = $true)]
  [string]$RootPath,

  # If set, writes normalized JSON back to file (in-place).
  [switch]$InPlace,

  # If set, creates a .bak backup next to each file before overwriting.
  [switch]$Backup
)

function Ensure-Array($value) {
  if ($null -eq $value) { return @() }

  # Already an array
  if ($value -is [System.Array]) { return $value }

  # String -> [string] array (trim + drop empty)
  if ($value -is [string]) {
    $s = $value.Trim()
    if ($s -eq "") { return @() }
    return @($s)
  }

  # If it's an object/map (PSCustomObject or Hashtable), treat as SINGLE item
  if ($value -is [pscustomobject] -or $value -is [hashtable] -or
      $value -is [System.Collections.IDictionary]) {
    return @($value)
  }

  # Other enumerables (lists) -> array
  if ($value -is [System.Collections.IEnumerable]) { return @($value) }

  # Fallback -> single item array
  return @($value)
}

function Ensure-ArrayProp($obj, [string]$propName) {
  if ($null -eq $obj) { return }

  if (-not ($obj.PSObject.Properties.Name -contains $propName)) {
    $obj | Add-Member -NotePropertyName $propName -NotePropertyValue @() -Force
  } else {
    $obj.$propName = Ensure-Array $obj.$propName
  }
}

# Fields we want arrays-only
$ArrayFields = @(
  "stress_conditions",
  "fragility_points",
  "authority_drift_flags",
  "escalation_triggers",
  "stress_category_tags",
  "branch_points",
  "signals_observed",
  "uncertainty_notes",
  "stop_or_reset_events"
)

# Find all module_03 JSON files under RootPath
$files = Get-ChildItem -Path $RootPath -Recurse -Filter "module_03_sapp_simulation_stress_testing_ID_2.json" -File

if (-not $files -or $files.Count -eq 0) {
  throw "No Module 03 JSON files found under: $RootPath"
}

Write-Host "Found $($files.Count) Module 03 JSON file(s)."

foreach ($f in $files) {
  $raw  = Get-Content -Raw -Path $f.FullName
  $json = $raw | ConvertFrom-Json -Depth 200

  # Root-level optional arrays (keep them consistent even if unused)
  foreach ($field in @("observations","uncertainty_notes","escalation_triggers")) {
    Ensure-ArrayProp $json $field
  }

  # ---- simulation_runs canonicalization (must end as System.Array) ----
  if ($null -eq $json.simulation_runs) {
    $json | Add-Member -NotePropertyName "simulation_runs" -NotePropertyValue @() -Force
  }

  # Wrap any non-array into an array
  if (-not ($json.simulation_runs -is [System.Array])) {
    $json.simulation_runs = @($json.simulation_runs)
  }

  # Final defensive canonicalization (no-op if already correct)
  $json.simulation_runs = @($json.simulation_runs)

  # Assert canonical shape after normalization (fail fast)
  if (-not ($json.simulation_runs -is [System.Array])) {
    $t = $json.simulation_runs.GetType().FullName
    throw "Normalize failed: simulation_runs is not an array after normalization: $($f.FullName). Type=$t"
  }
  # ---------------------------------------------------------------

  foreach ($run in @($json.simulation_runs)) {
    foreach ($af in $ArrayFields) {
      Ensure-ArrayProp $run $af
    }

    # ethical_constructs.tensions etc should also be arrays if present
    if ($run.ethical_constructs) {
      foreach ($ecf in @("tensions","affected_parties","potential_harms","tradeoffs_noted")) {
        Ensure-ArrayProp $run.ethical_constructs $ecf
      }
    }
  }

  # Output (dry run by default)
  $normalized = $json | ConvertTo-Json -Depth 100

  if ($InPlace) {
    if ($Backup) {
      Copy-Item -Path $f.FullName -Destination ($f.FullName + ".bak") -Force
    }
    Set-Content -Path $f.FullName -Value $normalized -Encoding UTF8
    Write-Host "Normalized (in-place): $($f.FullName)"
  } else {
    Write-Host "Normalized (dry-run): $($f.FullName)"
  }
}

Write-Host "Done."
