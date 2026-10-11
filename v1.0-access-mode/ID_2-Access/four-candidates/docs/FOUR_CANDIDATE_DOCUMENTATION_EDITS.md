# ID2 four candidate documentation edit schedule

Prepared 11 October 2026 for `C:\access-pod-v1.0\ID_2-Access\four-candidates`.

This is the edit schedule for a later Word revision. It records the intended retained material, proposed additions and code/record checks. No DOCX, PDF, script, session record or archived comparison has been changed by this planning step. Sealing remains deferred.

## Recommended approach

Use the original Word Toolkit as the formatting and content master, keep its full instructional content, and add a clearly identified four-candidate walkthrough. Use this Markdown file to review the changes and exact technical facts before applying them to a separately named Word copy. Do not rebuild the Word document by converting this Markdown file: that would risk losing its original styles, numbering, contents fields, bookmarks, tables and page furniture.

A near-matching full-content Word master has been located at:

`C:\v1.1-Access-mode\modes\ID_2_access_4.sessions\docs\create_sessions\ID_2 Toolkit Script Examples Companion.backup.20260418-202652.docx`

SHA-256: `4cc3edca3e8f1e42f0c57b3f4c79230b64435e0cf3eb3f76b6ad25eec23346ab`.

It retains the 18 February 2026 document information, 1,713 paragraphs, 23 first-level headings, contents styles, 294 bookmarks, 60 section-property blocks and footer structure. It also retains 157 anchored drawing groups with VML fallbacks and code formatting. The existing revised four-session DOCX has 399 paragraphs, ten first-level headings, one section and no bookmarks or drawings. Use that shorter document as a source of four-case material, rather than treating it as a complete replacement for the original master.

The text comparison found 787 of 790 substantial non-contents paragraphs in normalized published PDF text. The three exceptions are metadata: the backup identifies the document as `APOD-ID2-SCRIPT-EXAMPLES-002` in two locations and dates it 18 February 2026; the published PDF shows `APOD-ID2-SCRIPT-EXAMPLES-001` and 20 February 2026. Record and reconcile those differences explicitly in the later revision; do not silently claim the backup is the exact publication master. Preserve both source histories and confirm the new draft's identifier/date before finalising its title page. Neither source contains embedded raster images, although the Word backup has graphical formatting objects. No missing screenshot assets were identified.

The published PDF is 62 pages. Confirm the backup's rendered layout against it before Word authoring; this edit schedule does not claim that visual comparison has already passed.

Another Word upload is not needed to begin the edit schedule or work from the located backup. If the author has the exact published Word master, or a newer preferred master, use that to resolve the source choice before revising Word. A Word source for the separate operational handbook is only needed if a later request includes adapting that handbook; it and all existing PDFs stay unchanged here.

## Source and output roles

Paths below are relative to the four-candidate folder unless written as absolute paths.

| Source | Role in the revision |
|---|---|
| Original Toolkit Word backup above | Preserve full original content and formatting; make a new working copy |
| `docs/create_sessions/ID_2 Toolkit Script Examples Companion.pdf` | Published 62-page reading/layout reference; leave unchanged |
| `docs/create_sessions/ID_2 Toolkit Script Examples Companion - revised four-session run.docx` | Four-case content donor; check every copied field and command against current files |
| `docs/create_sessions/Four ID_2 records_candidets session + ps7 console.docx` | Historical record/console source; retain as source evidence |
| `docs/create_sessions/Access-Mode ID_2 commands & Path 2 Execution Notes.docx` | Historical execution/enterprise context; distinguish its dependencies from the standalone ID2 example |
| `records/sessions/2026-04-11/` and `scripts/` | Current data and executable behavior for technical checks |
| `records/comparisons/2026-04-11/ID2-20260411-1400-qpath-tr008-run/id2_comparison_summary.json` | Historical saved comparison; preserve timestamp and original paths |

Proposed new authoring output:

