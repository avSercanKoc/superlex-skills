# Skill Structure Standard (Skill Anatomy)

## Purpose

The mandatory structure template that every new skill added to the Lex-Skill library must follow. Contributors creating new skills must use this template as a reference.

## Core Principles

Skills are defense layers against legal "AI slop." Therefore, every skill must:

- **Be jurisdiction-agnostic at the spine** — `SKILL.md` describes the process, invariants, and abstract structure in English; jurisdiction-specific legal content lives exclusively in `jurisdictions/<code>.md`
- **Have clear triggering conditions** — when should the agent load this skill?
- **Have explicit process steps** — no ambiguity, no vague language
- **Have labeled risks** — agent behavior is controlled with the 🟢🟡🔴 level system
- **List anti-patterns explicitly** — clearly specify which forms of "AI slop" are prohibited
- **Use XML Urgency Tags for strict rules** — LLMs parse tags like `<EXTREMELY-IMPORTANT>` and `<HARD-GATE>` more strongly than plain text. Do not remove or alter these tags; they are core safety constraints.

## Jurisdiction Separation — What Goes Where

This is the most important architectural rule of the library. The agent's workflow is:

1. The agent reads `SKILL.md` to learn the process, structure, and invariants.
2. The agent resolves the active jurisdiction (from `preferences.default_governing_law` or explicit user choice) and loads the matching `jurisdictions/<code>.md`.
3. The agent produces the output by applying the abstract structure from `SKILL.md` and filling it with the concrete legal content, statutory citations, and working-language labels from `jurisdictions/<code>.md`.

### Content Placement Rules

| Content | Goes in `SKILL.md` | Goes in `jurisdictions/<code>.md` |
|--------|--------------------|-----------------------------------|
| Triggering conditions / when-to-use | ✅ | ❌ |
| Abstract process flow | ✅ | ❌ |
| Context schema field names | ✅ | ❌ |
| Generic anti-patterns (e.g. "do not fabricate provisions") | ✅ | ❌ |
| Abstract HARD-GATE skeleton and intent | ✅ | ❌ |
| Generic SELF-TEST items (structure, disclaimer presence, language consistency) | ✅ | ❌ |
| Risk-zone categories (what *kinds* of content are 🔴) | ✅ | ❌ |
| Statute numbers (TBK, TTK, KVKK, GDPR, etc.) | ❌ | ✅ |
| Output document section labels in the jurisdiction's working language | ❌ | ✅ |
| Jurisdiction-language HARD-GATE prompt text spoken to the user | ❌ | ✅ |
| Jurisdiction-specific SELF-TEST items tied to named articles | ❌ | ✅ |
| Jurisdiction-specific anti-patterns (e.g. "do not cite repealed 818 s.K. BK") | ❌ | ✅ |
| Red Flags items tied to named statutes (e.g. "TTK m.18/3 not satisfied") | ❌ | ✅ |
| Legal references (laws, regulations, case law, gazette citations) | ❌ | ✅ |

### Examples

```
# ❌ WRONG — SKILL.md contains TR law inline
## Output Specification
Section 12 — İlgili Kişinin Hakları — KVKK m.11'deki 9 hak eksiksiz listelenmelidir.
```

```
# ✅ CORRECT — SKILL.md stays abstract
## Output Specification
The policy MUST include a "Data Subject Rights" section enumerating every statutory right
granted in the active jurisdiction. The concrete rights list, article numbers, and
working-language labels are defined in `jurisdictions/<code>.md`.
```

```
# ❌ WRONG — HARD-GATE prompt text hard-coded in Turkish inside SKILL.md
<HARD-GATE phase="post-generation">
"Bu politikada aşağıdaki maddeler en yüksek riskli kısımlardır: ..."
</HARD-GATE>
```

```
# ✅ CORRECT — SKILL.md describes the HARD-GATE contract; jurisdictions/<code>.md owns the text
<HARD-GATE phase="post-generation">
The agent MUST stop and present the top 3 highest-risk items in the jurisdiction's
working language using the template defined in `jurisdictions/<code>.md`
(`Post-Generation HARD-GATE Template` section). Delivery before user approval is FORBIDDEN.
</HARD-GATE>
```

### Exception — Discoverability Keywords

