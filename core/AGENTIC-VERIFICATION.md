# Agentic Verification Protocol

## Purpose

A mandatory post-generation validation protocol that the agent MUST apply after producing a document and before delivering it.

## Scope

This protocol is applied progressively based on the risk levels defined in `core/RISK-FRAMEWORK.md`:

- **🟢 Low Risk:** Only **Step 1 (Fact-Check Protocol)** is mandatory. Steps 2-4 may be skipped.
- **🟡 Medium Risk:** **All steps (1-4) are mandatory.**
- **🔴 High Risk:** **All steps (1-4) are mandatory;** additionally, a pre-generation `<HARD-GATE>` check is required (see `core/RISK-FRAMEWORK.md`).

## Why It Is Required

- To catch agent hallucinations at the final stage
- To prevent legal errors from reaching the user
- To proactively inform users about high-risk clauses
- To establish a culture of "active verification" instead of blind trust

## Protocol Steps

### Step 1: Run the Fact-Check Protocol

Complete the checklist in each skill's `<SELF-TEST>` block:

```
<SELF-TEST>
Before delivering the output, the agent must complete these checks:
- [ ] Are all cited legal provisions real and accurate?
- [ ] Are legal terms used in the correct context?
- [ ] Are dates and time periods consistent?
- [ ] [Skill-specific checks]
</SELF-TEST>
```

If any check fails: **STOP, fix it, and re-check.**

### Step 2: Perform Risk Scanning

Identify the top 3-5 highest-risk clauses in the generated document:
- Clauses with the most severe legal consequences
- Phrases most likely to be misunderstood
- Sections that require sector/situation-specific customization

### Step 3: Ask the User an Active Confirmation Question

```
"The following clauses in this document are the highest-risk sections:
1. [Clause X] - Risk: [explanation] -> 💡 Alternative: [safer text]
2. [Clause Y] - Risk: [explanation] -> 💡 Alternative: [safer text]
3. [Clause Z] - Risk: [explanation] -> 💡 Alternative: [safer text]

Have you reviewed these sections for your specific situation?
Would you like to apply the suggested alternatives?"
```

### Step 4: User Approval

- The document is NOT considered complete until the user approves
- This is enforced via the `<HARD-GATE>` mechanism
- The agent cannot proceed to the next step without approval

## Mandatory Rules for the Agent

1. **No skipping** - No step in this protocol may be skipped.
2. **Order is mandatory** - Steps must be applied in sequence.
3. **Honesty** - The agent must not present undetected risks as "no risk."
4. **Proactivity** - The agent must flag risky clauses even if the user does not ask.
