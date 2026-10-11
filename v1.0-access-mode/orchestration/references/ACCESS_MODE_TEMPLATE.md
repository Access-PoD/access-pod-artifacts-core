# Access-mode Orchestration Template

This document defines the available **Access-mode configurations** for the v1.0 workshop and related governance materials.

Access-mode provides a structured mechanism for selecting different governance **reasoning postures** while preserving a common modular framework. All modules retain the **HASH KEY 1–10** internal structure. Modes differ only by module selection and filename suffix (`_ID_<mode>`).

This template is informational and is intended to support consistent navigation, facilitation, and inspection across modes.

---

## Orchestration reference — HASH KEY alignment (informative)

This table describes how HASH KEY 1–10 semantics apply at the **Access-mode orchestration level**.  
It does not replace or redefine module-level HASH KEY usage.

| HASH KEY | Orchestration meaning |
|---------:|-----------------------|
| HK 1 | Purpose of the selected governance posture |
| HK 2 | Intended scope of discussion and use |
| HK 3 | Assumptions about audience maturity and context |
| HK 4 | Terminology and framing consistency across modes |
| HK 5 | Types of evidence or reasoning emphasised |
| HK 6 | Mode-specific methods of engagement or analysis |
| HK 7 | Governance boundaries and non-claims |
| HK 8 | Failure modes or misinterpretation risks |
| HK 9 | Expected outputs of the selected mode |
| HK 10 | Review, reflection, and transition to other modes |

This alignment supports consistent reasoning across modes while allowing operational emphasis to vary.

---

## Mode selection guidance

- Use **Mode ID_1** to establish governance fundamentals and shared language.  
- Use **Mode ID_2** to examine governance under operational and runtime conditions.  
- Use **Mode ID_3** to prepare governance artifacts for inspection, standards discussion, or external review.

---

## How Access-mode selection works (informative)

Access-mode is an orchestration mechanism for selecting a governance **operational posture** without changing the underlying framework.

All modes:
- use the same six-module structure;
- preserve HASH KEY 1–10 semantics; and
- differ only in module emphasis and file suffix (`_ID_<mode>`).

Mode selection does not imply maturity, quality, or progression. It defines *how governance is examined*, not *how advanced a system is*.

---

### Step 1 — Identify the primary question

Ask:
- Are we learning fundamentals?
- Are we examining runtime behaviour?
- Are we preparing for inspection or standards discussion?

The answer determines the mode.

---

### Step 2 — Select the mode

| Primary intent | Select mode |
|---------------|-------------|
| Foundational understanding | ID_1 — Core Workshop |
| Governance under operation | ID_2 — Access-mode |
| Inspection / standards | ID_3 — Operator / Standards |

Only one mode should be active per session.

---

### Step 3 — Load the corresponding modules

Use only the modules in:
- `modes/ID_1_core/modules/`
- `modes/ID_2_access/modules/`
- `modes/ID_3_operator/modules/`

Canonical modules in `/modules` remain unchanged and authoritative.

---

### Step 4 — Maintain posture discipline

During delivery:
- Do not drift into another mode’s assumptions
- Do not import terminology prematurely
- Do not answer questions using a different mode’s logic

If a question belongs to another mode, note it explicitly and defer.

---

### Step 5 — Optional transition (advanced use)

In multi-session programs, modes may be sequenced deliberately:

- ID_1 → ID_2 (from understanding to operation)
- ID_2 → ID_3 (from operation to inspection)

Transitions should occur **between sessions**, not within them.

---

### Interpretation note

Access-mode selection:
- does not assert deployment readiness;
- does not imply compliance or certification; and
- does not rank systems or organizations.

It provides a controlled way to reason about governance from different, clearly bounded perspectives.

---

## Visual selector — Audience → mode → outputs (informative)

Use this selector to choose an Access-mode configuration based on the primary audience and the intended outputs.

+------------------------------+-----------------------------+----------------------------------------------+
| Primary audience | Select mode | Typical outputs |
+------------------------------+-----------------------------+----------------------------------------------+
| General / mixed cohorts | ID_1 — Core Workshop | Shared governance language |
| Education / early-stage | | Scoped intent and boundaries |
| practitioners | | Evidence discipline and written artifacts |
| | | Reflection and forward practice |
+------------------------------+-----------------------------+----------------------------------------------+
| Practitioners / designers | ID_2 — Access-mode | Scenario-based stress-testing reasoning |
| Assurance / operations teams | (Runtime Governance) | Runtime policy attachment discussion |
| | | Telemetry concepts and drift / revocation |
| | | Trust signal interpretation (non-assertive) |
+------------------------------+-----------------------------+----------------------------------------------+
| Operators / auditors | ID_3 — Operator / | Inspection-ready artifact framing |
| Standards bodies / | Standards Mode | Normative language precision |
| regulators | | Evidence request handling and traceability |
| | | Packaging, manifests, release discipline |
+------------------------------+-----------------------------+----------------------------------------------+

Interpretation note: This selector is illustrative. It does not prescribe assessment outcomes, evidence sufficiency, or governance adequacy.

---

## Facilitator timing guidance (informative)

The following guidance provides indicative timing for a standard delivery. It is informational only and may be adapted based on audience, depth, and facilitation context.

### Mode ID_1 — Core Workshop

**Recommended duration:** 90–120 minutes  
**Pacing profile:** Exploratory, discussion-led