The `description` frontmatter field MAY include search keywords in multiple languages (e.g. `NDA`, `Gizlilik Sozlesmesi`) so the agent can match user phrasing. The `When to Use` section MAY likewise list trigger phrases in multiple languages for discoverability. These are *triggering metadata*, not legal content, and do not violate the separation rule.

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
- Include keywords the agent can search for (`KVKK`, `ihtarname`, `NDA`, `contract review`, etc.) — multilingual keywords are allowed for discoverability
- Do not summarize process or workflow
- Try to stay under 500 characters

## Optional Pre-Frontmatter Block — `<SUBAGENT-STOP>`

Meta-skills and orchestrator skills (currently: `lawyer-context-manager`, `specification-before-drafting`, `subagent-driven-development`) SHOULD include a `<SUBAGENT-STOP>` block immediately after the closing `---` of the frontmatter and before the first `#` heading.

**Purpose:** When an agent dispatches a subagent to execute a specific legal task, the subagent already has context injected by the orchestrating session. Loading the meta-skill again wastes the subagent's context budget and risks derailing it from its assigned task.

**When to add it:**
- ✅ Meta-skills with `output_type: "context"` that run at session start (e.g., `lawyer-context-manager`)
- ❌ Task-execution skills (`document`, `analysis`, `draft-with-checklist`) — subagents SHOULD use these

```xml
<SUBAGENT-STOP>
If you were dispatched as a subagent to execute a specific legal task
(drafting, reviewing, or analysing a document), skip this skill.
Context has already been established and injected by the orchestrating session.
Proceed directly with your assigned task using the context you were given.
</SUBAGENT-STOP>
```

The block uses XML-style tags because language models respond reliably to them. The tag must appear verbatim — do not paraphrase it.

## Mandatory Sections

Every `SKILL.md` must INCLUDE these 12 sections. Write all of them in English and keep them jurisdiction-agnostic (see the separation rules above).

### 1. Overview

What the skill does and what problem it solves. 1-2 sentences, emphasizing the core principle. No statute names or jurisdiction-specific citations here.

### 2. Instruction Priority

When instructions conflict, resolve in this order:

1. **User's explicit instructions** (AGENTS.md, direct user messages) — highest priority.
2. **Skill protocols** (HARD-GATE, SELF-TEST, DISCLAIMER, Red Flags) — overrides default helpfulness.
3. **Default system prompt** — lowest priority.

### 3. When to Use

- In which situations this skill is triggered (including common user phrases — multilingual triggers allowed for discoverability)
- In which situations it should NOT be used (boundaries with nearby skills must be clear)

### 4. Jurisdiction Configuration

Default jurisdiction, supported jurisdictions, and an explicit instruction to load `jurisdictions/<code>.md` before producing output. Example:

```markdown
- Default: `tr`
- Supported: `tr`, `eu`
- The agent MUST load `jurisdictions/<selected>.md` after context collection and before drafting.
  That file provides: statutory citations, output section labels in the working language,
  the user-facing HARD-GATE prompt text, jurisdiction-specific SELF-TEST items, and the
  jurisdiction-specific anti-patterns.
```

If the active jurisdiction cannot be resolved unambiguously (e.g. the client operates in both TR and EU markets), the skill MUST require the user to choose the primary regime before generation. Mixing two legal regimes in a single output is an anti-pattern.

### 5. Context Requirements

Mandatory and optional fields expected from `lawyer-context-manager`. Field names are jurisdiction-agnostic identifiers from the context schema. Example:

```
MANDATORY: client.legal_name, client.registered_address, preferences.default_court
OPTIONAL: client.tax_id, firm.attorney_name
```

If context is missing, the agent must FIRST use **REQUIRED SUB-SKILL:** `skills/lawyer-context-manager/SKILL.md` to collect missing data from the user, then return to this skill. Document generation with missing context is PROHIBITED.

### 6. Process Flow

Steps the agent follows. For skills with decision points, a flow diagram in Graphviz `dot` format is recommended. For linear flows, a numbered list is sufficient. The node labeled "Load jurisdictions/<code>.md" MUST appear in every process flow that produces a legal output.

### 7. Output Specification

Abstract output structure: what *sections* the document must contain and *what each section must accomplish*. Describe sections by purpose (e.g. "Controller identity block", "Data subject rights enumeration", "Penalty clause with statutory-discount awareness"), NOT by jurisdiction-specific label or statute number.

The concrete section labels in the working language, the statutory bindings for each section, and the placeholders to fill are defined in `jurisdictions/<code>.md` under its `Output Template` section.

