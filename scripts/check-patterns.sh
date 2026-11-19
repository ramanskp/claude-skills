#!/usr/bin/env bash
# Validates the pattern library:
#  1. Every path listed in INDEX.md exists.
#  2. Every pattern file (except styles/) has all template headings, in order.
#  3. Every style preset has the style headings, in order.
#  4. Every pattern file on disk is listed in INDEX.md.
#  5. Relative markdown links between patterns resolve.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
P="$ROOT/plugins/ui-ux/skills/ui-ux/references/patterns"
fail=0
err() { echo "  ✗ $*"; fail=1; }

PATTERN_HEADINGS=("## When to use" "## When NOT to use" "## Anatomy" "## Required states" \
  "## Behavior & responsive" "## Accessibility" "## Do & Don't" "## Anti-patterns" "## Related patterns")
STYLE_HEADINGS=("## Intent" "## Token overrides" "## Component adjustments" \
  "## Accessibility guardrails" "## Do & Don't" "## Pairs well with")

check_order() { # file, headings...
  local f="$1"; shift; local last=0 h n
  for h in "$@"; do
    n=$(grep -nxF -- "$h" "$f" | head -1 | cut -d: -f1 || true)
    if [[ -z "$n" ]]; then err "${f#$P/}: missing '$h'"
    elif (( n < last )); then err "${f#$P/}: '$h' out of order"
    else last=$n; fi
  done
}

echo "1. INDEX paths exist"
indexed=$(grep -oE '`[a-z-]+/[a-z-]+\.md`' "$P/INDEX.md" | tr -d '`' | sort -u)
for rel in $indexed; do [[ -f "$P/$rel" ]] || err "INDEX lists missing file: $rel"; done

echo "2–3. Headings"
while IFS= read -r f; do
  if [[ "$f" == */styles/* ]]; then check_order "$f" "${STYLE_HEADINGS[@]}"
  else check_order "$f" "${PATTERN_HEADINGS[@]}"; fi
done < <(find "$P" -mindepth 2 -name '*.md' | sort)

echo "4. Files on disk are indexed"
while IFS= read -r f; do
  rel="${f#$P/}"; grep -qxF "$rel" <<<"$indexed" || err "not in INDEX.md: $rel"
done < <(find "$P" -mindepth 2 -name '*.md' | sort)

echo "5. Relative links resolve"
while IFS= read -r f; do
  dir=$(dirname "$f")
  for link in $(grep -oE '\]\(\.\.?/[^)#]+\.md' "$f" | sed 's/](//' || true); do
    [[ -f "$dir/$link" ]] || err "${f#$P/}: broken link $link"
  done
done < <(find "$P" -name '*.md' ! -name '_TEMPLATE.md' | sort)

if (( fail )); then echo "FAILED"; exit 1; else echo "All checks passed ($(wc -l <<<"$indexed" | tr -d ' ') patterns)"; fi
