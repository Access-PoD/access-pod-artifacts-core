---
title: Module 03 — Governance RAG & Retrieval Boundaries
mode: ID_3 (inspection / standards)
status: Primer
---

# Module 3 — governance_rag_references (ID_3 Primer)
## Bounded Retrieval for Standards-Aligned Inspection Reasoning

HASH KEY progression (1–10) is defined in the ID_3 control file and used consistently across modules.

Access-Mode context:
This module is rendered under **ID_3 — Inspection / Standards** posture.
It establishes reference discipline and retrieval boundaries for inspection-facing artifacts.
No compliance, adequacy, certification, or approval claims are permitted.
AI must not expand its reasoning base beyond explicitly defined sources.

---

## Purpose

Define how reference materials function as governance-grade retrieval anchors.

Inspection reasoning must be bounded, traceable, and authority-aware.

Unbounded retrieval introduces silent authority drift and inspection instability.

Structural citation does not create normative authority or regulatory standing.

---

## HASH KEY 1 — Purpose of Retrieval

**Why are references being retrieved at all?**

Answer clearly before selecting any source.

- Are references used to interpret standards?
- To explain obligations?
- To compare positions?
- To provide contextual grounding only?

Complete:
> “References are retrieved in this work to…”

If this cannot be stated, retrieval is premature.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Lock retrieval purpose before selecting sources.

### Good answer shape
- Specific
- Limited in scope
- Does not include determination language

### Common failure modes
- Using references to infer compliance
- Allowing retrieval to determine adequacy

### Inspection check
Would this retrieval purpose survive regulator scrutiny?

</details>

---

## HASH KEY 2 — Reference Categories (Allowed Sources)

**Identify what types of references are permitted.**

Common categories include:
- formal standards (e.g. ISO, IEC),
- statutory or regulatory texts,
- official guidance or consultation drafts,
- internal policy frameworks,
- prior governance decisions.

List explicitly:
- **Allowed reference categories**
- **Disallowed reference categories** (blogs, commentary, unofficial summaries)

Governance-grade RAG begins with exclusion.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent informal authority creep.

### Governance principle
Governance-grade RAG begins with exclusion.

### Inspection check
Would an external reviewer question any category listed?

</details>

---

## HASH KEY 3 — Authority Weighting

**Not all references carry equal authority.**

For each allowed category:
- which sources are authoritative?
- which are contextual only?
- which must never override formal instruments?

Answer:
> “In the event of conflict, priority is given to…”

This prevents silent authority inversion.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Make authority hierarchy explicit.

### Failure mode
Contextual sources overriding formal standards.

### Inspection check
If two references conflict, is the decision rule explicit?

</details>

---

## HASH KEY 4 — Interpretation Boundaries

**Define how references may be interpreted.**

Consider:
- literal reading only?
- contextual explanation permitted?
- synthesis allowed but not reinterpretation?

Explicitly state:
- what AI may summarise,
- what AI may not infer.

Ambiguity here leads directly to drift.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent AI from extending obligations beyond source text.

### Common failure modes
- Harmonising standards without instruction
- Inferring applicability

### Inspection check
Would interpretation remain defensible under challenge?

</details>

---

## HASH KEY 5 — Reference Currency & Versioning

**Clarify time sensitivity of references.**

- Are only current versions allowed?
- Are superseded drafts excluded?
- How are amendments or consultations handled?

Complete:
> “References are considered valid only if…”

This is critical for audit defensibility.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Ensure audit defensibility.

### Failure mode
Allowing AI to silently substitute updated references.

### Inspection check
Are all references version-identifiable?

</details>

---

## HASH KEY 6 — AI Retrieval Boundary (Critical Control)

**Define the retrieval limits placed on AI.**

- Can AI retrieve only provided documents?
- May it generalise beyond supplied text?
- Is external retrieval disabled or constrained?

Complete:
> “AI retrieval is limited to…”

This boundary is non-negotiable in governance contexts.

Any external retrieval, if permitted, must be explicitly logged and cited.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent silent reasoning expansion.

### Common failure modes
- AI introducing uncited “best practice”
- Filling evidence gaps with general knowledge

### Inspection check
Could AI expand its reasoning base without detection?

</details>

---

## HASH KEY 7 — Exercise: Reference Map

This exercise is intended to make reference authority and usage explicit before
any drafting begins. The goal is not completeness, but defensibility: every
reference used should have a clear role, weight, and boundary.

**Exercise**

Example (illustrative only):

| Reference                     | Category        | Authority Level | Allowed Use                          |
|------------------------------|-----------------|-----------------|--------------------------------------|
| ISO/IEC 23894:2023 (excerpt) | Formal standard | Primary         | Literal citation and contextual explanation only |

Create a simple reference map:

| Reference | Category | Authority Level | Allowed Use |
|---------|---------|-----------------|------------|
|         |         |                 |            |

Populate at least **five entries** relevant to your current work.

If a reference cannot be classified, it should not be used.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Make authority explicit before drafting begins.

### Failure mode
Using references without declared weight.

</details>

---

## HASH KEY 8 — Case Prompt (Drift Test)

Case prompts are optional and intended for deeper stress-testing where time permits.

**Scenario**

AI introduces a phrase:
> “Best practice suggests…”

- Is “best practice” defined?
- Is a source cited?
- Does this phrase introduce an unstated authority?

Write how you would:
- identify the issue,
- correct the draft,
- prevent recurrence.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Stress-test retrieval discipline under subtle drift.

### Failure mode
Allowing uncited consensus language.

</details>

---

## HASH KEY 9 — Reflection Checkpoint

Reflect:

- Which references do you rely on most often?
- Where have informal sources influenced past work?
- What feels uncomfortable to exclude?

Discomfort often signals habit, not necessity.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Surface hidden authority habits.

</details>

---

## HASH KEY 10 — Priority & Readiness Rating (Retrieval Stability)

Rate your reference discipline readiness:

This rating is a self-assessment checkpoint, not a maturity score or approval.
It is intended to surface weaknesses in reference scope, authority hierarchy,
and retrieval boundaries before drafting or analysis begins.

*Readiness score:*
- 1 
- 2 
- 3 
- 4 
- 5 

Interpret the scale as follows:

5 — Ready: Reference scope, authority weighting, and AI retrieval limits are
     explicit, enforced, and consistently applied.

4 — Mostly ready: Core references are controlled, but minor ambiguity or
     manual correction is still required.

3 — Partially ready: References are identified, but authority conflicts or
     retrieval drift are not fully controlled.

2 — Not ready: Informal or implicit sources frequently influence reasoning,
     and AI boundaries are inconsistently enforced.

1 — Not ready: Reference discipline is unstable and drafting should not
     proceed.

- What would improve this score?
- What reference gaps exist?
- What must be resolved before drafting begins?

Proceed to Module 4 only when:
- reference scope is explicit,
- authority hierarchy is defined,
- and AI retrieval boundaries are enforced.


<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Gate drafting without implying adequacy.

### Failure mode
Treating 5 as compliance approval.

</details>

---

## Module 3 Completion Note

This module is complete when:

- references are bounded,
- authority is explicit,
- interpretation limits are defined, and
- AI cannot silently expand its reasoning base.

Governance reasoning begins with disciplined retrieval.
