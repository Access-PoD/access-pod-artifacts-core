# ID2: two preserved examples and current execution guidance

Updated 11 October 2026 for `C:\access-pod-v1.0\v1.0-access-mode\ID_2-Access`. Use the [collection README](../../README.md) for the complete layout and release status.

| Location | Contents and status |
|---|---|
| This folder | Published two-candidate artifacts: seven original scripts and the February baseline/variant records, with a narrow link correction in the current handbook and a separately named current execution guide. The exact original 53-file release remains in its provenance ZIP. |
| `four-candidates/` | Separate April baseline-plus-three-variant example, preserved source records/scripts and completed four-candidate documentation. Its handbook copy has the same narrow link correction. |

## Read the documentation first

Start with the original `README_ID_2.md`, `release_notes_ID_2.md` and `docs/Access-Mode ID_2 - Operational Runtime Reasoning (APOD-ID2-OR-001).pdf`. The current handbook changes only the page 2 GitHub release-tag link from the invalid lowercase `ID_2-access` to the published `ID_2-Access`; its other content remains unchanged.

For current two-candidate paths and executable command formatting, use the [current two-candidate Word guide](<docs/create_sessions/revisions/ID_2 Toolkit Script Examples Companion - current two-candidate guide.docx>) or its [PDF reading copy](<docs/create_sessions/revisions/ID_2 Toolkit Script Examples Companion - current two-candidate guide.pdf>) and [revision notes](docs/create_sessions/revisions/REVISION_NOTES.md). The original 62-page Toolkit PDF stays unchanged at `docs/create_sessions/ID_2 Toolkit Script Examples Companion.pdf`. The current guide distinguishes the February 16 authoring walkthrough from the February 10 supplied exemplar and uses a fresh working copy.

Version E, E.2 and the Project Guide remain unchanged in `docs/relationship_to_version_E/`. The separate [four-candidate guide and replay route](four-candidates/README.md) continues to document the April example. The current two-candidate guide does not replace it. The differing handbook from the local development folder remains historical material under `../../provenance/ID_2-Access/local-document-history/`.

## Record and workflow boundaries

The two supplied cases live under `records/sessions/2026-02-10/`; each has `session.json` and all six module JSON files under its `artifacts/` folder. The child's four cases live under `four-candidates/records/sessions/2026-04-11/`, with `session.json` directly in each candidate folder and only its Module 03 output supplied. Neither example replaces the other. Use explicit day and variant roots; do not compare a directory containing both examples.

The published baseline's `session.session_id` remains its placeholder value even though its folder has a concrete ID. No ID, signoff or other source record field was corrected during this documentation update. The comparator reads Module 03 content and does not validate the session metadata or establish ID3 eligibility.

In the earlier 11 October 2026 execution-guide revision, the two-candidate direct comparison was rechecked from a fresh copy of the then-current nested source: one baseline and the one expected time-pressure variant, exit 0 with no warnings, and no changes to the 53 copied publication files or collection source. Prior normalized-workflow evidence remains separately recorded. Normalization and the wrapper can rewrite working-copy Module 03 files and create backups; authoring helpers are not required for replay. Scripts, supplied records and archived comparison summaries retain their source bytes. No model, training, ID3 inspection or freeze was performed in that comparison check. This later Markdown clarification used static inspection and file-integrity checks; it did not repeat the workflow.

## Current reading clarifications

Read the preserved modules, exemplars and helper guidance with these current collection corrections. Those Markdown source files retain their published wording and bytes.

**Draft and exploratory status.** When finalising an ID2 working note, remove editing scaffolding that no longer applies. Retain accurate document status, authorship, scope, uncertainty and the non-inspection qualification. Human review or circulation does not convert an ID2 note into an approved, compliant or frozen ID3 artifact. This corrects the preserved Module 04 instruction to remove draft markers before any circulation; it does not relabel the supplied draft records.

**Module headings and ratings.** Each of the six priming and six exemplar modules contains ten locally titled HASH KEY sections; the child copies have the same headings. The preserved README does not provide a separate universal progression table. Use the headings in the selected module. These labels are distinct from SHA-256 integrity hashes. A 1–5 reflection rating alone does not establish module completion, mode progression or inspection eligibility. Exemplar selections are supplied examples, not a new user's answers.

**Helper and development paths.** The historical helper README ends after its template introduction. Use these actual template and helper locations:

| Example | Module 03 template | Session template | Helper reading file |
|---|---|---|---|
| Two-candidate | [module_03.template.json](records/templates/module_03.template.json) | [session.template.json](records/templates/session.template.json) | [Helpers_README.md](records/helpers/Helpers_README.md) |
| Four-candidate | [module_03.template.json](four-candidates/records/templates/module_03.template.json) | [session.template.json](four-candidates/records/templates/session.template.json) | [Helpers_README.md](four-candidates/records/helpers/Helpers_README.md) |

The walkthrough folder in each example is `docs/create_sessions/`, with a plural `sessions`; the helper reading filename is `Helpers_README.md`, with that casing. Use the current guide for the chosen example and its record layout. Create new exercises in a separate working project; `../../drafts/module_stubs/` does not identify a supplied collection folder.

**ID3 assistance and handoff.** The [ID2 organizer control](modules/organizer_mode.md) permits secondary ID3 assistance only if explicitly enabled, for structuring material for review. Within an ID2 project this does not invoke the separate ID3 inspection workflow. A change of primary posture requires a separately configured project and its own published workflow. This is a human choice, not an automatic next curriculum stage. The supplied four-candidate comparison does not establish eligibility for that workflow.

**Reference configuration.** Preselected organizer options describe the supplied example's intended reasoning configuration. They are not a new user's acknowledgement and do not demonstrate that a model or runtime enforced the settings. The control file's precedence language describes its intended role within a deliberately configured Access-Mode project; including it among documents being reviewed does not itself configure a project or activate its instructions. Review the configuration in a separate working project and record user-specific configuration and acknowledgement independently.

## Preservation and provenance

The original handbook and execution-guide sources are preserved under `../../provenance/ID_2-Access/link-path-corrections-20261011/`; the [correction record](../../provenance/ID_2-Access/link-path-corrections-20261011/CORRECTION_RECORD.json) identifies original/revised hashes and the precise changes. The original source ZIP and checksum sidecar remain under `../../provenance/ID_2-Access/`. The older import record describes the initial import; the correction record and current collection inventory describe the later documentation changes.

Historical READMEs, release notes, descriptive manifests, the published Toolkit PDF, three earlier four-case DOCXs, papers and records retain their source contents. `LOCAL_SOURCE_INVENTORY.json` records the development inventory and excluded staging/backups. No source development files were deleted or rewritten. These current navigation notes and corrected reading copies do not confer authority, approval or production readiness. Current collection packaging status is recorded in the [root manifest](../../collection-manifest.json).
