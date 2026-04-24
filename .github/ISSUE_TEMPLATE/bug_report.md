---
name: Bug Report
about: A skill misbehaved, the Guardian gave a false positive/negative, or a safety gate failed
labels: bug
---

<!--
BEFORE FILING: Search open AND closed issues. If your issue already exists,
add a comment or reaction to the existing one instead of filing a duplicate.
-->

- [ ] I searched existing issues and this is not a duplicate

## Environment

| Field | Value |
|-------|-------|
| Lex-Skill version | |
| Platform (Cursor, Claude Code, Gemini CLI, etc.) | |
| Platform version | |
| Model | |
| OS + shell | |

## Is this a Lex-Skill issue or a platform issue?

<!--
Lex-Skill is a plugin. Some reported "bugs" are actually issues in the
underlying platform or model. If you're not sure, try reproducing without
Lex-Skill loaded.

If the problem persists without Lex-Skill, file the issue with your platform.
-->

- [ ] I confirmed this issue does not occur without Lex-Skill loaded

## Which skill or component is affected?

<!-- e.g. `skills/privacy-policy`, `scripts/validate-skills.sh`, `hooks/session-start` -->

## What happened?

<!-- Be specific. "It doesn't work" is not a bug report. -->

## Steps to reproduce

1.
2.
3.

## Expected behaviour

<!-- What should have happened? -->

## Actual behaviour

<!-- What happened instead? -->

## Did a safety gate fail?

<!--
If a HARD-GATE was bypassed, a SELF-TEST was skipped, a disclaimer was omitted,
or a jurisdiction was mixed — describe which gate failed and how.
These are the highest-priority bugs in the library.
-->

- [ ] A HARD-GATE was bypassed
- [ ] A SELF-TEST was skipped
- [ ] The disclaimer was omitted
- [ ] Jurisdiction mixing occurred in a single output document
- [ ] Not applicable — this is a structural / Guardian / hook bug

## Conversation transcript or debug log

<!--
A session transcript showing the failure is the single most helpful thing
you can include. Redact any client PII before sharing.
-->