| Module | Focus area                               | Typical time |
|------:|------------------------------------------|-------------:|
| 01    | Governance identity and responsibility   | 15–20 min    |
| 02    | Intent, scope, and boundaries             | 15–20 min    |
| 03    | References and evidence discipline        | 15–20 min    |
| 04    | Writing governance artifacts              | 20–25 min    |
| 05    | Access PoD lens (conceptual)              | 10–15 min    |
| 06    | Reflection and forward practice           | 10–15 min    |

**Facilitation emphasis**
- Encourage shared language and interpretation.
- Avoid system-specific or compliance discussions.
- Prioritise clarity over completeness.

---

### Mode ID_2 — Access-mode (Runtime Governance)

**Recommended duration:** 120–150 minutes  
**Pacing profile:** Analytical, scenario-driven

| Module | Focus area                                   | Typical time |
|------:|----------------------------------------------|-------------:|
| 01    | Governance identity (runtime accountability) | 10–15 min    |
| 02    | Scope under operational pressure             | 15–20 min    |
| 03    | SAPP simulation and stress-testing            | 25–30 min    |
| 04    | Artifact interpretation under change         | 15–20 min    |
| 05    | Runtime enforcement and telemetry            | 25–30 min    |
| 06    | CSC reasoning, drift, and revocation          | 15–20 min    |

**Facilitation emphasis**
- Use scenarios rather than hypotheticals.
- Focus on *behaviour under change*, not ideal states.
- Reinforce separation between governance signals and claims.

---

### Mode ID_3 — Operator / Standards Mode

**Recommended duration:** 90–120 minutes  
**Pacing profile:** Structured, inspection-oriented

| Module | Focus area                                   | Typical time |
|------:|----------------------------------------------|-------------:|
| 01    | Governance identity (external accountability) | 10–15 min    |
| 02    | Normative language precision                 | 15–20 min    |
| 03    | References and traceability                  | 15–20 min    |
| 04    | Regulator or reviewer evidence requests      | 20–25 min    |
| 05    | Access PoD lens (inspection framing)         | 10–15 min    |
| 06    | Packaging, manifests, and release discipline | 10–15 min    |

**Facilitation emphasis**
- Assume governance literacy.
- Avoid system design debates.
- Focus on clarity, defensibility, and interpretability.

---

## Mode ID_1 — Core Workshop (default)

**Purpose:** Foundational governance reasoning  
**Primary audience:** General practitioners, researchers, mixed-discipline cohorts  
**Governance posture:** Conceptual and documentation-based  
**Execution focus:** Pre-runtime reasoning

### Description
Mode ID_1 is the baseline workshop configuration. It is designed to establish core governance discipline before introducing runtime, enforcement, or standards-specific considerations.

This mode focuses on:
- governance identity and responsibility,
- intent and scope clarity,
- evidence-aware writing practices, and
- reflective governance reasoning.

No assumptions are made about system deployment, runtime enforcement, or regulatory engagement. The emphasis is on building shared understanding and consistent language.

### Typical use cases
- Introductory workshops
- Early-stage governance capability building
- Education and research contexts
- Cross-functional or non-technical audiences

### Module set
- `modes/ID_1_core/modules/*.md`

All modules in this mode are canonical copies of the base workshop materials.

---

## Mode ID_2 — Access-mode (Runtime Governance)

**Purpose:** Governance in operation  
**Primary audience:** Governance practitioners, system designers, assurance teams  
**Governance posture:** Stress-tested and execution-aware  
**Execution focus:** Runtime behaviour and continuous assurance reasoning

### Description
Mode ID_2 introduces **Access-mode** as a runtime-oriented governance posture. It extends the core workshop by incorporating modules that explore how governance behaves under operational conditions.

This mode focuses on:
- simulation-based risk discovery,
- attachment of governance policy to execution boundaries,
- runtime monitoring and telemetry, and
- reasoning about drift, degradation, and revocation of trust signals.

Mode ID_2 does not assert operational adequacy or compliance. It provides a structured context for examining runtime governance concepts as reasoning tools.

### Typical use cases
- Advanced governance workshops
- Runtime assurance discussions
- Exploration of post-deployment governance
- Bridging policy and system execution perspectives

### Module set
- `modes/ID_2_access/modules/*.md`

This mode combines selected canonical modules with new, mode-specific modules addressing runtime governance concepts.

---

## Mode ID_3 — Operator / Standards Mode

**Purpose:** Inspection-ready governance reasoning  
**Primary audience:** Operators, standards bodies, regulators, auditors  
**Governance posture:** Evidence-driven and review-oriented  
**Execution focus:** External engagement and publication discipline

### Description
Mode ID_3 reframes the workshop for **operator and standards-facing contexts**. It assumes familiarity with governance fundamentals and shifts emphasis toward how governance artifacts are prepared, presented, and reviewed.

This mode focuses on:
- normative language precision,
- preparation for regulator or standards inquiry,
- evidence packaging and traceability, and
- publication and release discipline.

Mode ID_3 supports inspection and discussion but does not imply conformity, certification, or regulatory approval.

### Typical use cases
- Standards exploration and mirror committee engagement
- Regulator-facing preparation
- Operator documentation and audit readiness discussions
- Public review and external consultation contexts

### Module set
- `modes/ID_3_operator/modules/*.md`

This mode combines canonical modules with operator- and standards-specific modules designed for inspection-oriented reasoning.

---

## Structural invariant

Across all modes:
- the six-module structure is preserved;
- HASH KEY 1–10 semantics remain consistent; and
- only module selection and filename suffixes differ.

Generated mode modules are not authoritative sources. Canonical content resides in `/modules` and shall be regenerated into modes following any change.
