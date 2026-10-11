# v1a collection notes and errata

Added 10 October 2026 for Consolidated Draft Edition 1. This is an additive collection note; all ten published v1a files remain unchanged. The original ZIP and checksum are preserved under `../provenance/v1a/`.

## Arithmetic clarification

`examples/example_csc_certificate_v1a.json`, at `assessment.composite_score`, contains **80.8**. The example's declared factor scores and weights give **80.06**:

```text
82*0.18 + 78*0.12 + 80*0.16 + 85*0.26 + 76*0.16 + 74*0.12 = 80.06
```

The historical JSON value is retained in this faithful import. Use 80.06 when explaining that weighted calculation. Any later corrected example should be explicitly versioned and recorded in the collection manifest. This arithmetic does not establish factor derivation, full star qualification, signature validity or evidence authenticity. Original dates, demonstration identifiers and placeholders remain intact.

## Actual file paths

The original README uses abbreviated or older names. The files present in this import are:

| Item | Actual path relative to `v1a/` |
|---|---|
| Certificate schema | `schemas/csc-certificate.schema_v1a.json` |
| Metric catalog schema | `schemas/csc_metric_catalog_schema_v1a.json` |
| Metric catalog | `catalogs/csc_metric_catalog_v1a.json` |
| Sector profiles | `profiles/csc_sector_profiles_v1a.json` |
| Example certificate | `examples/example_csc_certificate_v1a.json` |
| JSON instructions | `docs/Access_PoD_JSON_Instructions_v1a.pdf` |
| Published internal manifest | `manifest_v1a_pack.json` |

The instruction PDF's reference to `manifest_v1a.json` means the published manifest above. Its nine entries verify the nine listed original files, excluding the manifest itself. The historical absolute development directory is provenance and is not a prerequisite for reading or validating this copy.

The README's `_future_extensions/` entry is a reserved, unpopulated location; its absence is not a packaging failure. Paper A and the instruction PDF remain unchanged. The bundled original licence remains in `LICENSE`.

## First-pass verification

All ten imported files match their ZIP members; all nine original manifest entries match; both PDF byte hashes are unchanged; Paper A matches the user's supplied assessment copy. Source ZIP CRC and SHA-256 checks passed. These are preservation and consistency checks, not a new execution or assurance assessment.
