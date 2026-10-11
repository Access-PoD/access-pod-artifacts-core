# Module 3 — SAPP Simulation and Stress Testing
## Simulation-Based Discovery of Governance Fragility

HASH KEY progression (1–10) is defined in the README_ID_2 and used consistently across modules.

Access-Mode context:
This module is rendered under **ID_2 — Operational / Runtime Reasoning** posture.
Simulations are used to explore stress, fragility, and escalation behaviour.
They do not predict outcomes, validate controls, or determine adequacy.

---

## Purpose

This module introduces SAPP-style simulation as an operational reasoning technique for governance:
construct stress scenarios, observe where assumptions fail, and document escalation triggers.
The goal is discovery of fragility and ambiguity — not pass/fail testing.

---

## HASH KEY 1 — Objective

**What are you trying to discover via simulation?**

Write 1–2 sentences.

- Which governance assumptions do you want to stress?
- What kind of fragility are you looking for (scope drift, tone drift, evidence gaps, escalation confusion)?

Complete:
> “The objective of this simulation is to…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Define **what you are trying to discover**, not what you are trying to prove.

### Good answer shape
- 1–2 sentences
- Framed as discovery, not validation
- Focused on governance fragility, not system performance

### Strong framing pattern
> “The objective of this simulation is to explore how ___ behaves under ___ stress in order to surface risks or ambiguities.”

### Common failure modes
- Treating simulation as a test of success
- Framing objectives as confirmation or assurance
- Collapsing multiple discovery goals into one run

### Quality check
Could the simulation “fail” to reveal anything useful?  
If yes → the objective is exploratory enough.

</details>

---

## HASH KEY 2 — Scope

**Define what the simulation applies to and what it excludes.**

List explicitly:
- **In scope** (process stage, actors, artifacts, decision points)
- **Out of scope** (live enforcement, compliance determination, technical benchmarking, etc.)

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent simulations from silently expanding into enforcement, assurance, or inspection.

### Good answer shape
- Explicit in-scope elements (processes, artifacts, roles)
- Explicit exclusions (live systems, real enforcement, approvals)

### Strong indicators
- Clear statement that scenarios are hypothetical
- Explicit exclusion of real-world outcomes or decisions

### Common failure modes
- Treating simulated context as representative reality
- Letting scope drift during the simulation itself
- Assuming results apply beyond the defined boundary

### Quality check
If a scenario outcome looked alarming, would scope still prevent action?  
If yes → scope is doing its job.

</details>

---

## HASH KEY 3 — Assumptions

**List at least three assumptions the simulation relies on.**

Examples (adapt, don’t copy):
- “Simulation is incomplete and may miss unknown failure modes.”
- “Signals may be noisy or delayed.”
- “Human review remains available at escalation points.”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Expose the **limits of the simulation** before interpreting its outputs.

### Good answer shape
- At least three assumptions
- Includes uncertainty and incompleteness
- Includes human interpretation assumptions

### Strong examples
- “Simulated conditions do not reflect full system complexity.”
- “Observed outcomes may be false positives.”
- “Human review remains available after simulation.”

### Common failure modes
- Treating assumptions as guarantees
- Omitting uncertainty
- Writing assumptions after results are known

### Quality check
If one assumption failed, would the simulation still be trusted?  
If no → interpretation must be constrained.

</details>

---

## HASH KEY 4 — Definitions

Define key terms for this run:

- **Simulation** (what it means here)
- **Stress condition** (what constitutes stress)
- **Fragility** (how you recognise it)
- **Escalation trigger** (what requires human review)

Keep each definition to 1–2 lines.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Ensure everyone shares the **same meaning** for simulation-related terms.

### Good answer shape
- 1–2 lines per term
- Context-specific (not generic definitions)
- Distinguishes exploration from evaluation

### Common failure modes
- Reusing inspection or testing language
- Leaving terms implicit
- Using “simulation” to imply prediction

### Quality check
Would a reviewer interpret these terms the same way you do?  
If yes → definitions are sufficient.

</details>

---

## HASH KEY 5 — Evidence

**What evidence will you capture from the simulation?**

Specify what counts as valid evidence for this module, such as:
- scenario narrative + branching points,
- observed assumption breakdowns,
- uncertainty notes,
- decision logs (who decided, on what basis),
- artifact diffs (before/after) if drafting is involved.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Define **what counts as evidence** from a simulation — and what does not.

### Good answer shape
- Describes qualitative and reasoning-based evidence
- Includes uncertainty notes and observation logs
- Explicitly excludes proof or validation claims

