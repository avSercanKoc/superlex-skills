# Installing Lex-Skill for Codex

Enable Lex-Skill's legal engineering workflows in Codex via native skill discovery.

## Installation

1. **Clone the Lex-Skill repository:**
   ```bash
   git clone https://github.com/[username]/lex-skill.git ~/.codex/lex-skill
   ```

2. **Create the skills symlink:**
   ```bash
   mkdir -p ~/.agents/skills
   ln -s ~/.codex/lex-skill/skills ~/.agents/skills/lex-skill
   ```

   **Windows (PowerShell):**
   ```powershell
   New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.agents\skills"
   cmd /c mklink /J "$env:USERPROFILE\.agents\skills\lex-skill" "$env:USERPROFILE\.codex\lex-skill\skills"
   ```

3. **Restart Codex** to discover the skills.

## Verify

```bash
ls -la ~/.agents/skills/lex-skill
```

You should see a symlink pointing to your Lex-Skill skills directory.

## Updating

```bash
cd ~/.codex/lex-skill && git pull
```

## Uninstalling

```bash
rm ~/.agents/skills/lex-skill
```

Optionally delete the clone: `rm -rf ~/.codex/lex-skill`.
