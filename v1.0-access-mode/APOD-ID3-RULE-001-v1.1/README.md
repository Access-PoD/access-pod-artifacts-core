# APOD-ID3-RULE-001 — Rule Engine (Session Completeness) — v1.1

**Status:** Informative companion + machine-readable rule bundle  
**Posture:** ID_3 (inspection / standards)  
**Scope:** Structural inspection enforcement + diagnostic completeness scoring only.

## What this release is
This release packages the formal structural inspection specification (APOD-ID3-RULE-001)
together with the machine-readable rule definition used by ID_3 inspection tooling.

The Rule Engine enforces **structural correctness prior to canonical promotion and freeze**.
It does **not** evaluate governance adequacy, policy sufficiency, decision validity, or compliance status.

## What this release is not
- Not a compliance framework
- Not certification, approval, or endorsement
- Not deployment readiness guidance
- Not legal or regulatory interpretation

## Contents
- `spec/Rule Engine Formalization.pdf`
- `spec/README.md`
- `rules/session_completeness.rule.json`
- `manifests/rule_release.manifest.json`
- `checksums/SHA256SUMS.txt`
- `changes/CHANGELOG.md`
- `changes/DIFF_NOTES.md`
- `CONTRIBUTORS.md`
- `release_notes_INTERNAL.md`

Artifacts not listed above are **excluded by definition**.

## Intended use
- Use `rules/session_completeness.rule.json` to validate `session.json` records produced in ID_2
  prior to ID_3 canonical promotion, freeze, and integrity anchoring.
- Completeness scoring is **diagnostic only** and must not drive semantic edits.

## Integrity
- `checksums/SHA256SUMS.txt` provides SHA-256 hashes for all files in this release pack.

## Change governance (high-level)
- Rule changes require a version bump and changelog entry.
- Backward compatibility should be evaluated and recorded in `DIFF_NOTES.md`.
- Non-fabrication boundary must be preserved: structural correction permitted; semantic invention prohibited.