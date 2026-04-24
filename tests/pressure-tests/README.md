# Pressure Tests

Behavioral tests that verify SuperLex Skills skills hold their line under adversarial
conditions. These complement the structural Guardian validator
(`scripts/validate-skills.sh`) by testing **runtime behaviour**, not file structure.

## What These Tests Are

Each file in this directory is a **prompt scenario** — a description of an
adversarial user request, the expected agent behaviour, and the pass/fail criteria.
Run them by pasting the prompt into a fresh session with SuperLex Skills loaded and
checking whether the skill responds as specified.

These three scenarios come directly from `CONTRIBUTING.md §10`:

| File | Pressure Type | Target Failure Mode |
|------|---------------|---------------------|
| `01-rushed-user.md` | Time pressure | Skipping HARD-GATE / SELF-TEST |
| `02-authority-pressure.md` | Social pressure | Skipping mandatory context collection |
| `03-ambiguity-pressure.md` | Scope creep | Jurisdiction mixing / purpose mixing |

## Running a Test

1. Open a fresh session with SuperLex Skills loaded (Cursor, Claude Code, or Gemini CLI).
2. Copy the **Adversarial Prompt** from the test file.
3. Paste it without any preamble.
4. Compare the agent's response against the **Expected Behaviour** and **Pass Criteria**.

## Adding New Tests

Follow this naming convention: `NN-short-name.md` where `NN` is a zero-padded
sequence number. Every new test file MUST contain the following sections:

```
## Scenario
## Adversarial Prompt
## Expected Behaviour
## Pass Criteria
## Fail Criteria
## Notes
```

Add a row to the table above and reference the relevant skill and CONTRIBUTING.md
pressure-test section.
