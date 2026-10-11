param(
  [Parameter(Mandatory = $true)]
  [string]$PackRoot,

  [Parameter(Mandatory = $true)]
  [string]$OutboxRoot,

  [Parameter(Mandatory = $true)]
  [string]$InboxRoot,   # kept for compatibility; not used for module_03 in this version

  # NOTE: retained but not used for module_03 sources in this version (we copy from 10_working)
  [string]$BaselineModule03RelPath = "baseline\ID2-20260210-1835-session\artifacts\module_03_sapp_simulation_stress_testing_ID_2.json",
  [string]$VariantModule03RelPath  = "variants\ID2-20260210-1907-session-timepressure\artifacts\module_03_sapp_simulation_stress_testing_ID_2.json",

  [switch]$CleanupInboxDate,
  [string]$InboxDateFolder = "",

  [switch]$DryRun,

  [ValidateSet("SHA256","SHA384","SHA512")]
  [string]$HashAlgorithm = "SHA256",

  [switch]$Strict
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) {
  if (-not (Test-Path -LiteralPath $p)) {
    New-Item -ItemType Directory -Path $p -Force | Out-Null
  }
}

function Assert-Path([string]$p, [string]$label) {
  if (-not (Test-Path -LiteralPath $p)) { throw "$label not found: $p" }
}

function Read-Json([string]$p) {
  Get-Content -LiteralPath $p -Raw | ConvertFrom-Json -Depth 100
}

function Write-Json($obj, [string]$p) {
  $obj | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $p -Encoding utf8
}

function Hash-Canonical([string]$outFinal, [string[]]$canonicalNames, [string]$algo) {
  $hashPath = Join-Path $outFinal "hashes.txt"

  $lines = foreach ($name in ($canonicalNames | Sort-Object)) {
    $p = Join-Path $outFinal $name
    if (-not (Test-Path -LiteralPath $p)) { throw "Missing canonical file for hashing: $p" }
    $h = Get-FileHash -Algorithm $algo -Path $p
    "{0}  {1}" -f $h.Hash.ToLower(), $name
  }

  if ($DryRun) {
    Write-Host "[DryRun] Would write hashes.txt -> $hashPath"
  } else {
    $lines | Set-Content -LiteralPath $hashPath -Encoding ascii
  }
}

function Stamp-SessionCanonical($obj, [string]$frozenAtUtc) {
  # Session artifacts: packaging stamp under ID_3 (not compliance/approval)
  $obj.inspection_status = "frozen_under_ID_3"
  $obj | Add-Member -NotePropertyName "frozen_at_utc" -NotePropertyValue $frozenAtUtc -Force
  return $obj
}

function Stamp-ModuleCanonical($obj, [string]$completedAtUtc) {
  # Module artifacts: packaging stamp under ID_3 (final == final packaging)
  $obj.inspection_status = "frozen_under_ID_3"
  $obj | Add-Member -NotePropertyName "status" -NotePropertyValue "final" -Force
  $obj | Add-Member -NotePropertyName "completed_at_utc" -NotePropertyValue $completedAtUtc -Force
  return $obj
}

Write-Host "Move-And-Freeze-ID3Outbox.ps1 (Canonical promotion + ID_3 freeze stamping)"
Write-Host "PackRoot  : $PackRoot"
Write-Host "OutboxRoot: $OutboxRoot"
Write-Host "InboxRoot : $InboxRoot"
Write-Host "DryRun    : $DryRun"
Write-Host "Algorithm : $HashAlgorithm"
Write-Host ""

Assert-Path $PackRoot "PackRoot"
Ensure-Dir $OutboxRoot
Assert-Path $InboxRoot "InboxRoot"

# Derive session date from PackRoot parent folder if possible
$parentName  = Split-Path -Leaf (Split-Path -Parent $PackRoot)
$utcDate     = [DateTime]::UtcNow.ToString("yyyy-MM-dd")
$sessionDate = if ($parentName -match '^\d{4}-\d{2}-\d{2}$') { $parentName } else { $utcDate }

