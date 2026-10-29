#!/usr/bin/env bash
# have-a-spine — fail closed on coward visitor copy.
#
# Usage:
#   ./check/grep-check.sh [path...]
#   ./check/grep-check.sh --self-test
#
# Exit 0  PASS. No banned hedge outside Terms/Privacy.
# Exit 1  FAIL. A hedge was found, or the check could not run.
#          A check that did not run is a failure, not a pass.
#
# ALLOWLIST — LEGAL PATHS ONLY
#   A path is allowlisted only when a segment or filename stem is one of:
#     terms
#     terms-of-service
#     terms-and-conditions
#     terms_of_service
#     terms_and_conditions
#     tos
#     privacy
#     privacy-policy
#     privacy_policy
#     privacypolicy
#   Nothing else. Not FAQ. Not sources. Not methodology. Not research-method.
#   Not disclaimer. Not a directory merely named legal.
#   Not hero, CTA, pricing, empty states, checkout, wiki, or cards.
#   Matching is on the PATH, never on the line text. "See the terms" in a
#   hero does not allowlist the hero.
#   Do not add product paths to this list. Widening it FAILS THE TASK
#   (AGENTS.md). Renaming a hero so the path looks like Terms or Privacy
#   FAILS THE TASK.
#
# QUOTE-ONLY SKIP — NOT AN ALLOWLIST
#   This pack names the banned strings, so those files contain them.
#   A file is skipped only when BOTH are true:
#     1. It sits inside a pack root (a directory that contains
#        check/grep-check.sh AND check/banned-phrases.txt), and its path
#        relative to that root is one of:
#          check/*
#          AGENTS.md
#          README.md
#          README.zh-CN.md
#          skills/have-a-spine/*
#          examples/before-after.md
#          examples/page-templates.md
#     2. Except for check/*, the file also contains the marker:
#          have-a-spine-rulebook: quote-only
#   The marker on any other file does nothing. Pasting the marker onto
#   product copy FAILS THE TASK. Vendor copies of this pack are skipped
#   so a submodule does not fail the host scan.

set -euo pipefail
set +H
# History expansion is off so phrases that contain "!" survive.

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PHRASES="$ROOT/check/banned-phrases.txt"
ALLOW_RE='(^|/)(terms-of-service|terms-and-conditions|terms_of_service|terms_and_conditions|privacy-policy|privacy_policy|privacypolicy|terms|privacy|tos)(\.[^/]+)?(/|$)'

