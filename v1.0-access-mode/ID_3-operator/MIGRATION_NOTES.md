# ID3 migration and execution orientation

Layout update, 11 October 2026: current collection paths below reflect the standalone IDs now grouped under `v1.0-access-mode/`. Other migration and pending-work statements retain their preparation-time context; use the [collection README](../../README.md) for current completion status.

Prepared 11 October 2026 for the local consolidated draft at `C:\access-pod-v1.0`.

`ID_3-operator/` preserves the complete published release: 45 files, including six PDFs, the Toolkit DOCX, six primer modules, six exemplar modules, four PowerShell scripts, the bundled rule and the prepared two-candidate inbox. All source bytes are unchanged. The original `ID_3_review_packs/ID_3_outbox/` and `ID_3_review_packs/records_only/` directories remain empty. These notes and `SOURCE_NOTICES.md` are collection additions.

## Read the execution documents first

Start with the [original release README](README_ID_3.md), [release notes](release_notes_ID_3.md), [ID3 control](controls/inspection_mode_control_ID_3.md) and [Inspection & Freeze Discipline handbook](<docs/Access-Mode ID_3-Operator - Inspection & Freeze Discipline.pdf>). Then read the [Toolkit README](docs/execution_toolkit/README_toolkit.md), [Toolkit Word command source](<docs/execution_toolkit/ID_3 - Toolkit Script Examples Companion.docx>) and [Toolkit PDF reading copy](<docs/execution_toolkit/ID_3 - Toolkit Script Examples Companion.pdf>). All remain unchanged.

Version E, E.2 and the Project Guide remain under `docs/relationship_to_version_E/`. Version E matches the user-supplied paper. These shared documents also match the earlier ID1 copies.

## Normal workflow and relocation

The supplied walkthrough uses PowerShell 7 and a prepared February baseline plus one time-pressure variant. It can skip Toolkit Step 1 because the inbox is already populated. The normal sequence is:

1. Create the four-file `10_working` surface from the prepared inbox, using the Toolkit Step 2 block and its source-file preflight checks.
2. Run `scripts/Inspect-SessionMetadataShapes.ps1`, then `scripts/Correct-ID3SessionMetadata.ps1`, then inspect again.
3. Read `20_corrected/corrected_notes.md` and `20_corrected/correction_note.md`. The operator confirms zero required-field failures and that corrections respect non-fabrication. Script exit status and completeness percentages are diagnostic, not substitutes for this review.
4. Use the documented recommended DryRun, then an authorised freeze. Verify the four canonical files against the generated `hashes.txt`. Archive/reset is a separate later step in the Toolkit.

The supplied `-DryRun` checks expected source paths and reports planned operations. It may create a missing `OutboxRoot`: directory creation occurs before the DryRun branch. It does not parse or stamp the canonical JSON, repeat the completeness-rule checks or establish that a real freeze will succeed.

Use it in the documented separate working copy. Before a real freeze, retain the operator review of required failures, corrections, intended records and non-fabrication described above. A successful DryRun or script exit does not replace that review.

For a later exercise, copy this entire component to a separate working folder and open PowerShell 7 at that copy's root. Preserve the relative `scripts/`, `scripts/rules/` and `ID_3_review_packs/` structure. Adapt a separate copy of the Toolkit commands to the working folder; do not run its old absolute paths unchanged.

| Historical reference | How to resolve it for a later working-copy run |
|---|---|
| `C:\v1.0-Access-mode\modes\ID_3_operator` | The absolute root of the separate copy of `C:\access-pod-v1.0\v1.0-access-mode\ID_3-operator` |
| Review workspace | `<working-copy root>\ID_3_review_packs` |
| Prepared inbox date | `<review workspace>\ID_2_inbox\2026-02-10` |
| Working pack | `<review workspace>\2026-02-10\ID3-20260210-module03-timepressure` |
| `10_working` | A child of that working pack, created by Toolkit Step 2 |
| Freezer arguments | `-PackRoot` is that working pack; `-OutboxRoot` is `<review workspace>\ID_3_outbox`; `-InboxRoot` is `<review workspace>\ID_2_inbox` |

Keep the example's date, branch and session identifiers when replaying the original example. Inspect/correct resolve their review and rule paths relative to their script location, and select the newest `10_working` directory recursively. Use a fresh copy with one active cycle so an archived working tree is not selected. The original documented freeze does not use `-Strict` or `-CleanupInboxDate`.