`docs/create_sessions/revisions/ID_2 Toolkit Script Examples Companion - four-candidate consolidated draft.docx`

That file has not been created. Keep the original Word sources, published PDFs and the complete parent two-candidate release intact. After Word verification, route the four-candidate README to the new guide and retain the earlier guides as explicitly labelled historical/reference material. Do not mark the documentation work complete merely because this schedule exists.

## Content retention and edit map

Use heading text and nearby paragraph wording as edit anchors. Paragraph numbers may help locate a source, but should not become permanent cross-references because additions will change them. Retain the author's terminology and original method, posture and non-authority statements.

| Edit | Location or anchor | Retain | Proposed change |
|---|---|---|---|
| E01 | Title page and Document Information | Author, affiliation, format and both historical source identities | Add a separately dated four-candidate consolidated-draft revision label. Explicitly reconcile the backup/PDF identifier and date differences; do not silently replace either historical record. |
| E02 | Reader Orientation / Structure of This Companion | Full method explanation, six-module framing and optional JSON layer | Add a short reading route separating the retained February example from the new April four-candidate walkthrough. |
| E03 | Release Context and original primer identifiers | Original February example, values and instructional sequence | Label its scope as the retained two-case example. Do not globally replace its dates, session IDs or singular variant wording. |
| E04 | Existing scaffolding and field-by-field sections | Original explanations of why each field exists and how to record it | Add the April folder convention and distinguish replay of supplied files from creation of a new session. Never scaffold over supplied records. |
| E05 | New four-candidate part after the retained walkthrough | Original heading, list, table and code styles | Add one common setup section and four equally detailed case sections, followed by comparison and interpretation. |
| E06 | Revised donor: Working Root And Scaffold Commands | Useful command explanations | Replace active old-root commands with a fresh-working-copy workflow. The donor's template copies with `-Force` target populated April paths; do not copy those commands unchanged into the replay route. |
| E07 | Revised donor: Shared Session.json Values / candidate subsections | Authored scenario content supported by the records | Check every value against the relevant saved JSON. Keep distinct session IDs and blank fields; do not infer authorship, intended reuse or sign-off. |
| E08 | Helper script explanations | Purpose and optional nature of each helper | State actual parameters, writes and backups; separate optional authoring helpers from the three-script replay chain. Add the fixed-value caveats below. |
| E09 | Comparative analysis / wrapper invocation | Exploratory comparison framing | Show one baseline plus three variant results, exact current paths and output checks. Define the four text-list comparisons and first-run limit. |
| E10 | Revised donor: Operational Snapshot From The Reviewed Run Notes | Historical Path 2 context | Label it as an external workflow snapshot with its own source and prerequisites. Replace any inference that this alone establishes all four source records are structurally complete or eligible for ID3. |
| E11 | Historical console output and screenshots | Original evidence and captions where accurate | Keep historical images/text intact with their date/context. Add new clearly labelled examples only from verified later runs; do not edit a screenshot to imply a run occurred. |
| E12 | New appendices | Full original instructional content | Include the complete eight supplied JSON records or a clearly identified full-record companion appendix, with filenames and source hashes. Include all authored fields, including nulls/blanks and ethical/uncertainty content, rather than only a short summary table. |
| E13 | Contents, internal references and footer/page numbering | Original formatting conventions | Update contents and references after additions. Preserve style and structure; additional material will naturally change pagination. |
| E14 | Four-candidate README and navigation, after Word verification | Original two-candidate navigation and all papers | Link the new guide, identify source/history documents, record the revision and refresh collection hashes. Leave sealing for later. |

The source backup's paragraph coverage provides an additional preservation checklist. These are one-based source XML paragraph locators, not page numbers:

| Backup paragraphs | Material to retain |
|---|---|
| 1–199 | Introduction and contents |
| 200–380 | Scaffolding and execution hygiene |
| 381–539 | Baseline session walkthrough |
| 540–933 | Baseline Module 03 walkthrough |
| 934–1400 | Time-pressure variant walkthrough |
| 1401–1520 | Comparison and canonical exemplar |
| 1521–1643 | Troubleshooting |
| 1644–1713 | Checklist and conclusion |

