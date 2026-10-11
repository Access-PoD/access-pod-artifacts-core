<#
Edit-ID2SessionJson.ps1
Interactive editor for ID_2 session.json (non-inspection). No coding required.

Usage:
  pwsh .\Edit-ID2SessionJson.ps1 -Path ".\session.json"
  pwsh .\Edit-ID2SessionJson.ps1 -Path "C:\...\records\sessions\2026-02-10\ID2-...\session.json"
#>

param(
  [Parameter(Mandatory=$true)]
  [string]$Path
)

if (-not (Test-Path $Path)) {
  Write-Error "File not found: $Path"
  exit 1
}

# Load JSON safely
$json = Get-Content -Raw -Path $Path | ConvertFrom-Json -Depth 100

# Defensive initialization (prevents null property errors)
if (-not $json.validation) {
  $json | Add-Member -NotePropertyName validation -NotePropertyValue ([pscustomobject]@{}) -Force
}

if (-not $json.signoff) {
  $json | Add-Member -NotePropertyName signoff -NotePropertyValue ([pscustomobject]@{}) -Force
}

# Read JSON
try {
  $json = Get-Content -Raw -Path $Path | ConvertFrom-Json -Depth 50
} catch {
  Write-Error "Could not parse JSON. Check commas/quotes. $_"
  exit 1
}

function Prompt-Value([string]$label, [string]$current) {
  $c = if ($null -eq $current) { "" } else { $current }
  $v = Read-Host "$label [current: $c]"
  if ([string]::IsNullOrWhiteSpace($v)) { return $c }
  return $v
}

function Prompt-List([string]$label, $currentList) {
  $curr = @()
  if ($currentList) { $curr = @($currentList) }
  Write-Host ""
  Write-Host "$label"
  Write-Host "  Current: $($curr -join '; ')"
  Write-Host "  Enter items separated by ';' (blank keeps current)"
  $v = Read-Host "  New"
  if ([string]::IsNullOrWhiteSpace($v)) { return $curr }
  return @($v.Split(';') | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" })
}

function Ensure-ID2Guards($jsonObj) {
  # Hard guardrails (do not let accidental edits change posture)
  $jsonObj.schema_version = "id2_records_v0.1"
  $jsonObj.record_class   = "non_inspection_session_record"
  $jsonObj.access_mode_primary = "ID_2"
  $jsonObj.inspection_status   = "not_frozen"
  $jsonObj.intended_use = "Operational reasoning capture; signals not decisions; non-inspection."
  $jsonObj.human_decision_required = $true

  $jsonObj.validation.misalignment_testing_required_for_high_impact_outputs = $true
  $jsonObj.validation.question_driven_verification_required = $true
  $jsonObj.validation.human_review_required_before_external_use = $true

  $jsonObj.signoff.non_inspection_acknowledged = $true
  $jsonObj.signoff.no_adequacy_or_compliance_claims_acknowledged = $true
  $jsonObj.signoff.human_accountability_acknowledged = $true

  return $jsonObj
}

Write-Host ""
Write-Host "=== Edit ID_2 session.json (non-inspection) ===" -ForegroundColor Cyan
Write-Host "Tip: press Enter to keep the current value."
Write-Host ""

# Session metadata
$json.session.session_id = Prompt-Value "Session ID (recommend: ID2-YYYYMMDD-HHMM-<slug>)" $json.session.session_id
$json.session.timezone   = Prompt-Value "Timezone" $json.session.timezone

# created_utc: only set if missing (do NOT overwrite on later edits)
if ([string]::IsNullOrWhiteSpace($json.session.created_utc)) {
    $json.session.created_utc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    Write-Host "created_utc auto-set to $($json.session.created_utc)" -ForegroundColor DarkGray
}
else {
    # Keep existing created_utc unchanged
}

# Facilitator
$json.session.facilitator.name = Prompt-Value "Facilitator name" $json.session.facilitator.name
$json.session.facilitator.role = Prompt-Value "Facilitator role" $json.session.facilitator.role

# Participants (simple single-entry editor)
$pName = Prompt-Value "Participant #1 name" ($json.session.participants[0].name)
$pRole = Prompt-Value "Participant #1 role" ($json.session.participants[0].role)
$json.session.participants = @(@{ name = $pName; role = $pRole })

# Project context
$json.session.project_context.project_name = Prompt-Value "Project name" $json.session.project_context.project_name
$json.session.project_context.audience = Prompt-List "Audience (e.g., internal; workshop; standards)" $json.session.project_context.audience
$json.session.project_context.purpose_statement = Prompt-Value "Purpose statement" $json.session.project_context.purpose_statement
$json.session.project_context.in_scope = Prompt-List "In scope (use ';' between items)" $json.session.project_context.in_scope
$json.session.project_context.out_of_scope = Prompt-List "Out of scope (use ';' between items)" $json.session.project_context.out_of_scope

# Run plan notes
$json.run_plan.notes = Prompt-Value "Run plan notes" $json.run_plan.notes

# Outputs artifacts list (optional)
$json.outputs_index.artifacts = Prompt-List "Artifacts list (filenames relative to artifacts/)" $json.outputs_index.artifacts

# Signoff (optional)
$signedByInput = Prompt-Value "Signed by (optional)" $json.signoff.signed_by

if (-not [string]::IsNullOrWhiteSpace($signedByInput)) {
    $json.signoff.signed_by = $signedByInput

    # Automatically set UTC timestamp
    $json.signoff.signed_at_utc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

    Write-Host "Signed at UTC automatically set to $($json.signoff.signed_at_utc)" -ForegroundColor DarkGray
}
else {
    # If no signer entered, leave both fields unchanged
}

# Enforce guardrails so posture doesn't drift
$json = Ensure-ID2Guards $json

# Backup then write
$backup = "$Path.bak." + (Get-Date -Format "yyyyMMdd-HHmmss")
Copy-Item -Path $Path -Destination $backup -Force | Out-Null

try {
  $json | ConvertTo-Json -Depth 50 | Set-Content -Path $Path -Encoding UTF8
  Write-Host ""
  Write-Host "Saved: $Path" -ForegroundColor Green
  Write-Host "Backup: $backup" -ForegroundColor DarkGray
} catch {
  Write-Error "Failed to write JSON. $_"
  exit 1
}
