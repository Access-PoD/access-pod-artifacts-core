# v1.0-Access-mode

This repository contains the **Access-Mode orchestration system** for creating, managing, and validating AI projects with disciplined reasoning postures.

Access-Mode is **model-agnostic** and focuses on controlling *how* an AI system reasons, not what it decides.

---

## Canonical guidance (read first)

The authoritative guide for using this repository is:

**/orchestration/Access_Mode_Project_Guide.PDF**

This document defines:
- Access-Mode concepts (ID_1, ID_2, ID_3),
- single-mode and mixed-mode project setup,
- validation and record-keeping discipline,
- and correct use of supporting files.

If documentation elsewhere differs, the Project Guide takes precedence.

## Required files for Access-Mode projects

When creating an Access-Mode project (ID_1, ID_2, or ID_3), the following files
must always be uploaded together:

- The mode-specific README file
- The mode-specific control file
- All six modules for that mode

These files form a single reasoning contract for the project
Uploading only some modules, or omitting the README or control file, breaks
Access-Mode discipline and invalidates the project configuration.

This requirement applies to:
- single-mode projects, and
- mixed-mode projects (in addition to organizer_mode.md).

For full setup and operating instructions, refer to the Project Guide linked above.

---

## Repository structure

### `/modules/`
Canonical source modules.

- These files are **authoritative** and **mode-agnostic**.
- They are retained for provenance, traceability, and audit reference.
- They represent the original source material from which all Access-Mode
  configurations (ID_1, ID_2, ID_3, and future modes) are derived.

Important notes:

- Canonical modules are **not used directly** in AI projects.
- They are intentionally **slightly different** from the ID_1, ID_2, and ID_3
  modules, which apply mode-specific constraints, language, and posture controls.
- Canonical modules must **never be edited in place**.

To create a new mode or variant:

- Copy all canonical modules using **robocopy** (see `/ROBOCOPY_ONLY.PDF`).
- Rename and adapt files **only in the destination mode folder**.
- Apply testing and validation before use.

The `/modules` directory functions as a **source-of-truth archive**, not a
working directory.

### `/modes/`
Generated mode packs.

- Each `ID_x_*` folder contains derived modules.
- These files may be edited **only within their mode folder**.
- Never overwrite canonical modules.

### `/orchestration/`
Orchestration and usage documentation.

Includes:
- **Access_Mode_Project_Guide.PDF** (canonical)
- Access-Mode Quick Reference
- Facilitator Quick-Start Card
- Access-Mode Index
- Workshop and mode templates

---

## Editing rules (important)

- Do not edit generated mode files to change canonical logic.
- Do not mix modules from different modes unless explicitly using mixed-mode rules.
- Do not treat Access-Mode as a compliance or certification mechanism.

All outputs are drafts and require human review.

---

## Intended use

This repository is intended for:
- learning and teaching AI governance concepts,
- structured AI-assisted reasoning,
- workshop delivery,
- and standards exploration.

It does **not** assert compliance, certification, or deployment readiness.

---

## Versioning

This repository follows strict versioning.

- Canonical modules are never overwritten.
- Changes are introduced through new versions or new mode folders.