Append the new four-case material using checked content from the revised donor's paragraphs 37–399. Retain the historical transcript as historical text. Preserve native drawing objects and section formatting during targeted Word edits; a text-only reconstruction would lose them.

## Full coverage of the four supplied candidates

“Full” in this revision means documenting each supplied session and its populated Module 03 record in full. The six-module curriculum remains intact, but the April branches do not contain populated Module 01, 02, 04, 05 or 06 JSON outputs. Their entries in `outputs_index` do not establish that those twenty files exist or were completed. Creating them would require additional author-supplied content and is outside this documentation pass.

Common day root: `records/sessions/2026-04-11/`.

| Candidate | Folder under the day root | Run | Stress conditions | Saved tags |
|---|---|---|---:|---|
| Baseline | `baseline/ID2-20260411-1400-qpath-tr008-run/` | `RUN-01` | 4 | `null` / not supplied |
| Time pressure | `variants/ID2-20260411-1400-qpath-tr008-run-timepressure/` | `RUN-02` | 5 | authority, telemetry, incentive, ethical, delegation |
| Ambiguity | `variants/ID2-20260411-1400-qpath-tr008-run-ambiguity/` | `RUN-03` | 4 | authority, telemetry, ambiguity, ethical, delegation |
| Lifecycle boundary | `variants/ID2-20260411-1400-qpath-tr008-run-lifecycleboundary/` | `RUN-04` | 5 | authority, lifecycle, containment, ethical, delegation |

Each candidate contains `session.json` directly at its folder root and `artifacts/module_03_sapp_simulation_stress_testing_ID_2.json`. The original February example instead stores its session under `artifacts/`; preserve that historical distinction.

Give each case the same subsections: purpose and scenario; exact identity and source paths; complete session metadata; stress conditions; branch points; signals; fragility points; authority-drift flags; uncertainty; escalation; stop/reset entries; ethical tensions, affected parties, potential harms and trade-offs; then comparison scope and interpretation. Retain all saved field values and do not silently shorten or combine the scenarios.

Each saved Module 03 record has one simulation run, five branch points, five signals, five fragility points, five authority-drift flags, five uncertainty notes, five escalation triggers and two stop/reset entries. These are authored records, not independent measurements of model performance.

All four sessions are `active` and `not_frozen`, require human decisions and retain blank `session_status.intended_reuse`. All four Module 03 completion states are `draft`. Describe these states as supplied.

## Proposed replacement and addition text

### Four candidate introduction

> This worked example contains one baseline and three authored stress variants: time pressure, ambiguity and lifecycle boundary. Each candidate supplies a session record and one populated Module 03 record. The walkthrough documents all eight supplied records and compares the three variants against the common baseline. The six-module curriculum remains available; the other five module-output files are not included in these April candidate folders.

### Replay and authoring boundary

> To review the supplied example, use a fresh working copy and the comparison workflow. Do not copy blank templates over the supplied candidate files. The interactive session, Module 03, tag and status helpers are optional authoring tools for an explicitly chosen record; they are not prerequisites for replaying the saved four candidates.

### Comparison meaning

> The comparator reads the first `simulation_runs` entry from each record and compares text in `stress_conditions`, `fragility_points`, `authority_drift_flags` and `escalation_triggers`. Its output describes recorded differences. It does not execute the scenario, evaluate all reasoning fields, verify every file listed in the session index or decide inspection eligibility.

### Historical enterprise context

> The Path 2 notes describe a separate historical use of this run family. Their candidate, routing and lifecycle statements retain that context. The standalone ID2 comparison can be replayed using this folder's scripts and records; it does not require an enterprise repository, model service or training operation, and its success does not establish those external outcomes.

### Output and status

