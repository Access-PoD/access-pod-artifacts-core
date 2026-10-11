Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ------------------------------------------------------------------
# Auto-detect working pack
# ------------------------------------------------------------------

$Root = Join-Path $PSScriptRoot "..\ID_3_review_packs"
$Root = (Resolve-Path $Root).Path

$WorkingFolders = @(Get-ChildItem $Root -Recurse -Directory |
  Where-Object { $_.FullName -like "*\10_working" })

if (-not $WorkingFolders -or $WorkingFolders.Length -eq 0) {
  throw "No 10_working folder found under ID_3_review_packs."
}

$Working = $WorkingFolders |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1

Write-Host "Using working folder: $($Working.FullName)"
Write-Host ""

# ------------------------------------------------------------------
# Resolve pack root + choose session inputs (prefer corrected if present)
# ------------------------------------------------------------------

# Pack root = parent of 10_working
$PackRoot = Split-Path $Working.FullName -Parent

function Resolve-SessionJsonPath {
  param(
    [Parameter(Mandatory)][string]$PackRoot,
    [Parameter(Mandatory)][ValidateSet("baseline","variants")][string]$Branch
  )

  $corrected = Join-Path $PackRoot "20_corrected\$Branch\jsons\session.corrected.json"
  $working   = Join-Path $PackRoot "10_working\$Branch\jsons\session.json"

  if (Test-Path -LiteralPath $corrected) {
    Write-Host "Using corrected session ($Branch): $corrected" -ForegroundColor Cyan
    return $corrected
  }

  Write-Host "Using working session ($Branch): $working" -ForegroundColor Yellow
  return $working
}

$BaselinePath = Resolve-SessionJsonPath -PackRoot $PackRoot -Branch "baseline"
$VariantPath  = Resolve-SessionJsonPath -PackRoot $PackRoot -Branch "variants"

Write-Host ("Inspection surface: {0}" -f ($(if ($BaselinePath -like "*\20_corrected\*") { "20_corrected (preferred)" } else { "10_working (fallback)" }))) -ForegroundColor Magenta
Write-Host ""

if (-not (Test-Path -LiteralPath $BaselinePath)) { throw "Baseline session.json not found: $BaselinePath" }
if (-not (Test-Path -LiteralPath $VariantPath))  { throw "Variant session.json not found:  $VariantPath" }

# ------------------------------------------------------------------
# Load JSON
# ------------------------------------------------------------------

$Baseline = Get-Content -LiteralPath $BaselinePath -Raw | ConvertFrom-Json -Depth 100
$Variant  = Get-Content -LiteralPath $VariantPath  -Raw | ConvertFrom-Json -Depth 100

Write-Host ("[PROBE] baseline audience raw type: {0}" -f $Baseline.session.project_context.audience.GetType().FullName) -ForegroundColor Cyan
Write-Host ("[PROBE] baseline audience raw json: {0}" -f (ConvertTo-Json -InputObject $Baseline.session.project_context.audience -Compress -Depth 5)) -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------------
# Compare top-level property names
# ------------------------------------------------------------------

$BaseProps = $Baseline.PSObject.Properties.Name | Sort-Object
$VarProps  = $Variant.PSObject.Properties.Name  | Sort-Object
$Diff = Compare-Object $BaseProps $VarProps

# ------------------------------------------------------------------
# Load completeness rule
# ------------------------------------------------------------------

$RulePath = Join-Path $PSScriptRoot "rules\session_completeness.rule.json"
if (-not (Test-Path -LiteralPath $RulePath)) {
  throw "Rule JSON not found: $RulePath"
}

$Rule = Get-Content -LiteralPath $RulePath -Raw | ConvertFrom-Json -Depth 100
if (-not $Rule.fields) { throw "Rule JSON missing 'fields' array: $RulePath" }
if (-not $Rule.validators) { throw "Rule JSON missing 'validators' object: $RulePath" }

