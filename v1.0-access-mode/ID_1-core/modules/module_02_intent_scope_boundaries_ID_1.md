# Module 2 — Governance Intent, Scope, and Boundaries
## Defining What the System May and May Not Do

HASH KEY progression (1–10) is defined in the README_ID_1 and used consistently across modules.

Access-Mode context:
This module is rendered under **ID_1 — Core / Learning** posture.
It supports conceptual scoping and boundary articulation prior to any
operational or inspection reasoning.

In Access-Mode ID_1, this module applies to how governance intent and scope are reasoned about prior to system operation. No runtime execution, enforcement, or deployment context is assumed.

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

Complete the sentence:
> “The intent of this work is to…”

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Lock a single governance purpose for the work (what this is for), before wording or analysis begins.

### Good answer shape
- 1–2 sentences
- States the governance task (explain / assess / document / support a decision)
- Names the audience (internal / external)

### Strong framing pattern
> “The intent of this work is to ___ for ___, so that ___ remains explicit and reviewable.”

### Common failure modes
- Multiple intents in one statement (explain + assess + recommend)
- Sliding into operational assumptions (“when deployed”, “in production”)

### Quality check
Can you point to one “primary objective” without adding a second purpose?  
If yes → this section is sound.

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

Silence here creates risk later.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Make scope boundaries explicit so the work can’t silently expand later.

### Good answer shape
- Two lists: **In scope** / **Out of scope**
- Names jurisdictions (if any)
- Names standards/frameworks as categories (not interpretations)

### Strong framing pattern
> “In scope: ___. Out of scope: ___.”

### Common failure modes
- Treating “unknown” items as implicitly included
- Listing informal commentary as if it were authoritative

### Quality check
If someone asked “why didn’t you cover X?”, can you point to “Out of scope”?  
If yes → this section is locked.

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
Prevent time and context ambiguity (point-in-time vs forward-looking) from contaminating later reasoning.

### Good answer shape
- One sentence starting “This work applies to…”
- Includes timeframe (as-of date or period)
- Clarifies context type (current state vs hypothetical)

### Strong framing pattern
> “This work applies to ___ as-of ___, within the context of ___.”

### Common failure modes
- Mixing current obligations with future speculation
- Treating a hypothetical scenario as factual context

### Quality check
Could a reader tell whether this is point-in-time or forward-looking?  
If yes → this section is complete.

</details>

---

## HASH KEY 4 — Assumptions Being Made

**Surface assumptions before they become hidden dependencies.**

Consider:
- assumed system behavior,
- assumed data quality,
- assumed compliance posture,
- assumed human oversight.

List at least **three assumptions**, even if they feel obvious.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Surface assumptions early so they don’t become hidden dependencies.

### Good answer shape
- Minimum 3 assumptions
- Each assumption is concrete (“We assume…”) not vague (“It is assumed…”)
- Assumptions are about context, inputs, oversight—not outcomes

### Strong framing pattern
> “Assumption 1: ___. Assumption 2: ___. Assumption 3: ___.”

### Common failure modes
- Smuggling conclusions into assumptions (“assume compliant”)
- Writing assumptions so broad they can’t be tested

### Quality check
Would changing one assumption materially change the result?  
If yes → assumptions are meaningful.

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

This protects both you and downstream readers.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prevent the artifact from being misread as advice, approval, or evaluation.

### Good answer shape
- 1–3 “does not” statements
- Focus on what the work will not attempt (not what it “can’t” do)
- Keeps language non-operational and non-inspection

### Strong framing pattern
> “This work explicitly does not ___.”

### Common failure modes
- Over-long disclaimers that drown the intent
- Adding compliance/approval language where it isn’t needed

### Quality check
Would a rushed reader still understand what this work does NOT do?  
If yes → this section is doing its job.

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
Create the “stop line” for AI assistance for this task, before drafting begins.

### Good answer shape
- One sentence starting “AI assistance is limited to…”
- Names allowed assistance (structure, summarise, rewrite)
- Names at least one explicit stop condition (e.g., interpretation, recommendation, sign-off)

### Strong framing pattern
> “AI assistance is limited to ___. AI must not ___ without human intervention.”

### Common failure modes
- Vague boundaries (“help me with analysis”)
- Allowing AI to decide what is in or out of scope

