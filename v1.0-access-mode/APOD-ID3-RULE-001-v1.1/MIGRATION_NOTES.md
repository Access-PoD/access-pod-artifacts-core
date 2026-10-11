# Original v1.1 rule pack: migration and candidate scope

Layout update, 11 October 2026: this separately versioned rule pack now sits inside `v1.0-access-mode/`, alongside the standalone IDs. Other migration and pending-work statements retain their preparation-time context; use the [collection README](../../README.md) for current completion status.

Prepared 11 October 2026 for `C:\access-pod-v1.0\v1.0-access-mode\APOD-ID3-RULE-001-v1.1`.

This folder preserves all ten files in the published rule pack, including the unchanged 29-page `spec/Rule Engine Formalization.pdf`. The original JSON, Markdown, manifests and checksums retain their source bytes. This note and `SOURCE_NOTICES.md` are separate collection additions.

## One original rule baseline

**One original v1.1 pack is sufficient to retain the shared per-session structural checks for both the two-candidate and four-candidate examples. Candidate count alone does not require a second rule version.**

The rule targets an individual ID2 `session.json`. It contains 43 field checks, 31 required fields, six validators and 47 possible diagnostic points per session. Both example sets declare the same `id2_records_v0.1` schema. Reusing those field checks across more sessions does not change the checks themselves.

This is a distinction between common rule definitions and execution coverage:

| Material | Current scope |
|---|---|
| `rules/session_completeness.rule.json` | Original shared session-field rule; preserved unchanged |
| Its `scoring.report` metadata | Names `baseline_percent`, `variant_percent` and `average_percent` |
| Original specification Annex D, pp26–28 | Worked baseline-plus-one-variant example |
| `../ID_3-operator/` scripts and Toolkit | Original two-branch inspection/correction/freeze workflow |
| `../ID_2-Access/four-candidates/` | Separate four-case ID2 example; its comparison result does not establish four-case ID3 execution or freeze eligibility |

The original rule is byte-identical to `../ID_3-operator/scripts/rules/session_completeness.rule.json`, SHA-256 `0be33798f768ec5de74b68bf849fc27932264883f4981714ae97964c6c0e8198`. The existing ID3 copy remains unchanged. No new candidate-specific rule copies have been created.

## Existing local four-case revision

The development file at `C:\v1.1-Access-mode\modes\ID_3_operator_4.sessions\scripts\rules\session_completeness.rule.json` is a distinct local revision, SHA-256 `1e9044fec38266fa46acf4c33664903c3516a122f362e0f706c871f9fa4187b3`.

Its validators and field `path`, `required`, `points` and `validate` definitions match the original. It changes the rule title, report labels, intended-use wording and session-ID correction guidance. In particular, its notes permit normalizing named variant suffixes to a shared base session ID. It retains the same `rule_id` and `schema_version` as the published original.

That local revision has not been imported or substituted into this collection. The rule publication's change-governance requirements call for explicit versioning, changelog entries and compatibility review when the rule changes. If the local revision is later adopted, identify its reporting and correction-policy changes explicitly; do not describe it as the unchanged published v1.1 rule.

A future four-case ID3 workflow needs explicit candidate discovery, inspection results for every case, reviewed session-ID handling, output naming, complete pack/hash coverage and tests of the adapted implementation. Sharing one field-rule baseline does not by itself demonstrate those behaviors. All four supplied April sessions currently have blank required `session_status.intended_reuse`; no intent was inferred or filled during this migration.

## Documentation and normal use

Read the original `README.md`, `spec/README.md`, `spec/Rule Engine Formalization.pdf`, `release_notes_INTERNAL.md`, `changes/CHANGELOG.md` and `changes/DIFF_NOTES.md`. The specification defines the structural/non-fabrication boundaries and change governance. The internal release notes limit current field coverage to `session.json` completeness.

This publication supplies a specification and rule data, not an executable engine. Operational commands are supplied by the separate ID3 Operator package. Follow its documented PowerShell 7 working-copy sequence and human review before freeze; the migration has not changed those scripts or removed their paired-layout assumptions. The prior original two-case ID3 replay already used this exact rule and its recorded outputs were reverified during the ID3 migration. No new workflow or freeze was run for this unchanged rule import.

The historical publication describes structural enforcement more broadly than the current automatic freezer gate. Read the preserved ID3 migration qualifications alongside it: human review checks required failures and non-fabrication before freeze. Diagnostic completeness does not authorise semantic edits or certify the artifacts.

## Inventory and preservation

The source ZIP and published sidecar match, and the ZIP CRC passes. All nine entries in `checksums/SHA256SUMS.txt` match their original files; the checksum file excludes itself. The descriptive `manifests/rule_release.manifest.json` lists eight content files and omits its own file and the checksum file. The README's contents list omits the README itself. Those historical descriptions are unchanged; all ten actual ZIP members are preserved.

The full current inventory is `../../collection-manifest.json`, excluding itself. `../../provenance/APOD-ID3-RULE-001-v1.1/IMPORT_RECORD.json` traces every original member, while `RULE_REVIEW.json` and `RULE_REVIEW.md` record integrity, the ID3 equality check and the local four-case comparison. The archive has no wrapper directory, explicit empty directory entries, executable scripts or licence file.

Earlier component notes remain dated records and may describe this pack as pending at their preparation time. It is now present here; the root README and current collection manifest record the latest status. All papers and original rule/source files remain unchanged. All planned component imports and the four-candidate ID2 documentation update are complete; the separately recorded current two-candidate guide and handbook link correction do not change this rule. Current collection packaging status is recorded in the [root manifest](../../collection-manifest.json).
