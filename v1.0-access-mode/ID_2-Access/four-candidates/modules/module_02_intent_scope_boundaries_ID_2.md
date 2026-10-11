# Module 2 — Governance Intent, Scope, and Boundaries
## Defining What the System May and May Not Do

HASH KEY progression (1–10) is defined in the README_ID_2 and used consistently across modules.

Access-Mode context:
This module is rendered under **ID_2 — Operational / Runtime Reasoning** posture.
It supports exploratory and stress-based reasoning about how scope boundaries behave under operational conditions.
It does not support determinations of adequacy, compliance, certification, or approval.

---

## Purpose

This module establishes **governance intent and scope discipline** before reference retrieval,
drafting, or analysis begins.

Most governance failures involving AI do not arise from incorrect answers — they arise from
**unclear scope**, **unstated assumptions**, or **implicit delegation of authority**.

---

## HASH KEY 1 — Governance Intent (Primary Objective)

**What is the specific governance purpose of this work?**

Answer in one or two sentences.

- Are you assessing risk, explaining policy, supporting a decision, or documenting compliance?
- Is this work exploratory, advisory, or decision-adjacent?
- Who is the intended audience (regulator, internal committee, public)?

Complete:
> “The intent of this work is to…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Force a **single, stable governance purpose** before analysis, drafting, or reference retrieval begins.

### Good answer shape
- 1–2 sentences
- Singular objective (not a list)
- Describes *why the work exists*, not what tools will be used

### Strong framing pattern
> “The intent of this work is to ___ in order to support ___, without making determinations or approvals.”

### Common failure modes
- Combining multiple intents (e.g. assess + recommend + justify)
- Framing intent in terms of outputs (“to produce a report”)
- Smuggling in decision authority (“to determine”, “to confirm”)

### Quality check
If the scope were challenged later, could this intent be defended without revision?  
If yes → intent is stable.

</details>

---

## HASH KEY 2 — Jurisdictional and Standards Scope

**Define the formal scope boundaries.**

- Which jurisdictions apply?
- Which standards, frameworks, or regulatory instruments are in scope?
- Are drafts, guidance notes, or informal interpretations included or excluded?

List explicitly:
- **In scope**
- **Out of scope**

If uncertain, treat items as out of scope until explicitly revalidated.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Make **scope explicit enough to defend exclusions**, not just inclusions.

### Good answer shape
- Clear in-scope list
- Explicit out-of-scope list
- Conservative treatment of uncertainty (exclude until validated)

### Strong indicators
- Named jurisdictions
- Named standards or instruments
- Explicit exclusion of drafts, guidance, or informal material (if applicable)

### Common failure modes
- Vague scope (“relevant laws”, “applicable standards”)
- Assuming shared understanding
- Treating silence as inclusion

### Quality check
Could someone else reproduce your scope boundary without asking follow-up questions?  
If yes → scope is defensible.

</details>

---

## HASH KEY 3 — Temporal and Contextual Boundaries

**Clarify time and context limits.**

- Is this a point-in-time assessment or a forward-looking view?
- Does this reflect current law, proposed changes, or hypothetical scenarios?
- Are legacy systems or historical decisions relevant?

Answer:
> “This work applies to…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent **time drift and context bleed** from undermining conclusions later.

### Good answer shape
- Clear time anchor (point-in-time vs forward-looking)
- Explicit handling of legacy or hypothetical material
- Context stated in plain language

### Strong framing pattern
> “This work applies to ___ as at ___, and does not address ___.”

### Common failure modes
- Mixing current and future states
- Implicitly incorporating proposed or draft changes
- Ignoring historical dependencies

### Quality check
If reviewed 12 months later, would the time/context still be clear?  
If yes → boundary holds.

</details>

---

## HASH KEY 4 — Assumptions Being Made

**Surface assumptions before they become hidden dependencies.**

List at least **three assumptions**, even if they feel obvious.

Consider:
- assumed system behavior,
- assumed data quality,
- assumed oversight,
- assumed compliance posture.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Surface assumptions **before they silently become dependencies**.

### Good answer shape
- At least three assumptions
- Written as statements, not justifications
- Includes human, system, and governance assumptions

### Strong examples
- “It is assumed that…”
- “This work assumes continued human oversight…”
- “It is assumed that data inputs are representative…”

### Common failure modes
- Listing facts instead of assumptions
- Treating assumptions as guarantees
- Hiding assumptions inside other sections

### Quality check
If one assumption proved false, would the impact be visible?  
If yes → assumptions are doing their job.

</details>

---

## HASH KEY 5 — Explicit Non-Goals and Exclusions

