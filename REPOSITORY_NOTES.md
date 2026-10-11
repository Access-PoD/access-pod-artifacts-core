# Repository context for the consolidated draft

This repository's [main README](README.md) is the entry point to Access PoD v1.0, Public Review Draft. The collection files are reproduced from the locally sealed snapshot. Preparing this repository does not create a GitHub release or publication tag.

## Collection and retained repository content

The [collection manifest](collection-manifest.json) covers the curated collection: the root collection documents, `v1a/`–`v1d/`, `v1.0-access-mode/` and `provenance/`. It lists 371 files and excludes the manifest itself.

The repository also retains earlier content in [schemas](schemas/), [catalogs](catalogs/), [profiles](profiles/), [examples](examples/), [docs](docs/) and [_future_extensions](_future_extensions/), along with [manifest_v1a.json](manifest_v1a.json) and [LICENSE_HISTORY.md](LICENSE_HISTORY.md). Those historical paths remain available for existing references. Their presence does not add them to the sealed collection inventory or change the scope of the current examples. Use the main README's versioned reading routes for the consolidation.

`manifest_v1a.json` describes its original Version A scope. It is not a manifest for the new repository root or the consolidated collection. Its historical README hash must not be applied to the replacement root README.

The Git controls `.gitattributes` and `.gitignore`, this note and retained historical repository content are outside the sealed collection manifest. The repository tree and the curated release ZIP therefore have distinct inventories. Git does not retain empty directories; the sealed ZIP retains the nine empty directories recorded in its receipt.

## Historical licensing observations

Read [LICENSING.md](LICENSING.md) for the consolidated draft's selected components and identified publisher-owned additions. Existing notices and historical records are preserved.

That sealed document's reference to the then-current repository README records an observation made before this repository update. The observed text remains available in the [previous README at commit 324e406](https://github.com/Access-PoD/access-pod-artifacts-core/blob/324e4069c38067cbb27a2ac863c1ada6d285c2ee/README.md); the corresponding [licensing history snapshot](https://github.com/Access-PoD/access-pod-artifacts-core/blob/324e4069c38067cbb27a2ac863c1ada6d285c2ee/LICENSE_HISTORY.md) preserves the other side of the documented discrepancy. Replacing the landing page does not resolve or rewrite that history.

The root MIT `LICENSE` retains the same text and copyright notice. Its committed line endings now match the sealed collection exactly. Scoped Git attributes preserve the collection's byte identity without renormalizing the other historical files.

## Release preparation

The intended later publication tag is `v1.0-consolidated`. The preserved preparation identity remains `v1.0-consolidated-draft`. The manifest's sealed and unpublished fields record the local snapshot, not a GitHub publication event.

The prepared release description and three upload assets are held separately for a later step: `access-pod-v1.0.zip`, `SHA256SUMS.txt` and `SEAL_RECEIPT.json`. The [collection release notes](RELEASE_NOTES_v1.0_CONSOLIDATED.md) explain the package and its limits. No new runtime or model evaluation is implied by this repository preparation.
