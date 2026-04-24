---
name: review-contract
description: Review a contract for legal risks, missing clauses, and jurisdiction-specific issues. Invokes lawyer-context-manager then routes to contract-review.
---

Invoke the `lex-skill:lawyer-context-manager` skill and signal that the task
is a contract review.

Read `skills/lawyer-context-manager/SKILL.md`. After context collection and
jurisdiction resolution, the context manager will delegate to
`skills/contract-review/SKILL.md`. Both the pre-generation and post-generation
HARD-GATEs are mandatory for contract review (`risk_level: high`).
