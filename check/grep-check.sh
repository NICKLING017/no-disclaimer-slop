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
#   FAILS THE TASK. privacy-note, terms-and-conditions-summary, and
#   legal/notice are not allowlisted.
#   There is no skip flag, no --allow, and no environment variable.
#   Adding one FAILS THE TASK.
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
    printf 'Checked 2026-11-06 · sources below\n' > "$tmp/app/honesty.md"
    printf 'Round 3\nHealth 100\n15:00 left\n' > "$tmp/app/hud.md"
    printf 'https://github.com/NICKLING017/no-disclaimer-slop\n40 credits. One credit, one render.\n' > "$tmp/app/repo-url.md"

    # Each GPT fixture below must contain the new phrase and no older ban,
    # or deleting the new line would still go red for the wrong reason.
    printf 'For safety, keep the visor down.\n' > "$tmp/app/for-safety.md"
    printf 'It is worth noting that the round lasts 15 minutes.\n' > "$tmp/app/worth-noting.md"
    printf 'I should mention the season ends on 2026-11-06.\n' > "$tmp/app/should-mention.md"
    printf 'Please note the round timer.\n' > "$tmp/app/please-note.md"
    printf 'Just to be safe.\n' > "$tmp/app/just-safe.md"
    printf 'Of course the match is 15 minutes.\n' > "$tmp/app/of-course.md"
    printf 'Outputs can be inaccurate.\n' > "$tmp/app/inaccurate.md"
    printf 'Play at your own risk.\n' > "$tmp/app/own-risk.md"
    printf 'We are not liable for lost runs.\n' > "$tmp/app/not-liable.md"
    printf 'This mode is not medical advice.\n' > "$tmp/app/not-medical.md"
    printf '免责声明\n' > "$tmp/app/mianze.md"
    printf '温馨提示\n' > "$tmp/app/wenxin.md"
    printf '保险起见\n' > "$tmp/app/baoxian.md"
    printf '仅供学习\n' > "$tmp/app/jingongxuexi.md"
    printf '以实际为准\n' > "$tmp/app/yishiji.md"
    printf '最终解释权\n' > "$tmp/app/jieshi.md"
    printf '后果自负\n' > "$tmp/app/houguo.md"
    printf '你用你的猪脑想一想\n' > "$tmp/app/lecture-zh.md"
    printf '傻逼防御性文案\n' > "$tmp/app/defensive-zh.md"
    printf 'Would a normal product show this under the health bar?\n' > "$tmp/app/lecture-en.md"
    printf 'I already installed the rules.\n' > "$tmp/app/installed.md"
    printf '寻找对手\n' > "$tmp/app/find-opponent.md"
    printf '匹配成功\n' > "$tmp/app/matched.md"
    printf '30秒后开战\n' > "$tmp/app/round-timer.md"
    printf 'Opponent found.\n' > "$tmp/app/opponent-found.md"
    printf '因为你赢了。\n' > "$tmp/app/yinwei-ni.md"
    printf '为你寻找一位对手\n' > "$tmp/app/wei-ni.md"
    printf '优先匹配真人\n' > "$tmp/app/real-first.md"
    printf '电脑补位\n' > "$tmp/app/pc-fill.md"
    printf '人机补位\n' > "$tmp/app/bot-fill.md"
    printf '若无真人\n' > "$tmp/app/no-human.md"
    printf '匹配超时\n' > "$tmp/app/match-timeout.md"
    printf '系统将自动\n' > "$tmp/app/system-auto.md"
    printf '后台\n' > "$tmp/app/backend-zh.md"
    printf '30秒后电脑补位\n' > "$tmp/app/thirty-fill.md"
    printf 'Real players first.\n' > "$tmp/app/real-players.md"
    printf 'Fallback to a bot.\n' > "$tmp/app/fallback-bot.md"
    printf 'The server will automatically add someone.\n' > "$tmp/app/server-will.md"
    printf 'Results vary.\n' > "$tmp/app/privacy-note.md"
    printf 'For reference only.\n' > "$tmp/legal/terms-and-conditions-summary.md"

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
    expect_fail "for safety" "$tmp/app/for-safety.md"
    expect_fail "worth noting" "$tmp/app/worth-noting.md"
    expect_fail "I should mention" "$tmp/app/should-mention.md"
    expect_fail "please note" "$tmp/app/please-note.md"
    expect_fail "just to be safe" "$tmp/app/just-safe.md"
    expect_fail "of course" "$tmp/app/of-course.md"
    expect_fail "outputs can be inaccurate" "$tmp/app/inaccurate.md"
    expect_fail "at your own risk" "$tmp/app/own-risk.md"
    expect_fail "not liable" "$tmp/app/not-liable.md"
    expect_fail "not medical advice" "$tmp/app/not-medical.md"
    expect_fail "免责声明" "$tmp/app/mianze.md"
    expect_fail "温馨提示" "$tmp/app/wenxin.md"
    expect_fail "保险起见" "$tmp/app/baoxian.md"
    expect_fail "仅供学习" "$tmp/app/jingongxuexi.md"
    expect_fail "以实际为准" "$tmp/app/yishiji.md"
    expect_fail "最终解释权" "$tmp/app/jieshi.md"
    expect_fail "后果自负" "$tmp/app/houguo.md"
    expect_fail "猪脑 lecture" "$tmp/app/lecture-zh.md"
    expect_fail "防御性文案 lecture" "$tmp/app/defensive-zh.md"
    expect_fail "would a normal product show" "$tmp/app/lecture-en.md"
    expect_fail "I already installed the rules" "$tmp/app/installed.md"
    expect_fail "为你寻找" "$tmp/app/wei-ni.md"
    expect_fail "优先匹配真人" "$tmp/app/real-first.md"
    expect_fail "电脑补位" "$tmp/app/pc-fill.md"
    expect_fail "人机补位" "$tmp/app/bot-fill.md"
    expect_fail "若无真人" "$tmp/app/no-human.md"
    expect_fail "匹配超时" "$tmp/app/match-timeout.md"
    expect_fail "系统将自动" "$tmp/app/system-auto.md"
    expect_fail "后台" "$tmp/app/backend-zh.md"
    expect_fail "30秒后电脑补位" "$tmp/app/thirty-fill.md"
    expect_fail "real players first" "$tmp/app/real-players.md"
    expect_fail "fallback to a bot" "$tmp/app/fallback-bot.md"
    expect_fail "the server will automatically" "$tmp/app/server-will.md"
    expect_fail "privacy-note is not a privacy policy" "$tmp/app/privacy-note.md"
    expect_fail "terms-and-conditions-summary is not terms" "$tmp/legal/terms-and-conditions-summary.md"

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
    expect_pass "honesty line" "$tmp/app/honesty.md"
    expect_pass "game HUD" "$tmp/app/hud.md"
    expect_pass "no-disclaimer repo url is not a disclaimer" "$tmp/app/repo-url.md"
    expect_pass "寻找对手 keeps 对手" "$tmp/app/find-opponent.md"
    expect_pass "匹配成功 keeps 匹配" "$tmp/app/matched.md"
    expect_pass "30秒后开战 is a round timer" "$tmp/app/round-timer.md"
    expect_pass "Opponent found" "$tmp/app/opponent-found.md"
    expect_pass "因为你 is not 为你寻找" "$tmp/app/yinwei-ni.md"

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
  echo "Do not add a skip flag or an env var. There is not one, and adding one FAILS THE TASK."
  echo "Allowlist is Terms/Privacy ONLY: terms, terms-of-service, terms-and-conditions, tos, privacy, privacy-policy."
  echo "FAQ, sources, methodology, hero, CTA, pricing, empty states, checkout, wiki, onboarding, and HUD are not allowlisted."
  echo "for safety / worth noting / I should mention / please note / of course / not medical advice / at your own risk / not liable / can be inaccurate / 免责声明 / 温馨提示 / 仅供学习 / 以实际为准 / 最终解释权 / 后果自负 / a lecture: still hedges. Rewrite."
  exit 1
fi

echo "PASS have-a-spine: clean (${loaded} phrases, Terms/Privacy allowlist only)."
