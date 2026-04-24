# Installing SuperLex Skills for OpenCode

SuperLex Skills is fully compatible with OpenCode's native skill discovery and plugin system.

## Prerequisites

- [OpenCode.ai](https://opencode.ai) installed

## Installation

Add SuperLex Skills to the `plugin` array in your `opencode.json` (global or project-level):

```json
{
  "plugin": ["superlex-skills@git+https://github.com/avSercanKoc/superlex-skills.git"]
}
```

Replace `avSercanKoc` with your GitHub username.

Restart OpenCode. The plugin will automatically register the `lawyer-context-manager` and all specialized legal skills.

## Usage

Use OpenCode's native `skill` tool:

```
use skill tool to list skills
use skill tool to load superlex-skills/lawyer-context-manager
```

SuperLex Skills enforces a **Lawyer-in-the-loop** workflow. It will automatically trigger its `<HARD-GATE>` risk summaries during generation.

## Updating

SuperLex Skills updates automatically when you restart OpenCode. To pin a specific version (e.g., v0.1.0):

```json
{
  "plugin": ["superlex-skills@git+https://github.com/avSercanKoc/superlex-skills.git#v0.1.0"]
}
```

## Getting Help

- Report issues: <https://github.com/avSercanKoc/superlex-skills/issues>
- Full documentation: <https://github.com/avSercanKoc/superlex-skills/blob/main/README.md>
