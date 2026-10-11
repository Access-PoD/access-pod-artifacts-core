# Mode ID_2 — Access-mode (Runtime Governance)

**Status:** Draft  
**Audience:** AI governance practitioners, system designers, assurance teams  
**Purpose:** Implement operational / runtime reasoning posture within the Access-Mode method.

## What this mode is
ID_2 introduces **Access-mode**: a runtime-oriented configuration that extends foundational governance reasoning into operational analysis, including simulation, stress-testing, and interpretation of runtime signals.

This mode is designed to answer:
- How does governance behave under pressure?
- Where does policy attach at runtime?
- How is trust signaled, revoked, or degraded?

## Module set
1. Module 01 — Governance AI Identity *(canonical)*  
2. Module 02 — Intent, Scope & Boundaries *(canonical)*  
3. Module 03 — SAPP Simulation & Stress Testing *(new)*  
4. Module 04 — Writing Governance Artifacts *(canonical)*  
5. Module 05 — Access PoD Runtime Enforcement *(new)*  
6. Module 06 — CSC Scoring & Revocation *(new)*  

New modules in this mode introduce runtime reasoning, telemetry concepts, and governance stress-testing.

## How to use
- Use this mode for:
  - advanced workshops
  - governance-in-operation discussions
  - bridging policy and system execution
- Outputs emphasize:
  - failure discovery
  - enforcement points
  - continuous assurance signals

## Optional Records and Session Capture (ID_2)

ID_2 supports optional structured records to capture operational reasoning, simulation observations, uncertainty, and escalation signals produced while working through the modules.

These records are non-inspection artifacts. They exist to support:

replayable operational reasoning,

comparison across scenarios or sessions,

human review of signal interpretation,

preparation for later inspection work (if and when ID_3 is invoked).

Use of records is optional. All ID_2 work may be performed using the modules alone.

## Editing rules
- Canonical modules remain read-only here.
- New module development should occur in `../../drafts/module_stubs/`
  and be promoted intentionally.
