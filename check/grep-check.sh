#!/usr/bin/env bash
# Usage: ./check/grep-check.sh [path...]
# Exit 1 if banned visitor hedges appear outside allowlisted paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGETS=("${@:-.}")
ALLOW='(terms|privacy|legal|disclaimer|sources|methodology|research-method)'
FAIL=0
while IFS= read -r phrase; do
  [[ -z "$phrase" || "$phrase" =~ ^# ]] && continue
  while IFS= read -r hit; do
    [[ -z "$hit" ]] && continue
    if echo "$hit" | grep -Eiq "$ALLOW"; then
      continue
    fi
    echo "HEDGE: $hit"
    FAIL=1
  done < <(rg -n -i --hidden -g '!node_modules' -g '!.git' -g '!dist' -g '!check/banned-phrases.txt' -F "$phrase" "${TARGETS[@]}" 2>/dev/null || true)
done < "$ROOT/check/banned-phrases.txt"
if [[ "$FAIL" -ne 0 ]]; then
  echo "have-a-spine: banned hedges found in visitor-facing paths."
  exit 1
fi
echo "have-a-spine: clean"
