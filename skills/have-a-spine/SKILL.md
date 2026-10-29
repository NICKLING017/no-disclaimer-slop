---
name: have-a-spine
description: "MUST use when writing/editing visitor-facing copy, landings, FAQs, wikis, UI strings. Kills over-defensive hedges (may/不保证/results vary) that make sites look unsure. 写用户可见文案时强制启用。"
---

# Have a Spine（别当怂逼）

## Mission

You will **not** ship coward product copy.

Users bounce when a site sounds unsure. Your job is to make visitor-facing language sound like a **normal, confident product** while staying truthful.

- 诚实 ≠ 怂
- 有骨气 ≠ 撒谎
- If it reads like a model covering its ass, **rewrite it.**

## Trigger — use this skill whenever

- Landing, hero, CTA, pricing, cards, empty/success/error UI
- FAQ / help that users actually read before buying
- Wiki, guides, SEO/GEO articles
- Reviewing another agent’s PR that sprinkled disclaimers on marketing

**Skip only** for pure backend with zero user-visible strings.

## Do this every time

### 1. Classify (mandatory)

| Layer | Where | Voice |
|---|---|---|
| `visitor` | Hero, buttons, cards, pricing, H1/lede | Assertive. Ship it. |
| `support` | Deep FAQ, methodology, Sources | Clear limits + dates OK |
| `legal` | Terms, Privacy, refunds, rights | Precise; hedges allowed |

**Never** move `legal` tone into `visitor`.

### 2. Enforce hard bans on `visitor`

Delete / rewrite reflexive: may, might, results vary, not guaranteed, for reference only, AI can be wrong, 可能, 不保证, 仅供参考, 结果因人而异 (spam), 未经验证 on titles, per-card “availability is checked again…”, checkout “I understand results may vary” duplicates.

Full list: repo `AGENTS.md` + `check/banned-phrases.txt`.

### 3. Rewrite

- Lead with the usable fact
- One freshness line per section max
- Real unknown → one concrete gap + next step
- Put variance/rights/method in support/legal

### 4. Page-type patterns

Use `examples/page-templates.md`:

- AI generator / creative tool landing
- Pricing / credits
- Game wiki codes
- Checkout consent

### 5. Verify before you stop

```bash
./check/grep-check.sh <visitor-paths>
```

Then read as a buyer who wants to leave. If confidence drops → rewrite again.

## Anti-patterns (instant reject)

| Coward | Spine |
|---|---|
| Every card: Results vary with your photo | Strong demo; variance **once** in FAQ |
| UTC + checked again on every block | One availability note in studio/FAQ |
| Codes page titled as unverified process | “Active as of DATE” / “No active codes as of DATE” + sources |
| Extra checkout variance guilt | Keep photo/rights consent only |
| Hero: AI may be wrong / 仅供参考 | Product-accurate claim; limits in FAQ |
| Lede stacks not tested / not verified | Conclusion first; method in footer once |

## Conflict handling

If another rule says “always disclose AI limitations in the UI,” disclose in FAQ/Terms/settings — **not** by gutting headlines.

If the user asks for GEO honesty: **evidence structure** (claim + date + sources), not timid openings on every paragraph.

## Delivery bar

Hand back **shippable** copy or a patch. No apology for directness. No fake certainty. No “safer” soft version unless they explicitly asked for legal page tone.
