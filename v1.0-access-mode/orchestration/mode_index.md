# Access-mode Index

This index defines the available **Access-mode configurations** for the v1.0 workshop.

Each mode (6 modules pod) is a deterministic selection derived from a common structural framework.  
All modules retain the **HASH KEY 1–10** internal structure.  
Modes differ only in *operational emphasis* and *intended use context*.

(Note: In this index, the term “pod” (lower case) refers to a logical grouping of six modules used together within a mode. It is a documentation and orchestration term only, and is distinct from Access PoD (Policy-on-Demand) and other PoD identifiers.)

---

## Out of scope (informative)

This index and the Access-mode configurations it describes are provided as an informational framework to support structured discussion, analysis, and standards exploration. They do not constitute, and shall not be interpreted as, certification criteria, conformity-assessment schemes, assurance claims, or statements of deployment readiness.

Access-mode does not define requirements, controls, performance thresholds, or evidence sufficiency for regulatory compliance. It does not assert that the use of any mode results in a compliant, safe, or trustworthy AI system, nor does it substitute for legal, regulatory, or organisational determinations.

Any references to runtime behaviour, monitoring, or inspection are illustrative of governance-reasoning practices and are not intended to imply operational adequacy, approval, or endorsement by any authority.

---

## Why Access-mode exists

Access-mode exists to address a recurring gap in AI governance practice: the tendency to treat governance as a single, static activity rather than as a set of **context-dependent operational postures**.

In practice, the questions, evidence, and controls required to reason about AI governance differ depending on whether the objective is to educate practitioners, evaluate runtime behaviour, or prepare materials for standards or regulatory inspection. Access-mode provides a structured mechanism for transitioning between these postures without altering the underlying governance framework. By preserving a common module structure and HASH KEY semantics, Access-mode enables consistent reasoning while allowing governance to be examined at different stages of maturity, execution, and accountability.

---

## Mode ID_1 — Core Workshop

**Reasoning intent:** Foundational governance reasoning  
**Governance posture:** Conceptual and written  
**Context focus (execution):** Pre-runtime reasoning (no execution context assumed)

### When to use
Select this mode when the goal is to:
- introduce AI governance discipline
- establish identity, scope, and evidence practices
- support mixed or early-stage audiences

### Characteristics
- Architecture-agnostic
- No runtime enforcement assumed
- Emphasizes clarity, intent, and reflection

### Module set pod - All from v1.0-workshop core modules
1. Governance & AI Identity  
2. Intent, Scope & Boundaries  
3. Governance RAG & References  
4. Writing Governance Artifacts  
5. Access PoD Lens  
6. Forward Practice & Reflection  

📁 Location: `modes/ID_1_core/`

---

## Mode ID_2 — Access-mode (Runtime Governance)

**Reasoning intent:** Governance in operation  
**Governance posture:** Stress-tested and execution-aware  
**Context focus (execution):** Runtime behavior and continuous assurance

### When to use
Select this mode when the goal is to:
- explore how governance behaves under pressure
- connect policy to execution boundaries
- reason about enforcement, drift, and revocation

### Characteristics
- Introduces simulation and runtime control points
- Emphasizes telemetry and feedback loops
- Extends governance reasoning beyond documentation into operational analysis.

### Module set pod
1. Governance & AI Identity *(canonical)*  From v1.0-workshop 
2. Intent, Scope & Boundaries *(canonical)*  From v1.0-workshop  
3. SAPP Simulation & Stress Testing *(new)*   For Access mode
4. Writing Governance Artifacts *(canonical)*  From v1.0-workshop  
5. Access PoD Runtime Enforcement *(new)*  For Access mode
6. CSC Scoring & Revocation *(new)*  For Access mode

📁 Location: `modes/ID_2_access/`

---

## Mode ID_3 — Operator / Standards Mode

**Reasoning intent:** Inspection-ready governance  
**Governance posture:** Evidence-driven and auditable  
**Context focus (execution):** Standards, regulators, and publication discipline

### When to use
Select this mode when the goal is to:
- prepare artifacts for standards or regulatory review
- improve normative language precision
- formalize packaging, traceability, and evidence handling

### Characteristics
- Assumes prior governance understanding
- Focuses on how governance is presented, reviewed, and challenged
- Suitable for operator, auditor, and policymaker contexts

### Module set pod
1. Governance & AI Identity *(canonical)*  From v1.0-workshop 
2. Normative Language & ISO-style Phrasing *(new)*  For Access mode
3. Governance RAG & References *(canonical)*  From v1.0-workshop 
4. Regulator Evidence Requests *(new)*  For Access mode
5. Access PoD Lens *(canonical)*  From v1.0-workshop 
6. Packaging, Manifests & Release Discipline *(new)*  For Access mode

📁 Location: `modes/ID_3_operator/`

---

## Selection guidance (quick)

- **New audience or first exposure →** ID_1  
- **Runtime assurance, enforcement, drift →** ID_2  
- **Standards, regulators, operators →** ID_3  

---

## Structural invariant

All modes:
- use the same six-module structure;
- preserve HASH KEY 1–10 semantics; and
- differ only by module selection and filename suffix (`_ID_n`).

Generated mode modules are **not authoritative sources**.  
Canonical content resides in `/modules` and shall be regenerated into modes following any change.

---

## Annex A — Informative lifecycle mapping of Access-modes

This annex provides a conceptual mapping between Access-mode configurations and commonly recognised phases of an AI system lifecycle. The mapping is illustrative and does not correspond to any specific standard or prescribed lifecycle model.

The purpose of this annex is to support orientation and discussion rather than to define process steps, controls, or assessment criteria.

### Conceptual lifecycle stages

| Conceptual lifecycle stage        | Governance emphasis                              | Access-mode |
|----------------------------------|--------------------------------------------------|-------------|
| Early design and intent setting  | Identity, purpose, scope, documentation          | ID_1        |
| Deployment and operation         | Runtime behavior, controls, monitoring           | ID_2        |
| Review and external engagement   | Evidence presentation, inspection, traceability  | ID_3        |

### Interpretive notes

- Mode ID_1 supports governance reasoning prior to system operation, where clarity of intent, responsibility, and scope are primary concerns.
- Mode ID_2 supports discussion of governance during system operation, including how controls and signals may behave under changing conditions.
- Mode ID_3 supports post-hoc and external-facing activities, such as review, audit preparation, and standards or regulatory engagement.

This mapping is non-normative and is provided solely to assist understanding of how governance focus may shift across stages of system maturity.

