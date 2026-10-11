# Four-candidate ID2 guide revision

Local draft revision prepared 11 October 2026. Sealing and ZIP creation remain deferred.

## Access Mode folder layout update

On 11 October 2026, the standalone ID1–ID3 folders were grouped directly under `v1.0-access-mode/`. The current four-candidate root is `C:\access-pod-v1.0\v1.0-access-mode\ID_2-Access\four-candidates`. The guide's displayed root and replay setup, the companion appendix orientation and collection navigation were updated for this location. The guide still renders to 94 pages; its original 62 pages remain pixel-identical to the preserved master. The source-root command uses a two-line `Join-Path` expression to keep the Word commands readable.

The earlier documentation record retains its original review paths and output hashes as historical provenance. The [layout change record](../../../../../../provenance/ACCESS_MODE_LAYOUT_20261011.json) records the subsequent relocation and new document/script hashes. Original papers, source records, release scripts and the earlier Word sources are unchanged. The replay guard still requires a fresh working folder. This layout update creates no ZIP or final seal.

## Read the guide

The [new Word guide](<ID_2 Toolkit Script Examples Companion - four-candidate consolidated draft.docx>) contains the entire original 62-page walkthrough followed by the four-candidate supplement starting on page 63. It has 94 rendered pages in this review. The first 62 pages are pixel-identical to the selected Word backup's render. Use the supplement's linked reading route or Word's Navigation pane for current instructions.

Keep the [full-record appendix](ID2_FOUR_CANDIDATE_FULL_RECORDS.md) beside it. It contains all eight complete supplied JSON records, source-relative filenames and original-byte SHA-256 hashes. The [replay script](Replay-ID2-FourCandidate.ps1) is the exact command source checked in an isolated working copy. Choose an unused working-copy folder before rerunning it; the example path was used during this review and intentionally refuses to overwrite an existing folder.

## Retained source and identity

The master is `ID_2 Toolkit Script Examples Companion.backup.20260418-202652.docx`, preserved byte-for-byte under `provenance/ID_2-Access/documentation-20261011/` at the collection root. Its SHA-256 is `4cc3edca3e8f1e42f0c57b3f4c79230b64435e0cf3eb3f76b6ad25eec23346ab`.

The backup identifies itself as APOD-ID2-SCRIPT-EXAMPLES-002 dated 18 February 2026. The published PDF identifies itself as APOD-ID2-SCRIPT-EXAMPLES-001 dated 20 February 2026. The supplement explicitly explains both histories. Neither original identity is silently changed, and no new formal document identifier is assigned.

All 1,713 original XML paragraphs, the original contents control, 60 section definitions, 294 bookmarks and 157 drawing groups remain intact. All 16 original package parts remain; only `word/document.xml` changes through appended material. Styles, numbering, theme, footer, relationships and original package metadata retain their original bytes. New pages use the source typography, page geometry and footer convention, with paragraph spacing and keep-with-next settings applied only to new material.

## Edit schedule implementation

- E01–E03: a separately dated revision title and source-identity explanation appear at the supplement opening. The complete original title, contents and historical primer remain before it.
- E04–E07: current April folder conventions, a fresh-copy replay and four equally detailed case chapters are added. Complete JSON serialization, empty fields and boilerplate remain available in the full-record appendix.
- E08–E09: the actual three-script chain, helper writes, first-run limit, four compared text lists and baseline plus three expected variant checks are documented.
- E10–E11: Path 2 statements are identified as historical source context. The older transcript and enterprise-note files remain unchanged; no external execution or inspection result is inferred from local replay.
- E12: all eight source JSON records are reproduced in the companion appendix, with exact source hashes. Their values, nulls, blanks and case-specific tags are preserved.
- E13: the original contents remains correct because pages 1–62 are unchanged. The supplement adds nine verified internal navigation links and continuous page numbering.
- E14: the four-candidate and root READMEs point to the new guide, and the collection preparation inventory includes the additions. The edit schedule remains unchanged as a dated planning record.

No original instructional content was deleted or shortened. Repeated new explanatory boundary paragraphs were consolidated into the common orientation to avoid sparse case-ending pages; all source-authored case fields remain covered.

## Code and records check

The command source passed parsing and executed once through the primary comparison chain in a fresh working copy. It exited 0 with no warnings and verified the exact baseline and all three expected variants. All 52 pre-revision child files remained unchanged during replay. Four working-copy Module 03 files had three top-level null fields normalized to empty arrays; session records, recorded run content, case tags and draft completion states stayed unchanged. Backups and a new comparison summary were produced only in that working copy.

The comparator reads `simulation_runs[0]` and compares `stress_conditions`, `fragility_points`, `authority_drift_flags` and `escalation_triggers`. It does not evaluate all record fields or execute a scenario or model. The April inputs provide only session and Module 03 JSONs; the twenty other indexed module outputs remain absent. All sessions retain active/not_frozen status, blank intended reuse and blank human signoff; Module 03 remains draft. No missing content, completion or permission was invented.

Independent technical review checked case-specific metadata and every populated run string against the records. All eight JSON appendix blocks match source text after line-ending normalization, and all command lines match the tested script. Every final page was covered by visual review and retained-page image comparison. Rendering used read-only Word PDF conversion with the packaged document rasterization workflow; no source was saved by Word.

## Collection boundary

The new guide and its three companions are additions in this `revisions/` folder. A source backup and machine-readable review record are added under collection provenance. Only the collection README, child README and collection preparation manifest are updated. The original two-candidate release, all papers, all earlier component folders, the four-candidate source documents, scripts and records remain unchanged. The final manifest remains `final_seal: false`.
