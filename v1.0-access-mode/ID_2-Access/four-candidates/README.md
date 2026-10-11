# ID2 four-candidate example — local draft

Prepared 11 October 2026. This self-contained folder retains the original modules, controls, papers, templates and seven scripts, with the four-case records from `C:\v1.1-Access-mode\modes\ID_2_access_4.sessions`. It is a local four-candidate example; the complete published two-candidate release remains one level above.

## Candidate map

The common session day is `records/sessions/2026-04-11/`.

| Case | Folder within that day |
|---|---|
| Baseline | `baseline/ID2-20260411-1400-qpath-tr008-run/` |
| Time pressure | `variants/ID2-20260411-1400-qpath-tr008-run-timepressure/` |
| Ambiguity | `variants/ID2-20260411-1400-qpath-tr008-run-ambiguity/` |
| Lifecycle boundary | `variants/ID2-20260411-1400-qpath-tr008-run-lifecycleboundary/` |

Each case supplies `session.json` and `artifacts/module_03_sapp_simulation_stress_testing_ID_2.json`. These are eight saved records supporting a Module 03 comparison. The sessions list six module outputs, but those other five module records are not supplied in these April branches. No missing records were invented. The April comparison summary is retained in `records/comparisons/2026-04-11/ID2-20260411-1400-qpath-tr008-run/` with its original paths and timestamp.

## Four-candidate documentation revision

The new [four-candidate Word guide](<docs/create_sessions/revisions/ID_2 Toolkit Script Examples Companion - four-candidate consolidated draft.docx>) retains the original 62-page walkthrough; its four-candidate supplement begins on page 63 and documents all four supplied cases. Use it with the [full-record companion](docs/create_sessions/revisions/ID2_FOUR_CANDIDATE_FULL_RECORDS.md), [verified replay script](docs/create_sessions/revisions/Replay-ID2-FourCandidate.ps1) and [revision notes](docs/create_sessions/revisions/REVISION_NOTES.md).

Read the shared [current module, status and helper clarifications](../MIGRATION_NOTES.md#current-reading-clarifications) alongside this four-candidate guide.

Version E, E.2, the Project Guide and original Toolkit PDF remain unchanged. The current ID2 handbook has only its page 2 release-tag link corrected to `ID_2-Access`; the original handbook is preserved with the [correction record](../../../provenance/ID_2-Access/link-path-corrections-20261011/CORRECTION_RECORD.json). Three earlier DOCXs under `docs/create_sessions/` remain as historical/reference sources. Their old console text and path instructions retain their original context. The [edit schedule](docs/FOUR_CANDIDATE_DOCUMENTATION_EDITS.md) is preserved as the dated planning record; the new guide is the completed draft revision from that plan.

`README_ID_2.md`, `release_notes_ID_2.md`, `manifest.txt`, helper guidance and the other older PDFs retain their historical content. The handbook link correction is the explicit exception described above. The 21 February `manifest.txt` describes the earlier release and is not this folder's current inventory. Use [the import record](../../../provenance/ID_2-Access/IMPORT_RECORD.json), [the documentation revision record](../../../provenance/ID_2-Access/documentation-20261011/DOC_REVISION_RECORD.json) and [the collection inventory](../../../collection-manifest.json) for the assembled payload and this addition. The unchanged Word source backup is preserved beside the revision record.

## Bounded replay

Before using the linked replay script, set `$sourceRoot` in a separate script copy to the `four-candidates` folder in your extracted collection. Set `$assessmentRoot` and the derived `$workBase` to your own writable location. Review the resulting `$workingRoot` and choose an unused directory; the script refuses to reuse an existing working folder.

The packaged values record the author's earlier Windows workspace. Historical absolute paths inside supplied JSON records and archived comparison output remain provenance and should not be globally replaced.

Check the newly generated summary for the requested baseline and all three expected variant paths, as the replay script does. A wrapper exit code alone is not a complete validation result. Keep `-MarkCompleted` and the authoring/status helpers outside the supplied-record replay route. The wrapper invokes child `pwsh` processes without checking each child's `LASTEXITCODE`; the replay script adds result checks for this supplied-case route. No new failure-path execution was performed for this Markdown clarification, and the prior successful replay does not establish general runtime robustness.

Use PowerShell 7, with `pwsh` on PATH. The new replay script creates a fresh working copy and verifies the baseline and three expected variant identities; choose an unused working-copy path if its example path already exists. The wrapper resolves its sibling scripts locally and accepts explicit record paths. A complete invocation from a working-copy root is:

```powershell
pwsh -NoProfile -File .\scripts\primary\Run-ID2-StressComparison.ps1 -BaselinePath "records\sessions\2026-04-11\baseline\ID2-20260411-1400-qpath-tr008-run\artifacts\module_03_sapp_simulation_stress_testing_ID_2.json" -VariantsRoot "records\sessions\2026-04-11\variants" -RecordsRoot "records\sessions\2026-04-11" -OutJson "records\comparisons\replay\id2_comparison_summary.json"
```

The wrapper changes working-copy Module 03 files during normalization and creates backups, even without `-MarkCompleted`. In the migration replay it converted three root fields from null to empty arrays in each of the four Module 03 records. Session files and completion states stayed unchanged. The migration replay and the final guide replay exited 0, had no warnings and produced three variant results. The final guide replay also checked the exact baseline and all three variant identities. Source records here remain unnormalized and byte-identical to the supplied files. This demonstrates comparison of recorded text; it does not evaluate reasoning accuracy.

All four sessions retain blank `session_status.intended_reuse`. ID2 comparison does not fill or validate that field, and this result is not an ID3 eligibility decision. No intention, permission, sign-off or completion was invented. The imported ID3 and rule-pack releases retain their original two-branch workflow context. This documentation revision does not adapt ID3 for four cases or authorise source changes, new freezes or enterprise execution.
