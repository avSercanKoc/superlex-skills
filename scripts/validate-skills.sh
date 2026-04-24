#!/usr/bin/env bash
# validate-skills.sh — Lex-Skill "Guardian"
#
# Purpose:
#   Enforces core/SKILL-ANATOMY.md on every skill. Run in CI and before every PR.
#
# Checks per skill (skills/<name>/):
#   1.  SKILL.md exists.
#   2.  YAML frontmatter is present, <= 1024 characters, and contains the 6 required keys.
#   3.  frontmatter `name` matches the folder name (kebab-case).
#   4.  `description` starts with "Use when" and is <= 500 characters.
#   5.  `risk_level` is one of {low, medium, high}.
#   6.  `output_type` is one of {document, analysis, draft-with-checklist, context}.
#   7.  The 12 mandatory top-level section headers are present, in order.
#   8.  At least one <HARD-GATE ...> block exists.
#   9.  If risk_level=high, BOTH phase="pre-generation" AND phase="post-generation" HARD-GATEs exist.
#   10. A <SELF-TEST> block exists.
#   11. No jurisdiction leakage in SKILL.md body.
#   12. No force-load leakage (@skills/ or @core/) in SKILL.md body.
#   13. jurisdictions/ directory exists.
#   14. Every code in frontmatter jurisdiction: array has a matching jurisdictions/<code>.md file.
#   14. Each jurisdictions/<code>.md declares the expected template sections
#       (Output Template, Post-Generation HARD-GATE Template, Jurisdiction-Specific Anti-Patterns,
#        Jurisdiction-Specific SELF-TEST, Legal References).
#
# Usage:
#   scripts/validate-skills.sh                 # validate every skill
#   scripts/validate-skills.sh skills/privacy-policy
#   scripts/validate-skills.sh --strict        # fail on warnings too
#
# Exit codes:
#   0 — all skills pass
#   1 — at least one skill has an error
#   2 — invocation error (bad arguments, missing dependencies)

set -u
# Note: we intentionally do NOT use `set -e`. We want to collect every failure
# from every skill, not stop on the first grep that returns 1.

# ---------- config ----------------------------------------------------------

MANDATORY_SECTIONS=(
  "Overview"
  "Instruction Priority"
  "When to Use"
  "Jurisdiction Configuration"
  "Context Requirements"
  "Process Flow"
  "Output Specification"
  "Risk Zones"
  "Agentic Verification Gate"
  "Anti-Patterns"
  "Fact-Check Protocol"
  "Legal References"
)

# Named TR statutes / institutions that must not leak into SKILL.md bodies.
# Accepted inside the `description:` frontmatter line and the "When to Use" section
# (multilingual discoverability keywords, per SKILL-ANATOMY.md).
LEAK_PATTERN='\b(TBK|TTK|KVKK|HMK|TKHK|TCK|GDPR|DSA|Türk Hukuku|Yargıtay|İstanbul|MERSİS|UETS)\b'

JURISDICTION_TEMPLATE_SECTIONS=(
  "Output Template"
  "Post-Generation HARD-GATE Template"
  "Jurisdiction-Specific Anti-Patterns"
  "Jurisdiction-Specific SELF-TEST"
  "Legal References"
)

VALID_RISK_LEVELS="low medium high"
VALID_OUTPUT_TYPES="document analysis draft-with-checklist context"

# ---------- colours ---------------------------------------------------------

if [ -t 1 ] && command -v tput >/dev/null 2>&1 && [ "$(tput colors 2>/dev/null || echo 0)" -ge 8 ]; then
  C_RED=$(tput setaf 1); C_GREEN=$(tput setaf 2); C_YELLOW=$(tput setaf 3)
  C_BLUE=$(tput setaf 4); C_DIM=$(tput dim); C_BOLD=$(tput bold); C_RESET=$(tput sgr0)
else
  C_RED=""; C_GREEN=""; C_YELLOW=""; C_BLUE=""; C_DIM=""; C_BOLD=""; C_RESET=""
fi

# ---------- state -----------------------------------------------------------