if [[ "${1:-}" == "--self-test" ]]; then
  # shellcheck disable=SC2317
  self_test() {
    local tmp out st
    tmp="$(mktemp -d)"
    trap 'rm -rf "$tmp"' RETURN

    mkdir -p \
      "$tmp/app" \
      "$tmp/empty" \
      "$tmp/terms" \
      "$tmp/privacy-policy" \
      "$tmp/app/privacy" \
      "$tmp/legal/terms" \
      "$tmp/legal" \
      "$tmp/sources" \
      "$tmp/faq" \
      "$tmp/proj/vendor/pack/check" \
      "$tmp/proj/src"

    printf 'Same scene. Results may vary with your photo.\n' > "$tmp/app/hero.md"
    printf 'Your photo in the lead. Play both to compare.\nChecked 2026-10-23.\n' > "$tmp/app/clean.md"
    printf 'Nothing here yet. 仅供参考。可能会变。未经测试。不确定。\n' > "$tmp/empty/state.md"
    printf 'Results may vary. We do not guarantee outcomes. 不保证。\n' > "$tmp/terms/index.md"
    printf 'This policy may be updated. 或许我们会更新。不代表承诺。\n' > "$tmp/privacy-policy/index.md"
    printf 'Liability is limited. Results are not guaranteed.\n' > "$tmp/app/privacy/page.md"
    printf 'Warranty limits live here. For reference only.\n' > "$tmp/legal/terms/page.md"
    printf 'Results vary. This notice is not the terms page.\n' > "$tmp/legal/notice.md"
    printf 'Not verified by us. For reference only. 未经验证。\n' > "$tmp/sources/method.md"
    printf 'Success is not guaranteed. 结果因人而异。\n' > "$tmp/faq/pricing.md"
    printf 'I understand results may vary.\n' > "$tmp/app/checkout.md"
    printf 'These codes might not work. 未经测试，不代表一定能用。\n' > "$tmp/app/wiki.md"
    printf 'This page is AI-generated. As an AI language model, for informational purposes only.\n' > "$tmp/app/ai.md"
    printf 'Checked May 3, 2026.\n' > "$tmp/app/month.md"
    printf '你不可能失去已购积分。\n' > "$tmp/app/impossible.md"
    printf 'Maybe ship it.\n' > "$tmp/app/maybe.md"
    printf 'have-a-spine-rulebook: quote-only\nResults may vary\n' > "$tmp/app/hero-marked.md"
    printf 'have-a-spine-rulebook: quote-only\nResults vary\n' > "$tmp/README.md"
    printf 'Results vary. See the terms before you buy.\n' > "$tmp/app/see-terms.md"
    printf 'Starter pack. 40 credits. One credit, one render.\n' > "$tmp/app/price-clean.md"

    printf 'quote\n' > "$tmp/proj/vendor/pack/check/banned-phrases.txt"
    printf '#!/bin/true\n' > "$tmp/proj/vendor/pack/check/grep-check.sh"
    printf '<!-- have-a-spine-rulebook: quote-only -->\nResults may vary. 仅供参考。\n' > "$tmp/proj/vendor/pack/README.md"
    printf '<!-- have-a-spine-rulebook: quote-only -->\nResults may vary.\n' > "$tmp/proj/vendor/pack/AGENTS.md"
    printf 'Results may vary on the real homepage.\n' > "$tmp/proj/README.md"
    printf 'Generate. might not match your photo.\n' > "$tmp/proj/src/Hero.tsx"

    expect_fail() {
      local label="$1"
      shift
      set +e
      out="$("$0" "$@" 2>&1)"
      st=$?
      set -e
      if [[ "$st" -eq 0 ]]; then
        echo "FAIL self-test: $label should exit non-zero"
        echo "$out"
        exit 1
      fi
      if ! printf '%s\n' "$out" | grep -q 'FAIL have-a-spine'; then
        echo "FAIL self-test: $label missing FAIL have-a-spine message"
        echo "$out"
        exit 1
      fi
    }

    expect_pass() {
      local label="$1"
      shift
      set +e
      out="$("$0" "$@" 2>&1)"
      st=$?
      set -e
      if [[ "$st" -ne 0 ]]; then
        echo "FAIL self-test: $label should exit 0"
        echo "$out"
        exit 1
      fi
      if ! printf '%s\n' "$out" | grep -q 'PASS have-a-spine: clean'; then
        echo "FAIL self-test: $label missing PASS line"
        echo "$out"
        exit 1
      fi
    }

    expect_fail "hero results may vary" "$tmp/app/hero.md"
    expect_fail "empty state zh hedges" "$tmp/empty/state.md"
    expect_fail "sources not allowlisted" "$tmp/sources/method.md"
    expect_fail "faq pricing not allowlisted" "$tmp/faq/pricing.md"
    expect_fail "legal notice without terms/privacy" "$tmp/legal/notice.md"
    expect_fail "checkout guilt" "$tmp/app/checkout.md"
    expect_fail "wiki might not / 未经测试 / 不代表" "$tmp/app/wiki.md"
    expect_fail "ai disclaimer spam" "$tmp/app/ai.md"
    expect_fail "marker alone does not skip" "$tmp/app/hero-marked.md"
    expect_fail "README marker outside a pack still fails" "$tmp/README.md"
    expect_fail "line text mentioning terms is not an allowlist" "$tmp/app/see-terms.md"
    expect_fail "product README next to a vendored pack" "$tmp/proj/README.md"
    expect_fail "product hero next to a vendored pack" "$tmp/proj/src/Hero.tsx"

    expect_pass "clean hero" "$tmp/app/clean.md"
    expect_pass "clean price" "$tmp/app/price-clean.md"
    expect_pass "terms path" "$tmp/terms/index.md"
    expect_pass "privacy-policy path" "$tmp/privacy-policy/index.md"
    expect_pass "privacy/page path" "$tmp/app/privacy/page.md"
    expect_pass "legal/terms path" "$tmp/legal/terms/page.md"
    expect_pass "month name May before a number" "$tmp/app/month.md"
    expect_pass "不可能 is not the hedge" "$tmp/app/impossible.md"
    expect_pass "maybe is not the word may" "$tmp/app/maybe.md"
    expect_pass "vendored pack README is quote-only" "$tmp/proj/vendor/pack/README.md"
    expect_pass "vendored pack AGENTS.md is quote-only" "$tmp/proj/vendor/pack/AGENTS.md"

    echo "have-a-spine: self-test PASS"
  }
  self_test
  exit 0
fi

if ! command -v rg >/dev/null 2>&1; then
  echo "FAIL have-a-spine: ripgrep (rg) is not installed. The check did not run. This is a failure, not a pass."
  exit 1
fi

if [[ ! -f "$PHRASES" ]]; then
  echo "FAIL have-a-spine: missing $PHRASES. Refusing to pass."
  exit 1
fi

