# v1c collection notes and errata

Added 11 October 2026 for Consolidated Draft Edition 1. All **ten published v1c files** remain unchanged, including Paper C, the informative annex in PDF and Markdown, the schema, both examples and the original manifests.

## Actual integrity-file locations

| Historical reference | Location and role in this collection |
|---|---|
| README: `meta/manifest.json` | `v1c/manifest.json` is the descriptive inventory and scope record. It contains no per-file hashes. There is no original `meta/` directory. |
| README / descriptive manifest: `meta/SHA256SUMS.txt` | The original ZIP checksum is the separately published `provenance/v1c/sealed_20260117_105542.zip.sha256`. |
| Release notes: root `SHA256SUMS.txt` | That filename is absent from the ZIP. Use the published ZIP sidecar above, whose line begins with `SHA256`. |
| Per-file source integrity | `v1c/manifest.internal.json` records hashes and sizes for nine original files; it excludes itself. |
| External seal metadata | `provenance/v1c/manifest.external.json` binds the original ZIP name, hash and sidecar name. Its historical Windows paths describe the original seal, not an installation requirement. |
| Consolidated collection inventory | Root `collection-manifest.json` covers the current collection payload and additions, excluding itself. The inventory alone does not authenticate the ZIP; current packaging status is recorded in that manifest and the separate seal receipt. |

Paths in the table are relative to `C:\access-pod-v1.0`. The source archive, external manifest, published checksum and nine internal entries agree. The navigation errors do not indicate corrupted source bytes. The added notes are tracked by the collection inventory rather than inserted into the historical manifests.

## Scope of the example workflow

The intended activity is human onboarding guidance and declaration review: establish context, assign accountable functions, begin under containment, identify evidence and escalation conditions, interpret outputs under Version A, and reassess after change. The standalone files do not contain an onboarding engine or a completed organization-specific execution trace.

The policy example remains a proposed policy, with a predecessor identifier that is not resolved by this pack. The dataset example remains experimental and explicitly excludes assurance inference; its blank external-verification reference is appropriate to that example. Status fields, dates and a seal do not turn these declarations into approvals. No example value, reference, date or status has been filled in or changed for this migration.

## Schema and interpretation boundaries

Both supplied examples use the appropriate record kind. The original schema nevertheless does not bind the outer `kind` label to the matching policy/dataset branch. A future stricter schema should be explicitly versioned; this import retains the published schema and its identifiers.

The permitted `externally_verified` label records a declaration and does not independently verify an external authority. A consumer should check supporting evidence in context. This note does not create new universal approval criteria or replace an empty reference with invented evidence.

Version A's governance authority remains continuous through onboarding. Paper C's steady-state handback wording describes a change in lifecycle focus. Eligibility under incomplete telemetry, progression decisions and small-team role safeguards still need contextual evidence beyond these lineage examples. The informative annex adds traceability concepts, not new certification or CSC scoring authority.

The paper's minor editorial duplication in section 10.3 remains unchanged. Paper C and the annex PDF have not been rewritten or re-rendered.

## First migration checks

All ten source files match their ZIP members; all nine internal-manifest entries match hashes and sizes; the published external manifest and checksum agree with the ZIP; both PDFs are unchanged. Paper C also matches the user's supplied `APOD-TR-004_Vol2_Version-C (1).pdf` byte for byte and is included only once here.

These are import and integrity checks, not a new schema test, governance decision or runtime evaluation. The earlier private review's optional validators and research reports are separate materials. Read `SOURCE_NOTICES.md` for provenance and licence context.