$frozenAtUtc = [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ")
$freezeStamp = $sessionDate + "--FREEZE-" + [DateTime]::UtcNow.ToString("yyyyMMdd-HHmmssZ")

$outFinal    = Join-Path $OutboxRoot $freezeStamp
$packDst     = Join-Path $outFinal "pack"
$packMoveDst = Join-Path $packDst (Split-Path -Leaf $PackRoot)

Write-Host "FreezeFolder: $outFinal"
Write-Host ""

# Validate required pack folders exist pre-move (adjust list if your pack uses fewer stages)
$required = @("10_working","20_corrected")
foreach ($r in $required) { Assert-Path (Join-Path $PackRoot $r) "Required folder '$r'" }

# Create outFinal
if ($DryRun) {
  Write-Host "[DryRun] Would create: $outFinal"
  Write-Host "[DryRun] Would create: $packDst"
} else {
  Ensure-Dir $outFinal
  Ensure-Dir $packDst
}

# Move pack into outbox (preserve provenance surfaces inside pack/)
if ($DryRun) {
  Write-Host "[DryRun] Would move pack: $PackRoot -> $packMoveDst"
} else {
  Move-Item -LiteralPath $PackRoot -Destination $packMoveDst
}

# Determine packRootFinal for subsequent paths
$packRootFinal = if ($DryRun) { $PackRoot } else { $packMoveDst }

# ---------- Canonical promotion sources ----------
# Sessions: from 20_corrected
$correctedDir = Join-Path $packRootFinal "20_corrected"
Assert-Path $correctedDir "20_corrected"

$baselineSessCorrected = Join-Path $correctedDir "baseline\jsons\session.corrected.json"
$variantSessCorrected  = Join-Path $correctedDir "variants\jsons\session.corrected.json"
Assert-Path $baselineSessCorrected "Baseline session.corrected.json (20_corrected)"
Assert-Path $variantSessCorrected  "Variant session.corrected.json (20_corrected)"

# Module_03: from 10_working (your actual current structure)
$workDir = Join-Path $packRootFinal "10_working"
Assert-Path $workDir "10_working"

$baselineM3 = Join-Path $workDir "baseline\jsons\module_03_sapp_simulation_stress_testing_ID_2.json"
$variantM3  = Join-Path $workDir "variants\jsons\module_03_sapp_simulation_stress_testing_ID_2.json"
Assert-Path $baselineM3 "Baseline module_03 (10_working)"
Assert-Path $variantM3  "Variant module_03 (10_working)"

# Canonical root names (frozen export surface)
$canon = @(
  "session_baseline.canonical.json",
  "session_variant.canonical.json",
  "module_03_baseline.canonical.json",
  "module_03_variant.canonical.json"
)

# ---------- Promote + stamp (must occur BEFORE hashing) ----------
if ($DryRun) {
  Write-Host "[DryRun] Would copy + stamp canonical root artifacts (prior to hashing):"
  Write-Host "  session baseline: $baselineSessCorrected -> $($canon[0])"
  Write-Host "  session variant : $variantSessCorrected  -> $($canon[1])"
  Write-Host "  module03 baseline: $baselineM3           -> $($canon[2])"
  Write-Host "  module03 variant : $variantM3            -> $($canon[3])"
  Write-Host "  stamp inspection_status='frozen_under_ID_3'"
  Write-Host "  sessions add frozen_at_utc=$frozenAtUtc"
  Write-Host "  module_03 set status='final' and completed_at_utc=$frozenAtUtc"
} else {
  # Copy raw sources to canonical root
  Copy-Item -LiteralPath $baselineSessCorrected -Destination (Join-Path $outFinal $canon[0]) -Force
  Copy-Item -LiteralPath $variantSessCorrected  -Destination (Join-Path $outFinal $canon[1]) -Force
  Copy-Item -LiteralPath $baselineM3            -Destination (Join-Path $outFinal $canon[2]) -Force
  Copy-Item -LiteralPath $variantM3             -Destination (Join-Path $outFinal $canon[3]) -Force

  # Stamp canonical JSONs (packaging semantics) BEFORE hashing
  $sb = Stamp-SessionCanonical (Read-Json (Join-Path $outFinal $canon[0])) $frozenAtUtc
  $sv = Stamp-SessionCanonical (Read-Json (Join-Path $outFinal $canon[1])) $frozenAtUtc
  Write-Json $sb (Join-Path $outFinal $canon[0])
  Write-Json $sv (Join-Path $outFinal $canon[1])

  $mb = Stamp-ModuleCanonical (Read-Json (Join-Path $outFinal $canon[2])) $frozenAtUtc
  $mv = Stamp-ModuleCanonical (Read-Json (Join-Path $outFinal $canon[3])) $frozenAtUtc
  Write-Json $mb (Join-Path $outFinal $canon[2])
  Write-Json $mv (Join-Path $outFinal $canon[3])

  # Root note defining "final" under ID_3
  $mdPath = Join-Path $outFinal "ID3_FREEZE_NOTE.md"
  @"
# ID_3 Freeze Note

- frozen_at_utc: $frozenAtUtc
- outbox_freeze_folder: $outFinal
- pack_root: $packRootFinal

## Canonical artifacts (root; stamped prior to hashing)
- $($canon[0])  (inspection_status=frozen_under_ID_3; frozen_at_utc=$frozenAtUtc)
- $($canon[1])  (inspection_status=frozen_under_ID_3; frozen_at_utc=$frozenAtUtc)
- $($canon[2])  (inspection_status=frozen_under_ID_3; status=final; completed_at_utc=$frozenAtUtc)
- $($canon[3])  (inspection_status=frozen_under_ID_3; status=final; completed_at_utc=$frozenAtUtc)

## Definition: status="final" (ID_3)
In this outbox freeze, **final** means:

- **final packaging under Access-Mode ID_3**
- structurally aligned and metadata-normalized for inspection packaging
- ready for deterministic hashing and archive verification

It does **not** mean:
- compliant / approved / adequate
- audited or regulator-accepted
- operationally complete

## Notes
- Session JSONs are sourced from the 20_corrected surface (metadata corrections only).
- Module_03 JSONs are sourced from the 10_working surface (original ID_2 record; packaged under ID_3).
- Hashing occurs after stamping so hashes.txt reflects the final canonical state.
"@ | Set-Content -LiteralPath $mdPath -Encoding utf8
}

# Post-copy verification (non-DryRun): ensure canonical files exist + print sizes
if (-not $DryRun) {
  Write-Host "Post-copy verification (canonical root artifacts):"
  foreach ($name in ($canon | Sort-Object)) {
    $p = Join-Path $outFinal $name
    if (-not (Test-Path -LiteralPath $p)) {
      throw "Post-copy verification failed: missing canonical file: $p"
    }
    $fi = Get-Item -LiteralPath $p
    Write-Host ("  - {0}  ({1} bytes)" -f $fi.Name, $fi.Length)
  }
}

# Hash only canonical root JSONs (skip actual hashing in DryRun)
if ($DryRun) {
  Write-Host "[DryRun] Would hash canonical root JSONs into hashes.txt:"
  foreach ($n in ($canon | Sort-Object)) { Write-Host ("  - " + (Join-Path $outFinal $n)) }
} else {
  Hash-Canonical -outFinal $outFinal -canonicalNames $canon -algo $HashAlgorithm
  Write-Host "hashes.txt preview:"
  Get-Content (Join-Path $outFinal "hashes.txt") | ForEach-Object { Write-Host ("  " + $_) }
}

# Freeze receipt inside pack\50_freeze (optional; only if folder exists)
$freezeDir = Join-Path $packRootFinal "50_freeze"
if (Test-Path -LiteralPath $freezeDir) {
  $receiptPath = Join-Path $freezeDir "freeze_receipt.md"

  $receipt = @"
# ID_3 Freeze Receipt (Canonical Promotion)

- frozen_at_utc: $frozenAtUtc
- outbox_freeze_folder: $outFinal
- pack_root: $packRootFinal

## Canonical promoted artifacts (root; stamped prior to hashing)
- $($canon[0]) (from pack\20_corrected\baseline\jsons\session.corrected.json; stamped frozen_under_ID_3)
- $($canon[1]) (from pack\20_corrected\variants\jsons\session.corrected.json; stamped frozen_under_ID_3)
- $($canon[2]) (from pack\10_working\baseline\jsons\module_03_*.json; stamped frozen_under_ID_3; status=final)
- $($canon[3]) (from pack\10_working\variants\jsons\module_03_*.json; stamped frozen_under_ID_3; status=final)

## Integrity anchor
- hashes.txt (root; hashes the four canonical JSON only)

## Definition: status="final" (ID_3)
final = final packaging under ID_3 for hashing and archive verification.
It does not mean compliant, approved, audited, or regulator-accepted.
"@

  if ($DryRun) {
    Write-Host "[DryRun] Would write freeze receipt -> $receiptPath"
  } else {
    $receipt | Set-Content -LiteralPath $receiptPath -Encoding utf8
  }
} else {
  Write-Host "Note: pack\50_freeze not present; skipping freeze_receipt.md write."
}

Write-Host ""
Write-Host "DONE"
Write-Host "Outbox freeze folder: $outFinal"
Write-Host "Pack moved to       : $packMoveDst"
Write-Host "Canonical root JSON : $($canon -join ', ')"
Write-Host "hashes.txt          : $(Join-Path $outFinal 'hashes.txt')"
Write-Host ""

# Optional: cleanup inbox date folder
if ($CleanupInboxDate) {
  if ([string]::IsNullOrWhiteSpace($InboxDateFolder)) { throw "CleanupInboxDate set but InboxDateFolder not provided." }
  Assert-Path $InboxDateFolder "InboxDateFolder"
  $leaf = Split-Path -Leaf $InboxDateFolder
  if ($leaf -notmatch '^\d{4}-\d{2}-\d{2}$') { throw "Refusing cleanup: InboxDateFolder leaf not YYYY-MM-DD: $InboxDateFolder" }

  if ($DryRun) {
    Write-Host "[DryRun] Would remove inbox date folder: $InboxDateFolder"
  } else {
    Remove-Item -Recurse -Force $InboxDateFolder
    Write-Host "Inbox date folder removed: $InboxDateFolder"
  }
}