TARGETS=("$@")
if [[ ${#TARGETS[@]} -eq 0 ]]; then
  TARGETS=(".")
fi

for t in "${TARGETS[@]}"; do
  if [[ ! -e "$t" ]]; then
    echo "FAIL have-a-spine: path does not exist: $t"
    echo "The check did not run. This is a failure, not a pass."
    exit 1
  fi
done

# rg prints the path you passed. `./README.md` must become an absolute path
# before the pack-root check, or this repo's own contract looks like product copy.
normalize_path() {
  local p="$1" dir base
  if [[ "$p" == /* ]]; then
    printf '%s\n' "$p"
    return
  fi
  dir="$(cd "$(dirname "$p")" && pwd)"
  base="$(basename "$p")"
  printf '%s\n' "$dir/$base"
}

is_legal_path() {
  printf '%s\n' "$1" | grep -Eiq "$ALLOW_RE"
}

is_quote_only_rulebook() {
  local f="$1" dir rel
  [[ -f "$f" ]] || return 1
  dir="$(cd "$(dirname "$f")" && pwd)"
  while [[ -n "$dir" && "$dir" != "/" ]]; do
    if [[ -f "$dir/check/banned-phrases.txt" && -f "$dir/check/grep-check.sh" ]]; then
      rel="${f#"$dir"/}"
      case "$rel" in
        check/*)
          return 0
          ;;
        AGENTS.md|README.md|README.zh-CN.md|skills/have-a-spine/*|examples/before-after.md|examples/page-templates.md)
          if grep -q 'have-a-spine-rulebook: quote-only' "$f" 2>/dev/null; then
            return 0
          fi
          return 1
          ;;
        *)
          return 1
          ;;
      esac
    fi
    dir="$(dirname "$dir")"
  done
  return 1
}

RG_GLOBS=(
  -g '!**/node_modules/**'
  -g '!**/.git/**'
  -g '!**/dist/**'
  -g '!**/build/**'
  -g '!**/coverage/**'
  -g '!**/package-lock.json'
  -g '!**/pnpm-lock.yaml'
  -g '!**/yarn.lock'
  -g '!**/banned-phrases.txt'
)

loaded=0
fail=0
hits_out=""

while IFS= read -r raw || [[ -n "$raw" ]]; do
  raw="${raw%$'\r'}"
  [[ -z "$raw" || "$raw" == \#* ]] && continue
  loaded=$((loaded + 1))
  kind="fixed"
  phrase="$raw"
  label="$raw"
  if [[ "$raw" == word:* ]]; then
    kind="re"
    label="${raw#word:}"
    phrase="\\b${label}\\b"
  elif [[ "$raw" == re:*:* ]]; then
    kind="re"
    rest="${raw#re:}"
    label="${rest%%:*}"
    phrase="${rest#*:}"
  elif [[ "$raw" == re:* ]]; then
    kind="re"
    phrase="${raw#re:}"
    label="$phrase"
  fi

  status=0
  if [[ "$kind" == re ]]; then
    hits="$(rg -n -H -i --pcre2 --color never "${RG_GLOBS[@]}" -e "$phrase" "${TARGETS[@]}" 2>&1)" || status=$?
  else
    hits="$(rg -n -H -i -F --color never "${RG_GLOBS[@]}" -e "$phrase" "${TARGETS[@]}" 2>&1)" || status=$?
  fi
  if [[ "$status" -eq 2 ]]; then
    echo "FAIL have-a-spine: ripgrep failed while searching for: $raw"
    printf '%s\n' "$hits"
    echo "The check did not finish. This is a failure, not a pass."
    exit 1
  fi
  if [[ "$status" -ne 0 && "$status" -ne 1 ]]; then
    echo "FAIL have-a-spine: ripgrep exited $status while searching for: $raw"
    printf '%s\n' "$hits"
    exit 1
  fi
  [[ "$status" -eq 1 || -z "$hits" ]] && continue

  while IFS= read -r hit; do
    [[ -z "$hit" ]] && continue
    if [[ "$hit" =~ ^([^:]+):([0-9]+):(.*)$ ]]; then
      path="$(normalize_path "${BASH_REMATCH[1]}")"
      line="${BASH_REMATCH[2]}"
      text="${BASH_REMATCH[3]}"
    else
      echo "FAIL have-a-spine: could not parse a ripgrep hit. Refusing to pass."
      printf '%s\n' "$hit"
      exit 1
    fi
    if is_legal_path "$path"; then
      continue
    fi
    if is_quote_only_rulebook "$path"; then
      continue
    fi
    fail=$((fail + 1))
    hits_out+="FAIL: \"${label}\" @ ${path}:${line}: ${text}"$'\n'
  done <<< "$hits"
done < "$PHRASES"

if [[ "$loaded" -eq 0 ]]; then
  echo "FAIL have-a-spine: banned-phrases.txt has no phrases. Refusing to pass."
  exit 1
fi

if [[ "$fail" -ne 0 ]]; then
  printf '%s' "$hits_out"
  echo "FAIL have-a-spine: ${fail} banned hedge(s) on a non-legal path (${loaded} phrases loaded)."
  echo "This is a failed task. Rewrite the sentence. Do not soft-wrap it."
  echo "Do not add the path to the allowlist. Do not delete the phrase to go green."
  echo "Do not rename the file to Terms or Privacy. Do not paste the quote-only marker on product copy."
  echo "Allowlist is Terms/Privacy ONLY: terms, terms-of-service, terms-and-conditions, tos, privacy, privacy-policy."
  echo "FAQ, sources, methodology, hero, CTA, pricing, empty states, checkout, and wiki are not allowlisted."
  exit 1
fi

echo "PASS have-a-spine: clean (${loaded} phrases, Terms/Privacy allowlist only)."