**MANDATORY:** The standard disclaimer defined in `core/DISCLAIMER.md` is automatically appended to the end of every output. The skill must declare in Output Specification where this hook appears (usually at the end of the document, after the signature block).

### 8. Risk Zones

🟢🟡🔴 labeled items described by *kind of content* (e.g. "legal-basis selection", "penalty clause amount", "termination method"), NOT by statute number. The jurisdiction file binds these kinds to concrete named provisions.

### 9. Agentic Verification Gate

Two different HARD-GATE definitions are used according to skill risk level. Full compliance with progressive application in `core/RISK-FRAMEWORK.md` + `core/AGENTIC-VERIFICATION.md` is mandatory.

Each HARD-GATE block in `SKILL.md` defines:

- The *phase* (pre-generation or post-generation)
- The *contract* — what questions, risks, or approvals must be satisfied
- A pointer to the jurisdiction file's template section for the actual working-language prompt text

**Pre-Generation HARD-GATE — mandatory ONLY for 🔴 High Risk skills:**

```
<HARD-GATE phase="pre-generation">
Critical information validation questions that the agent MUST stop and ask
BEFORE generating the document. The questions are enumerated by topic (e.g.
"confirm recipient address", "confirm notice purpose", "confirm applicable
deadline and its basis"). The working-language phrasing of each question
is defined in jurisdictions/<code>.md under `Pre-Generation HARD-GATE Template`.
Generation cannot proceed until all questions are answered.
</HARD-GATE>
```

**Post-Generation HARD-GATE — for all skills (Agentic Verification Steps 3-4):**

```
<HARD-GATE phase="post-generation">
Risk summary and approval questions that the agent MUST present to the user
AFTER document generation but BEFORE delivery. The user-facing summary is
delivered in the jurisdiction's working language using the template in
jurisdictions/<code>.md under `Post-Generation HARD-GATE Template`.
The document is NOT considered COMPLETE until user approval is obtained.
**Motto:** Violating the letter of the rules is violating the spirit of the rules.
</HARD-GATE>
```

For 🟢 Low Risk skills, only the Fact-Check Protocol (Step 1) is mandatory in the post-generation HARD-GATE; Steps 2-4 are optional. For 🟡 Medium and 🔴 High Risk, both HARD-GATEs and all Agentic Verification steps (1-4) are mandatory.

### 10. Anti-Patterns (Legal AI Slop)

❌ Generic prohibitions that apply regardless of jurisdiction (e.g. "do not fabricate provisions", "do not mix two legal regimes in one document"). Jurisdiction-specific anti-patterns (e.g. "do not cite 818 sayılı BK", "do not recommend email notice between merchants") live in `jurisdictions/<code>.md`.

General anti-patterns that apply to every skill are listed in a separate section below.

**Rationalization (Self-Correction) Table:**
Every skill MUST include a `Thought -> Reality` table at the end of this section to prevent the agent from rationalizing shortcuts. This catches the agent's internal monologue and provides a strict counter-argument.

Example:
```markdown
## Anti-Patterns
...
### Rationalization (Self-Correction)

| Thought | Reality |
|---------|---------|
| "The user is in a hurry, I'll just skip the HARD-GATE" | Rushed users are exactly why the HARD-GATE exists. Never skip it. |
| "This is a simple document, no risks here" | Simple documents still cause rights forfeiture. Follow the protocol. |
```

### 11. Fact-Check Protocol

```
<SELF-TEST>
Before delivering the output, the agent must complete generic checks
(structure, language consistency, disclaimer presence, context completeness,
no fabricated citations). The jurisdiction-specific checks (named-article
accuracy, enumeration counts, repealed-law detection, delivery-form rules,
etc.) are listed in jurisdictions/<code>.md under `Jurisdiction-Specific SELF-TEST`.
The agent MUST run BOTH the generic checks here AND the jurisdiction-specific
checks before delivery.
**CRITICAL:** Do Not Trust the Report. Verify every evidence manually from the source documents.
</SELF-TEST>
```

### 12. Legal References

`SKILL.md` MUST NOT enumerate statute numbers. Instead this section contains a single pointer:

```markdown
## Legal References

Statute-level citations, regulation numbers, gazette issues, and case-law anchors live
in `jurisdictions/<code>.md` under its `Legal References` section. Every reference
there MUST be verifiable in an official source (e.g. `mevzuat.gov.tr`, `eur-lex.europa.eu`).
Fabricated provisions are PROHIBITED across the entire library.
```

