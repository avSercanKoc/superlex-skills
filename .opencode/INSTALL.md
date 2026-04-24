# Installing Lex-Skill for OpenCode

Lex-Skill is fully compatible with OpenCode's native skill discovery and plugin system.

## Prerequisites

- [OpenCode.ai](https://opencode.ai) installed

## Installation

Add Lex-Skill to the `plugin` array in your `opencode.json` (global or project-level):

```json
{
  "plugin": ["lex-skill@git+https://github.com/[username]/lex-skill.git"]
}
```

Replace `[username]` with your GitHub username.

Restart OpenCode. The plugin will automatically register the `lawyer-context-manager` and all specialized legal skills.

## Usage

Use OpenCode's native `skill` tool:

```
use skill tool to list skills
use skill tool to load lex-skill/lawyer-context-manager
```

Lex-Skill enforces a **Lawyer-in-the-loop** workflow. It will automatically trigger its `<HARD-GATE>` risk summaries during generation.

## Updating

Lex-Skill updates automatically when you restart OpenCode. To pin a specific version (e.g., v0.1.0):

```json
{
  "plugin": ["lex-skill@git+https://github.com/[username]/lex-skill.git#v0.1.0"]
}
```

## Getting Help

- Report issues: https://github.com/[username]/lex-skill/issues
- Full documentation: https://github.com/[username]/lex-skill/blob/main/README.md
