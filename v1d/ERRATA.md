# v1d collection notes and errata

Added 11 October 2026 for Consolidated Draft Edition 1. All **ten published v1d files** remain unchanged, including Paper D, the execution guide, schemas, examples and optional helper. The empty `paper/docx/` directory from the ZIP is also preserved.

## Execution guide and paths

Read the original `tools/docs/validate_jsonschema_usage.pdf`. Its historical Windows folder is an example development location. For this collection, open PowerShell in `C:\access-pod-v1.0\v1d`. Python 3.9 or later and the `jsonschema` package are required for the optional helper; runtime dependencies are not bundled.

Use these complete single-line commands for the two documented schema/data pairs:

```powershell
py -B .\tools\validate_jsonschema.py companions\schemas\v1d_scenarios.schema.json examples\v1d_scenarios.index.json
py -B .\tools\validate_jsonschema.py companions\schemas\apod.v1d.stress_evidence_record.schema.json examples\apod.v1d.stress_evidence_record.example.json
```

If `py` is unavailable, use your Python executable (with PowerShell's `&` before a quoted executable path). The helper resolves its two arguments relative to the parent of its own `tools/` folder. Do not prefix the schema/data arguments with another `v1d/`.

The usage guide's page 3 Step 4 omits a displayed PowerShell continuation after the script name. The single-line form above avoids that copy/paste problem without changing the helper. The README mentions a `.docx` usage-guide alternative, but none is supplied; use the PDF. The empty `paper/docx/` placeholder contains no paper or guide.

The earlier private review observed `VALIDATION: PASS` and exit 0 for both original pairs using Python 3.12.14 and jsonschema 4.25.1. These are structural checks. The helper does not assert `date-time` formats, compare the evidence record with the scenario index, or authenticate evidence and roles. Both examples passing therefore does not resolve the cross-file issue below.

## Unresolved SC-004 mapping

The index and scenario library identify `v1d-SC-004` as **Ethical Ambiguity With No Clear Harm**, with the `ethical_ambiguity` stress type. The worked evidence record uses the same ID for **Telemetry gap + vendor delegation during time-critical reporting**, with telemetry, delegation, authority, incentive and compounded stress types.

The library permits combined scenarios, but the intended identity of this record remains unresolved. No replacement ID is inferred. Changing only its ID would also leave other relationships, including the decision-note reference ending in `v1d-SC-004.txt`, to resolve. An author-confirmed revision could align the record or document a distinct variant and its derivation. This migration preserves the published example and records the discrepancy separately.

## Human workflow and evidence boundaries

The intended activity is to select or combine scenarios, establish scope and accountable human participation under the rules of engagement, conduct the selected tabletop/simulation/walkthrough/revocation rehearsal, record findings and rationale, and consider constraints or follow-up. The original **Planned (Standards Exploration)** status and informative, non-certifying scope remain intact. Version A retains its stated authority; Version D stress results constrain trust rather than elevate it.

The supplied evidence record describes an internal tabletop. Its three `internal://` references are not supplied in this release, and the stated roles, actions and follow-up have not been authenticated by this migration. `record_confidence` concerns the record, while `provisional_only` does not itself establish an issued assurance decision. Historical example dates remain unchanged.

## Integrity and preservation

The original v1d release supplies one ZIP asset, with no embedded manifest or separately published checksum/manifest asset in the verified source snapshot. The preserved ZIP is at `../provenance/v1d/APOD-TR-005_Vol2_Version-D_Offline-Review_20260125_143440.zip`; its SHA-256 matches the GitHub asset digest recorded in the 10 October 2026 download snapshot.

`../provenance/v1d/IMPORT_RECORD.json` records the ten member hashes, source metadata and preserved directory. Root `../collection-manifest.json` covers the imported files and collection additions. These are locally generated inventories, not an upstream seal or signature. No published checksum sidecar has been invented.

Both original PDFs are unchanged. Paper D also matches the user's supplied `APOD-TR-005_Vol2_Version-D (1).pdf` byte for byte and appears once at `paper/pdf/APOD-TR-005_Vol2_Version-D.pdf`. The earlier private review's added validators and research reports are separate materials. See `SOURCE_NOTICES.md` for attribution and licence context.
