# v1b collection notes and errata

Added 11 October 2026 for Consolidated Draft Edition 1. All **16 published v1b files** retain their original bytes. These notes accompany an illustrative draft; they do not change Version A governance definitions or turn the example into an operational assurance service.

## Read the historical release with these clarifications

The original README and five guidance PDFs are preserved. Their normal workflow is human evidence preparation: define scope, complete the native self-assessment, index evidence, prepare/review a scoped snapshot, check readiness, manage disclosure and restore evidence before reissue. The supplied records illustrate this workflow; this migration does not execute a model, scorer, registry or runtime controller.

| Source / issue | Collection clarification |
|---|---|
| Operator's Manual p5, Step 1 | The supplied self-assessment is `native/json/apod.self_assessment.eu_annex_vii.v1b.json`. Use that name rather than the unsuffixed reference. |
| Expanded assessment, response-scale notes | The actual evidence index is `native/json/apod.evidence_manifest.json`; `apod_governance_evidence_manifest.json` is not included. |
| Original folder diagram / manifest root | Paths beginning `_future_extensions/v1b/` describe the historical layout. In this collection, work beneath `v1b/`. The manifest's old absolute development path is provenance, not an installation prerequisite. |
| README's runtime “proof” language | The pack supplies illustrative records and a review procedure. Treat runtime effectiveness as a separate claim requiring execution evidence. |
| README's broad “schema-validated” description | Three supplied schemas correspond to the self-assessment, evidence manifest and CSC snapshot. The crosswalk and descriptive bundle have no dedicated schema in this pack. File checks do not authenticate governance authority. |
| Historical example dates and blanks | Preserve the pilot values, snapshot validity dates, blank draft signoffs and two null crosswalk targets. The crosswalk's `issued_at` of 1 February 2026 is later than the original seal context and snapshot expiry; its illustrative chronology needs clarification, not an invented replacement date. |
| “Paper B forthcoming” in the original README | This describes the artifact release at publication. The separately supplied Paper B has now been added under `papers/`; it is not an original ZIP member. |

## Regulatory-reference clarification

A–J are internal Access PoD review categories. Some historical `annex_vii_refs` and checklist headings are unreliable legal pinpoints. In the original Official Journal text of Regulation (EU) 2024/1689, Annex VII has main points 1–5, not 6–10. Post-market monitoring is Article 72; serious-incident reporting is Article 73. The retained Article 61 post-market anchor should not be relied on for that purpose. These are historical citation clarifications, not a new determination of legal applicability. [Official EUR-Lex text, original 2024 publication](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng).

The original PDFs and JSON references remain unchanged. Use the checklist as a preparatory evidence aid; its statement that it satisfies Annex VII is not established by the supplied example. A future reference correction should separate internal category IDs from reviewed legal pinpoints. Renaming every Annex VII reference to Annex IV would not resolve the mapping.

## Paper preservation and source boundaries

`papers/APOD-TR-003_Vol2_Version-B.pdf` is the user's supplied Paper B, copied without changing its content or PDF metadata. Only the filename's download suffix `(1)` was removed. Its distinct source and SHA-256 are recorded in `../provenance/v1b/IMPORT_RECORD.json`.

The paper's original edition/status labels and assessed editorial issues are retained. These include the contents/status navigation, the displayed versus embedded workspace link and the incomplete regulation citation. This migration does not edit the paper or substitute one of the differing workspace copies.

## Preservation checks

All 16 original files match the source ZIP. All 15 entries in `manifest_v1b.json` match hashes and sizes; that historical manifest excludes itself and the collection additions. The five original guidance PDFs and added Paper B are unchanged from their respective sources. Source ZIP CRC and SHA-256 checks pass. These checks establish preservation, not a new schema evaluation or runtime result.

Read `SOURCE_NOTICES.md` for release-specific attribution and licence context. The collection inventory covers the additions separately from the preserved original manifest.