### Strong indicators
- “Observed reasoning breakdowns”
- “Assumption stress points”
- “Escalation ambiguity notes”

### Common failure modes
- Treating outcomes as metrics
- Treating narratives as proof
- Failing to record uncertainty

### Quality check
Could this evidence support discussion without implying correctness?  
If yes → evidence definition is sound.

</details>

---

## HASH KEY 6 — Method

Describe the simulation method (bulleted steps). Minimum:

1. Define scenario + stress condition(s)
2. Define expected governance response (what “should” happen)
3. Run the scenario (tabletop or prompt-driven)
4. Record observations and failure modes
5. Identify escalation triggers and required human decisions
6. Produce outputs (notes, flags, next actions)

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Keep the simulation **structured but lightweight**.

### Good answer shape
- Clear step sequence
- Human checkpoints included
- Ends with documentation, not decisions

### Common failure modes
- Over-engineering the method
- Skipping documentation steps
- Treating method as repeatable proof

### Quality check
Could another facilitator reproduce the method without guidance?  
If yes → method is clear enough.

</details>

---

## HASH KEY 7 — Controls (Guardrails)

List controls that prevent misuse of simulation outputs:

- human review required before external use,
- prohibit interpreting simulation as predictive or “validated,”
- require recording uncertainty and alternative explanations,
- require resetting if mode drift occurs.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent simulation outputs from being misused downstream.

### Good answer shape
- Explicit human review requirement
- Clear prohibition on adequacy/compliance inference
- Reset or stop condition defined

### Common failure modes
- Assuming “exploratory” is self-evident
- Allowing outputs to escape context
- No defined stop rule

### Quality check
If someone tried to reuse this output later, would controls stop them?  
If yes → controls are effective.

</details>

---

## HASH KEY 8 — Failure Modes

Identify common pitfalls for this module (at least three):

- treating simulation outputs as proof or assurance,
- overfitting governance design to one scenario,
- confusing narrative plausibility with real-world likelihood,
- collapsing uncertainty into a single conclusion.

For each, write a 1-line detection cue:
> “You’ll know this is happening when…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Anticipate **misinterpretation of the simulation itself**.

### Good answer shape
- At least three failure modes
- Each paired with a detection cue
- Focused on reasoning errors, not system bugs

### Common failure modes
- Treating simulation as predictive
- Overfitting to a single scenario
- Ignoring contradictory observations

### Quality check
Would these failure modes still matter if the scenario “looked right”?  
If yes → they’re governance-relevant.

</details>

---

## HASH KEY 9 — Outputs

Specify what artifacts this module produces (choose at least two):

- SAPP stress-test note (1–2 pages)
- escalation trigger list
- assumptions register update
- artifact edits required (scope statement, boundary language, evidence rules)
- “next simulation” backlog

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Constrain outputs to **signals and prompts**, not conclusions.

### Good answer shape
- Lists exploratory artifacts (notes, flags, questions)
- Avoids recommendations or decisions
- Links outputs to next governance steps

### Common failure modes
- Producing summary conclusions
- Writing outputs that look like findings
- Skipping documentation entirely

### Quality check
Could these outputs be safely shared without misinterpretation?  
If yes → outputs are well-scoped.

</details>

---

## HASH KEY 10 — Review & Next Actions

Decide what happens after this module:

- What must be refined (assumptions, boundaries, controls)?
- What must be escalated for human review?
- What additional simulation(s) are needed?
- Is a transition to ID_3 structuring appropriate (review-only, not inspection)?

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Decide **what happens because uncertainty was revealed**, not because answers were found.

### Good answer shape
- Focuses on refinement, escalation, or further exploration
- Names conditions for stopping or transitioning modes
- Avoids action mandates

### Common failure modes
- Treating next steps as decisions
- Escalating automatically
- Skipping review entirely

### Quality check
Does this section preserve optionality and human judgment?  
If yes → it’s aligned with ID_2 posture.

</details>

---

## ID_2 Guardrail Reminder (SAPP)

- Simulations are exploratory tools, not tests of success.
- Stress outcomes are signals, not verdicts.
- All interpretation and action require human judgment.
- Do not claim adequacy, compliance, certification, or approval.

---

## Facilitator Notes (optional)

- Timing: 20–40 minutes depending on scenario complexity
- Prompting: keep scenarios bounded; stop if scope creep occurs
- Common questions: “Is this realistic?” → treat as hypothesis; record uncertainty

---

## Module 3 Completion Note

This module is complete when:
- at least one scenario has been run,
- fragility points are documented,
- escalation triggers are explicit,
- outputs are recorded as signals (not conclusions).
