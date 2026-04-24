#!/usr/bin/env bash
#
# bump-version.sh — Lex-Skill Version Synchronizer
#
# Usage:
#   scripts/bump-version.sh <new-version>   Bump all declared files
#   scripts/bump-version.sh --check         Report current versions
#   scripts/bump-version.sh --audit         Scan repo for version drift
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFIG="$REPO_ROOT/.version-bump.json"

if [[ ! -f "$CONFIG" ]]; then
  echo "error: .version-bump.json not found at $CONFIG" >&2
  exit 1
fi

# Check for jq
if ! command -v jq >/dev/null 2>&1; then
  echo "error: 'jq' is required but not installed. Install with: brew install jq" >&2
  exit 1
fi

# --- helpers ---

read_json_field() {
  local file="$1" field="$2"
  local jq_path
  jq_path=$(echo "$field" | sed -E 's/\.([0-9]+)/[\1]/g' | sed 's/^/./' | sed 's/\.\././g')
  jq -r "$jq_path" "$file"
}

write_json_field() {
  local file="$1" field="$2" value="$3"
  local jq_path
  jq_path=$(echo "$field" | sed -E 's/\.([0-9]+)/[\1]/g' | sed 's/^/./' | sed 's/\.\././g')
  local tmp="${file}.tmp"
  jq "$jq_path = \"$value\"" "$file" > "$tmp" && mv "$tmp" "$file"
}

declared_files() {
  jq -r '.files[] | "\(.path)\t\(.field)"' "$CONFIG"
}

audit_excludes() {
  jq -r '.audit.exclude[]' "$CONFIG" 2>/dev/null
}

# --- commands ---

cmd_check() {
  local has_drift=0
  local versions=()

  echo "⚖️  Lex-Skill Version Check:"
  echo ""

  while IFS=$'\t' read -r path field; do
    local fullpath="$REPO_ROOT/$path"
    if [[ ! -f "$fullpath" ]]; then
      printf "  %-45s  MISSING\n" "$path"
      has_drift=1
      continue
    fi
    local ver
    ver=$(read_json_field "$fullpath" "$field")
    printf "  %-45s  %s\n" "$path ($field)" "$ver"
    versions+=("$ver")
  done < <(declared_files)

  echo ""

  local unique
  unique=$(printf '%s\n' "${versions[@]}" | sort -u | wc -l | tr -d ' ')
  if [[ "$unique" -gt 1 ]]; then
    echo "🚨 DRIFT DETECTED — versions are not in sync!"
    has_drift=1
  else
    echo "✅ All declared files are in sync at ${versions[0]}"
  fi

  return $has_drift
}

cmd_audit() {
  cmd_check || true
  echo ""

  local current_version
  current_version=$(
    while IFS=$'\t' read -r path field; do
      local fullpath="$REPO_ROOT/$path"
      [[ -f "$fullpath" ]] && read_json_field "$fullpath" "$field"
    done < <(declared_files) | sort | uniq -c | sort -rn | head -1 | awk '{print $2}'
  )

  echo "🔍 Audit: scanning for version string '$current_version'..."
  
  local -a exclude_args=("--exclude-dir=.git" "--exclude-dir=node_modules" "--binary-files=without-match")
  while IFS= read -r pattern; do
    exclude_args+=("--exclude=$pattern" "--exclude-dir=$pattern")
  done < <(audit_excludes)

  grep -rn "${exclude_args[@]}" -F "$current_version" "$REPO_ROOT" | grep -vE "$(jq -r '.files[].path' "$CONFIG" | tr '\n' '|' | sed 's/|$//')" || echo "No undeclared references found."
}

cmd_bump() {
  local new_version="$1"
  if ! echo "$new_version" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+'; then
    echo "error: '$new_version' must be X.Y.Z format" >&2
    exit 1
  fi

  echo "🚀 Bumping Lex-Skill to $new_version..."
  
  while IFS=$'\t' read -r path field; do
    local fullpath="$REPO_ROOT/$path"
    [[ ! -f "$fullpath" ]] && continue
    write_json_field "$fullpath" "$field" "$new_version"
    echo "  Updated $path"
  done < <(declared_files)

  echo "✅ Done. Remember to update CHANGELOG.md!"
}

# --- main ---

case "${1:-}" in
  --check) cmd_check ;;
  --audit) cmd_audit ;;
  --help|-h|"")
    echo "Usage: scripts/bump-version.sh <new-version> | --check | --audit"
    exit 0
    ;;
  *) cmd_bump "$1" ;;
esac
