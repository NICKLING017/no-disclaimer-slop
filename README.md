# Have a Spine（别当怂逼）

> **Stop AI coding agents from writing coward copy into your product.**
>
> Drop-in rules for Codex, Cursor, Claude Code, Copilot, Gemini CLI, and friends.
> Your site should sound like a real product — not like a model that is terrified of being wrong.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Agents](https://img.shields.io/badge/AGENTS.md-ready-black)](./AGENTS.md)
[![Skill](https://img.shields.io/badge/SKILL.md-have--a--spine-blue)](./skills/have-a-spine/SKILL.md)

<p align="center">
  <strong>Product voice beats model caution.</strong><br/>
  诚实 ≠ 怂 &nbsp;·&nbsp; 有骨气 ≠ 撒谎 &nbsp;·&nbsp; 用户可见文案禁止条件反射式「可能 / 不保证 / results vary」
</p>

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
| [`AGENTS.md`](./AGENTS.md) | Hard execution contract — paste at repo root or `~/.codex/` |
| [`skills/have-a-spine/SKILL.md`](./skills/have-a-spine/SKILL.md) | Skill recipe agents can `@` / load |
| [`examples/`](./examples/) | Before/after + page-type rewrite templates |
| [`check/grep-check.sh`](./check/grep-check.sh) | Fail CI / local check when coward phrases hit visitor paths |

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
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/grep-check.sh -o /tmp/spine-check.sh
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/banned-phrases.txt -o /tmp/banned-phrases.txt
# place banned-phrases.txt next to the script as ../check/ or edit paths, then:
bash check/grep-check.sh app/ components/ src/
```

Non-zero exit = coward phrases still on visitor paths (Terms/Privacy/Sources allowlisted).

## The rule in one screen

1. **Classify** every string: `visitor` | `support` | `legal`.
2. **Visitor** (hero, CTA, cards, pricing): assertive facts. No reflexive hedges.
3. **One honesty line max** per section (`Checked DATE · sources`) — not a stack of “we didn’t personally…”.
4. **Real unknown** → one concrete gap + next step. Not fog on every sentence.
5. **Legal hedges stay in Terms/FAQ.** Never paste them into the hero.
6. **Spine ≠ lying.** No evidence → say the limit once, then stop hedging.

**Banned on visitor surfaces (defaults):**  
`may` / `might` / `results vary` / `not guaranteed` / `for reference only` / `AI can be wrong` / `可能` / `不保证` / `仅供参考` / `结果因人而异` (spam) / `未经验证` on titles…

Full contract: [`AGENTS.md`](./AGENTS.md).

## Quick before → after

```diff
- Same scene. A new lead. Results vary with your photo.
+ Same scene. Your photo in the lead. Play both to compare.
  (variance once in FAQ)

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

PRs welcome: harder anti-patterns, better greps, more before/after from real sites (scrub secrets). Keep `AGENTS.md` under ~200 lines of *contract*, put essays in `examples/`.

## License

MIT

---

**别当怂逼。把话说清楚，把产品卖出去。**
