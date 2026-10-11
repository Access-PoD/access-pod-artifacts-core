# Access PoD v1.0: Consolidated Governance Artifacts and Access-Mode

**Release type:** Consolidated research collection  
**Status:** Public Review Draft — Consolidated Edition 1  
**Preparation identity:** `v1.0-consolidated-draft`  
**Updated:** 11 October 2026

## Purpose and scope

This edition brings nine selected Access PoD source releases into one collection for learning, standards exploration, technical review and gov-tech research: Version A–D artifacts, the Access-Mode base, standalone ID1–ID3 examples and the original v1.1 session-completeness rule. A separate four-candidate ID2 extension is included alongside the original two-candidate release.

Each component retains its own publication identity and draft research scope. The collection identity does not rename those versions or the rule baseline. The [root README](README.md) provides the component map and reading routes.

## What this collection adds

- A common entry point, Access-Mode collection guide and component navigation.
- Current notes for known path, terminology and interpretation issues.
- The separately supplied Version B paper, identified in provenance.
- Current two-candidate and four-candidate ID2 guides, with documented source identities and changes.
- A narrow release-link correction in both current ID2 handbook copies; the published handbook remains preserved in provenance and its source archive.
- A separate four-candidate ID2 comparison example, with a full-record Markdown companion and working-copy replay guidance.
- Preserved source archives, dated verification evidence and a collection-level file inventory.
- A [licensing and source-scope explanation](LICENSING.md) that identifies the selected components, collection additions and preserved historical notice conflict.

Collection additions and revisions are distinguished from source releases. The original published ID2 Toolkit PDF remains available; the current guides have separate names. The papers, original scripts and supplied records have not been rewritten as part of these documentation updates.

## How to start

Read the [root README](README.md) and current note for the chosen component. For an initial Access-Mode project, select one posture and use its actual README, control file and six priming modules. Keep worked exemplars in a separate reference project. The [Access-Mode collection guide](v1.0-access-mode/COLLECTION_GUIDE.md#selecting-project-files) gives the exact file routes.

ID1 supports learning; ID2 supports exploratory operational reasoning and recorded comparisons; ID3 supports the original inspection and freeze workflow. Choosing one neither requires nor authorises the next. Source instructions and example checkboxes do not independently establish runtime enforcement, user consent or approval.

## Known limits and evidence

The four-candidate ID2 extension supplies four session records and four Module 03 records. It does not add the other five module JSON outputs per candidate or demonstrate four-candidate ID3 support. The original ID3 inbox and execution evidence concern the supplied two-candidate example.

ID3 requires the documented operator review before a real freeze. Its DryRun is a limited preflight: it can create an output directory, does not parse or stamp the canonical JSON and does not repeat the completeness-rule checks. Consult the [current ID3 notes](v1.0-access-mode/ID_3-operator/MIGRATION_NOTES.md) before using it. The unchanged rule describes per-session completeness; retaining one rule baseline does not establish that every candidate layout is supported by the surrounding scripts.

Known arithmetic, citation, metadata and scenario-mapping issues remain explicit in the [v1a](v1a/ERRATA.md), [v1b](v1b/ERRATA.md), [v1c](v1c/ERRATA.md) and [v1d](v1d/ERRATA.md) errata. Prefilled answers, incomplete fields and historical status labels describe supplied examples. New users must record their own facts and decisions in working copies.

Dated provenance records document prior isolated checks within their stated environments and scope. This documentation revision does not create a new model evaluation, rerun an ID3 freeze or establish general runtime robustness. File preservation and successful example checks do not constitute governance approval.

## Distribution and verification

The preparation identity remains `v1.0-consolidated-draft`. Current local packaging status is recorded in the [collection manifest](collection-manifest.json). Local sealing records a SHA-256 integrity snapshot of this Public Review Draft. `v1.0-consolidated` remains a proposed future publication tag; local packaging does not publish or tag the release.

The curated asset is `access-pod-v1.0.zip`. The separate `SHA256SUMS.txt` and `SEAL_RECEIPT.json` beside the final ZIP record its checksum, manifest identity and package verification. Any earlier review ZIP and checksum describe earlier bytes and do not verify subsequent edits. Dated preparation and provenance records retain their then-current pending or unsealed status; use the current manifest and separate receipt for this snapshot.

The [collection manifest](collection-manifest.json) inventories the assembled payload and excludes itself. Original component manifests and archive checksums continue to identify their historical distributions. Read each inventory's stated coverage; matching hashes verify bytes, not adequacy or effectiveness.

GitHub-generated source archives describe the tagged repository tree. Do not assume they are equivalent to a separately curated release ZIP without checking their contents and scope. This local integrity seal is not a digital signature, an ID3 workflow result or a governance approval. Publication and tag creation are separate actions.

## Licensing

The publisher-owned material in this consolidated draft is distributed under the [MIT License](LICENSE). [Licensing and source scope](LICENSING.md) identifies the nine selected components, the separately identified collection additions, and the preserved historical notice conflict. External releases retain their own terms.

## Related releases and terms

These releases remain outside this selected distribution. They are references for related research, not bundled dependencies or evidence that this collection reproduces their execution results. Read each release's own scope, notices and licence files before reuse.

| Related release | Research context | Terms and notices |
|---|---|---|
| [Access-PoD Dataset Lifecycle v1.0](https://github.com/Access-PoD/access-pod-artifacts-core/releases/tag/v1.0-apod-dataset-lifecycle) | APOD-TR-007 dataset-lifecycle extension, including schemas, policies and passport artifacts | Consult the release's `LICENSE.txt` and attribution notices, including its reference to [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). |
| [Q-Pathformer Enterprise v1.0](https://github.com/qpathformer/qpathformer-enterprise-v1.0-release/releases/tag/v1.0-qpathformer-enterprise) | Earlier execution, dataset-lifecycle, CSC and expanded Access-Mode research context | Consult [QPATHFORMER-PLATFORM-1.0](https://github.com/qpathformer/qpathformer-enterprise-v1.0-release/blob/v1.0-qpathformer-enterprise/QPATHFORMER-PLATFORM-1.0.txt) and the release's nested notices. |
| [Q-Pathformer Enterprise v2.0 Standards Edition](https://github.com/qpathformer/qpathformer-enterprise-v2.0-standards-release/releases/tag/v2.0-qpathformer-enterprise-standards) | APOD-TR-010 / TR-010-R operation-authorisation, package-integrity and bounded-verification research | Consult [QPATHFORMER-PLATFORM-1.0](https://github.com/qpathformer/qpathformer-enterprise-v2.0-standards-release/blob/v2.0-qpathformer-enterprise-standards/QPATHFORMER-PLATFORM-1.0.txt) and the release's file-specific notices. |

Version-specific evidence should remain attached to its own release. The ID2 comparisons in this collection do not establish Q-Pathformer platform results or equivalence between the v1.0 and v2.0 research packages.

This edition supports public research and review. It does not confer certification, compliance, deployment authority or production readiness.
