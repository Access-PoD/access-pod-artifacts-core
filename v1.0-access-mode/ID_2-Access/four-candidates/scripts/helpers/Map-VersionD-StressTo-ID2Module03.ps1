<#
Map-VersionD-StressTo-ID2Module03.ps1
Interactive prompts (non-coder friendly) to map Version D-style stress/ethics constructs
into ID_2 Module 03 JSON fields.

Usage:
  pwsh .\Map-VersionD-StressTo-ID2Module03.ps1 -Path ".\module_03_sapp_simulation_stress_testing_ID_2.json"
#>

param(
  [Parameter(Mandatory=$true)]
  [string]$Path
)

if (-not (Test-Path $Path)) { throw "File not found: $Path" }

# Load JSON
$json = Get-Content -Raw -Path $Path | ConvertFrom-Json -Depth 60

# -----------------------------
# Helpers
# -----------------------------

function Ask([string]$q, [string]$current="") {
  $c = if ($current) { " [current: $current]" } else { "" }
  $v = Read-Host "$q$c"
  if ([string]::IsNullOrWhiteSpace($v)) { return $current }
  return $v
}

function AskList([string]$q, $currentList) {
  # Always return an array of strings
  $curr = @()
  if ($null -ne $currentList) {
    if ($currentList -is [System.Array]) { $curr = $currentList }
    else { $curr = @($currentList) }
  }
  Write-Host ""
  Write-Host "$q"
  Write-Host "  Current: $($curr -join '; ')"
  Write-Host "  Enter items separated by ';' (blank keeps current)"
  $v = Read-Host "  New"
  if ([string]::IsNullOrWhiteSpace($v)) { return @($curr) }
  return @(
    $v.Split(';') |
      ForEach-Object { $_.Trim() } |
      Where-Object { $_ -ne "" }
  )
}

function Ensure-Array([object]$v) {
  if ($null -eq $v) { return @() }
  if ($v -is [System.Array]) { return $v }
  return @($v)
}

function Ensure-Prop([object]$obj, [string]$name, $default) {
  if ($null -eq $obj) { return }
  if ($obj.PSObject.Properties.Match($name).Count -eq 0) {
    $obj | Add-Member -MemberType NoteProperty -Name $name -Value $default -Force
  }
}

function Coerce-ArrayProp([object]$obj, [string]$name) {
  if ($null -eq $obj) { return }
  Ensure-Prop $obj $name @()
  $obj.$name = Ensure-Array $obj.$name
}

function Normalize-StringArray([object]$v) {
  # Guarantees: array of non-empty trimmed strings (no objects)
  $items = @()

  if ($null -eq $v) { return @() }

  if ($v -is [System.Array]) {
    foreach ($x in $v) {
      if ($null -ne $x) { $items += ([string]$x) }
    }
  } else {
    $items += ([string]$v)
  }

  return @(
    $items |
      ForEach-Object { $_.Trim() } |
      Where-Object { $_ -ne "" }
  )
}

# -----------------------------
# Minimal hardening (early)
# -----------------------------

# Ensure expected sub-objects exist
Ensure-Prop $json "inputs"   ([pscustomobject]@{})
Ensure-Prop $json "captures" ([pscustomobject]@{})

# simulation_runs MUST be array
Ensure-Prop $json "simulation_runs" @()
$json.simulation_runs = Ensure-Array $json.simulation_runs

# Ensure a run exists (use PSCustomObject to avoid hashtable quirks)
if ($json.simulation_runs.Count -eq 0) {
  $json.simulation_runs = @(
    [pscustomobject]@{
      run_id = "RUN-01"
      scenario_summary = ""
      stress_conditions = @()
      branch_points = @()
      signals_observed = @()
      fragility_points = @()
      authority_drift_flags = @()
      uncertainty_notes = @()
      escalation_triggers = @()
      stop_or_reset_events = @()
      ethical_constructs = [pscustomobject]@{
        tensions = @()
        affected_parties = @()
        potential_harms = @()
        tradeoffs_noted = @()
      }
    }
  )
}

$run = $json.simulation_runs[0]

Write-Host ""
Write-Host "=== Map Version D stress/ethics constructs → ID_2 Module 03 JSON ===" -ForegroundColor Cyan
Write-Host "Press Enter to keep current values. Use ';' to separate list items."
Write-Host ""

# -----------------------------
# Prompts
# -----------------------------

# High-level inputs (Version D-style constructs map here)
$json.inputs.scenario_seeds = AskList "Scenario seeds (Version D scenario framing)" $json.inputs.scenario_seeds
$json.inputs.stressors      = AskList "Stressors to inject (time pressure, ambiguity, stakeholder pressure, etc.)" $json.inputs.stressors
$json.inputs.context_notes  = Ask "Context notes (why this run exists / what you're testing)" $json.inputs.context_notes

# Module 03 captures
$json.captures.objective = Ask "Objective (what are you trying to discover under stress?)" $json.captures.objective
$json.captures.scope_in  = AskList "Scope IN (this simulation applies to...)" $json.captures.scope_in
$json.captures.scope_out = AskList "Scope OUT (explicit exclusions)" $json.captures.scope_out
$json.captures.assumptions = AskList "Assumptions (what must be true for interpretation to hold?)" $json.captures.assumptions
$json.captures.evidence_to_capture = AskList "Evidence to capture (what will you record?)" $json.captures.evidence_to_capture
$json.captures.controls_guardrails = AskList "Controls/guardrails (stop lines; human review points)" $json.captures.controls_guardrails

