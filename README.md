<!-- have-a-spine-rulebook: quote-only -->

[中文说明 →](./README.zh-CN.md)

# Have a Spine

> **Stop AI coding agents from writing coward copy into your product.**
>
> Drop-in rules for Codex, Cursor, Claude Code, Copilot, Gemini CLI, and friends.
> Your site should sound like a real product — not like a model that is terrified of being wrong.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Agents](https://img.shields.io/badge/AGENTS.md-ready-black)](./AGENTS.md)
[![Skill](https://img.shields.io/badge/SKILL.md-have--a--spine-blue)](./skills/have-a-spine/SKILL.md)

<p align="center">
  <strong>Product voice beats model caution.</strong><br/>
  Honesty ≠ cowardice &nbsp;·&nbsp; A spine ≠ a lie &nbsp;·&nbsp; No reflexive “may / not guaranteed / results vary” on visitor copy
</p>

---

## This is mandatory

This is an execution contract. It is not tone advice, not a best effort, and not something an agent is allowed to soften because a model card likes disclaimers.

A coding agent that adds a hedge to the hero, the CTA, pricing, or an empty state — a softer synonym, a footnote, a tooltip, or a second checkbox — has failed the task. Do not commit that. Do not open that PR.

Before you call the work done, run every item in [FAIL CONDITIONS](./AGENTS.md#fail-conditions). [`check/grep-check.sh`](./check/grep-check.sh) exits non-zero and prints `FAIL` when a banned phrase sits outside Terms/Privacy. Sources, FAQ, methodology, and marketing paths are not on the allowlist. Editing the allowlist or the phrase list to force a green check is also a failure.

中文：[`README.zh-CN.md`](./README.zh-CN.md)

---

## Why this exists

Coding agents are trained to **hedge**. On a marketing page that becomes:

- “Results may vary”
- “Availability is checked again before you buy”
- “Not verified / not tested / we cannot confirm”
- “仅供参考 / AI 可能出错 / 结果因人而异”

A visitor does not read that as honesty. They read: **these people are not sure → bounce.**

Adjacent projects fix related diseases ([anti-sycophancy](https://github.com/FerroxLabs/agents-md), [no hedging prompts](https://github.com/lordon1a/agents.md), [AGENTS.md format](https://github.com/agentsmd/agents.md)). **Have a Spine** is the one aimed at **shipped UI and public copy**.

## What you get

| File | Purpose |
|---|---|
| [`AGENTS.md`](./AGENTS.md) | Hard execution contract. [FAIL CONDITIONS](./AGENTS.md#fail-conditions) block "done" |
| [`skills/have-a-spine/SKILL.md`](./skills/have-a-spine/SKILL.md) | Same contract as a skill: triggers, decision tree, rewrite algorithm, blocking self-check |
| [`examples/`](./examples/) | Harsh before/after + page-type rewrite templates |
| [`check/grep-check.sh`](./check/grep-check.sh) | Exits non-zero and prints `FAIL` when a banned hedge is outside Terms/Privacy |

## Install (60 seconds)

### Option A — Codex / any AGENTS.md agent

```bash
# One project
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md \
  -o AGENTS.md

# Or merge: paste the "Have a Spine" section into your existing AGENTS.md

# All projects (Codex home)
mkdir -p ~/.codex
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md \
  -o ~/.codex/AGENTS.md
```

Restart / new Codex session so it reloads instructions.

### Option B — Cursor / Claude Code skill

```bash
mkdir -p .cursor/skills/have-a-spine   # or your skills dir
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/skills/have-a-spine/SKILL.md \
  -o .cursor/skills/have-a-spine/SKILL.md
```

Then: `@have-a-spine` when editing landing copy, FAQ, wiki, checkout strings.

### Option C — Vendor the whole repo

```bash
git submodule add https://github.com/NICKLING017/no-disclaimer-slop.git vendor/have-a-spine
# point AGENTS.md / skills at vendor/have-a-spine
```

### Verify

```bash
mkdir -p check
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/grep-check.sh -o check/grep-check.sh
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/banned-phrases.txt -o check/banned-phrases.txt
chmod +x check/grep-check.sh

# Prove the gate fails closed, then scan visitor copy.
bash check/grep-check.sh --self-test
bash check/grep-check.sh app/ components/ src/
```

`--self-test` must print `self-test PASS`. A scan that finds a hedge prints `FAIL` and exits non-zero. That result blocks "done." Allowlist is **Terms / Privacy only** — documented at the top of [`check/grep-check.sh`](./check/grep-check.sh). FAQ, sources, methodology, hero, pricing, and empty states are scanned.

## The rule in one screen

These are obligations. The blocking list is [FAIL CONDITIONS](./AGENTS.md#fail-conditions). Skipping one fails the task.

1. **Classify** every string before you edit it: `visitor` | `support` | `legal`.
2. **Visitor** (hero, CTA, cards, pricing, empty states): assertive facts. Banned phrases are blocked. FAQ and sources are not a waiver.
3. **One honesty line max** per section (`Checked DATE · sources`) — not a stack of “we didn’t personally…”.
4. **Real unknown** → one concrete gap + next step. Not fog on every sentence.
5. **Legal hedges stay in Terms/Privacy only.** Not in FAQ. Not in the hero.
6. **Spine ≠ lying.** No evidence → say the limit once, then stop hedging.

**Banned outside Terms/Privacy:**  
`may` / `might` / `might not` / `results vary` / `not guaranteed` / `for reference only` / `AI-generated` / `可能` / `或许` / `不确定` / `不保证` / `仅供参考` / `结果因人而异` / `未经验证` / `未经测试` / `不代表`…

Full contract: [`AGENTS.md`](./AGENTS.md).

## Quick before → after

```diff
- Same scene. A new lead. Results vary with your photo.
+ Same scene. Your photo in the lead. Play both to compare.

- This page has not tested a redeem button… schedule is not verified…
+ No active promo codes as of 2026-10-23.
  Sources & method in the footer — once.
```

More: [`examples/before-after.md`](./examples/before-after.md) · [`examples/page-templates.md`](./examples/page-templates.md)

## Who this is for

- Indie hackers shipping AI / SaaS / game wikis with coding agents
- Teams tired of reviewing “disclaimer salad” PRs
- Anyone whose GEO “honesty” tone accidentally became **timid marketing**

## Not this

- Not permission to invent fake certainty
- Not a waiver for payment / privacy / regulated claims
- Not a full brand system — only **spine for user-visible language**

## Contributing

PRs welcome: harder anti-patterns, better greps, more before/after from real sites (scrub secrets). Keep [FAIL CONDITIONS](./AGENTS.md#fail-conditions) in `AGENTS.md`. Do not dilute them into a blog post. Essays and rewrites live in `examples/`.

## License

MIT

---

**Have a spine. Say it clearly. Sell the product.**
