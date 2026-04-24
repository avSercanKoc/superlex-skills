# Security Policy

## Scope

SuperLex Skills is a plugin for AI coding agents — it contains skill definitions,
safety protocols, and process flows, not executable server code. The security
surface is therefore different from a typical software project.

**In scope:**
- Safety-gate bypasses: a skill configuration or prompt that systematically
  allows the agent to skip a HARD-GATE, SELF-TEST, or disclaimer
- Jurisdiction leakage: a SKILL.md change that causes the Guardian to miss
  a statute citation inside the engine body
- Hook injection: a crafted session-start hook payload that causes unintended
  agent behaviour or context pollution
- PII exposure: a skill template, example, or test fixture that captures or
  logs real personal data

**Out of scope:**
- General AI model behaviour (hallucinations, jailbreaks) — report these to
  the model provider
- Features you disagree with (open a Feature Request issue instead)
- Platform-level security issues (Cursor, Claude Code, Gemini CLI) — report
  these to the respective platforms

## Reporting a Vulnerability

**Please do not open a public GitHub issue for security vulnerabilities.**

If you find a safety-gate bypass, PII exposure, or hook injection issue:

1. Email the maintainer directly: **[security contact — update this address]**
2. Include in your report:
   - A description of the vulnerability
   - The specific file(s) and line(s) involved
   - Steps to reproduce (including which platform and model you used)
   - The potential impact (which safety guarantee is broken)

We will acknowledge your report within **48 hours** and aim to ship a fix or
mitigation within **7 days** for critical issues.

## What We Consider a Critical Issue

A **critical** security issue in SuperLex Skills is one that:
- Allows a HARD-GATE to be systematically bypassed without user awareness
- Causes the disclaimer to be omitted from a delivered legal document
- Allows jurisdiction mixing to produce a document claiming compliance with
  two legal regimes simultaneously
- Exposes real client PII via a committed fixture or template

These are the same conditions that would expose a lawyer's client to legal
harm — we treat them with corresponding urgency.

## Responsible Disclosure

We follow a **coordinated disclosure** model:

- You report privately → we fix → you can publish after the fix ships
- We credit reporters in the CHANGELOG unless you prefer anonymity
- We do not take legal action against good-faith security researchers

## Security Model Note

SuperLex Skills's safety model is designed around **human-in-the-loop** verification:
every high-risk output requires explicit user approval through a HARD-GATE before
delivery. No skill in this library should ever produce a binding legal document
without a human lawyer reviewing and approving the output. If you discover a
configuration that violates this principle, that is a critical issue.