### Quality check
Could you enforce this boundary in a live session without debate?  
If yes → this control is locked.

</details>

---

## HASH KEY 7 — Exercise: Scope Compression

**Exercise (15–20 minutes)**

Write a **scope declaration** of no more than 150 words that includes:
- intent,
- scope,
- exclusions,
- AI assistance limits.

If you cannot do this concisely, the scope is not ready.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Prove scope is stable by compressing it into a single, defensible declaration.

### Good answer shape
- ≤150 words
- Contains: intent, scope, exclusions, AI boundary
- Reads like an opening “scope statement”

### Strong framing pattern
> “Intent: ___. Scope: ___. Out of scope: ___. AI limit: ___.”

### Common failure modes
- Writing a paragraph that implies recommendations
- Leaving out exclusions or AI limits

### Quality check
If someone only read this 150-word block, would they understand the boundaries?  
If yes → scope is ready.

</details>

---

## HASH KEY 8 — Case Prompt (Boundary Stress Test)

Case prompts are optional and intended for deeper stress-testing where time permits.

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
Test whether you can reject scope expansion cleanly and professionally.

### Good answer shape
- Short response (3–6 sentences)
- States whether request is in scope
- If out of scope: names what would need to change (new scope statement / new artifact)

### Strong framing pattern
> “That request is out of scope for this work as currently defined. If we want to include it, we need to update the intent/scope and revalidate boundaries.”

### Common failure modes
- Saying “yes” informally and expanding scope silently
- Turning the response into advice or recommendation

### Quality check
Does your response preserve boundaries without sounding obstructive?  
If yes → this section is useful.

</details>

---

## HASH KEY 9 — Reflection Checkpoint

Reflect honestly:

- Where was scope previously assumed rather than defined?
- Which exclusions were uncomfortable to write?
- What would have gone wrong without this module?

Note any resistance — resistance usually signals a real boundary.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Surface discomfort and ambiguity so it can be handled deliberately (not hidden).

### Good answer shape
- 3–6 bullet notes or short sentences
- Mentions at least one exclusion that felt hard to write
- Notes one likely future drift risk

### Common failure modes
- Writing a summary instead of a reflection
- Declaring finality (“scope is complete”)

### Quality check
Did you identify one place scope could drift if unchecked?  
If yes → reflection is genuine.

</details>

---

## HASH KEY 10 — Priority & Stability Rating (Learning Readiness)

Rate the stability of your scope definition:

This rating is a self-assessment checkpoint, not a maturity score or approval.
It is intended to surface unresolved risks, ambiguities, or capability gaps
before proceeding to subsequent modules or issuing governance outputs.

Here, readiness reflects stability of intent, scope, exclusions, and AI
assistance boundaries.

**Stability score:** 

1 ☐ 
2 ☐ 
3 ☐ 
4 ☐ 
5 ☐

Interpret the scale as follows:

5 — Ready: The core discipline addressed in this module is explicit, stable,
     and consistently applied with minimal reliance on corrective intervention.

4 — Mostly ready: Controls are in place, but occasional ambiguity or correction
     is still required.

3 — Partially ready: Understanding exists, but defensibility relies heavily on
     review, rework, or external support.

2 — Not ready: Gaps frequently introduce risk, inconsistency, or loss of
     accountability.

1 — Not ready: Proceeding would create governance risk and should be paused.

- What would cause this scope to change?
- What must be revalidated before proceeding to reference retrieval or drafting?

Proceed to Module 3 only when:
- scope feels **defensible**, not perfect;
- exclusions are explicit; and
- AI boundaries are clearly stated.

<details>
<summary><strong>PRIMING — How to approach this section (delete before finalising)</strong></summary>

### Intent
Gate progression based on stability of scope—not confidence or correctness.

### Good answer shape
- Choose a score and justify it in plain language
- Name one thing that would change the score
- State what must be revalidated before moving on

### Common failure modes
- Treating “5” as success
- Using the score to imply approval or adequacy

### Quality check
If the score were 2, would you be willing to stop and tighten scope before drafting?  
If yes → the rating is honest.

</details>

---

## Module 2 Completion Note

This module is complete when:

- intent is singular,
- scope is bounded,
- assumptions are visible,
- and AI assistance is explicitly constrained.

Clarity here prevents downstream governance failure.