ERRORS=0
WARNINGS=0
SKILLS_CHECKED=0
SKILLS_FAILED=0
STRICT=0

CURRENT_SKILL=""
CURRENT_ERRORS=0
CURRENT_WARNINGS=0

# ---------- reporting helpers ----------------------------------------------

err()  { printf "  %s✗%s %s\n" "$C_RED"    "$C_RESET" "$*"; ERRORS=$((ERRORS+1)); CURRENT_ERRORS=$((CURRENT_ERRORS+1)); }
warn() { printf "  %s!%s %s\n" "$C_YELLOW" "$C_RESET" "$*"; WARNINGS=$((WARNINGS+1)); CURRENT_WARNINGS=$((CURRENT_WARNINGS+1)); }
ok()   { printf "  %s✓%s %s\n" "$C_GREEN"  "$C_RESET" "$*"; }
note() { printf "  %s·%s %s\n" "$C_DIM"    "$C_RESET" "$*"; }

heading() {
  printf "\n%s▸ %s%s%s\n" "$C_BOLD" "$1" "$C_RESET" ""
}

# ---------- argv ------------------------------------------------------------

TARGETS=()
while [ $# -gt 0 ]; do
  case "$1" in
    --strict) STRICT=1 ;;
    -h|--help)
      sed -n '2,34p' "$0"
      exit 0
      ;;
    -*)
      printf "%sunknown flag:%s %s\n" "$C_RED" "$C_RESET" "$1" >&2
      exit 2
      ;;
    *)
      TARGETS+=("$1")
      ;;
  esac
  shift
done

# ---------- locate repo root ------------------------------------------------

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT" || exit 2

if [ ! -d "skills" ]; then
  printf "%sno skills/ directory found at %s%s\n" "$C_RED" "$REPO_ROOT" "$C_RESET" >&2
  exit 2
fi

