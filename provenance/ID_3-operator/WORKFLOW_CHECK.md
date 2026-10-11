# ID3 migration workflow evidence verification

11 October 2026. Read-only verification; no workflow was rerun.

The previous positive workflow evidence applies to the exact original ID3 operator release being migrated. The ZIP is SHA256 `905a30ca8b9aad772193aacb2ac8eadc3ebb7dc9080bd735be59d32a0987e1fa`. ZIP CRC passes; all 45 extracted files match the archive; all 44 internal checksum entries pass. The prior fixture's four scripts and bundled rule match the archive and recorded source hashes. Its four prepared inbox inputs and retained `10_working` inputs also match archive bytes. All five positive invocation logs match the previously recorded stdout/stderr.

The retained PowerShell 7.6.6 execution covers inspect, correct, re-inspect, the assessor's check of the documented gate, DryRun and a fixture freeze. Current read-back confirms the saved report has zero required failures. The baseline correction changes only its placeholder session ID to the existing inbox folder ID; the variant is semantically unchanged and both original creation dates remain intact. All four retained canonical outputs still match both their runtime `hashes.txt` and the prior recorded hashes. These four runtime hashes are distinct from the 44 release-checksum entries.

## Migration implications

- Script-relative `ID_3_review_packs` and `scripts/rules` paths relocate together. The inspector/corrector choose the newest `10_working` recursively; use one unambiguous active pack, and avoid selecting retained historical outbox working trees.
- The prepared original two-case inbox supports the demonstrated workflow. The documented new-intake route uses explicit `robocopy` paths. The optional `Copy-ID2Inbox.ps1` has historical hardcoded paths and a self-call issue; it is not required for the supplied example.
- The freezer takes explicit `PackRoot`, `OutboxRoot`, and `InboxRoot`. Future runs belong on bounded working copies. Session promotion uses `20_corrected`; Module 03 promotion uses unchanged `10_working` records.
- PowerShell 7 is required. The previous successful runtime was 7.6.6 on Windows 11; Windows PowerShell 5.1 failed at `ConvertFrom-Json -Depth`. This does not recreate or diagnose the original Windows 10 laptop.
- The separately published rule PDF/pack is outside this migration. Keeping the rule JSON already bundled in the ID3 ZIP does not import that separate pack.

## Human decisions and limits

Before any later real freeze, the operator selects the intended ID3 scope and pack, examines corrections, confirms zero required failures and checks non-fabrication. A successful script exit or completeness percentage is insufficient. Recommended DryRun verifies paths before an authorised freeze; the previous fixture gate was an assessor check, not independent sign-off or production authorisation. Migration itself does not authorise a new source freeze or publication.

This evidence concerns the original two-case example. It does not establish that its two-branch ID3 scripts support the newer four-case ID2 extension. No model, enterprise workflow, source correction, source freeze, archive/reset or cleanup ran in this verification. Existing caveats on null/empty timestamp fallback, the manual freezer gate, timestamps changing on a new freeze event, and late missing-file validation remain unchanged. The previously corrected repeat-comparison instrumentation error is not reused.

The accompanying JSON records exact file hashes, source/fixture/output correspondence, five positive logs, the gate, environment, scope and referenced evidence. No release or collection file was written by this workflow-evidence verification.
