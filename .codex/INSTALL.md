# Installing SuperLex Skills for Codex

Enable SuperLex Skills's legal engineering workflows in Codex via native skill discovery.

## Installation

1. **Clone the SuperLex Skills repository:**

   ```bash
   git clone https://github.com/avSercanKoc/superlex-skills.git ~/.codex/superlex-skills
   ```

2. **Create the skills symlink:**

   ```bash
   mkdir -p ~/.agents/skills
   ln -s ~/.codex/superlex-skills/skills ~/.agents/skills/superlex-skills
   ```

   **Windows (PowerShell):**

   ```powershell
   New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.agents\skills"
   cmd /c mklink /J "$env:USERPROFILE\.agents\skills\superlex-skills" "$env:USERPROFILE\.codex\superlex-skills\skills"
   ```

3. **Restart Codex** to discover the skills.

## Verify

```bash
ls -la ~/.agents/skills/superlex-skills
```

You should see a symlink pointing to your SuperLex Skills skills directory.

## Updating

```bash
cd ~/.codex/superlex-skills && git pull
```

## Uninstalling

```bash
rm ~/.agents/skills/superlex-skills
```

Optionally delete the clone: `rm -rf ~/.codex/superlex-skills`.
