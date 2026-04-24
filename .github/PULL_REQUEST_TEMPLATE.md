<!--
Read this template fully before submitting.
PRs with missing sections, placeholder answers, or unrelated bundled changes
may be closed without review.
-->

## Problem Statement

What concrete problem does this PR solve?

- What were you doing?
- What failed?
- Why is this a real contributor/user problem (not a theoretical one)?

## Scope of Change

What does this PR change (1-3 short bullets)?

- 
- 
- 

## Contribution Path

Select one:

- [ ] Path A: New jurisdiction for an existing skill
- [ ] Path B: New skill
- [ ] Path C: Fix/tune an existing skill
- [ ] Path D: Core/docs/tooling maintenance

## Core vs Jurisdiction Boundary Check

- [ ] I did not place statute numbers or jurisdiction-specific legal wording in `SKILL.md`.
- [ ] I kept concrete legal content inside `jurisdictions/<code>.md`.
- [ ] If I changed `SKILL.md`, changes are abstract and jurisdiction-agnostic.

## Validation Evidence

Paste command output snippets or summarize key lines:

- [ ] `npm run validate`
- [ ] `npm run validate:strict` (or warnings are explained below)

Warnings / exceptions (if any):

## Pressure Test Evidence (Required for skill behavior changes)

Document results for:

1. Rushed user pressure
2. Authority pressure
3. Ambiguity pressure

If not applicable, explain why.

## Human Review Gate

- [ ] A human reviewed the full diff before submission.

## Checklist

- [ ] `CHANGELOG.md` updated (if behavior/content/tooling changed).
- [ ] `RELEASE-NOTES.md` updated when release-level impact exists.
- [ ] `version` fields remain synchronized (`package.json`, plugin manifests, `gemini-extension.json`) when a version bump is part of this PR.
- [ ] No unrelated changes are bundled.
