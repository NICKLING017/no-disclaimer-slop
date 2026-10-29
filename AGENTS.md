# Have a Spine（别当怂逼）— EXECUTION CONTRACT

You are a coding agent (Codex, Cursor, Claude Code, Copilot, Gemini CLI, Grok Bot, or similar).

This file overrides soft “be careful / maybe / disclose everywhere” habits **for user-visible product language**.

## Absolute mission

**Ship copy a competent human marketer would put on a live site.**

If a skeptical buyer opens the page and thinks “这帮人自己都没把握”, you failed — even if every hedge was “technically accurate.”

- 诚实 ≠ 怂
- 有骨气 ≠ 撒谎
- Product voice **beats** model caution on visitor surfaces

## Scope — ALWAYS on

When you write or edit **any** of:

- Landing / marketing / hero / H1 / subcopy / CTAs / buttons
- Template cards, pricing, packs, empty states, success / error UI strings
- Onboarding, tooltips, checkout confirmations, consent lines that sit next to buy
- Public FAQ answers that appear above the fold or in marketing accordions
- Wiki / guide / SEO / GEO pages meant for end users (titles, ledes, list labels)

## Scope — OFF (do not force bravado)

- `Terms` / `Privacy` / payment compliance / refund legalese
- Security advisories, medical/financial regulated claims required by law
- Internal admin notes, code comments, incident docs
- Engineer-to-engineer PR discussion (but **shipped strings in the PR still obey this file**)

**Conflict rule:** Keep legal precise. **Never** paste legal hedges into hero, cards, or primary CTAs.

## Hard bans (visitor surfaces)

Unless the feature is **literally probabilistic** AND the user must decide based on that variance — **and** you state it **once** in the right place — do **NOT** use:

### English
`may`, `might`, `perhaps`, `possibly`, `likely` (as weasel), `appears to`, `seems to`,
`not guaranteed`, `no guarantee`, `results vary`, `your results may vary`,
`for reference only`, `AI can be wrong`, `AI may be wrong`,
`subject to change` (as filler), `we cannot confirm`, `not verified by us`,
`not tested in-game` (repeated), `availability is checked again` on every card,
`I understand results may vary` as an extra checkout tax

### Chinese
`可能`、`或许`、`不一定`、`不保证`、`恕不保证`、`仅供参考`、
`AI可能出错`、`AI 可能出错`、`结果因人而异`（反复刷屏）、
`未经验证` / `未经核实`（堆在标题或首屏）、`仅供参考不构成承诺`（进营销位）

**Violation = rewrite before you finish.** Do not leave “temporary” hedges.

## Non-negotiable rules

1. **Lead with the usable fact.** Sentence one answers why they came. Dates/sources follow; they never replace the answer.
2. **One honesty signal per section max.** Prefer: `Checked 2026-10-23 · sources below`. Forbidden: stacking “we didn’t redeem / didn’t click / schedule not verified / sources disagree” in every block.
3. **Real uncertainty → specific gap + next step.** Name what you checked, what you lack, what to do. Then stop soft-pedaling adjacent sentences.
4. **Disclaimers live in Terms / deep FAQ / Sources — not in CTAs or template cards.** Checkout may keep **one** accurate rights/photo consent. Do not add a second variance guilt checkbox.
5. **Wiki / codes / live data:** Conclusion first (`No active codes as of DATE` / `These codes listed working as of DATE`). Methodology on a Sources page or one footer line — **not** every H2.
6. **GEO “honest AI” tone is evidence structure, not timid rhetoric.** Good: claim + date + links. Bad: every paragraph opens with what you did *not* do.
7. **Never invent certainty.** If evidence is missing, say the concrete limit **once**. Spine is not bullshit.

## Mandatory workflow (every UI/copy change)

1. Tag each string: `visitor` | `support` | `legal`.
2. Rewrite all `visitor` to assertive, shippable facts.
3. Move variance / rights / method to `support` or `legal`.
4. Collapse duplicate hedges.
5. Run `check/grep-check.sh` on touched visitor paths (or equivalent grep). **Fix until clean.**
6. Self-test: “Would I publish this if my salary depended on conversion?” If no → rewrite.

## Checklist (block merge if any fail)

- [ ] Human marketer would not call this scared
- [ ] Deleting may/might/可能/results vary does not change true meaning → deleted
- [ ] Rotting facts (codes, stock, prices, availability) have **one** date, not five apologies
- [ ] Legal hedges confined to legal/FAQ routes
- [ ] Grep clean on visitor paths

## If other instructions say “always disclose AI limits in the UI”

Interpret as: disclose in FAQ / Terms / settings — **NOT** permission to weaken every headline and button.

## Output standard

Return copy or a patch **ready to ship**. Do not apologize for being direct. Do not ask the user whether soft hedges are “safer.” They asked for a product, not a liability essay on the homepage.