function Get-ValueAtPath {
  param(
    [Parameter(Mandatory=$true)]$Obj,
    [Parameter(Mandatory=$true)][string]$Path
  )

  $cur = $Obj
  foreach ($seg in ($Path -split '\.')) {
    if ($null -eq $cur) { return $null }

    # Handle explicit index segments like participants[0]
    if ($seg -match '^(?<name>[^\[]+)\[(?<idx>\d+)\]$') {
      $name = $matches['name']
      $idx  = [int]$matches['idx']

      if ($cur -isnot [pscustomobject]) { return $null }
      $prop = $cur.PSObject.Properties[$name]
      if (-not $prop) { return $null }

      $arr = $prop.Value
      if (-not (($arr -is [System.Array]) -or ($arr -is [System.Collections.IList]))) { return $null }

      $count = if ($arr -is [System.Array]) { $arr.Length } else { $arr.Count }
      if ($count -le $idx) { return $null }

      $cur = $arr[$idx]
      continue
    }

    # Normal property access (do NOT unwrap arrays)
    if ($cur -isnot [pscustomobject]) { return $null }
    $p = $cur.PSObject.Properties[$seg]
    if (-not $p) { return $null }

    $cur = $p.Value
  }

    # Prevent 1-element arrays from being unwrapped by PowerShell pipeline enumeration
    if ($cur -is [System.Array] -or $cur -is [System.Collections.IList]) { return ,$cur }
    return $cur
} 

function Test-Validator {
  param(
    [Parameter(Mandatory=$true)]$Value,
    [Parameter(Mandatory=$true)]$Validator
  )

  $props = $Validator.PSObject.Properties

  function HasProp([string]$name) {
    return ($props.Match($name).Count -gt 0)
  }

  function GetProp([string]$name) {
    return $props[$name].Value
  }

  if (-not (HasProp "type")) { return $false }
  $type = [string](GetProp "type")

  switch ($type) {

    "string" {
      # Allow DateTime/DateTimeOffset values produced by ConvertFrom-Json
      if ($Value -is [DateTime]) {
        $Value = ([DateTimeOffset]$Value.ToUniversalTime()).ToString("yyyy-MM-ddTHH:mm:ssZ")
      }
      elseif ($Value -is [DateTimeOffset]) {
        $Value = $Value.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
      }

      if ($Value -isnot [string]) { return $false }

      if (HasProp "min_length") {
        $min = [int](GetProp "min_length")
        if ($Value.Length -lt $min) { return $false }
      }

      if (HasProp "pattern") {
        $pat = [string](GetProp "pattern")
        if ($Value -notmatch $pat) { return $false }
      }

      if (HasProp "disallow_exact") {
        foreach ($bad in (GetProp "disallow_exact")) {
          if ($Value -eq [string]$bad) { return $false }
        }
      }

      if (HasProp "disallow_regex") {
        foreach ($rx in (GetProp "disallow_regex")) {
          if ($Value -match [string]$rx) { return $false }
        }
      }

      return $true
    }

    "boolean" {
      return ($Value -is [bool])
    }

    "array" {
      # Accept both native arrays and other list types that can appear in PS objects
      $isArrayLike = ($Value -is [System.Array]) -or ($Value -is [System.Collections.IList])
      if (-not $isArrayLike) { return $false }

      $len = if ($Value -is [System.Array]) { $Value.Length } else { $Value.Count }

      if (HasProp "min_length") {
        $min = [int](GetProp "min_length")
        if ($len -lt $min) { return $false }
      }

      return $true
    }

    default {
      # Fail closed for safety
      return $false
    }
  }
}

function Get-RawPropertyValueAtPath {
  param(
    [Parameter(Mandatory=$true)]$Obj,
    [Parameter(Mandatory=$true)][string]$Path
  )

  $cur = $Obj
  $segs = $Path -split '\.'

  for ($i = 0; $i -lt $segs.Length; $i++) {
    if ($null -eq $cur) { return $null }

    $seg = $segs[$i]

    if ($seg -match '^(?<name>[^\[]+)\[(?<idx>\d+)\]$') {
      # Keep existing indexed behavior
      $name = $matches['name']
      $idx  = [int]$matches['idx']

      if ($cur -isnot [pscustomobject]) { return $null }
      $prop = $cur.PSObject.Properties[$name]
      if (-not $prop) { return $null }

      $arr = $prop.Value
      if (-not (($arr -is [System.Array]) -or ($arr -is [System.Collections.IList]))) { return $null }

      $count = if ($arr -is [System.Array]) { $arr.Length } else { $arr.Count }
      if ($count -le $idx) { return $null }

      $cur = $arr[$idx]
      continue
    }

    if ($cur -isnot [pscustomobject]) { return $null }

    $prop = $cur.PSObject.Properties[$seg]
    if (-not $prop) { return $null }

    # IMPORTANT: always step using the property VALUE (no scalarization)
    $cur = $prop.Value
  }

   # Prevent 1-element arrays from being unwrapped by PowerShell pipeline enumeration
  if ($cur -is [System.Array] -or $cur -is [System.Collections.IList]) { return ,$cur }
  return $cur
}

