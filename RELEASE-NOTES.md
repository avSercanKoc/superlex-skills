# Lex-Skill Release Notes

## v0.2.0 (2026-04-24) — Agentic Safety Hardening

This release significantly fortifies Lex-Skill against AI failure modes by integrating the "Superpowers" behavioral methodology. It transforms the library from a collection of templates into a self-regulating agentic framework.

### Highlights

- **"Superpowers" Methodology Integration:** Behavioral hardening via Rationalization Tables and "The Iron Law" of verification.
- **Reviewer Agent Ecosystem:** Dedicated subagent templates in `agents/` for specialized compliance and quality reviews.
- **Bootstrap Onboarding:** Added `using-lex-skill` to ensure agents learn the repository's "laws" immediately upon session start.
- **Enhanced Guardian:** Automated enforcement of the new safety structure (12 mandatory sections).
- **Synchronized Manifests:** Version 0.2.0 is now standard across package.json, Cursor, Claude, and Gemini manifests.

### Agentic Safety Protocols (Superpowers Method)

Recent updates have fortified Lex-Skill:
- **Rationalization Prevention Tables:** Added to the `Anti-Patterns` section of every skill to stop the agent from taking cognitive shortcuts.
- **The Iron Law (Verification-Before-Completion):** Integrated into `core/AGENTIC-VERIFICATION.md` to ensure the agent never claims success without fresh evidence.
- **Instruction Priority:** A strict hierarchy (User > Protocols > System Prompt) enforced globally.
- **XML Urgency Tags:** Use of `<EXTREMELY-IMPORTANT>` tags to bypass instruction decay.

## v0.1.0 (2026-04-23) — Initial Release

### Included Skills

- `using-lex-skill` (`output_type: context`, risk: low)
  - Bootstrap meta-skill for agent onboarding and rules.
- `lawyer-context-manager` (`output_type: context`, risk: low)
  - Session context collection
  - Jurisdiction routing
  - Portable snapshot import/export (`lex-snapshot-*.json`)
- `privacy-policy` (`tr`, `eu`; risk: medium)
- `contract-review` (`tr`; risk: high)
- `terms-of-use` (`tr`; risk: medium)
- `nda-generator` (`tr`; risk: medium)
- `legal-letter` (`tr`; risk: high)
- `specification-before-drafting` (`tr`; risk: low)
- `subagent-driven-development` (`tr`; risk: low)

### What "v0.1.0" Means

- **Stable baseline architecture** is now in place (`core/`, `skills/`,
  validator, plugin manifests).
- **Backward compatibility is not guaranteed yet** for prompt-level behavior,
  template wording, and some metadata fields while the library matures.
- **Semver policy starts now:** future breaking behavior changes should move
  to `v0.2.0`, `v1.0.0`, etc., with synchronized version bumps across:
  - `package.json`
  - `.cursor-plugin/plugin.json`
  - `.claude-plugin/plugin.json`
  - `.claude-plugin/marketplace.json` (`plugins[0].version`)
  - `gemini-extension.json`

### Release Governance

- `CHANGELOG.md` tracks cumulative project history.
- This file (`RELEASE-NOTES.md`) communicates release-level narrative and
  operator-facing impact.
- `.version-bump.json` defines the single source of truth for synchronized
  version fields across all plugin manifests.

### Known Scope Limits in v0.1.0

- Jurisdiction coverage is intentionally limited (TR-first, EU only where
  explicitly provided).
- No automated version bump script is shipped yet; version updates are
  controlled manually using `.version-bump.json` as the checklist contract.
- CI wiring for Guardian is repository-dependent and should be configured by
  each downstream integrator.
