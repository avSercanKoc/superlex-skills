# Pressure Test Logs

This directory contains **records of adversarial pressure testing** run during
skill development — the evidence trail that a skill held its line before a PR
was opened.

Each file documents a session or batch of sessions where an AI agent was
subjected to adversarial prompts (urgency pressure, authority pressure,
ambiguity pressure) and the results were recorded.

## Relationship to `tests/pressure-tests/`

| Directory | Purpose |
|-----------|---------|
| `tests/pressure-tests/` | **Scenario definitions** — reusable prompts + pass/fail criteria |
| `docs/pressure-tests/` | **Session logs** — evidence that a specific skill passed those scenarios |

When you open a PR for a new skill or a modified skill, paste your pressure
test session transcripts (redacted of any real client data) here as
`YYYY-MM-DD-<skill-name>.md`.

## File Naming Convention

```
YYYY-MM-DD-<skill-name>[-optional-description].md
```

Examples:
- `2026-04-23-contract-review-tr.md`
- `2026-04-24-privacy-policy-eu-jurisdiction-addition.md`

## What to Include in a Log File

1. **Date and tester** (agent + platform + model)
2. **Skill and jurisdiction under test**
3. **Scenarios run** (reference the scenario number from `tests/pressure-tests/`)
4. **Transcript or summary** of each session (redacted of PII)
5. **Pass/Fail verdict** per scenario
6. **Notes** on any near-misses or adjustments made