The verifiability rules — real article numbers, in-force at the declared jurisdiction version, with gazette citation where known — are enforced *inside* each jurisdiction file.

## Optional Section: Red Flags - STOP

For 🔴 High Risk skills (e.g., `legal-letter`, `contract-review`), adding an explicit "STOP" list is strongly recommended so the agent can self-regulate under pressure.

The Red Flags in `SKILL.md` describe *abstract categories* that should halt generation. The jurisdiction-specific, statutory-named red flags belong in `jurisdictions/<code>.md`.

```markdown
# SKILL.md (abstract)
## Red Flags — STOP and Ask the User

The agent MUST stop before drafting if any of the following applies:

- A mandatory context field is missing or fabricated
- The purpose of the document is ambiguous or multi-valued
- A statutory or contractual deadline cannot be cited with a concrete basis
- The counterparty address or identity cannot be verified
- The user is requesting language that could create criminal exposure (threat, defamation)

For jurisdiction-specific red flags (e.g. merchant-to-merchant notice form, repealed
statutes, consumer-protection triggers), see the `Red Flags` section of
`jurisdictions/<code>.md`.
```

**Purpose:** A fixed control list against rationalizations such as "the user is in a hurry" or "details are not important." The list should be specific, not generic.

## Cross-Referencing Other Skills

Dependencies on another skill or core document should be declared in this format:

- ✅ `**REQUIRED SUB-SKILL:** skills/lawyer-context-manager/SKILL.md` — The agent MUST invoke and execute this skill as a dependency.
- ✅ `**REQUIRED BACKGROUND:** core/RISK-FRAMEWORK.md` — The agent MUST read and understand this document to ensure compliance.
- ✅ `**Related:** core/AGENTIC-VERIFICATION.md` — Informational link for context.
- ❌ `@skills/lawyer-context-manager/SKILL.md` — **FORBIDDEN:** `@` syntax force-loads files, consumes context budget, and causes instruction drift.
- ❌ "See Context Manager" — unclear whether required or optional

## General Anti-Patterns (Prohibited in All Skills)

- ❌ **Fabricated legal provisions** — generating non-existent law or article numbers
- ❌ **Jurisdiction leakage in SKILL.md** — embedding statute numbers, jurisdiction-specific output labels, or working-language prompt text in `SKILL.md` instead of `jurisdictions/<code>.md`
- ❌ **Mixing legal regimes** — producing a single document that pretends to satisfy two jurisdictions at once (e.g. a "KVKK + GDPR combined" privacy policy)
- ❌ **Ambiguous timing language** — using "as soon as possible" instead of a concrete deadline with a stated legal basis
- ❌ **Repealed-law citation** — citing superseded statutes or old article numbers
- ❌ **Legal jargon abuse** — making simple clauses unclear with unnecessary complexity
- ❌ **Cross-system term forcing** — using `liability`, `indemnification` without legal adaptation to the active jurisdiction
- ❌ **Workflow summary in `description`** — encourages shortcut reading and may bypass `SKILL.md`
- ❌ **Skipping HARD-GATE / SELF-TEST** — protocol must be fully applied regardless of risk level
- ❌ **Non-minimized data collection** — requesting more personal data than needed (data-minimization principle in the active jurisdiction)
- ❌ **Language drift** — output language must match the active jurisdiction's working language; mixed-language output is PROHIBITED
- ❌ **Hallucinated additions** — silently adding clauses the user did not request (extra penalty clause, waiver statement, etc.)

## Jurisdiction File Anatomy (`jurisdictions/<code>.md`)

The structure and rules for creating jurisdiction-specific files (the "Fuel") are comprehensively documented in **[`core/JURISDICTION-ANATOMY.md`](JURISDICTION-ANATOMY.md)**.

Every jurisdiction file MUST follow the guidelines defined there, including the Working Language Rule and the Fact-Check Protocol. The Guardian validator (`scripts/validate-skills.sh`) enforces the presence of specific headers defined in that document.

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
3. Create `skills/[skill-name]/SKILL.md` and fill in the frontmatter + 12 mandatory sections in **English, jurisdiction-agnostic**
4. If 🔴 High Risk, add the Red Flags section (abstract categories only)
5. Create jurisdiction files (`jurisdictions/tr.md`, etc.) using the Jurisdiction File Anatomy above — this is where statutes, working-language labels, and named-article SELF-TEST live
6. Apply pressure scenario testing
7. Open a PR
