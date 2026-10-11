# Access-Mode ID_3 — Operator / Inspection & Freeze Discipline
Release Manifest (ID_3 Operator)

Status: Informative working-release manifest  
Primary posture: ID_3 — Inspection / Standards  
Non-normative: This manifest does not define requirements, conformance criteria, compliance, certification, approval, or deployment readiness.

This manifest enumerates the public ID_3 release surface as distributed.

---

## Release Package Boundary

Included in this release:
- ID_3 modules (primary and exemplar)
- ID_3 control file (inspection posture enforcement)
- ID_3 scripts + rule specification
- ID_3 companion documents (treated as PDFs for release; currently staged as Word sources)
- Relationship-to-Version-E references (Version E, E.2, and Project Guide)
- Prepared example ID_2 inbox session under `ID_3_review_packs/ID_2_inbox/` to allow users to skip Toolkit Step 1

Notes:
- `ID_3_review_packs/ID_2_inbox/` FOLDER - includes a baseline and variant session from ID_2 to provide a prepared intake example for toolkit use. It does not imply adequacy, compliance, approval, or inspection completion. It is instructional and execution-oriented only.

---

## Root Files

- `manifest_ID_3.md`
- `README_ID_3.md`
- `release_notes_ID_3.md`

---

## controls/ (Canonical posture enforcement)

- `controls/inspection_mode_control_ID_3.md`
- `controls/Inspection Mode Rules README ID_3.pdf`

---

## primary_modules/ (Instructional ID_3 examples)

- `primary_modules/module_01_governance_ai_identity_ID_3.md`
- `primary_modules/module_02_normative_language_iso_phrasing_ID_3.md`
- `primary_modules/module_03_governance_rag_references_ID_3.md`
- `primary_modules/module_04_regulator_evidence_requests_ID_3.md`
- `primary_modules/module_05_access_pod_lens_ID_3.md`
- `primary_modules/module_06_packaging_manifests_release_ID_3.md`

---

## exemplar_modules/ (Canonical ID_3 modules)

- `exemplar_modules/module_01_governance_ai_identity_ID_3.md`
- `exemplar_modules/module_02_normative_language_iso_phrasing_ID_3.md`
- `exemplar_modules/module_03_governance_rag_references_ID_3.md`
- `exemplar_modules/module_04_regulator_evidence_requests_ID_3.md`
- `exemplar_modules/module_05_access_pod_lens_ID_3.md`
- `exemplar_modules/module_06_packaging_manifests_release_ID_3.md`

---

## docs/ (Companion documents and canonical references)

### Companion documents
Distributed as PDF for reading and review.  
The DOCX Toolkit companion is provided as the copy/paste execution source.

- `docs/Access-Mode ID_3-Operator — Inspection & Freeze Discipline.pdf`
- `docs/execution_toolkit/ID_3 - Toolkit Script Examples Companion.pdf`
- `docs/execution_toolkit/ID_3 - Toolkit Script Examples Companion.docx`
- `docs/execution_toolkit/README_toolkit.md`

### relationship_to_version_E/ (Canonical references included unchanged)
- `docs/relationship_to_version_E/README.md`
- `docs/relationship_to_version_E/APOD-TR-006 - Volume 2, Version E.pdf`
- `docs/relationship_to_version_E/APOD-TR-006-E.2.pdf`
- `docs/relationship_to_version_E/Access_Mode_Project_Guide.pdf`

---

## scripts/ (ID_3 operator tooling)

- `scripts/Copy-ID2Inbox.ps1`
- `scripts/Inspect-SessionMetadataShapes.ps1`
- `scripts/Correct-ID3SessionMetadata.ps1`
- `scripts/Move-And-Freeze-ID3Outbox.ps1`

### scripts/rules/ (Structural inspection specification)
- `scripts/rules/session_completeness.rule.json`

---

## ID_3_review_packs/ (Prepared example intake + operator workspace)

This folder provides a prepared example ID_2 inbox session for ID_3 execution walkthroughs.

### ID_2_inbox/ (Prepared example session for Toolkit Step 2)
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/session.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/module_01_governance_ai_identity_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/module_02_intent_scope_boundaries_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/module_03_sapp_simulation_stress_testing_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/module_04_writing_governance_artifacts_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/module_05_access_pod_runtime_enforcement_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/baseline/ID2-20260210-1835-session/artifacts/module_06_csc_scoring_revocation_ID_2.json`

- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/session.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/module_01_governance_ai_identity_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/module_02_intent_scope_boundaries_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/module_03_sapp_simulation_stress_testing_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/module_04_writing_governance_artifacts_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/module_05_access_pod_runtime_enforcement_ID_2.json`
- `ID_3_review_packs/ID_2_inbox/2026-02-10/variants/ID2-20260210-1907-session-timepressure/artifacts/module_06_csc_scoring_revocation_ID_2.json`

### ID_3_review_packs/ 
This directory is part of the expected deterministic workspace structure for ID_3 runs.

ID_3_review_packs/ID_2_inbox contains a prepared example session.
ID_3_outbox/ and records_only/ are expected to be empty at release and populated during execution.

---

## Non-Claims Reminder

This release is non-normative.

No claim of compliance, certification, approval, adequacy, or deployment readiness may be derived from:
- module completion,
- structural completeness,
- freeze state,
- integrity markers,
- example sessions,
- or script outputs.

Human judgment remains authoritative at all times.