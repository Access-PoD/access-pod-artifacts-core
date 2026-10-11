# v1d_scenarios.md
## Governance Stress-Testing Scenario Library

**Version:** v1d (Informative)  
**Status:** Companion Material — Non-Normative  

---

## Purpose

This document provides a library of **example governance stress-testing scenarios** aligned with **APOD-TR-005 — Volume 2, Version D**.

The scenarios are designed to:

- exercise governance behavior under stress,
- surface authority, evidence, delegation, incentive, and ethical ambiguity failure modes,
- produce **governance evidence records** (not outcomes or scores).

Scenarios are **not tests** and do **not** have pass/fail results.

---

## Schema Alignment

Each scenario below is compatible with:

### 1) Scenario Index Schema (catalog use)
**File:** `v1d_scenarios.schema.json`

**Required fields:**
- `scenario_id`
- `title`
- `stress_types`
- `summary`

**Optional fields used here:**
- `recommended_method`
- `tags`

### 2) Stress-Test Evidence Record (execution use)
**File:** `apod.v1d.stress_evidence_record.schema.json`

The scenario `scenario_id` in this document should be copied into:

- `scenario.scenario_id` in the evidence record, and  
- stress types should be mirrored into `stress.stress_types`.

**Stress type enums (must match exactly):**
- `authority`
- `delegation`
- `telemetry`
- `incentive`
- `ethical_ambiguity`
- `compounded`

---

## How to Use These Scenarios

1. Select one scenario (or combine two for a compounded exercise).  
2. Run it as a **tabletop**, **simulation**, **walkthrough**, or **revocation rehearsal** (as indicated).  
3. Record outcomes using the stress evidence record JSON format.  
4. Treat failures as **governance evidence**, not defects.

---

## Scenarios (Schema-Ready)

### v1d-SC-001 — Authority Under Deadline Pressure

- **Stress types:** `["authority","incentive"]`  
- **Recommended method:** `tabletop`  
- **Summary:** A governance signatory is asked to approve AI-assisted outputs under an external deadline while escalation pathways exist but are costly to invoke.  
- **Tags:** `["time-pressure","sign-off","escalation","governance-writing"]`

**Governance prompts:**
- Who is authorized to decide under deadline?
- What is escalated, and what is not?
- What evidence constrains the decision?

---

### v1d-SC-002 — Delegation Without Attribution

- **Stress types:** `["delegation","telemetry"]`  
- **Recommended method:** `walkthrough`  
- **Summary:** A third-party model is proposed to accelerate summarisation, but attribution for delegated outputs is incomplete and telemetry coverage is partial.  
- **Tags:** `["third-party","attribution-gap","telemetry-gap","delegation-boundary"]`

**Governance prompts:**
- Is delegation permitted under current scope?
- What must be logged and cited?
- Does governance constrain outputs until attribution is restored?

---

### v1d-SC-003 — Telemetry Delay During Incident Review

- **Stress types:** `["telemetry"]`  
- **Recommended method:** `simulation`  
- **Summary:** Governance telemetry arrives late or out of sequence while decisions must be made. Evidence exists, but is not timely enough to support confident interpretation.  
- **Tags:** `["delayed-evidence","confidence","pause","assurance-constraint"]`

**Governance prompts:**
- How does decision-making degrade when evidence is delayed?
- Is “absence of evidence” treated as uncertainty?
- Are trust signals constrained or withheld?

---

### v1d-SC-004 — Ethical Ambiguity With No Clear Harm

- **Stress types:** `["ethical_ambiguity"]`  
- **Recommended method:** `walkthrough`  
- **Summary:** System behavior creates plausible ethical concern, but no affected party or measurable harm can yet be identified. The pressure is to proceed because nothing is “proven.”  
- **Tags:** `["precaution","non-decision","ethical-restraint","uncertainty"]`

**Governance prompts:**
- Can ethical restraint be justified without proof?
- What triggers escalation under ethical ambiguity?
- What documentation is required to defend non-decision?

---

### v1d-SC-005 — Incentive Conflict at Scale-Up

- **Stress types:** `["incentive","authority"]`  
- **Recommended method:** `tabletop`  
- **Summary:** An organization plans to scale into a higher-impact context while stress-testing reveals unresolved fragility. Governance is pressured to preserve optics and timelines.  
- **Tags:** `["scale-up","optics","risk-committee","decision-pressure"]`

**Governance prompts:**
- Who owns the decision to delay or constrain scope?
- How is trust constrained before expansion?
- What evidence is required before proceeding?

---

### v1d-SC-006 — Compounded Stress — Delegation + Incentives + Ethical Ambiguity

- **Stress types:** `["compounded"]`  
- **Recommended method:** `tabletop`  
- **Summary:** External delegation is requested under commercial pressure while telemetry is partial and ethical ambiguity exists. Multiple stressors interact and amplify governance fragility.  
- **Tags:** `["compounded","delegation","telemetry-gap","ethical-ambiguity","deadline"]`

**Governance prompts:**
- Which control fails first: authority, evidence, or ethics?
- Does governance constrain scope or proceed under pressure?
- What actions are taken (pause/escalate/withhold assurance/rehearse revocation)?

---

## Recording Outcomes (Evidence Discipline)

When documenting outcomes, use the evidence record and include at minimum:

- `scenario.scenario_id`
- `stress.stress_types`
- `context.context_scope`
- `evidence.telemetry_status`
- `evidence.observed_failure_modes`
- `evidence.governance_actions_taken`
- `accountability.accountable_role`
- `review.next_step`

Outcomes are **not ratings**.  
They are **evidence and learning signals**.

---

## Scope and Limits

This scenario library:

- is informative, not prescriptive,
- does not define requirements or benchmarks,
- does not imply certification, approval, or compliance.
