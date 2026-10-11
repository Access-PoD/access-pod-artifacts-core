param(
  # Enable folder-derived session_id correction (recommended for ID_3 strict correctness)
  [switch]$EnableSessionIdGeneration = $true,

  # Strict=true => throw on unrecoverable issues; otherwise log and continue where safe
  [switch]$Strict
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# -------------------- Utilities --------------------
function Ensure-Dir([string]$p) {
  if (-not (Test-Path -LiteralPath $p)) {
    New-Item -ItemType Directory -Path $p -Force | Out-Null
  }
}

function Get-Json([string]$p) {
  if (-not (Test-Path -LiteralPath $p)) { throw "File not found: $p" }
  Get-Content -LiteralPath $p -Raw | ConvertFrom-Json -Depth 100
}

function Write-Json($obj, [string]$path) {
  $obj | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $path -Encoding utf8
}

function Is-Blank($v) {
  if ($null -eq $v) { return $true }
  if ($v -is [string]) { return [string]::IsNullOrWhiteSpace($v) }
  return $false
}

function Is-PlaceholderSessionId([string]$s) {
  if ([string]::IsNullOrWhiteSpace($s)) { return $false }
  if ($s -eq "ID2-YYYYMMDD-HHMM-<shortname>") { return $true }
  if ($s -match "^ID2-YYYYMMDD-HHMM-.*$") { return $true }
  return $false
}

function Try-ParseDto([string]$s) {
  if ([string]::IsNullOrWhiteSpace($s)) { return $null }
  [DateTimeOffset]$dto = [DateTimeOffset]::MinValue
  if ([DateTimeOffset]::TryParse($s, [ref]$dto)) { return $dto }
  return $null
}

function To-IsoUtcSeconds([DateTimeOffset]$dto) {
  # Strict format: yyyy-MM-ddTHH:mm:ssZ
  return $dto.UtcDateTime.ToString("yyyy-MM-ddTHH:mm:ssZ")
}

function Get-FileLastWriteUtcIso([string]$path) {
  $fi = Get-Item -LiteralPath $path
  $dto = [DateTimeOffset]$fi.LastWriteTimeUtc
  return (To-IsoUtcSeconds $dto)
}

function Get-Or-CreateObject($parent, [string]$name) {
  $p = $parent.PSObject.Properties[$name]
  if (-not $p -or $null -eq $p.Value) {
    $parent | Add-Member -NotePropertyName $name -NotePropertyValue ([pscustomobject]@{}) -Force
  }
  return $parent.$name
}

function Ensure-ArrayField([string]$label, $obj, [string]$dotPath, [ref]$log) {
  # Supports dot paths without indices
  $segs = $dotPath.Split(".")
  $cur = $obj
  for ($i=0; $i -lt ($segs.Length-1); $i++) {
    $cur = Get-Or-CreateObject $cur $segs[$i]
  }
  $leaf = $segs[-1]

  $prop = $cur.PSObject.Properties[$leaf]
  if (-not $prop -or $null -eq $prop.Value) {
    $cur | Add-Member -NotePropertyName $leaf -NotePropertyValue @() -Force
    $log.Value.Add("- [$label] ensured array: $dotPath (created empty array)") | Out-Null
    return
  }

  if ($prop.Value -is [System.Array]) { return }

  # Minimal coercion: wrap scalar into array
  $cur | Add-Member -NotePropertyName $leaf -NotePropertyValue @($prop.Value) -Force
  $log.Value.Add("- [$label] ensured array: $dotPath (coerced scalar -> array)") | Out-Null
}

function Get-Id2SessionFolderName([string]$inboxDateFolder, [string]$branch) {
  # branch = "baseline" or "variants"
  $p = Join-Path $inboxDateFolder $branch
  if (-not (Test-Path -LiteralPath $p)) { throw "Inbox branch not found: $p" }

  $dirs = @(Get-ChildItem -LiteralPath $p -Directory | Sort-Object Name)
  if (-not $dirs -or $dirs.Length -eq 0) { throw "No session folder under: $p" }

  # Deterministic: choose first by name (your structure has one folder each)
  return $dirs[0].Name
}

function Set-FolderDerivedSessionId([string]$label, $sessionObj, [string]$folderId, [ref]$log) {
  $session = Get-Or-CreateObject $sessionObj "session"
  $current = [string]$session.session_id

  $needsFix = (Is-Blank $current) -or (Is-PlaceholderSessionId $current)

  if (-not $needsFix) {
    if ($current -eq $folderId) {
      $log.Value.Add("- [$label] session.session_id already matches folder-derived id: $folderId") | Out-Null
    } else {
      $log.Value.Add("- [$label] session.session_id preserved (non-blank): '$current' (folder-derived would be '$folderId')") | Out-Null
    }
    return
  }

  $session | Add-Member -NotePropertyName "session_id" -NotePropertyValue $folderId -Force

  if (Is-PlaceholderSessionId $current) {
    $log.Value.Add("- [$label] session.session_id replaced placeholder '$current' => '$folderId'") | Out-Null
  } else {
    $log.Value.Add("- [$label] session.session_id set folder-derived = '$folderId'") | Out-Null
  }
}

function Ensure-CreatedUtc([string]$label, $sessionObj, [string]$sourceSessionFile, [ref]$log) {
  $session = Get-Or-CreateObject $sessionObj "session"
  $v = $session.created_utc

  if (-not (Is-Blank $v)) {
    if ($v -is [string]) {
      $dto = Try-ParseDto $v
      if ($null -ne $dto) {
        $norm = To-IsoUtcSeconds $dto
        if ($norm -ne $v) {
          $session | Add-Member -NotePropertyName "created_utc" -NotePropertyValue $norm -Force
          $log.Value.Add("- [$label] session.created_utc normalized (string) => $norm") | Out-Null
        }
        return
      }
    }
    elseif ($v -is [DateTimeOffset]) {
      $norm = To-IsoUtcSeconds $v
      $session | Add-Member -NotePropertyName "created_utc" -NotePropertyValue $norm -Force
      $log.Value.Add("- [$label] session.created_utc normalized (DateTimeOffset) => $norm") | Out-Null
      return
    }
    elseif ($v -is [DateTime]) {
      $dto = [DateTimeOffset]$v.ToUniversalTime()
      $norm = To-IsoUtcSeconds $dto
      $session | Add-Member -NotePropertyName "created_utc" -NotePropertyValue $norm -Force
      $log.Value.Add("- [$label] session.created_utc normalized (DateTime) => $norm") | Out-Null
      return
    }

    # Present but unparseable string or unknown type
    $msg = "[$label] session.created_utc present but unparseable/unsupported type ('$($v.GetType().Name)'); deriving from file LastWriteTimeUtc."
    if ($Strict) { throw $msg } else { $log.Value.Add("- " + $msg) | Out-Null }
  }

  $derived = Get-FileLastWriteUtcIso $sourceSessionFile
  $session | Add-Member -NotePropertyName "created_utc" -NotePropertyValue $derived -Force
  $log.Value.Add("- [$label] session.created_utc derived_from_file_last_write_utc = $derived") | Out-Null
}

# -------------------- Auto-detect pack + inbox --------------------
$ReviewRoot = Join-Path $PSScriptRoot "..\ID_3_review_packs"
$ReviewRoot = (Resolve-Path $ReviewRoot).Path

$WorkingFolders = @(Get-ChildItem $ReviewRoot -Recurse -Directory |
  Where-Object { $_.FullName -like "*\10_working" })

if (-not $WorkingFolders -or $WorkingFolders.Length -eq 0) {
  throw "No 10_working folder found under ID_3_review_packs."
}

$Working = $WorkingFolders | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$PackRoot = Split-Path $Working.FullName -Parent  # parent of 10_working
$DateFolder = Split-Path $PackRoot -Parent        # ...\ID_3_review_packs\<DATE>
$Date = Split-Path $DateFolder -Leaf

$InboxDateFolder = Join-Path $ReviewRoot ("ID_2_inbox\{0}" -f $Date)

Write-Host "Using working folder: $($Working.FullName)"
Write-Host "Using pack root      : $PackRoot"
Write-Host "Using inbox date      : $InboxDateFolder"
Write-Host ""

if (-not (Test-Path -LiteralPath $InboxDateFolder)) {
  throw "Inbox date folder not found: $InboxDateFolder"
}

# -------------------- Input paths (working) --------------------
$BaselineIn = Join-Path $Working.FullName "baseline\jsons\session.json"
$VariantIn  = Join-Path $Working.FullName "variants\jsons\session.json"

if (-not (Test-Path -LiteralPath $BaselineIn)) { throw "Baseline working session.json not found: $BaselineIn" }
if (-not (Test-Path -LiteralPath $VariantIn))  { throw "Variant working session.json not found:  $VariantIn" }

# -------------------- Source session files (inbox, for deterministic derivation) --------------------
$BaselineFolderId = Get-Id2SessionFolderName $InboxDateFolder "baseline"
$VariantFolderId  = Get-Id2SessionFolderName $InboxDateFolder "variants"

$BaselineSourceSession = Join-Path $InboxDateFolder ("baseline\{0}\artifacts\session.json" -f $BaselineFolderId)
$VariantSourceSession  = Join-Path $InboxDateFolder ("variants\{0}\artifacts\session.json" -f $VariantFolderId)

if (-not (Test-Path -LiteralPath $BaselineSourceSession)) { throw "Baseline inbox source session.json not found: $BaselineSourceSession" }
if (-not (Test-Path -LiteralPath $VariantSourceSession))  { throw "Variant inbox source session.json not found:  $VariantSourceSession" }

# -------------------- Output paths (20_corrected) --------------------
$OutBaseDir = Join-Path $PackRoot "20_corrected"
$OutBaselineDir = Join-Path $OutBaseDir "baseline\jsons"
$OutVariantDir  = Join-Path $OutBaseDir "variants\jsons"
Ensure-Dir $OutBaselineDir
Ensure-Dir $OutVariantDir

$BaselineOut = Join-Path $OutBaselineDir "session.corrected.json"
$VariantOut  = Join-Path $OutVariantDir  "session.corrected.json"
$NotesOut    = Join-Path $OutBaseDir     "corrected_notes.md"

# -------------------- Load + correct --------------------
$log = New-Object System.Collections.Generic.List[string]
$log.Add("# Corrected metadata notes (ID_3)") | Out-Null
$log.Add("") | Out-Null
$log.Add("- PackRoot: $PackRoot") | Out-Null
$log.Add("- InboxDateFolder: $InboxDateFolder") | Out-Null
$log.Add("- Baseline source session folder: $BaselineFolderId") | Out-Null
$log.Add("- Variant source session folder : $VariantFolderId") | Out-Null
$log.Add("- Corrected at (utc): $([DateTimeOffset]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ'))") | Out-Null
$log.Add("") | Out-Null

$baseline = Get-Json $BaselineIn
$variant  = Get-Json $VariantIn

# Minimal corrections (no fill-blanks)
if ($EnableSessionIdGeneration) {
  Set-FolderDerivedSessionId "baseline" $baseline $BaselineFolderId ([ref]$log)
  Set-FolderDerivedSessionId "variant"  $variant  $VariantFolderId  ([ref]$log)
} else {
  $log.Add("- [baseline] session.session_id generation disabled (preserved as-is).") | Out-Null
  $log.Add("- [variant]  session.session_id generation disabled (preserved as-is).") | Out-Null
}

Ensure-CreatedUtc "baseline" $baseline $BaselineSourceSession ([ref]$log)
Ensure-CreatedUtc "variant"  $variant  $VariantSourceSession  ([ref]$log)

# Array/type correctness (minimal coercion)
Ensure-ArrayField "baseline" $baseline "session.mode_controls.secondary_modes_allowed" ([ref]$log)
Ensure-ArrayField "variant"  $variant  "session.mode_controls.secondary_modes_allowed" ([ref]$log)
Ensure-ArrayField "baseline" $baseline "validation.validation_events" ([ref]$log)
Ensure-ArrayField "variant"  $variant  "validation.validation_events" ([ref]$log)
Ensure-ArrayField "baseline" $baseline "session.project_context.audience" ([ref]$log)
Ensure-ArrayField "variant"  $variant  "session.project_context.audience" ([ref]$log)

# Write outputs
Write-Json $baseline $BaselineOut
Write-Json $variant  $VariantOut
$log | Set-Content -LiteralPath $NotesOut -Encoding utf8

Write-Host "Wrote: $BaselineOut"
Write-Host "Wrote: $VariantOut"
Write-Host "Wrote: $NotesOut"
Write-Host ""
Write-Host "Next step recommended: re-run Inspect-SessionMetadataShapes.ps1, then proceed to hash and freeze." -ForegroundColor Cyan
Write-Host ""