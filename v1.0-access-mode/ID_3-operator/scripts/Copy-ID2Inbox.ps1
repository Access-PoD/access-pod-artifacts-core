param(
  # You only type the date folder name, e.g. 2026-02-10
  [Parameter(Mandatory=$true)]
  [string]$Date,

  [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ($PSVersionTable.PSVersion.Major -lt 7) {
  throw "ID3-CopyToInbox.ps1 requires PowerShell 7+. Current: $($PSVersionTable.PSVersion)"
}

# Fixed locations (no cd required)
$SrcBase  = "C:\v1.0-Access-mode\modes\ID_2_access\records\sessions"
$InboxRoot = "C:\v1.0-Access-mode\modes\ID_3_operator\ID_3_review_packs\ID_2_inbox"

$SrcSessionRoot = Join-Path $SrcBase $Date

# Resolve Copy-ID2Inbox.ps1 regardless of where launcher sits
$CopyScriptCandidates = @(
  (Join-Path $PSScriptRoot "primary\Copy-ID2Inbox.ps1"),
  (Join-Path $PSScriptRoot "Copy-ID2Inbox.ps1"),
  (Join-Path (Split-Path $PSScriptRoot -Parent) "primary\Copy-ID2Inbox.ps1")
)
$CopyScript = $CopyScriptCandidates | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $CopyScript) { throw "Copy script not found. Tried: $($CopyScriptCandidates -join '; ')" }

if (-not (Test-Path -LiteralPath $SrcSessionRoot)) { throw "Source session folder not found: $SrcSessionRoot" }
if (-not (Test-Path -LiteralPath $InboxRoot))     { throw "InboxRoot not found (create it first): $InboxRoot" }

# Safety: ensure we’re pointed at an ID_2 sessions folder
if (-not (Test-Path -LiteralPath (Join-Path $SrcSessionRoot "baseline")) -or
    -not (Test-Path -LiteralPath (Join-Path $SrcSessionRoot "variants"))) {
  throw "Source folder does not look like an ID_2 sessions date folder (missing baseline/ or variants/): $SrcSessionRoot"
}

Write-Host "ID_3 Bootstrap — Copy ID_2 sessions to ID_3 inbox"
Write-Host "Source: $SrcSessionRoot"
Write-Host "Inbox : $InboxRoot"
Write-Host "Using : $CopyScript"

$args = @(
  "-SrcSessionRoot", $SrcSessionRoot,
  "-InboxRoot", $InboxRoot,
  "-Force"
)

if (-not $Force) { $args = @("-SrcSessionRoot", $SrcSessionRoot, "-InboxRoot", $InboxRoot) }

& $CopyScript @args