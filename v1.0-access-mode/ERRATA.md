# Access-Mode base: folder guide and collection notes

For the current folder roles and reading routes, start with the [Access-Mode collection guide](COLLECTION_GUIDE.md). The [modes publication map](modes/README.md) labels the preserved early examples; the later standalone IDs retain their separate locations.

Added 11 October 2026 for Consolidated Draft Edition 1. The complete original base release is preserved: **50 files, nine PDFs and six empty mode `drafts`/`notes` directories**. Original files have not been renamed, rewritten or regenerated.

## Main folder structure

All paths below are relative to `C:\access-pod-v1.0\v1.0-access-mode`.

| Folder / file | Role in the base release |
|---|---|
| `README.md` | Original release orientation and project-file requirements. |
| `releases/` | Version E method paper, E.2 lifecycle companion and reading orientation. |
| `orchestration/` | Project Guide, mode index, quick references, facilitator guide, prompts and template. |
| `modules/` | Six original source modules and `ROBOCOPY_ONLY.pdf`; preserve as source material. |
| `modes/ID_1_core/` | Original learning-mode README, control, six derived modules and guidance. |
| `modes/ID_2_access/` | Original operational-reasoning README, control, six derived modules and guidance. |
| `modes/ID_3_operator/` | Original inspection-mode README, control, six derived modules and guidance. |
| `modes/*/drafts/` and `modes/*/notes/` | Original empty working placeholders; retained empty in this import. |
| `public-review/` | Historical configuration, relationship and review-framing notes. |
| `INTERNAL_RELEASE_NOTES_v1.0_Access_Mode.md` | Historical lineage and planned-release context; retained under its original label. |

The embedded mode examples belong to the preserved base release. The later standalone releases now sit directly under this Access-Mode folder: [ID1 collection notes](ID_1-core/ERRATA.md), [ID2 migration notes](ID_2-Access/MIGRATION_NOTES.md) and [ID3 migration notes](ID_3-operator/MIGRATION_NOTES.md). Their contents remain separate from the historical `modes/ID_1_core/`, `modes/ID_2_access/` and `modes/ID_3_operator/` folders. The [original rule pack](APOD-ID3-RULE-001-v1.1/MIGRATION_NOTES.md) now sits alongside those IDs as a separately versioned direct child of this Access-Mode folder. This layout update changes navigation; all original base-release files remain unchanged.

## Reading and normal use

Begin with `releases/README_doc_orientation.md`. It assigns method interpretation to Version E, practical setup to `orchestration/Access_Mode_Project_Guide.pdf`, and artifact-state explanation to E.2. These source roles are preserved; the collection adds no new method authority.

The base activity is human project preparation and review: select a reasoning posture for the intended task, consult its setup guidance, assemble the corresponding mode files, work within the declared scope, and retain source checks and human review. The IDs are examples of postures, not a compulsory sequence or maturity scale. This base package contains documentation and modules, with no executable runner or observed model session supplied. Import checks do not establish that a model follows the posture or that governance outcomes improve.

## Navigation and draft inconsistencies

| Source reference or wording | Actual location / clarification |
|---|---|
| Root README: `/ROBOCOPY_ONLY.PDF` | `modules/ROBOCOPY_ONLY.pdf`. The original path text remains unchanged. |
| Project Guide filename shown with `.PDF` | Actual filename: `orchestration/Access_Mode_Project_Guide.pdf`. Use exact casing for cross-platform use. |
| ID3 control filename | The supplied path is `modes/ID_3_operator/modules/inspection_mode_control_ID_3.md.md`. The doubled suffix is preserved for source identity. |
| ID1 control file | `modes/ID_1_core/modules/Learning_mode.md`. |
| ID2 control file | `modes/ID_2_access/modules/organizer_mode.md`. Do not infer an additional root control file. |
| `modes/MODE_DIFF_NOTE.md` | A supplied custom-ID4 explanatory note; no ID4 mode folder or complete pack is supplied. |

The Project Guide's single-mode setup (pp.23–26) specifies eight files: one mode README, one control and six modules. Its mixed-mode setup (pp.24/34) specifies fourteen files for one primary and one secondary mode. Some older quick-reference/configuration passages abbreviate these to six or thirteen files, or describe control as implicit. Guide p.33 also says zero or more secondary modes, whereas pp.34/36 specify at most one. Keep these distinctions visible when preparing a working project; the source orientation assigns setup to the Project Guide, but its internal wording still needs author clarification. This migration does not silently harmonise the documents. Historical lifecycle and progression language does not convert the IDs into required stages. Any later clarification belongs in an explicitly recorded author revision.