if [ ${#TARGETS[@]} -eq 0 ]; then
  for d in skills/*/; do
    TARGETS+=("${d%/}")
  done
fi

# ---------- low-level extractors -------------------------------------------

# Prints the raw YAML frontmatter between the first two `---` lines.
extract_frontmatter() {
  awk '
    BEGIN { state = 0 }
    /^---[[:space:]]*$/ {
      state++
      if (state == 1) next
      if (state == 2) exit
    }
    state == 1 { print }
  ' "$1"
}

# Prints the SKILL.md body *after* the frontmatter.
extract_body() {
  awk '
    BEGIN { state = 0 }
    /^---[[:space:]]*$/ {
      state++
      next
    }
    state >= 2 { print }
  ' "$1"
}

# frontmatter_value <frontmatter-text> <key>
frontmatter_value() {
  printf "%s\n" "$1" | awk -v k="$2" '
    $0 ~ "^" k ":" {
      sub("^" k ":[[:space:]]*", "")
      gsub(/^"|"$/, "")
      gsub(/^\x27|\x27$/, "")
      print
      exit
    }
  '
}

# byte length, POSIX
byte_len() {
  printf "%s" "$1" | wc -c | tr -d ' '
}

# ---------- per-skill checks -----------------------------------------------

check_frontmatter() {
  local file="$1"
  local fm
  fm="$(extract_frontmatter "$file")"

  if [ -z "$fm" ]; then
    err "no YAML frontmatter between --- markers"
    return
  fi

  local fm_bytes
  fm_bytes=$(byte_len "$fm")
  if [ "$fm_bytes" -gt 1024 ]; then
    err "frontmatter is $fm_bytes bytes — must be <= 1024 (agentskills spec)"
  fi

  local key val
  for key in name description version jurisdiction output_type risk_level; do
    val="$(frontmatter_value "$fm" "$key")"
    if [ -z "$val" ]; then
      err "frontmatter is missing required key: $key"
    fi
  done

  # name must equal folder name
  local folder_name
  folder_name="$(basename "$(dirname "$file")")"
  local fm_name
  fm_name="$(frontmatter_value "$fm" "name")"
  if [ -n "$fm_name" ] && [ "$fm_name" != "$folder_name" ]; then
    err "frontmatter name '$fm_name' does not match folder '$folder_name'"
  fi
  if [ -n "$fm_name" ] && ! printf "%s" "$fm_name" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$'; then
    err "frontmatter name '$fm_name' is not kebab-case"
  fi

  # description rule
  local fm_desc
  fm_desc="$(frontmatter_value "$fm" "description")"
  if [ -n "$fm_desc" ]; then
    if ! printf "%s" "$fm_desc" | grep -qi '^use when'; then
      err "description must start with \"Use when ...\""
    fi
    local desc_bytes
    desc_bytes=$(byte_len "$fm_desc")
    if [ "$desc_bytes" -gt 500 ]; then
      warn "description is $desc_bytes bytes — try to stay under 500"
    fi
  fi

  # risk_level
  local fm_risk
  fm_risk="$(frontmatter_value "$fm" "risk_level")"
  if [ -n "$fm_risk" ] && ! printf " %s " "$VALID_RISK_LEVELS" | grep -q " $fm_risk "; then
    err "risk_level '$fm_risk' — must be one of: $VALID_RISK_LEVELS"
  fi

  # output_type
  local fm_otype
  fm_otype="$(frontmatter_value "$fm" "output_type")"
  if [ -n "$fm_otype" ] && ! printf " %s " "$VALID_OUTPUT_TYPES" | grep -q " $fm_otype "; then
    err "output_type '$fm_otype' — must be one of: $VALID_OUTPUT_TYPES"
  fi

  # version semver-lite
  local fm_ver
  fm_ver="$(frontmatter_value "$fm" "version")"
  if [ -n "$fm_ver" ] && ! printf "%s" "$fm_ver" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
    warn "version '$fm_ver' is not semver x.y.z"
  fi
}

check_mandatory_sections() {
  local file="$1"
  local body
  body="$(extract_body "$file")"
  if [ -z "$body" ]; then
    err "SKILL.md body is empty after frontmatter"
    return
  fi

  # Find line numbers for every `## X` header that matches a mandatory section.
  local section line_no prev_line_no=0 prev_section=""
  for section in "${MANDATORY_SECTIONS[@]}"; do
    # grep for `^## <section>` allowing a trailing space / "(..." qualifier.
    line_no=$(printf "%s\n" "$body" | grep -nE "^## ${section}([[:space:]]|$|\()" | head -n1 | cut -d: -f1)
    if [ -z "$line_no" ]; then
      err "missing mandatory section: ## $section"
      continue
    fi
    if [ "$line_no" -lt "$prev_line_no" ]; then
      err "section '## $section' appears before '## $prev_section' — order is fixed"
    fi
    prev_line_no="$line_no"
    prev_section="$section"
  done

  # Special check for Rationalization (Self-Correction) table under Anti-Patterns
  if ! printf "%s\n" "$body" | grep -qiE "Rationalization \(Self-Correction\)"; then
    err "missing mandatory 'Rationalization (Self-Correction)' table header in Anti-Patterns"
  fi
}

check_hard_gate_and_self_test() {
  local file="$1"
  local fm_risk
  fm_risk="$(frontmatter_value "$(extract_frontmatter "$file")" "risk_level")"

  local body
  body="$(extract_body "$file")"

  local hg_count
  hg_count=$(printf "%s\n" "$body" | grep -cE '<HARD-GATE([[:space:]]|>)')
  if [ "$hg_count" -lt 1 ]; then
    err "no <HARD-GATE ...> block found"
  fi

  local has_post has_pre
  has_post=$(printf "%s\n" "$body" | grep -cE '<HARD-GATE[^>]*phase=("|\x27)post-generation("|\x27)')
  has_pre=$(printf "%s\n"  "$body" | grep -cE '<HARD-GATE[^>]*phase=("|\x27)pre-generation("|\x27)')

  if [ "$has_post" -lt 1 ]; then
    err "no post-generation HARD-GATE (phase=\"post-generation\") found"
  fi

  if [ "$fm_risk" = "high" ] && [ "$has_pre" -lt 1 ]; then
    err "risk_level=high requires a pre-generation HARD-GATE (phase=\"pre-generation\")"
  fi

  if ! printf "%s\n" "$body" | grep -q '<SELF-TEST>'; then
    err "no <SELF-TEST> block found"
  fi

  # QE Motto checks (v0.2.0 Hardening)
  if ! printf "%s\n" "$body" | grep -qi "Violating the letter of the rules is violating the spirit of the rules"; then
    warn "missing 'Spirit vs Letter' motto in HARD-GATE blocks"
  fi

  if ! printf "%s\n" "$body" | grep -qi "Do Not Trust the Report"; then
    warn "missing 'Do Not Trust the Report' skepticism warning in SELF-TEST"
  fi

  # Must mention loading jurisdictions/<code>.md at least once in the body.
  if ! printf "%s\n" "$body" | grep -Eq 'jurisdictions/(<code>|\[?selected\]?|[a-z]{2})\.md'; then
    err 'no reference to jurisdictions/<code>.md in SKILL.md body'
  fi

  # Disclaimer hook, unless output_type=context (the context skill produces no document).
  local fm_otype
  fm_otype="$(frontmatter_value "$(extract_frontmatter "$file")" "output_type")"
  if [ "$fm_otype" != "context" ]; then
    if ! printf "%s\n" "$body" | grep -Eq 'core/DISCLAIMER\.md'; then
      warn "no reference to core/DISCLAIMER.md — skill anatomy requires the disclaimer hook"
    fi
  fi
}

check_no_jurisdiction_leakage() {
  local file="$1"
  # Build a body that excludes the "## When to Use" section (discoverability keywords allowed there).
  local filtered
  filtered="$(extract_body "$file" | awk '
    BEGIN { skip = 0 }
    /^## When to Use[[:space:]]*$/  { skip = 1; next }
    /^## / && skip                  { skip = 0 }
    skip == 0                       { print }
  ')"

  local hits
  hits=$(printf "%s\n" "$filtered" | grep -nE "$LEAK_PATTERN" || true)
  if [ -n "$hits" ]; then
    err "jurisdiction leakage — named statutes / locations must live in jurisdictions/<code>.md:"
    # show the first 3 offending lines for context
    printf "%s\n" "$hits" | head -n 3 | while IFS= read -r ln; do
      note "$ln"
    done
  fi
}

check_no_force_load_leakage() {
  local file="$1"
  local body
  body="$(extract_body "$file")"
  
  if printf "%s\n" "$body" | grep -qE '@(skills|core)/'; then
    err "force-load leakage — do not use @skills/ or @core/ syntax in SKILL.md. Use **REQUIRED SUB-SKILL:** or **REQUIRED BACKGROUND:** instead."
  fi
}

check_jurisdiction_files() {
  local skill_dir="$1"
  local file="$skill_dir/SKILL.md"
  local jdir="$skill_dir/jurisdictions"

  if [ ! -d "$jdir" ]; then
    err "missing jurisdictions/ directory"
    return
  fi

  # Parse the frontmatter jurisdiction array — accept either JSON-flow ["tr","eu"] or YAML block.
  local fm
  fm="$(extract_frontmatter "$file")"
  local raw
  raw="$(frontmatter_value "$fm" "jurisdiction")"
  local codes
  codes="$(printf "%s" "$raw" | tr -d '[]" ' | tr ',' ' ' | tr -s ' ')"

  if [ -z "$codes" ]; then
    err "frontmatter jurisdiction is empty"
    return
  fi

  local fm_otype
  fm_otype="$(frontmatter_value "$fm" "output_type")"

  for code in $codes; do
    local jfile="$jdir/$code.md"
    if [ ! -f "$jfile" ]; then
      err "frontmatter declares jurisdiction='$code' but $jfile is missing"
      continue
    fi
    check_single_jurisdiction_file "$jfile" "$code" "$fm_otype"
  done

  # Warn if there are jurisdiction files not declared in frontmatter.
  local existing
  for jfile in "$jdir"/*.md; do
    [ -f "$jfile" ] || continue
    existing="$(basename "$jfile" .md)"
    if ! printf " %s " "$codes" | grep -q " $existing "; then
      warn "file $jfile exists but '$existing' is not declared in frontmatter jurisdiction:"
    fi
  done
}

check_single_jurisdiction_file() {
  local jfile="$1"
  local code="$2"
  local otype="${3:-}"
  local missing=0

  for section in "${JURISDICTION_TEMPLATE_SECTIONS[@]}"; do
    # Meta-skills (output_type=context) don't produce a document, so the
    # "Output Template" section is not required; a "Summary Template" section
    # is used instead.
    if [ "$otype" = "context" ] && [ "$section" = "Output Template" ]; then
      continue
    fi
    if ! grep -qE "^##[[:space:]]+${section}" "$jfile"; then
      warn "jurisdictions/$code.md is missing template section: ## $section"
      missing=$((missing+1))
    fi
  done

  if [ "$missing" -eq 0 ]; then
    ok "jurisdictions/$code.md — all template sections present"
  fi

  # Header line should identify the jurisdiction — light check.
  if ! head -n 3 "$jfile" | grep -Eq '^#[^#]'; then
    warn "jurisdictions/$code.md does not start with a top-level H1 header"
  fi
}

# ---------- main loop -------------------------------------------------------

printf "%sLex-Skill Guardian%s — validating %s skill(s) against core/SKILL-ANATOMY.md & JURISDICTION-ANATOMY.md\n" \
  "$C_BOLD" "$C_RESET" "${#TARGETS[@]}"

for target in "${TARGETS[@]}"; do
  # normalise: allow `skills/foo`, `skills/foo/`, or `foo`
  target="${target%/}"
  if [ ! -d "$target" ] && [ -d "skills/$target" ]; then
    target="skills/$target"
  fi

  SKILL_FILE="$target/SKILL.md"
  SKILLS_CHECKED=$((SKILLS_CHECKED+1))
  CURRENT_SKILL="$target"
  CURRENT_ERRORS=0
  CURRENT_WARNINGS=0

  heading "$target"

  if [ ! -f "$SKILL_FILE" ]; then
    err "$SKILL_FILE does not exist"
    SKILLS_FAILED=$((SKILLS_FAILED+1))
    continue
  fi

  check_frontmatter              "$SKILL_FILE"
  check_mandatory_sections       "$SKILL_FILE"
  check_hard_gate_and_self_test  "$SKILL_FILE"
  check_no_jurisdiction_leakage  "$SKILL_FILE"
  check_no_force_load_leakage   "$SKILL_FILE"
  check_jurisdiction_files       "$target"

  if [ "$CURRENT_ERRORS" -eq 0 ] && [ "$CURRENT_WARNINGS" -eq 0 ]; then
    ok "all checks passed"
  elif [ "$CURRENT_ERRORS" -eq 0 ]; then
    ok "no errors ($CURRENT_WARNINGS warning(s))"
  else
    SKILLS_FAILED=$((SKILLS_FAILED+1))
  fi
done

# ---------- summary ---------------------------------------------------------

printf "\n%s──────── summary ────────%s\n" "$C_BOLD" "$C_RESET"
printf "  skills checked : %d\n" "$SKILLS_CHECKED"
printf "  skills failed  : %s%d%s\n" "$( [ "$SKILLS_FAILED" -gt 0 ] && echo "$C_RED" || echo "$C_GREEN" )" "$SKILLS_FAILED" "$C_RESET"
printf "  errors         : %s%d%s\n" "$( [ "$ERRORS" -gt 0 ] && echo "$C_RED" || echo "$C_GREEN" )" "$ERRORS" "$C_RESET"
printf "  warnings       : %s%d%s\n" "$( [ "$WARNINGS" -gt 0 ] && echo "$C_YELLOW" || echo "$C_GREEN" )" "$WARNINGS" "$C_RESET"

if [ "$ERRORS" -gt 0 ]; then
  exit 1
fi
if [ "$STRICT" -eq 1 ] && [ "$WARNINGS" -gt 0 ]; then
  printf "\n%s--strict: treating %d warning(s) as failure%s\n" "$C_YELLOW" "$WARNINGS" "$C_RESET"
  exit 1
fi
exit 0
