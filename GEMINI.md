# SuperLex Skills — Gemini CLI Configuration

@./CLAUDE.md

## Skill Discovery

All SuperLex Skills legal skills live in `skills/`. To use a skill:

1. Read its `SKILL.md` (jurisdiction-agnostic spine, in English).
2. Resolve the active jurisdiction.
3. Read `skills/<skill>/jurisdictions/<code>.md` for the statutory
   content, output labels, and HARD-GATE prompt text in the
   jurisdiction's working language.

Core safety layers live in `core/`:

- `core/DISCLAIMER.md`
- `core/RISK-FRAMEWORK.md`
- `core/AGENTIC-VERIFICATION.md`
- `core/SKILL-ANATOMY.md`
- `core/JURISDICTION-ANATOMY.md`

## Mandatory Entry Point

For **any** legal document generation, contract analysis, legal notice,
NDA, privacy policy, terms-of-use, or similar legal output, read

```
skills/lawyer-context-manager/SKILL.md
```

**before** reading any other skill file and **before** producing any
draft. See `CLAUDE.md` for the full behavioural contract.

## Subagent Context Skip

If you are operating as a **subagent** dispatched by an orchestrating
session to execute a specific legal task, skip `lawyer-context-manager`.
Context is already injected by the orchestrating session. This is
signalled by the `<SUBAGENT-STOP>` block at the top of that skill.

## Current Legal Skills

- `using-superlex-skills` — bootstrap meta-skill (agent onboarding)
- `lawyer-context-manager` — meta-skill (context + jurisdiction routing)
- `specification-before-drafting` — meta-skill (pre-drafting strategy)
- `writing-superlex-skills` — meta-skill (TDD-based skill authoring and pressure testing)
- `privacy-policy` — `tr`, `eu`
- `contract-review` — `tr`
- `terms-of-use` — `tr`
- `nda-generator` — `tr`
- `legal-letter` — `tr`
- `subagent-driven-development` — orchestration skill (subagents + reviews)