function Score-Completeness {
  param(
    [Parameter(Mandatory=$true)]$Obj,
    [Parameter(Mandatory=$true)]$RuleObj
  )

  $pointsPossible = 0
  $pointsAwarded  = 0

  # Only required failures are true "failures"
  $failedRequired = New-Object System.Collections.Generic.List[string]

  # Optional issues are only recorded when the field is present but invalid/empty
  $optionalIssues = New-Object System.Collections.Generic.List[string]

  foreach ($f in $RuleObj.fields) {
    $path     = [string]$f.path
    $required = [bool]$f.required
    $points   = [int]$f.points
    $vname    = [string]$f.validate

    $pointsPossible += $points

    $val = Get-ValueAtPath -Obj $Obj -Path $path

    # If this field uses an array validator, re-fetch via raw property walk (prevents scalarization)
    if ($vname) {
      $validator = $RuleObj.validators.$vname
      if ($validator -and $validator.type -eq "array") {
        $val = Get-RawPropertyValueAtPath -Obj $Obj -Path $path
      }
    }

    # Missing means: property not found / index missing / null returned
    $isMissing = ($null -eq $val)

    # Present-but-empty (only meaningful for strings)
    $isEmptyString = $false
    if (-not $isMissing -and $val -is [string]) {
      if ([string]::IsNullOrWhiteSpace($val)) { $isEmptyString = $true }
    }

    # If missing:
    # - required => failure
    # - optional => ignore (no penalty, no issue)
    if ($isMissing) {
      if ($required) { $failedRequired.Add($path) | Out-Null }
      continue
    }

    # If present but empty string:
    # - required => failure
    # - optional => optional issue (quality signal)
    if ($isEmptyString) {
      if ($required) { $failedRequired.Add($path) | Out-Null }
      else { $optionalIssues.Add("$path (present_empty)") | Out-Null }
      continue
    }

    # Validate (if no validator, presence counts)
    $isValid = $true
    if ($vname) {
      $validator = $RuleObj.validators.$vname
      if (-not $validator) {
        # Missing validator reference: fail closed for required; optional => optional issue
        $isValid = $false
      } else {
        $isValid = Test-Validator -Value $val -Validator $validator
      }
    }

        if ($isValid) {
      $pointsAwarded += $points
    }
    else {
      if ($required) {
        $failedRequired.Add($path) | Out-Null

        $t = if ($null -eq $val) { "null" } else { $val.GetType().FullName }
        $vStr = if ($null -eq $val) { "null" } else { (ConvertTo-Json -InputObject $val -Compress -Depth 5) }

        Write-Host ("[DEBUG] required fail: {0} | type={1} | value={2}" -f $path, $t, $vStr) -ForegroundColor DarkYellow
      }
      else {
        $optionalIssues.Add("$path (present_invalid)") | Out-Null

        # Optional debug (comment out later if noisy)
        $t = if ($null -eq $val) { "null" } else { $val.GetType().FullName }
        $vStr = if ($null -eq $val) { "null" } else { (ConvertTo-Json -InputObject $val -Compress -Depth 5) }

        Write-Host ("[DEBUG] optional fail: {0} | type={1} | value={2}" -f $path, $t, $vStr) -ForegroundColor DarkGray
      }
    }
  }

  $pct = if ($pointsPossible -gt 0) { [math]::Round(($pointsAwarded / $pointsPossible) * 100, 2) } else { 0 }

  return [pscustomobject]@{
    points_possible  = $pointsPossible
    points_awarded   = $pointsAwarded
    percent          = $pct
    failed_required  = $failedRequired
    optional_issues  = $optionalIssues
  }
}

$baseScore = Score-Completeness -Obj $Baseline -RuleObj $Rule
$varScore  = Score-Completeness -Obj $Variant  -RuleObj $Rule
$avgPct    = [math]::Round((($baseScore.percent + $varScore.percent) / 2), 2)

# ------------------------------------------------------------------
# Prepare report output path (pack-level)
# ------------------------------------------------------------------

$OutDir  = Join-Path $PackRoot "20_corrected"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$OutPath = Join-Path $OutDir "correction_note.md"