The packaged inbox remains the original two-candidate example. The newer `../ID_2-Access/four-candidates/` draft has not been substituted into it or validated through ID3. A later four-candidate ID3 adaptation would be separate work.

## Execution evidence checked

The successful 10 October 2026 isolated PowerShell 7.6.6 replay was reverified against this exact archive on 11 October. Its script/rule files, four supplied inputs, retained working inputs, five invocation logs and saved zero-required-failure report match the recorded evidence. All four retained canonical output hashes still verify.

The example initially reports a baseline placeholder-ID failure. Correction substitutes the existing inbox-folder ID and preserves the original valid creation dates. Reinspection shows 80.85% baseline, 100% variant and 90.42% average, with zero required failures. These percentages describe diagnostic completeness. The earlier assessment's 98.85% screenshot reading was corrected in the prior recheck.

This migration reused verified evidence; it did not rerun correction, create a new freeze, archive/reset the sources or execute a model. The prior gate was checked by the assessor in an isolated example, and is not an independent human sign-off or production authorisation. See `../../provenance/ID_3-operator/WORKFLOW_CHECK.md` and its JSON counterpart for exact coverage and retained local evidence references.

## Clarifications retained alongside the originals

| Source wording or behavior | Clarification |
|---|---|
| Toolkit `working_10` | The commands and actual directory use `10_working`. |
| Summary calls Step 5 canonical promotion | Step 5 is reinspection; canonical generation occurs during the Step 7 freezer invocation. |
| Toolkit `ID_3_Freeze_Note.md` | The script generates `ID3_FREEZE_NOTE.md`. |
| Manifest handbook name uses an em dash | The actual filename is `Access-Mode ID_3-Operator - Inspection & Freeze Discipline.pdf`. Its older "staged as Word sources" wording is historical. |
| Handbook describes all canonical inputs as corrected | The freezer takes sessions from `20_corrected` and unchanged Module 03 records from `10_working`. |
| Freeze eligibility | The documented human gate is necessary; the freezer does not independently repeat the required-field check, and its `-Strict` switch is unused. |
| Timestamp correction edge cases | Existing null/empty dates can receive filesystem-derived values, while strict absent/malformed cases behave differently. The supplied valid dates do not exercise that fallback. Preserve the non-fabrication review for later inputs. |
| Hash reproducibility | Existing frozen bytes verify. A new freeze introduces new event metadata, so its hashes can differ; this qualifies the stronger identical-input wording. |
| Recovery | A real freeze can move a pack before detecting a missing canonical input. The documented DryRun catches the tested missing-file case before that move. |
| `Copy-ID2Inbox.ps1` | This optional helper retains historical hardcoded paths and a self-call issue. The prepared inbox avoids it; the documented new-intake route uses explicit `robocopy` paths. |

These qualifications do not overturn the successful supplied-example workflow. PowerShell 5.1 failed the prior compatibility check; use the documented PowerShell 7 environment. No claim is made about the exact configuration of the original Windows 10 laptop.

The original ID3 source ZIP contains its embedded `scripts/rules/session_completeness.rule.json` but not the separately published formal-specification PDF. This consolidated collection also includes the original sibling [APOD-ID3-RULE-001 v1.1 package](../APOD-ID3-RULE-001-v1.1/MIGRATION_NOTES.md), including [Rule Engine Formalization.pdf](<../APOD-ID3-RULE-001-v1.1/spec/Rule Engine Formalization.pdf>). It was not part of the initial ID3 import. The sibling package's inclusion does not change the original ID3 scripts or establish four-candidate inspection/freeze support.

## Integrity and next boundary

All 44 original entries in `checksums/SHA256SUMS.txt` verify. The checksum file excludes itself. `manifest_ID_3.md` remains an informative inventory. The collection's `../../collection-manifest.json` covers the complete imported payload and additions, excluding itself. The original ZIP, sidecar and import record are under `../../provenance/ID_3-operator/`.

The ID3 papers, original execution documents, scripts and records are unchanged. The standalone rule pack now sits beside ID3, while the ID2 documentation revisions and handbook link corrections are recorded separately in that component. Neither change adapts ID3 for four candidates or reruns its freeze workflow. Current collection packaging status is recorded in the [root manifest](../../collection-manifest.json). An earlier review ZIP describes its own snapshot.