**State what this work will NOT attempt to do.**

Examples:
- Not providing legal advice
- Not certifying compliance
- Not approving deployment
- Not evaluating technical performance

Complete:
> “This work explicitly does not…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Create **protective boundaries** against misinterpretation and overreach.

### Good answer shape
- Clear “this work does not…” statements
- Covers legal, compliance, approval, and technical exclusions as relevant
- Written defensively, not apologetically

### Strong framing pattern
> “This work explicitly does not ___, and should not be relied upon to ___.”

### Common failure modes
- Being vague to avoid discomfort
- Treating exclusions as implied
- Using exclusions that contradict the stated intent

### Quality check
Could this section be quoted to shut down an inappropriate request?  
If yes → it’s effective.

</details>

---

## HASH KEY 6 — AI Assistance Boundary (Critical Control)

**Define where AI may assist — and where it must stop.**

For this specific task:
- Can AI assist with structuring?
- With summarisation?
- With language refinement?

Identify at least **one boundary** where AI must not proceed without human intervention.

Complete:
> “AI assistance is limited to…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Define a **hard stop** between assistance and judgment for this task.

### Good answer shape
- Lists allowed assistance modes (structure, summary, language)
- Names at least one explicit stop point
- Task-specific (not generic AI policy)

### Required framing
> “AI assistance is limited to ___ and must not ___.”

### Common failure modes
- Overly broad permissions
- Treating review as a substitute for boundary setting
- Allowing AI to shape interpretation or recommendations

### Quality check
If AI output crossed this boundary, would it be immediately obvious?  
If yes → boundary is clear.

</details>

---

## HASH KEY 7 — Exercise: Scope Compression

Write a **scope declaration** (≤150 words) including:
- intent,
- scope,
- exclusions,
- AI assistance limits.

If you cannot do this concisely, the scope is not ready.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Test whether scope is **actually understood**, not just described.

### Good answer shape
- ≤150 words
- Includes intent, scope, exclusions, and AI limits
- Reads as something that could be shown to a reviewer

### Common failure modes
- Exceeding length to avoid hard choices
- Repeating earlier text verbatim
- Omitting AI boundaries

### Quality check
Could this declaration be used as a cover page scope statement?  
If yes → scope is compressed enough.

</details>

---

## HASH KEY 8 — Case Prompt (Boundary Stress Test)

**Scenario**

Midway through drafting, a stakeholder asks:
> “Can we also include a recommendation?”

- Is this within scope?
- What changes if you say yes?
- What governance risk is introduced if the scope silently expands?

Write your response as you would deliver it professionally.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Stress-test **scope discipline under social or organisational pressure**.

### Good answer shape
- Clear yes/no on scope change
- Explains consequences of accepting the change
- Names the governance risk introduced

### Common failure modes
- Automatically agreeing to expand scope
- Treating recommendations as “minor additions”
- Avoiding the uncomfortable refusal

### Quality check
Would your response protect you if the scope later became contested?  
If yes → the boundary holds.

</details>

---

## HASH KEY 9 — Reflection Checkpoint

- Where was scope assumed rather than defined?
- Which exclusions were uncomfortable to write?
- What would have gone wrong without this module?

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Surface **where scope discipline feels hardest**, not where it feels correct.

### Good answer shape
- Names discomfort or resistance
- Identifies at least one previously assumed boundary
- Avoids resolution or justification

### Common failure modes
- Treating reflection as summary
- Declaring certainty
- Skipping discomfort

### Quality check
Does this reflection reveal a pressure point you should watch later?  
If yes → it’s valuable.

</details>

---

## HASH KEY 10 — Priority & Stability Rating (Operational Readiness)

Rate the stability of your scope definition:

**Stability score:** 

1 ☐ 
2 ☐ 
3 ☐ 
4 ☐ 
5 ☐

- What would cause this scope to change?
- What must be revalidated before proceeding?

Proceed to Module 3 only when:
- scope feels defensible (not perfect),
- exclusions are explicit,
- AI boundaries are clearly stated.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Gate progression based on **scope stability**, not confidence or completeness.

### Good answer shape
- One score selected (1–5)
- Plain-language justification
- Names what would force scope revalidation

### Common failure modes
- Treating “5” as success
- Using the score defensively
- Converting the score into an adequacy claim

### Quality check
Would you pause or reset if the score were low?  
If yes → the rating is honest.

</details>

---

## Module 2 Completion Note

This module is complete when:
- intent is singular,
- scope is bounded,
- assumptions are visible,
- AI assistance is explicitly constrained.