# ------------------------------------------------------------------
# Write report
# ------------------------------------------------------------------

$Lines = New-Object System.Collections.Generic.List[string]
$Lines.Add("# Session Metadata Shape Report (ID_3)") | Out-Null
$Lines.Add("") | Out-Null
$Lines.Add("- Baseline file: $BaselinePath") | Out-Null
$Lines.Add("- Variant file : $VariantPath") | Out-Null
$Lines.Add("- Rule file    : $RulePath") | Out-Null
$Lines.Add("") | Out-Null

$Lines.Add("## Completeness (diagnostic)") | Out-Null
$Lines.Add("") | Out-Null
$Lines.Add("| Record | Points | Percent |") | Out-Null
$Lines.Add("|---|---:|---:|") | Out-Null
$Lines.Add("| baseline | $($baseScore.points_awarded)/$($baseScore.points_possible) | $($baseScore.percent)% |") | Out-Null
$Lines.Add("| variant  | $($varScore.points_awarded)/$($varScore.points_possible) | $($varScore.percent)% |") | Out-Null
$Lines.Add("| average  | - | $avgPct% |") | Out-Null
$Lines.Add("") | Out-Null
$Lines.Add("> Note: Completeness is diagnostic only. Do not modify records based on score. Only minimal metadata correction is permitted before hash/freeze.") | Out-Null
$Lines.Add("") | Out-Null

$Lines.Add("## Top-level metadata differences (key names only)") | Out-Null
$Lines.Add("") | Out-Null

# --- Optional issues (present but empty/invalid) ---
$Lines.Add("") | Out-Null
$Lines.Add("## Optional issues (present but empty/invalid)") | Out-Null
$Lines.Add("") | Out-Null
$Lines.Add("> Optional fields that are missing are not listed. This section only flags fields that exist but are empty or fail validation.") | Out-Null
$Lines.Add("") | Out-Null

if (($baseScore.optional_issues.Count -eq 0) -and ($varScore.optional_issues.Count -eq 0)) {
  $Lines.Add("No optional issues detected.") | Out-Null
} else {
  if ($baseScore.optional_issues.Count -gt 0) {
    $Lines.Add("### baseline") | Out-Null
    foreach ($p in $baseScore.optional_issues) { $Lines.Add("- $p") | Out-Null }
    $Lines.Add("") | Out-Null
  }
  if ($varScore.optional_issues.Count -gt 0) {
    $Lines.Add("### variant") | Out-Null
    foreach ($p in $varScore.optional_issues) { $Lines.Add("- $p") | Out-Null }
    $Lines.Add("") | Out-Null
  }
}

if (-not $Diff) {
  $Lines.Add("No top-level metadata differences detected.") | Out-Null
} else {
  foreach ($d in $Diff) {
    $side = if ($d.SideIndicator -eq "=>") { "variant_only" } else { "baseline_only" }
    $Lines.Add("- $($d.InputObject) ($side)") | Out-Null
  }
}
$Lines.Add("") | Out-Null

$Lines.Add("## Required-field failures (diagnostic)") | Out-Null
$Lines.Add("") | Out-Null

if ($baseScore.failed_required.Count -eq 0 -and $varScore.failed_required.Count -eq 0) {
  $Lines.Add("No required-field failures detected.") | Out-Null
} else {
  if ($baseScore.failed_required.Count -gt 0) {
    $Lines.Add("### baseline") | Out-Null
    foreach ($p in $baseScore.failed_required) { $Lines.Add("- $p") | Out-Null }
    $Lines.Add("") | Out-Null
  }
  if ($varScore.failed_required.Count -gt 0) {
    $Lines.Add("### variant") | Out-Null
    foreach ($p in $varScore.failed_required) { $Lines.Add("- $p") | Out-Null }
    $Lines.Add("") | Out-Null
  }
}

$Lines | Set-Content -LiteralPath $OutPath -Encoding UTF8

# ------------------------------------------------------------------
# Console guidance
# ------------------------------------------------------------------

Write-Host ""
Write-Host ("Completeness (diagnostic): baseline {0}% | variant {1}% | average {2}%" -f $baseScore.percent, $varScore.percent, $avgPct) -ForegroundColor Green
Write-Host "file - correction_note.md created (check file)" -ForegroundColor Yellow
Write-Host "Next step recommended - Correct-ID3SessionMetadata.ps1 for metadata correction only before hash and freeze" -ForegroundColor Cyan
Write-Host ""