Canonical/source modules and mode-derived modules have different roles in the release. The shared six-module structure does not make them interchangeable, and this import does not regenerate one from the other.

## Additional reading and setup clarifications

These current collection notes clarify conflicting historical wording; they do not rewrite the preserved method documents or create a new mode progression. Preserving the imported copies is a release-preparation decision, not an additional restriction on reuse under an applicable licence.

**Working copies.** The early [ID1 README](modes/ID_1_core/README_ID_1.md) contains an edit-and-regenerate instruction that conflicts with the [base README's source-preservation rule](README.md). Preserve the imported shared and mode-specific modules in this collection. Make intentional adaptations in a separate working copy and identify them as adaptations.

**Historical draft locations.** The early ID2 and ID3 references to `../../drafts/` and `../../drafts/module_stubs/` describe development paths absent from the supplied archive. They are not required installation directories. They are distinct from the supplied empty `modes/*/drafts/` placeholders. Create a working project outside the preserved collection; do not regenerate source modules to satisfy those references.

**ID2 control file.** The [quick reference](orchestration/guides/Access_Mode_Quick_Reference.md) uses the historical labels Mentor for ID2 and Organizer for ID3. Select files by their mode ID and actual pack path. In ID2, [organizer_mode.md](modes/ID_2_access/modules/organizer_mode.md) is the mode control. For current collection setup, follow the Project Guide's explicit single-mode list: mode README, control and six numbered modules. The older quick-reference instruction to omit `organizer_mode.md` conflicts with that setup. The mixed-mode ambiguity above remains unresolved.

**ID4 reference.** The preserved [ID4 note](modes/MODE_DIFF_NOTE.md) contains exception wording about a future README, while its own limits and the later ID1 release notes prohibit implying validation or adequacy. No complete ID4 mode pack is included. A README declaration by itself does not establish runtime adequacy, validation, regulatory acceptance or permission to treat exploratory outputs as inspection evidence.

## Preservation and integrity

The published ZIP and its checksum sidecar are retained under `../provenance/v1.0-access-mode/`. The external sidecar and recorded GitHub digest match the ZIP. No embedded checksum inventory or manifest was supplied in this base ZIP. The collection-generated `IMPORT_RECORD.json` records all 50 source-member hashes and six explicit directory entries; root `../collection-manifest.json` covers the imported files and additions, excluding itself.

All nine PDFs retain their published bytes. Version E at `releases/APOD-TR-006 - Volume 2, Version E.pdf` exactly matches the user's supplied `APOD-TR-006+-+Volume+2,+Version+E.pdf`, so no duplicate is added. E.2 and the guides retain their original edition labels and contents.

These checks establish preservation and folder completeness. No project was uploaded, model invoked, session record populated or freeze workflow performed. Current collection packaging status is recorded in the [root manifest](../collection-manifest.json). An earlier assessment or review ZIP describes its own snapshot. See `SOURCE_NOTICES.md` for attribution context.

## Historical handbook link correction

The current ID2 Operational Runtime Reasoning handbook in both the two-candidate and four-candidate folders has its page 2 GitHub release-tag link corrected from `ID_2-access` to the [working ID2 release link](https://github.com/Access-PoD/access-pod-artifacts-core/releases/tag/ID_2-Access). Other handbook content remains unchanged. The original PDF is preserved under `../provenance/ID_2-Access/link-path-corrections-20261011/` and in the published ZIP; the [correction record](../provenance/ID_2-Access/link-path-corrections-20261011/CORRECTION_RECORD.json) records original/revised hashes. The published Toolkit PDF remains unchanged, with a separately named current two-candidate execution guide linked from [ID2 migration notes](ID_2-Access/MIGRATION_NOTES.md). No original base-release PDF is changed by these standalone-ID2 documentation corrections.

The collection link check also received an HTTP 202 JavaScript challenge from the EUR-Lex EU AI Act page. That response is recorded as requiring browser confirmation, not as proof of a broken source link. The [layout and link-check record](../provenance/ACCESS_MODE_LAYOUT_20261011.json) distinguishes current navigation from retained historical document references.
