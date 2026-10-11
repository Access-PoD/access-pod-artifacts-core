# Execution Toolkit — Format & Editing Guidance

This folder contains the execution-layer documentation for Access-Mode ID_3.

The Toolkit is distributed in two formats:

- **PDF** — Reading and review copy (read-only)
- **DOCX** — Copy/paste execution source

---

## 1. Format Roles

### PDF Version

The PDF is provided for:

- structured reading
- inspection review
- standards-facing reference
- archival distribution

The PDF is **read-only**.

Do not copy PowerShell commands directly from the PDF.  
Page headers, footers, and hidden formatting characters may be included during copy and will cause PowerShell parsing errors.

---

### DOCX Version

The Word (DOCX) version is the authoritative execution source.

Use the DOCX version for:

- copy/paste of PowerShell commands
- script block extraction
- controlled editing for custom runs

---

## 2. PowerShell Execution Discipline

When executing commands:

- Open PowerShell 7.
- Copy commands from the DOCX file only.
- Paste directly into PowerShell.
- Execute in the specified working directory.

If a PowerShell error references unexpected tokens such as:


Page | X


You likely copied content from the PDF.  
Delete the extraneous line and re-copy from the DOCX source.

---

## 3. Editing for Custom Runs

For custom inspection cycles:

1. Open the DOCX file.
2. Modify only:
   - date paths (YYYY-MM-DD)
   - session identifiers
   - folder labels
3. Save under a new filename, e.g.:


ID_3 - Toolkit Script Examples Companion_CUSTOM_2026-03-05.docx


Do not modify the canonical release version.

---

## 4. Recommended Editing Tools

For command safety and formatting clarity:

- **Notepad** — Safe for stripping formatting before execution
- **Visual Studio Code** — Recommended for:
  - viewing whitespace
  - verifying backticks
  - confirming path integrity
  - detecting hidden characters

When pasting from Word into VS Code:

- Enable “Render Whitespace”
- Confirm no unexpected characters appear
- Confirm backticks (`) remain intact

---

## 5. Script File Alternative (Advanced)

For repeatable environments, consider extracting PowerShell blocks into standalone `.ps1` snippet files.

This eliminates copy/paste risk and ensures deterministic execution.

Example:


scripts/snippets/STEP2_Create-10_working.ps1


Execution:


pwsh -NoProfile -File .\scripts\snippets\STEP2_Create-10_working.ps1


---

## 6. Execution Integrity Principle

The Toolkit enforces deterministic inspection discipline.

Formatting errors, hidden characters, or silent command alteration undermine reproducibility.

Always treat the DOCX file as the execution source of truth.