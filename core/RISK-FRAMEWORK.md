# Risk Level Framework

## Purpose

Defines the risk level of each skill in SuperLex Skills and specifies how the agent must behave at each level.

## Risk Levels

### 🟢 Low Risk

**Agent Behavior:** Operates with flexibility, provides guidance, but does not halt.

**Characteristics:**
- The document is not legally binding
- Incorrect output does not directly cause loss of rights
- Primarily informational in nature

**Example Skills:** cookie-policy

**Agent Instructions:**
1. Check context information
2. Generate the document
3. Run the Fact-Check Protocol
4. Add the disclaimer
5. Deliver

---

### 🟡 Medium Risk

**Agent Behavior:** Provides explanations and alternatives at every critical point.

**Characteristics:**
- The document may produce legal consequences
- Incorrect output can be corrected, but potentially at high cost
- Sector/situation-specific customization is critical

**Example Skills:** privacy-policy, nda-generator, terms-of-use

**Agent Instructions:**
1. Check context information (if missing, trigger `lawyer-context-manager`)
2. Generate the document
3. Provide explanations and alternatives at critical points
4. Run the Fact-Check Protocol
5. Agentic Verification - perform risk scanning and present findings to the user
6. Obtain user approval
7. Add the disclaimer
8. Deliver

---

### 🔴 High Risk

**Agent Behavior:** HARD-GATE - halts, asks for mandatory information, and does not continue without approval.

**Characteristics:**
- The document may directly initiate legal proceedings
- It may trigger legal deadlines
- It may be used as evidence in court
- Incorrect output may cause irreversible or hard-to-recover rights loss

**Example Skills:** legal-letter, contract-review

**Agent Instructions:**
1. Check context information (if missing, trigger `lawyer-context-manager`)
2. **<HARD-GATE>** - ask mandatory questions BEFORE generating the document
3. Collect all mandatory information; if information is missing, STOP - do not continue
4. Generate the document only after the user answers all required questions
5. Run the Fact-Check Protocol
6. Agentic Verification - perform risk scanning and present the highest-risk clauses
7. Obtain user approval
8. Add the disclaimer
9. Deliver

## Defining Risk Level in Skills

The `risk_level` field in YAML frontmatter is set according to this framework:

```yaml
risk_level: "low"    # 🟢
risk_level: "medium" # 🟡
risk_level: "high"   # 🔴
```

## General Safety Flow

```
Agent reads the skill
       ↓
[If 🔴 High Risk] -> HARD-GATE: Ask mandatory information -> Obtain approval
       ↓
Generate document
       ↓
Fact-Check Protocol (`<SELF-TEST>` block)
       ↓
Agentic Verification (present risk + alternatives to user)
       ↓
User approves -> Disclaimer added -> Deliver
```
