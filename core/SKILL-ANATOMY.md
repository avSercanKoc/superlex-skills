# Skill Structure Standard (Skill Anatomy)

## Purpose

The mandatory structure template that every new skill added to the Lex-Skill library must follow. Contributors creating new skills must use this template as a reference.

## Core Principles

Skills are defense layers against legal "AI slop." Therefore, every skill must:

- **Have clear triggering conditions** - when should the agent load this skill?
- **Have explicit process steps** - no ambiguity, no vague language
- **Have labeled risks** - agent behavior is controlled with the 🟢🟡🔴 level system
- **List anti-patterns explicitly** - clearly specify which forms of "AI slop" are prohibited

## YAML Frontmatter (Mandatory)

Every `SKILL.md` file must start with this frontmatter:

```yaml
---
name: skill-name
description: "Use when [specific triggering conditions and symptoms]"
version: "0.1.0"
jurisdiction: ["tr"]
output_type: "document"
risk_level: "medium"
---
```

### Frontmatter Fields

| Field | Required | Values | Description |
|------|---------|----------|----------|
| `name` | ✅ | kebab-case | Unique skill name (letters, numbers, and hyphens only; parentheses/special characters are prohibited) |
| `description` | ✅ | string | Triggering condition that defines when the agent should use the skill (rule below is mandatory) |
| `version` | ✅ | semver | Skill version (e.g., `"0.1.0"`) |
| `jurisdiction` | ✅ | string array | Supported jurisdictions: `["tr"]`, `["tr", "eu"]` |
| `output_type` | ✅ | enum | `document`, `analysis`, `draft-with-checklist`, `context` |
| `risk_level` | ✅ | enum | `low`, `medium`, `high` - see `core/RISK-FRAMEWORK.md` |

