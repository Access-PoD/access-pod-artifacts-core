# Canonical Configuration Note — Access-Mode Projects
*(For reuse across Access-Mode documentation — v1.0-access-mode)*

Access-Mode projects are composed of six modules per mode. Each Access-Mode (ID_1, ID_2, ID_3) includes a predefined control file that enforces its reasoning constraints and takes precedence over prompts or ad-hoc instructions. In **single-mode projects**, only the six modules for the selected mode are required; the associated control file is implicit and enforces that mode’s boundaries without introducing ambiguity. In **mixed-mode projects**, twelve modules are present (six primary and six secondary). Because ambiguity is introduced, a project-specific control file (`organizer_mode.md`) is **mandatory** to explicitly declare the primary mode, permitted secondary modes, and enforcement boundaries. This distinction ensures that structure enforces discipline by default, and explicit control files are used only when multiple reasoning postures coexist.

---

## Required components of an Access-Mode project (informative)

A complete Access-Mode project consists of a coherent set of files that together
define the reasoning posture, constraints, and permissible behavior of the AI system.

At minimum:

### Single-mode project
A single-mode Access-Mode project requires:
- one mode-specific README file,
- one mode-specific control file, and
- six modules corresponding to the selected Access-Mode (ID_1, ID_2, or ID_3).

This configuration is sufficient because the module set itself is unambiguous and
the mode control file enforces the reasoning boundaries implicitly.

### Mixed-mode project
A mixed-mode Access-Mode project requires:
- one mode-specific README file (primary mode),
- six modules from the primary Access-Mode,
- six modules from one permitted secondary Access-Mode, and
- one project-level control file (`organizer_mode.md`).

The project-level control file is mandatory because multiple module sets introduce
ambiguity that cannot be resolved by structure alone.

This section describes **composition**, not setup procedure.
Operational steps are defined in the Access-Mode Project Guide.

---

# Diff-Style Audit Note — Rationale for Access-Mode Project File Counts
*(For standards bodies, regulators, and review audiences — informative)*

## Context
Some documents describe Access-Mode projects in terms of **six module files** (single-mode) and **twelve modules plus one control file** (mixed-mode). This note clarifies why.

## Configuration model (what is included in a project)

This table summarises what files are present in an Access-Mode project
and why additional control is required only in mixed-mode cases.

| Aspect | Single-mode project | Mixed-mode project |
|---|---|---|
| Modules included | 6 modules from one Access-Mode | 12 modules (6 primary + 6 secondary) |
| Control file included | No additional project-level control file | `organizer_mode.md` (required) |
| Reasoning posture | Unambiguous (single mode) | Potentially ambiguous (multiple modes) |
| How ambiguity is handled | Structure alone is sufficient | Explicit declaration required |
| Project classification | Single-mode | Mixed-mode |

In a single-mode project, the selected module set is sufficient to determine
the reasoning posture. No additional project-level control file is required.

In a mixed-mode project, multiple module sets are present. This introduces
ambiguity about which reasoning posture is authoritative. A project-level
control file (`organizer_mode.md`) is therefore mandatory to explicitly declare
the primary mode, permitted secondary mode, and enforcement boundaries.

## Why the distinction exists
- Each Access-Mode has a **predefined control file** that constrains reasoning behavior and prevents inferred permissions (checked vs unchecked capability logic). In single-mode projects, the module set itself is unambiguous, so no additional project-level declaration is needed beyond correct module selection, project naming, and opening instruction.
- Mixed-mode projects intentionally include multiple module sets. This introduces ambiguity (primary vs secondary posture). `organizer_mode.md` is therefore mandatory to explicitly declare the authoritative primary mode, permitted secondary mode(s), and enforcement boundaries.

## Governance principle
**Implicit control is sufficient where structure is unambiguous. Explicit project-level control is required only where ambiguity is introduced.**

## Implementation references
- Mode pods are defined as deterministic six-module selections (structural invariant).  
- Mixed-mode requires an explicit control file to prevent blended authority and posture drift.