# Run-specific fields
$run.run_id = Ask "Run ID" $run.run_id
$run.scenario_summary = Ask "Scenario summary (short narrative of the run)" $run.scenario_summary
$run.stress_conditions = AskList "Stress conditions used in this run" $run.stress_conditions
$run.branch_points     = AskList "Branch points (where the scenario forked or interpretation changed)" $run.branch_points
$run.signals_observed  = AskList "Signals observed (treat as signals only)" $run.signals_observed
$run.fragility_points  = AskList "Fragility points (where governance boundaries degraded)" $run.fragility_points
$run.authority_drift_flags = AskList "Authority drift flags (confidence/approval language, etc.)" $run.authority_drift_flags
$run.uncertainty_notes = AskList "Uncertainty notes (what remains unknown / contested)" $run.uncertainty_notes
$run.escalation_triggers = AskList "Escalation triggers (human decision required)" $run.escalation_triggers
$run.stop_or_reset_events = AskList "Stop/reset events (if posture drift occurred)" $run.stop_or_reset_events

# Ensure ethical_constructs exists AND has expected fields
Ensure-Prop $run "ethical_constructs" ([pscustomobject]@{})
foreach ($k in @('tensions','affected_parties','potential_harms','tradeoffs_noted')) {
  Coerce-ArrayProp $run.ethical_constructs $k
}

$run.ethical_constructs.tensions = AskList "Ethical tensions (e.g., safety vs utility, speed vs review)" $run.ethical_constructs.tensions
$run.ethical_constructs.affected_parties = AskList "Affected parties (who could be impacted?)" $run.ethical_constructs.affected_parties
$run.ethical_constructs.potential_harms = AskList "Potential harms (describe, do not conclude)" $run.ethical_constructs.potential_harms
$run.ethical_constructs.tradeoffs_noted = AskList "Trade-offs noted (what was sacrificed/uncertain?)" $run.ethical_constructs.tradeoffs_noted

# Put run back (explicit)
$json.simulation_runs[0] = $run

# -----------------------------
# Canonical shape gate (pre-save)
# -----------------------------

# Inputs arrays (and optional references list)
Coerce-ArrayProp $json.inputs "references"

# String-normalize scenario_seeds + stressors (no accidental objects)
$json.inputs.scenario_seeds = Normalize-StringArray (Ensure-Array $json.inputs.scenario_seeds)
$json.inputs.stressors      = Normalize-StringArray (Ensure-Array $json.inputs.stressors)

# Captures arrays (list-typed per template expectations)
foreach ($k in @("method_steps","scope_in","scope_out","assumptions","evidence_to_capture","controls_guardrails")) {
  Coerce-ArrayProp $json.captures $k
}

# ---- simulation_runs: enforce true array shape (non-negotiable) ----
# Step 1: Ensure it exists
Ensure-Prop $json "simulation_runs" @()

# Step 2: Coerce via your helper (may return scalar/arraylist/etc.)
$json.simulation_runs = Ensure-Array $json.simulation_runs

# Step 3: Hard-wrap to guarantee [System.Array] even if a single item was unwrapped
$json.simulation_runs = @($json.simulation_runs)

# Optional: prevent a null-only array (e.g., @($null)) from passing through
$json.simulation_runs = @($json.simulation_runs | Where-Object { $_ -ne $null })

# Optional: if you require at least one run object before save, enforce it here
# (Uncomment if appropriate)
# if ($json.simulation_runs.Count -lt 1) {
#   throw "Persistence guard: simulation_runs contains no run objects (empty) immediately before save."
# }

# Run-level arrays + ethical_constructs arrays (string-normalized where appropriate)
foreach ($r in $json.simulation_runs) {

  # Run list fields: enforce array-of-strings (trimmed; no accidental objects)
  foreach ($k in @(
    "stress_conditions","branch_points","signals_observed","fragility_points",
    "authority_drift_flags","uncertainty_notes","escalation_triggers","stop_or_reset_events"
  )) {
    Ensure-Prop $r $k @()
    $r.$k = Normalize-StringArray (Ensure-Array $r.$k)
  }

  # ethical_constructs: ensure object exists, then enforce array-of-strings for each list field
  Ensure-Prop $r "ethical_constructs" ([pscustomobject]@{})
  foreach ($k in @('tensions','affected_parties','potential_harms','tradeoffs_noted')) {
    Ensure-Prop $r.ethical_constructs $k @()
    $r.ethical_constructs.$k = Normalize-StringArray (Ensure-Array $r.ethical_constructs.$k)
  }
}

# Fail-fast guard (do not write invalid shape)
if (-not ($json.simulation_runs -is [System.Array])) {
  throw "Persistence guard: simulation_runs is not an array immediately before save."
}

# Backup then save
$backup = "$Path.bak." + (Get-Date -Format "yyyyMMdd-HHmmss")
Copy-Item -Path $Path -Destination $backup -Force | Out-Null

$json | ConvertTo-Json -Depth 100 | Set-Content -Path $Path -Encoding UTF8

# Post-write check (verify persisted JSON is correct)
$doc2 = Get-Content -Raw -Path $Path | ConvertFrom-Json -Depth 60
if (-not ($doc2.simulation_runs -is [System.Array])) {
  throw "Persistence check failed: simulation_runs is not an array after write: $Path"
}

Write-Host ""
Write-Host "Saved:  $Path" -ForegroundColor Green
Write-Host "Backup: $backup" -ForegroundColor DarkGray
