# Module 3 — Governance Reference Discipline
## Bounded Retrieval for Standards-Aligned Reasoning

HASH KEY progression (1–10) is defined in the README_ID_1 and used consistently across modules.

Access-Mode context:
This module is rendered under **ID_1 — Core / Learning** posture.
References are treated as conceptual anchors only.
No authority resolution or inspection weighting is permitted.

---

## Purpose

This module establishes **reference discipline** for governance work supported by AI.

In governance contexts, errors rarely come from incorrect language generation.
They arise when **unbounded references**, **informal interpretations**, or
**implicit assumptions** are allowed to influence reasoning.

This module defines how reference materials function as **governance-grade
retrieval anchors**, ensuring that AI assistance operates only within
explicitly permitted sources and interpretations.

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
Clarify *why* references are being used before any retrieval occurs.

### Good answer shape
- 1–2 sentences
- Describes the role references play (explain, orient, compare)
- Avoids obligation or adequacy language

### Strong framing pattern
> “References are retrieved in this work to ___, not to ___.”

### Common failure modes
- Retrieving “just in case”
- Treating references as proof rather than context

### Quality check
If references were removed, would the reasoning still have a clear purpose?  
If yes → retrieval intent is sound.

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
Prevent unbounded retrieval by defining *what kinds* of sources are allowed.

### Good answer shape
- Two explicit lists: **Allowed** / **Disallowed**
- Categories, not interpretations
- Conservative inclusion

### Strong framing pattern
> “Allowed categories include ___. Disallowed categories include ___.”

### Common failure modes
- Treating blogs or summaries as governance sources
- Leaving categories implicit

### Quality check
Could you reject a source purely by category?  
If yes → categories are effective.

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
Make authority hierarchy explicit so conflicts don’t resolve themselves silently.

### Good answer shape
- Clear priority rule
- Distinguishes authoritative vs contextual sources
- States what must never override formal instruments

### Strong framing pattern
> “In the event of conflict, priority is given to ___ over ___.”

### Common failure modes
- Treating all references as equal
- Letting “helpful” sources outrank authoritative ones

### Quality check
If two sources disagree, is the resolution rule obvious?  
If yes → authority is explicit.

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
Define how far interpretation may go before it becomes reinterpretation.

### Good answer shape
- States what AI may summarise or explain
- States what AI must not infer or extend
- Keeps interpretation descriptive

### Strong framing pattern
> “AI may summarise or explain ___. AI must not infer or reinterpret ___.”

### Common failure modes
- Allowing synthesis that implies new meaning
- Blurring explanation with interpretation

### Quality check
Could you explain the boundary to a third party in one sentence?  
If yes → interpretation limits are clear.

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
Prevent outdated or superseded material from shaping reasoning.

### Good answer shape
- Clear rule for “current” vs “superseded”
- States how drafts or consultations are handled
- Avoids time ambiguity

### Strong framing pattern
> “References are considered valid only if ___.”

### Common failure modes
- Mixing current and outdated material
- Treating drafts as authoritative

### Quality check
Would a reviewer know which version applies?  
If yes → currency is controlled.

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
Create a hard stop on what AI is allowed to retrieve or generalise from.

### Good answer shape
- One clear boundary sentence
- Distinguishes provided vs external sources
- Mentions logging if external retrieval is allowed

### Strong framing pattern
> “AI retrieval is limited to ___. AI must not ___.”

### Common failure modes
- Allowing implicit external retrieval
- Letting AI generalise beyond supplied text

### Quality check
Could you detect if this boundary were violated?  
If yes → retrieval control is enforceable.

</details>

---

## HASH KEY 7 — Exercise: Reference Map

This exercise is intended to make reference authority and usage explicit before
any drafting begins. The goal is not completeness, but defensibility: every
reference used should have a clear role, weight, and boundary.

**Exercise (20 minutes)**

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
Force every reference to earn its place through classification.

### Good answer shape
- Table with reference, category, authority, allowed use
- At least five entries
- No unclassifiable references

### Common failure modes
- Including sources that “feel useful” but lack category
- Leaving authority level vague

### Quality check
Could you justify keeping each reference under challenge?  
If yes → the map is defensible.

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
Detect and correct authority drift introduced by language.

### Good answer shape
- Identifies the issue (“best practice”)
- Explains why it’s a problem
- Describes a concrete correction

### Common failure modes
- Leaving vague authority language untouched
- Replacing one vague phrase with another

### Quality check
Does the correction remove implied authority?  
If yes → drift is controlled.

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
Surface attachment to informal sources and habits.

### Good answer shape
- Short reflections
- Names at least one uncomfortable exclusion
- Notes one habit to unlearn

### Common failure modes
- Defending habits instead of noticing them
- Treating reflection as justification

### Quality check
Did you identify one source you rely on out of convenience?  
If yes → reflection is honest.

</details>

---

## HASH KEY 10 — Priority & Readiness Rating (Retrieval Stability)

Rate your reference discipline readiness:

This rating is a self-assessment checkpoint, not a maturity score or approval.
It is intended to surface weaknesses in reference scope, authority hierarchy,
and retrieval boundaries before drafting or analysis begins.

**Readiness score:** 

1 ☐ 
2 ☐ 
3 ☐ 
4 ☐ 
5 ☐

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
Gate progression based on stability of reference discipline.

### Good answer shape
- Select one score
- Justify it in plain language
- Name what would improve it

### Common failure modes
- Treating “5” as success
- Ignoring retrieval boundary weaknesses

### Quality check
If the score were 2, would you stop and fix reference discipline?  
If yes → the rating is honest.

</details>

---

## Module 3 Completion Note

This module is complete when:

- references are bounded,
- authority is explicit,
- interpretation limits are defined, and
- AI cannot silently expand its reasoning base.

Governance reasoning begins with disciplined retrieval.
