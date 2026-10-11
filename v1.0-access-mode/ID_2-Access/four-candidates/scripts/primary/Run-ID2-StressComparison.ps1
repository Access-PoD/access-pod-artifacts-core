<# 
Run-ID2-StressComparison.ps1

Chains:
  Normalize-ID2Module03.ps1  ->  ID2_Comparative_Analysis_Tool.ps1  ->  optional completion update

Design goals:
  - Deterministic: stable output path and schema hardening
  - Posture-safe: refuses to proceed if non-inspection guardrails are violated
  - Minimal assumptions: uses explicit baseline + variants root
  - Non-inspection: never asserts adequacy/compliance/readiness
#>

[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [string]$BaselinePath,

  [Parameter(Mandatory=$true)]
  [string]$VariantsRoot,

  [Parameter(Mandatory=$true)]
  [string]$RecordsRoot,

  [Parameter(Mandatory=$true)]
  [string]$OutJson,

  # If set, marks baseline and variants as completed after successful compare + posture checks
  [switch]$MarkCompleted
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Assert-FileExists([string]$Path, [string]$Label) {
  if (-not (Test-Path -LiteralPath $Path)) {
    throw "$Label not found: $Path"
  }
}

function Read-Json([string]$Path) {
  $raw = Get-Content -LiteralPath $Path -Raw -Encoding UTF8
  return $raw | ConvertFrom-Json -Depth 100
}

function Write-Json([object]$Obj, [string]$Path) {
  # Force canonical shapes immediately before serialization
  if ($null -ne $Obj.simulation_runs) {
    if (-not ($Obj.simulation_runs -is [System.Array])) {
      $Obj.simulation_runs = @($Obj.simulation_runs)
    }
  } else {
    $Obj.simulation_runs = @()
  }

  foreach ($field in @("observations","uncertainty_notes","escalation_triggers")) {
    if ($null -eq $Obj.$field) { $Obj.$field = @() }
    elseif (-not ($Obj.$field -is [System.Array])) { $Obj.$field = @($Obj.$field) }
  }

  $json = $Obj | ConvertTo-Json -Depth 100
  $json | Set-Content -LiteralPath $Path -Encoding UTF8
}

function Backup-File([string]$Path) {
  $stamp = (Get-Date).ToString("yyyyMMdd-HHmmss")
  $bak = "$Path.bak.$stamp"
  Copy-Item -LiteralPath $Path -Destination $bak -Force
  return $bak
}

function Assert-PersistedArrayShape([string]$Path) {
  $doc2 = Read-Json $Path
  if (-not ($doc2.simulation_runs -is [System.Array])) {
    throw "Persistence check failed: simulation_runs is not an array after write: $Path"
  }
}

function Ensure-Array([object]$Value) {
  if ($null -eq $Value) { return @() }
  # Already an array?
  if ($Value -is [System.Array]) { return $Value }
  # Single object -> wrap
  return @($Value)
}

function Assert-NonInspectionPosture([object]$Doc, [string]$Path) {
  # Required core fields
  if ($Doc.record_class -notlike "non_inspection_*") {
    throw "Posture violation: record_class is not non_inspection_* in $Path"
  }
  if ($Doc.access_mode_primary -ne "ID_2") {
    throw "Posture violation: access_mode_primary is not ID_2 in $Path"
  }
  if ($Doc.human_decision_required -ne $true) {
    throw "Posture violation: human_decision_required must be true in $Path"
  }
  if ($Doc.inspection_status -ne "not_frozen") {
    throw "Posture violation: inspection_status must be not_frozen in $Path"
  }

  # Intended use must clearly be signals-only (soft check)
  $iu = [string]$Doc.intended_use
  if ($iu -notmatch "(signals\s+not\s+decisions|non-inspection|non inspection)") {
    Write-Warning "Posture note: intended_use does not explicitly contain 'signals not decisions' or 'non-inspection' in $Path"
  }

  # Enforce simulation_runs array shape (hard check + fix-up)
  $Doc.simulation_runs = Ensure-Array $Doc.simulation_runs

  # Enforce common array fields (fix-up)
  foreach ($field in @("observations","uncertainty_notes","escalation_triggers")) {
    $Doc.$field = Ensure-Array $Doc.$field
  }

  return $Doc
}

function Mark-Completed([string]$Path) {
  $doc = Read-Json $Path
  $doc.simulation_runs = Ensure-Array $doc.simulation_runs
  if ($null -eq $doc.completion) { $doc | Add-Member -NotePropertyName completion -NotePropertyValue @{} }

  $doc.completion.status = "completed"
  $doc.completion.completed_at_utc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

  Backup-File $Path | Out-Null
  Write-Json $doc $Path
}

try {
  # --- Resolve tool paths relative to this script location ---
  $here = Split-Path -Parent $MyInvocation.MyCommand.Path
  $normalize = Join-Path $here "Normalize-ID2Module03.ps1"
  $compare   = Join-Path $here "ID2_Comparative_Analysis_Tool.ps1"

  Assert-FileExists $normalize "Normalize tool"
  Assert-FileExists $compare   "Compare tool"
  Assert-FileExists $BaselinePath "BaselinePath"
  Assert-FileExists $VariantsRoot "VariantsRoot"
  Assert-FileExists $RecordsRoot "RecordsRoot"

  # --- Step 1: Normalize (in-place + backup) ---
  Write-Host "== Step 1: Normalize Module 03 JSON files ==" -ForegroundColor Cyan
  pwsh $normalize -RootPath $RecordsRoot -InPlace -Backup

  # --- Step 2: Posture checks + schema hardening (baseline + variants) ---
  Write-Host "== Step 2: Posture checks + schema hardening ==" -ForegroundColor Cyan

  # Baseline
  $b = Read-Json $BaselinePath
  $b = Assert-NonInspectionPosture $b $BaselinePath
  Backup-File $BaselinePath | Out-Null
  Write-Json $b $BaselinePath
  Assert-PersistedArrayShape $BaselinePath

  # Variants (only Module 03 json files)
  $variantFiles = @(
    Get-ChildItem -LiteralPath $VariantsRoot -Recurse -File -Filter "module_03_sapp_simulation_stress_testing_ID_2.json" |
      ForEach-Object { $_.FullName } |
      Where-Object { $_ -and $_.Trim().Length -gt 0 } |
      Sort-Object
  )

  if ($variantFiles.Count -eq 0) {
    throw "No variant Module 03 files found under VariantsRoot: $VariantsRoot"
  }

  foreach ($vf in $variantFiles) {
    $vdoc = Read-Json $vf
    $vdoc = Assert-NonInspectionPosture $vdoc $vf
    Backup-File $vf | Out-Null
    Write-Json $vdoc $vf
    Assert-PersistedArrayShape $vf

  }

  # --- Step 3: Run comparative analysis ---
  Write-Host "== Step 3: Comparative analysis ==" -ForegroundColor Cyan

  # Ensure comparison directory exists
  $comparisonDir = Split-Path -Parent $OutJson
  if (-not (Test-Path -LiteralPath $comparisonDir)) {
    New-Item -ItemType Directory -Path $comparisonDir -Force | Out-Null
}

pwsh $compare `
  -BaselinePath $BaselinePath `
  -VariantsRoot $VariantsRoot `
  -OutJson $OutJson

  # --- Step 4: Optionally mark completion ---
  if ($MarkCompleted) {
    Write-Host "== Step 4: Mark completion (completed) ==" -ForegroundColor Cyan
    Mark-Completed $BaselinePath
    foreach ($vf in $variantFiles) { Mark-Completed $vf }
    Write-Host "Completion marked as 'completed' for baseline and variants." -ForegroundColor Green
  } else {
    Write-Host "Completion not modified (default)." -ForegroundColor Yellow
  }

  Write-Host "DONE. Output summary: $OutJson" -ForegroundColor Green
}
catch {
  Write-Error $_.Exception.Message
  exit 1
}
