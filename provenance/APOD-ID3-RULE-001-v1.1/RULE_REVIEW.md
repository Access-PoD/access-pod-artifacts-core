# Rule publication migration review

11 October 2026. Read-only source, JSON and tooling review; no workflow execution or release edits.

**One original per-session rule baseline can serve the same structural checks for two or four candidates. Candidate count alone does not require separate rule versions.** The original publication contains 43 field checks and 47 possible diagnostic points for each `session.json`. Candidate selection, branch paths, reporting, corrections and output naming belong to the consuming ID3 tooling.

The original rule publication is the correct migration source. Its rule is byte-identical to `C:\access-pod-v1.0\ID_3-operator\scripts\rules\session_completeness.rule.json`:

`0be33798f768ec5de74b68bf849fc27932264883f4981714ae97964c6c0e8198`

## Important distinction for the four-case example

The original rule's `scoring.report` metadata names baseline, variant and average. That is not a validator limiting the number of session records. The original ID3 inspector explicitly loads baseline and one variant, and its corrector/freezer use two branch layouts. They do not become four-case tools merely by sharing a rule file.

The local four-case rule at `C:\v1.1-Access-mode\modes\ID_3_operator_4.sessions\scripts\rules\session_completeness.rule.json` is different:

`1e9044fec38266fa46acf4c33664903c3516a122f362e0f706c871f9fa4187b3`

Its validators and all field `path`, `required`, `points` and `validate` contracts match the original. It changes the title, reporting labels, intended-use wording and session-ID correction guidance, while keeping `CSC_SESSION_COMPLETENESS_V1_1` and `rule_v1_1`. These changed bytes must not silently replace the original publication under an unchanged provenance claim. A future published profile/revision should identify and document changes under the publication's version/changelog discipline. Neither this comparison nor the prior two-case test validates a new four-case runtime substitution. The local variant is not imported.

## Integrity and adequate checks

The original ZIP matches its published SHA256 sidecar and passes CRC. All ten extracted files match archive bytes; all nine internal checksums pass. The manifest's eight named content files exist; its own manifest and checksum file are additional integrity metadata. The pack has a PDF, Markdown and JSON, with no standalone executable engine.

JSON parses, field paths are unique and every validator reference resolves. Previous ID3 workflow evidence uses this exact original rule and has already been reverified against its scripts, inputs, logs and four frozen-output hashes. No new workflow run is needed for an unchanged rule migration. The migration should still compare destination members/hashes, preserve the original PDF and rule, check additive local links, and confirm earlier collection files remain unchanged.

The prior four-case example's empty `session_status.intended_reuse` remains a separate author decision; a shared rule does not make it eligible to freeze. Human gate, non-fabrication and diagnostic-only limits remain in force.

The accompanying JSON contains the exact source paths, hashes, script line evidence and complete JSON differences. A separate comparison file remains in the private assessment workspace; the differences are embedded in the JSON preserved with this migration.