> A complete comparison of this supplied example produces three variant results for the four candidates. The wrapper normalizes working-copy Module 03 records and creates backups. Omitting `-MarkCompleted` preserves draft completion. The four blank intended-reuse fields remain author decisions; the comparison does not populate them or approve later ID3 processing.

## Commands and code checks for the Word revision

The later walkthrough should require PowerShell 7 with `pwsh` on PATH and begin in the root of a fresh copy of the four-candidate folder. Keep the collection copy unchanged. In that working copy, the comparison command is:

```powershell
pwsh -NoProfile -File .\scripts\primary\Run-ID2-StressComparison.ps1 -BaselinePath "records\sessions\2026-04-11\baseline\ID2-20260411-1400-qpath-tr008-run\artifacts\module_03_sapp_simulation_stress_testing_ID_2.json" -VariantsRoot "records\sessions\2026-04-11\variants" -RecordsRoot "records\sessions\2026-04-11" -OutJson "records\comparisons\documentation-replay\id2_comparison_summary.json"
```

Verify the generated baseline/variant identities, three `results` entries and `aggregate.variants_count = 3`, as well as the process result and warnings. The prior bounded replay used these same script/input bytes and passed. This edit-schedule preparation did not run the command again.

| Script or data behavior | Required documentation correction |
|---|---|
| Wrapper invokes normalizer and comparator | Describe one chain; do not imply every helper must run first. |
| Wrapper writes Module 03 inputs and backups | Use a separate working copy even when `-MarkCompleted` is omitted. |
| Normalizer | Explain array-shape normalization; do not call it a complete JSON Schema validator. |
| Session editor | Explain that it can write timestamps and sign-off metadata; it is an authoring step, not passive viewing. |
| Module 03 mapper | Explain interactive authored stress/ethics entries; it does not run the scenario or a model. |
| Tag helper | It overwrites tags; do not apply its default time-pressure tags to every case or silently fill the baseline's null tags. |
| Status helper | It overwrites `session_status` with fixed baseline wording and `learning_and_operational_comparison`; do not prescribe it as a neutral step for the four saved records. |
| Archived comparison | Keep `2026-04-11T11:44:44Z` and old absolute paths as provenance. Write new results to a separate output location. |
| Regenerated comparison | New paths/time and tied top-five ordering can differ; compare meaningful contents and candidate coverage rather than demand byte identity to the archived summary. |

## Verification before the Word revision is complete

1. Establish the chosen Word master and source hash. Compare its full text and key original pages against the published Toolkit; resolve any source differences before editing.
2. Keep an untouched source copy. Make targeted edits and additions in a new Word file, preserving the original styles, tables, numbering, headers/footers, bookmarks and relevant fields.
3. Maintain a coverage list for all original sections and all four new case sections. Every deletion or material replacement needs an explicit reason in the change record; do not silently condense the original content.
4. Recheck every path, parameter, candidate ID, run ID, field value, count and status against code and saved records. Preserve missing/null values as such.
5. Parse new command blocks and test any substantively changed execution instructions in an isolated working copy. Verify actual output identities/counts and resulting file changes, not exit status alone.
6. Confirm the full-record appendices reproduce all eight supplied JSONs without invented values or omitted fields. Preserve distinctions between historical material, current examples and fresh execution evidence.
7. Render the revised Word document and inspect every page for layout, tables, code wrapping, contents links, captions and page-number consistency. Compare retained material against the original visual reference. Added pages are expected; preservation means retaining the design and content, not forcing the old page count.
8. Verify the original two-candidate release, all existing papers, scripts, supplied records and earlier component folders by hash. Update only the intended four-candidate documentation and collection metadata.
9. Refresh navigation and the collection inventory after final documentation checks. Keep `final_seal` false and leave ZIP/sealing work for later.

The next authoring step is a new full-length Word revision based on the selected original master, using this edit map and the existing four-case material. This schedule is the reviewable preparation for that step, not a completed documentation revision.
