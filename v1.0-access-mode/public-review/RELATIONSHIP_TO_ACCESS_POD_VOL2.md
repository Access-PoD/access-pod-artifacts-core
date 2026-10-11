# Relationship to Access PoD Volume 2 (Informative)

## Purpose of this note

This note describes the relationship between the **Access-mode index** and **Access PoD Volume 2**, which introduces simulation-based risk discovery (SAPP), runtime policy enforcement (Access PoD), and telemetry-derived governance signals (CSC).

The intent of this note is to clarify scope and positioning. It does not assert equivalence, dependency, or compliance between documents.

---

## Distinct roles of the documents

Access PoD Volume 2 focuses on **governance mechanisms**.  
It introduces conceptual and technical constructs that explore how governance may attach to system execution, how behaviour may be observed under stress, and how trust signals may be derived from operational telemetry.

The Access-mode index focuses on **governance posture selection**.  
It organises governance activity into distinct, inspectable modes that reflect how governance reasoning is applied at different stages of maturity, operation, and external engagement.

In this sense:
- Volume 2 explains *what governance mechanisms exist and how they may function*.
- Access-mode explains *when and why different governance perspectives are applied*.

---

## Conceptual alignment

Access-mode is intentionally aligned with the concepts introduced in Access PoD Volume 2, without restating or extending them.

In particular:
- **Mode ID_1** aligns with the pre-runtime reasoning and documentation discipline that precedes the application of runtime governance mechanisms.
- **Mode ID_2** concepts such as SAPP, runtime policy attachment, and CSC may be examined as governance reasoning tools, rather than as assurance claims.
- **Mode ID_3** supports the preparation and inspection of governance artifacts that may reference Access PoD concepts, without asserting conformity, adequacy, or regulatory acceptance.

Access-mode does not modify, validate, or operationalise the mechanisms described in Volume 2. It provides a structured lens through which those mechanisms may be discussed.

---

## Non-normative relationship

Neither document is normative.  
Neither document defines requirements, controls, or sufficiency thresholds.

Use of Access-mode does not imply use of Access PoD mechanisms.  
Use of Access PoD mechanisms does not require adoption of Access-mode.

The documents are complementary and may be used independently.

---

## Intended use

Together, Access-mode and Access PoD Volume 2 are intended to support:
- education and capability building,
- structured governance discussion,
- standards exploration and comparison,
- inspection-ready reasoning about governance in operation.

They are not intended to be used as certification criteria, conformity assessment schemes, or indicators of deployment readiness.
