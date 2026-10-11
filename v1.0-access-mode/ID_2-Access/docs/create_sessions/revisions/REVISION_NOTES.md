# Current two-candidate execution guide revision

11 October 2026. This local revision updates the execution guide for `C:\access-pod-v1.0\v1.0-access-mode\ID_2-Access`.

Use the [current reading PDF](<ID_2 Toolkit Script Examples Companion - current two-candidate guide.pdf>) or [editable Word guide](<ID_2 Toolkit Script Examples Companion - current two-candidate guide.docx>). Begin with **Current folder setup on page 63**, then return to Step A. The setup copies the parent ID2 contents into a fresh working folder, excludes `four-candidates`, and leaves release sources unchanged. Choose an unused working folder and retain the same PowerShell session for later commands.

The [original published execution PDF](<../ID_2 Toolkit Script Examples Companion.pdf>) remains unchanged at its original path. It identifies APOD-ID2-SCRIPT-EXAMPLES-001, dated 20 February 2026. This corrected copy comes from the retained Word backup, APOD-ID2-SCRIPT-EXAMPLES-002, dated 18 February 2026; its historical cover metadata remains intact. The backup is preserved under `provenance/ID_2-Access/documentation-20261011` at the collection root. The Word backup is not represented as the exact master of the published PDF.

The original 62-page sequence, contents pagination, case material, governance wording and layout are retained. One current setup/provenance page is appended. Obsolete absolute roots now resolve through `$workingRoot`; the February 16 teaching walkthrough and February 10 supplied exemplar stay separate.

Concrete command repairs are confined to executable formatting: joined split robocopy option statements, a missing statement separator, misplaced backticks, two split filename tokens, and a Rename-Item continuation interrupted by a blank paragraph. The underlying scripts, templates and case records were not rewritten. Use the Word guide for copying logical command blocks; PDF visual line wrapping should not be treated as new command boundaries. Replace the generic `<DATE>` and `<NEW_SESSION_ID>` examples when using them.

Verification covered the current-path supplied baseline/variant comparison, fresh-copy setup, and repaired directory/template-copy/verification snippets. The 12 bounded setup/snippet invocations completed with exit 0 and empty stderr; generated files matched source templates, and source hashes were unchanged. The final guide's 11 tested command ranges and setup were extracted and matched to those successful tests. Interactive authorship/helper sessions and governance conclusions were not rerun by this documentation check.

The final 63-page render passed visual review. Fifty-four original pages are pixel-identical to the fully reviewed backup render; all other original pages and the new page were inspected at original resolution. All 60 section properties, original bookmarks, hyperlinks, drawings, fields and preserve-only package parts remain intact. Only document.xml changed in the Word package. Sealing remains for later.

## File identity

| File | SHA-256 |
|---|---|
| Current Word guide | `8b4b0526d8842b7bd177cce0be42031fe0f2d7b698d1bee5820650588cd00133` |
| Current reading PDF | `b3cbbb5085b95b0e5ceb344386f4171269482a6df1da95e21de1e9f9101e0554` |
| Retained Word backup | `4cc3edca3e8f1e42f0c57b3f4c79230b64435e0cf3eb3f76b6ad25eec23346ab` |
| Preserved published PDF | `f1932ae48a648bf8f5737e825118e16291e26e34362b94ac06d651db7bb68c9c` |
