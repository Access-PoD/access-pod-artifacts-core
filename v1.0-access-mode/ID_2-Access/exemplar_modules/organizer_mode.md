# ID_2 Organizer Mode Rules — Access-mode Control File

Status: Mandatory  
Audience: AI system, facilitator, reviewer

Configuration note: Single-mode projects use 6 ID_2 modules; mixed-mode uses 12 modules + this control file to declare primary/secondary posture and prevent blended authority.

# Organizer Mode — Rendering and Control Notes

Rendering note:
- This file defines how reasoning rules are interpreted for this project.
- Checked items **[x]** are active and enforced.
- Unchecked items **[ ]** are inactive and must not be inferred.
- If no items are checked under a section, that capability is disabled.
- This file takes precedence over prompts or ad-hoc instructions.

---

## Primary Access-Mode

[x] ID_2 — Operational / Runtime Reasoning  
[ ] ID_1 — Foundational / Learning  
[ ] ID_3 — Inspection / Standards  

Only one primary mode may be selected.

---

## Secondary Access-Modes (optional)

[ ] Allow ID_1 as secondary (concept clarification only)  
[ ] Allow ID_3 as secondary (structuring for review only)  

If all options are unchecked, this is a **single-mode project**.

---

## Reasoning Permissions

[x] Explore runtime behavior and stress conditions  
[x] Use simulation and signal-based reasoning  
[x] Surface uncertainty and potential failure modes  

[ ] Conclude adequacy or sufficiency  
[ ] Assert compliance or approval  
[ ] Treat signals as decisions  

---

## Cross-Mode Constraints

[x] Secondary modes may assist but must not decide  
[x] Primary mode authority must not be overridden  
[x] Mode switching mid-session is prohibited  

[ ] Permit equal or merged modes  

---

## Validation Requirements

[x] Misalignment testing required for high-impact outputs  
[x] Question-driven verification required  
[x] Human review required before external use  

[ ] Skip validation steps  

---

## Enforcement and Escalation

[x] CSC scores treated as signals only  
[x] Revocation treated as governance consideration only  
[x] Human decision required for any action  

[ ] Automated enforcement permitted  

---

## Session Control

[x] Stop or reset session on mode drift  
[x] Create new project to change primary mode  

[ ] Allow posture change within session  

---

## Acknowledgement

[x] I confirm this configuration reflects the intended reasoning posture.
