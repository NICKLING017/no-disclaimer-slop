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

> [!IMPORTANT]
> **Send this to your agent to install this skill globally:**

```text
Install the Have a Spine skill globally. Do not put it inside a project.

Download https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/skills/have-a-spine/SKILL.md
and save it to ~/.cursor/skills/have-a-spine/SKILL.md (create the directories).

Optionally also download https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md
to ~/.codex/AGENTS.md. If that file already exists, merge this contract into it. Do not wipe other rules.

When finished, confirm the paths you wrote.
```

That block is the install. Paste it to Cursor, Claude Code, Codex, or any other coding agent. The commands below are the same steps by hand. One global copy covers every project on this machine.

### Cursor / Claude Code / similar — global skill

| Agent | Global skill file |
|---|---|
| Cursor | `~/.cursor/skills/have-a-spine/SKILL.md` |
| Claude Code | `~/.claude/skills/have-a-spine/SKILL.md` |

```bash
# Cursor — every project for this user (default)
mkdir -p ~/.cursor/skills/have-a-spine
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/skills/have-a-spine/SKILL.md \
  -o ~/.cursor/skills/have-a-spine/SKILL.md

# Claude Code — same file, user-global skills
mkdir -p ~/.claude/skills/have-a-spine
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/skills/have-a-spine/SKILL.md \
  -o ~/.claude/skills/have-a-spine/SKILL.md
```

Codex user skills use the same file at `~/.agents/skills/have-a-spine/SKILL.md` (`~/.codex/skills/` still loads). For Codex, the global `AGENTS.md` below is the path to install first.

Open a new chat, then `@have-a-spine` (Cursor) or `/have-a-spine` (Claude Code) when editing landing copy, FAQ, wiki, or checkout strings.

Leave project folders such as `.cursor/skills/` and `.claude/skills/` alone. Those apply to one repo. This skill belongs in your home directory.

### Codex / any AGENTS.md agent

Default is the global file in your home directory. Merge when you already have one. A project-root `AGENTS.md` is optional and second.

```bash
# All projects (default) — Codex home
mkdir -p ~/.codex
# No ~/.codex/AGENTS.md yet:
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md \
  -o ~/.codex/AGENTS.md
# Already have ~/.codex/AGENTS.md? Merge the Have a Spine section into it. Do not replace the whole file.

# Optional: this project only
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md \
  -o AGENTS.md
```

Restart, or start a new Codex session, so it reloads instructions.

### Option C — optional: vendor the whole repo

Not the default. Use this only when a repository must pin the contract for every clone.

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

## Shipped on RapClip

Real production copy from [rapclip.app](https://rapclip.app). Rewrites merged in [PR 3](https://github.com/NICKLING017/rapclip.app/pull/3).

- **Checkout.** `I understand results may vary.` → `I have permission to use this photo and agree to the Terms.`
- **Homepage.** `no guaranteed word-for-word lip sync, and results vary with the photo.` → `No MP3 uploads. No voice cloning. The clip uses the performance you picked, and your photo is the person in the frame.`
- **Pricing.** `Length and output depend on the selected template.` → `Bulin 47 · 23.17 s · 720 × 1280 · 100 credits. Hotel Lobby · 15 s · 1280 × 720 · 100 credits. Freestyle · 15 s · 480 × 854 · 50 credits.`
- **Freestyle footnote.** `Your results will vary.` → `Your photo and your words go in the verse.`
- **Player.** `Results vary with your photo.` → `{name} archive example. Original soundtrack.`
- **Limits.** `Freestyle may adapt your lyrics to fit the clip. Exact words and word-for-word lip sync are not guaranteed.` → `Freestyle uses your topic for a 15-second verse. It does not take an MP3 and it does not clone a voice.`

Terms and Privacy legal hedges stay allowlisted.

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