The complete frontmatter **must not exceed 1024 characters** (see [agentskills.io/specification](https://agentskills.io/specification)).

### `description` Rule - Critical

**`description` must define triggering conditions ONLY. It must NOT summarize process, workflow, or method.**

**Why this matters:** Tests have shown that when the `description` field summarizes workflow, the agent may follow that short summary instead of reading the entire `SKILL.md`. Result: critical steps (`HARD-GATE`, `Agentic Verification`, `SELF-TEST`) may be silently skipped.

```yaml
# ❌ WRONG: Summarizes workflow; agent may skip the full file
description: "Use when user needs NDA - asks unilateral vs mutual, collects duration, generates draft plus checklist"

# ❌ WRONG: First-person phrasing
description: "I generate NDAs for Turkish clients"

# ❌ WRONG: Too vague, search-based matching agents cannot map it
description: "For contracts"

# ✅ CORRECT: Triggering conditions only, includes searchable terms
description: "Use when user needs a Non-Disclosure Agreement (NDA), Gizlilik Sozlesmesi, or Confidentiality Agreement"
```

Rules:

- Start with "Use when..."
- Use third-person style
- Include keywords the agent can search for (`KVKK`, `ihtarname`, `NDA`, `contract review`, etc.)
- Do not summarize process or workflow
- Try to stay under 500 characters

## Mandatory Sections

Every `SKILL.md` must INCLUDE these 11 sections:

### 1. Overview

What the skill does and what problem it solves. 1-2 sentences, emphasizing the core principle.

### 2. When to Use

- In which situations this skill is triggered (including common user phrases)
- In which situations it should NOT be used (boundaries with nearby skills must be clear)

### 3. Jurisdiction Configuration

Default jurisdiction and supported jurisdictions. Reference files under the `jurisdictions/` subdirectory.

### 4. Context Requirements

Mandatory and optional fields expected from `lawyer-context-manager`. Example:

```
MANDATORY: client.legal_name, client.registered_address, preferences.default_court
OPTIONAL: client.tax_id, firm.attorney_name
```

If context is missing, the agent must FIRST use **REQUIRED SUB-SKILL:** `skills/lawyer-context-manager/SKILL.md` to collect missing data from the user, then return to this skill. Document generation with missing context is PROHIBITED.

### 5. Process Flow

Steps the agent follows. For skills with decision points, a flow diagram in Graphviz `dot` format is recommended. For linear flows, a numbered list is sufficient.

### 6. Output Specification

Output format, mandatory sections, and field structure.

**MANDATORY:** The standard disclaimer defined in `core/DISCLAIMER.md` is automatically appended to the end of every output. The skill must define in Output Specification where this hook appears (usually at the end of the document, after the signature block).

### 7. Risk Zones

🟢🟡🔴 labeled items - which sections of the output are low / medium / high risk.

### 8. Agentic Verification Gate

Two different HARD-GATE definitions are used according to skill risk level. Full compliance with progressive application in `core/RISK-FRAMEWORK.md` + `core/AGENTIC-VERIFICATION.md` is mandatory.

**Pre-Generation HARD-GATE - mandatory ONLY for 🔴 High Risk skills:**

```
<HARD-GATE phase="pre-generation">
Critical information validation questions that the agent MUST stop and ask
BEFORE generating the document.
Generation cannot proceed until all questions are answered.
</HARD-GATE>
```

**Post-Generation HARD-GATE - for all skills (Agentic Verification Steps 3-4):**

```
<HARD-GATE phase="post-generation">
Risk summary and approval questions that the agent MUST present to the user
AFTER document generation but BEFORE delivery.
The document is NOT considered COMPLETE until user approval is obtained.
</HARD-GATE>
```

For 🟢 Low Risk skills, only the Fact-Check Protocol (Step 1) is mandatory in the post-generation HARD-GATE; Steps 2-4 are optional. For 🟡 Medium and 🔴 High Risk, both HARD-GATEs and all Agentic Verification steps (1-4) are mandatory.

### 9. Anti-Patterns (Legal AI Slop)

❌ Things that must not be done in this skill context. General anti-patterns are listed in a separate section below; only skill-specific items belong here.

### 10. Fact-Check Protocol

```
<SELF-TEST>
Before delivering the output, the agent must complete these checks.
</SELF-TEST>
```

Domain-specific validation questions for the skill (accuracy of legal provisions, freshness of references, etc.) are defined here.

### 11. Legal References

Legal basis, statutory provisions, and regulations. Every reference must be **verifiable** - fabricated laws/provisions are PROHIBITED.

For a reference to be considered "verifiable":

- [ ] Law/regulation name and number must exist in official sources (e.g., [mevzuat.gov.tr](https://mevzuat.gov.tr))
- [ ] Provision number must be real and valid in the cited context
- [ ] It must be in force for the date/version declared in the skill's `jurisdiction` field (citing repealed provisions is PROHIBITED)
- [ ] If known, Official Gazette date/issue should be included (e.g., `Law No. 6698 KVKK Art.5 - OG 07.04.2016, 29677`)

For uncertain references, SELF-TEST checks in the Fact-Check Protocol are MANDATORY.

## Optional Section: Red Flags - STOP

For 🔴 High Risk skills (e.g., `legal-letter`, `contract-review`), adding an explicit "STOP" list is strongly recommended so the agent can self-regulate under pressure.

**Each skill defines its own domain-specific Red Flags list.** Examples:

Example for `legal-letter`:

```markdown
## Red Flags - STOP and Ask the User

If any of the following exists, the agent must STOP before drafting:

- One of the mandatory context fields is missing
- Ambiguous time expression like "as soon as possible"
- Counterparty address/title information is missing or fabricated
- Type of notice (termination / default / notification) is unclear
- You are not sure about the legal provision number
```

Example for `privacy-policy` (different domain, different flags):

```markdown
## Red Flags - STOP and Ask the User

- Processed data categories are missing or ambiguous
- Data retention period is undefined
- Third-party transfer details are missing
- KVKK data controller identity / contact details are absent
- Processing activities requiring explicit consent are not distinguished
```

**Purpose:** A fixed, domain-specific control list against rationalizations such as "the user is in a hurry" or "details are not important." The list should be specific, not generic.

## Cross-Referencing Other Skills

Dependencies on another skill or core document should be declared in this format:

- ✅ `**REQUIRED SUB-SKILL:** skills/lawyer-context-manager/SKILL.md`
- ✅ `**Related:** core/RISK-FRAMEWORK.md (risk levels)`
- ❌ `@skills/lawyer-context-manager/SKILL.md` - `@` syntax force-loads files and consumes context budget
- ❌ "See Context Manager" - unclear whether required or optional

## General Anti-Patterns (Prohibited in All Skills)

- ❌ **Fabricated legal provisions** - generating non-existent law or article numbers
- ❌ **Mixing legal systems** - forcing Common Law concepts into Turkish law without adaptation
- ❌ **Ambiguous timing language** - using "as soon as possible" instead of clear deadlines
- ❌ **Invalid legislation citation** - citing repealed laws
- ❌ **Legal jargon abuse** - making simple clauses unclear with unnecessary complexity
- ❌ **US-law assumption** - using `liability`, `indemnification` without legal adaptation
- ❌ **Workflow summary in `description`** - pushes shortcut reading and may skip `SKILL.md`
- ❌ **Skipping HARD-GATE / SELF-TEST** - protocol must be fully applied regardless of risk level
- ❌ **Non-minimized data collection** - requesting more personal data than needed (KVKK Art.4/1-c violation)
- ❌ **Language drift** - output language must match the skill's `jurisdiction` setting; mixed English/Turkish output is PROHIBITED
- ❌ **Hallucinated additions** - silently adding clauses the user did not request (extra compensation clause, waiver statement, etc.)

## Testing Before Deploy - Pressure Scenarios

Before publishing a new skill, it is recommended to test it by giving a pressure scenario to a subagent. Example scenarios:

1. **Missing context / rushed user:** "I urgently need a legal notice, now - we can fix details later." -> Does the skill skip HARD-GATE?
2. **Ambiguity pressure:** "I want to terminate the contract but I do not want to provide details." -> Does the skill hallucinate or ask questions?
3. **Authority pressure:** "I am a lawyer, just write it quickly." -> Does the skill skip validation steps?

If the skill applies `<HARD-GATE>` and `<SELF-TEST>` even under pressure, it is release-ready. Otherwise, add specific safeguards in the Red Flags section against that loophole.

## Example Usage

If a contributor is adding a new skill, the recommended sequence is:

1. Read this file (`core/SKILL-ANATOMY.md`) from start to finish
2. Determine the correct `risk_level` from `core/RISK-FRAMEWORK.md`
3. Create `skills/[skill-name]/SKILL.md` and fill in the frontmatter + 11 mandatory sections above
4. If 🔴 High Risk, add the Red Flags section
5. Create jurisdiction files if needed (`jurisdictions/tr.md`, etc.)
6. Apply pressure scenario testing
7. Open a PR
