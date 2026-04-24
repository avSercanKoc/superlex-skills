# Changelog

## [0.2.0] - 2026-04-24

### Added
- **"Superpowers" Agentic Safety Protocols.**
  - **Rationalization Prevention Tables:** Every skill now includes a `Thought | Reality` table to counter cognitive biases and shortcut-taking.
  - **The Iron Law (Verification-Before-Completion):** Integrated into `core/AGENTIC-VERIFICATION.md`. Agents are forbidden from claiming success without fresh evidence.
  - **Explicit Instruction Priority:** Standardized hierarchy (User > Protocols > System Prompt) enforced globally via `scripts/validate-skills.sh`.
  - **XML Urgency Tags:** Use of `<EXTREMELY-IMPORTANT>` tags to bypass LLM instruction decay in critical safety paths.
- **`using-superlex-skills`** — Bootstrap meta-skill for agent orientation and rule onboarding.
- **`writing-superlex-skills`** — TDD-based meta-skill for authoring, pressure-testing, and contributing new legal skills. Adapts Superpowers `writing-skills` methodology to the legal domain.
- **Reviewer Agent Templates (`agents/`):** Dedicated persona templates for specialized subagents:
  - `legal-compliance-reviewer.md`
  - `jurisdiction-reviewer.md`
  - `language-consistency-reviewer.md`
- **lawyer-context-manager v0.3.0 — Portable Context Snapshots.**
  - Export frozen context to `lex-snapshot-*.json`.
  - Import and validate existing snapshots with summary preview.
- **`subagent-driven-development`** — Orchestration skill for multi-task legal work.
- **`specification-before-drafting`** — Design-first workflow for legal strategy.
- **Guardian Validator Updates:** Automated enforcement of Instruction Priority and Rationalization tables.
- **`tests/pressure-tests/`** — Behavioral test suite with 3 standard adversarial scenarios (rushed user, authority pressure, ambiguity pressure).
- **`.github/ISSUE_TEMPLATE/`** — Bug report, feature request, and jurisdiction request templates.
- **`.github/FUNDING.yml`** — GitHub Sponsors configuration.
- **`commands/`** — Slash commands: `draft-document`, `review-contract`, `validate-skills`.
- **`SECURITY.md`** — Responsible disclosure policy defining safety-gate bypass as a critical vulnerability.
- **`docs/pressure-tests/README.md`** — Index and conventions for session logs.

### Changed
- All skills refactored to v0.2.0: abstract jurisdiction-agnostic English `SKILL.md` + localized `jurisdictions/<code>.md`.
- `core/SKILL-ANATOMY.md` updated with the new 12-section mandatory structure.
- `hooks/session-start` hook now injects aggressive compliance rules via `<EXTREMELY-IMPORTANT>` tags.
- `hooks/pre-commit` added: Guardian validator runs on every commit via git hook.
- `hooks/run-hook.cmd` added: cross-platform polyglot wrapper for hook scripts (Windows + Unix).
- `hooks/hooks.json` and `hooks/hooks-cursor.json` added: platform-specific hook configuration for Claude Code and Cursor.

## [0.1.0] - 2026-04-23

### Added
- Initial release
- Core framework: DISCLAIMER, RISK-FRAMEWORK, AGENTIC-VERIFICATION, SKILL-ANATOMY
- lawyer-context-manager meta-skill
- privacy-policy skill (TR + EU jurisdictions)
- contract-review skill (TR jurisdiction)
- terms-of-use skill (TR jurisdiction)
- nda-generator skill (TR jurisdiction)
- legal-letter skill (TR jurisdiction)
