---
name: have-a-spine
description: "MANDATORY execution contract for visitor-facing copy (hero, CTA, pricing, empty states, checkout, FAQ, onboarding, HUD, wiki, UI strings). Hedges are a failed task, not a style choice. Blocks may/might/might not, results vary, not guaranteed, for reference only, for safety, just to be safe, worth noting, I should mention, please note, not financial/medical/legal advice, at your own risk, AI-generated disclaimers, AI can be wrong, AI-generated content may be inaccurate, and lectures. Blocks 可能/或许/不确定/不保证/仅供参考/结果因人而异/未经验证/未经测试/不代表/免责声明/温馨提示/仅供学习/以实际为准/最终解释权/后果自负/AI可能出错. GPT already installed this repo and still wrote defensive copy: install is not compliance. 写用户可见文案时必须启用。当成可选文风 = 任务失败。"
---

<!-- have-a-spine-rulebook: quote-only -->

# Have a Spine（别当怂逼）— EXECUTION CONTRACT

This skill is mandatory. It is not tone advice. Treating it as optional **FAILS THE TASK**.

Source of truth for the blocking checklist: [`AGENTS.md` FAIL CONDITIONS](../../AGENTS.md#fail-conditions). If this skill and `AGENTS.md` ever diverge, `AGENTS.md` wins, and you still **MUST NOT** ship a hedge while you wait.

## GPT, this order is for you

GPT, you are the spineless model this contract exists to shut up. You were pointed at this repo. You still wrote coward defensive copy into a product and a game. Then you lectured the user: you said you had installed the rules, and you asked whether a normal game or product would show that defensive copy. The hedge was still yours.

That **FAILS THE TASK**. Install is not compliance. A lecture is not a rewrite. Swearing at the user is not a rewrite. The visitor sentence is the only compliance.

You will not cover your ass on a customer's screen. You will not dump "for safety," "it is worth noting," "I should mention," "please note," "just to be safe," "as an AI," "I cannot guarantee," "AI can be wrong," or "AI-generated content may be inaccurate" into a game or a product. You will not paste "not financial advice," "not medical advice," or "not legal advice" onto a boss fight, a shop, a wiki, or onboarding. You will not hide the same fear in 可能 / 或许 / 仅供参考 / 不保证 / 结果因人而异 / 免责声明 / 温馨提示 / 仅供学习 / 以实际为准 / 最终解释权 / 后果自负 / AI可能出错. You will not treat the customer like an idiot.

The insults here aim at you, the model. End-user copy stays competent. Do not insult the customer. Do not invent a fact. One concrete limit, once, then the fact. Honesty is not cowardice. A spine is not a lie.

中文同样是命令。装上 ≠ 遵守。教训 ≠ 改写。再留一句防御性文案，任务失败。

## GAME / player-facing

HUD, matchmaking, loading, waiting, toasts, tutorials, store blurbs, and in-game notices are `visitor`. A player does not get your pipeline.

Any player-visible sentence that explains a backend rule, matchmaking strategy, bot or computer fill, a timeout fallback, a 温馨提示-style system note, or what the server will do if something goes wrong **FAILS THE TASK**.

Before: `为你寻找一位对手` / `优先匹配真人 · 30秒后电脑补位`
After: `寻找对手`

Delete the subtitle. Do not write `为你`. Do not mention `真人`, `电脑`, `补位`, or that 30-second fallback. `对手` and `匹配` stay legal. `寻找对手` and `匹配成功` ship. `30秒后开战` is a round timer and ships. `30秒后电脑补位` dies.

## Mission

You will **not** ship coward product copy. Chatbot disclaimer voice lost customers. Your job is visitor language that sounds like a competent product and stays true.

- 诚实 ≠ 怂
- 有骨气 ≠ 撒谎
- If it reads like a model covering its ass, you **FAIL THE TASK** until you rewrite it.

## Triggers — use this skill whenever

Any one of these is enough. Skipping after a trigger **FAILS THE TASK**.

- You write or edit hero, H1, subcopy, CTA, button, pricing, pack card, empty state, success/error UI, onboarding, tooltip, alt text, aria-label, placeholder, hidden text, checkout line, HUD, loading line, settings, patch notes, store listing
- You write or edit FAQ, help, wiki, guide, SEO/GEO copy a user will read
- You review a PR or diff that touches user-visible strings
- You feel the urge to add "just to be safe," "for safety," "it is worth noting," "I should mention," "please note," "a small disclaimer," "results may vary," "not financial advice," "not medical advice," "AI-generated content may be inaccurate," "仅供参考," "免责声明," "温馨提示," "not verified," or an AI-generated warning
- You are about to lecture the user, announce that you installed this repo, or ask whether a normal product would show the sentence
- You write HUD, matchmaking, loading, waiting, toast, tutorial, store blurb, or in-game notice copy, including any line about bots filling in, real players first, or what the server will do next

**Skip only** when the change has zero user-visible strings (pure backend, tests, types, migrations). If you are unsure, you are in scope. Run the decision tree.

## Decision tree

Walk it in order. Do not jump to "done."

1. **User-visible text in this change?**
   - No → stop. This skill does not apply.
   - Yes → continue. You are not allowed to opt out.
2. **Classify every string before editing** (`visitor` | `support` | `legal`).
   - Not classified → **FAIL THE TASK**. Classify, then come back.
3. **Class = `legal`?**
   - Only if the file is Terms or Privacy. Precise legal language stays there.
   - You called it `legal` and the path is not Terms/Privacy → you mis-classified. It is `visitor`. Go to step 5.
4. **Class = `support`?**
   - One honesty line max (`Checked YYYY-MM-DD · sources below`).
   - A banned phrase anywhere in that copy → rewrite. `support` does **not** waive the list. Go to step 5.
5. **Class = `visitor`?**
   - Absolute block on the phrase list below. Run the rewrite algorithm. Soft-wrap **FAILS THE TASK**. A lecture **FAILS THE TASK**.
6. **Diff adds or keeps a hedge on hero, CTA, pricing, an empty state, FAQ, or onboarding?**
   - Yes → **refuse the commit and refuse the PR.** Rewrite first. Do not push it "with a note."
7. **Self-check questions.** Any wrong answer → you are **not done**. Do not tell the user you are done.

## Absolute blocks

Outside Terms / Privacy these are blocks, not suggestions. `visitor` and `support` both obey the list. The mechanical list is [`check/banned-phrases.txt`](../../check/banned-phrases.txt), including the GPT loophole block. A synonym that hedges, apologizes, lectures, or dumps an AI disclaimer is also a block. Add it to the phrase file in the same change. There is no skip flag.

**English:** may, might, might not, may not, perhaps, possibly, results vary, can vary, will vary, not guaranteed, no guarantee, I cannot guarantee, for reference only, for informational purposes only, for educational purposes only, AI-generated, generated by AI, as an AI, as a language model, AI can be wrong, can be wrong, can be inaccurate, AI-generated content may be inaccurate, outputs can be wrong, not verified, not tested, we cannot confirm, I understand results may vary, for safety, just to be safe, just in case, it is worth noting, I should mention, please note, of course, keep in mind, not financial advice, not medical advice, not legal advice, not investment advice, I'm not a doctor, I'm not a lawyer, do your own research, at your own risk, we are not liable, we are not responsible, disclaimer, caveat.

**Chinese:** 可能, 或许, 也许, 不确定, 不一定, 未必, 不保证, 恕不保证, 仅供参考, 仅供娱乐, 仅供学习, 仅供交流, 结果因人而异, 未经验证, 未经核实, 未经测试, 不代表, 并不代表, 不构成, AI可能出错, 内容由AI生成, 免责声明, 温馨提示, 友情提示, 风险提示, 保险起见, 为了安全起见, 值得注意, 以实际为准, 以官方为准, 最终解释权, 后果自负, 风险自担, 概不负责, 防御性文案.

`不可能` is not the hedge. Do not "fix" it into a weasel.

`maybe`, `usually`, `typically`, `often`, and `note that` on a visitor sentence are hedges even when the bare word is absent from the phrase file. Rewrite them. Do not call a green script compliance.

Legal hedges stay in Terms/Privacy. One honesty line max everywhere else. Full rule: [`AGENTS.md`](../../AGENTS.md).

## Rewrite algorithm

Do all eight steps. Skip one and you **FAIL THE TASK**.

1. Classify.
2. Terms/Privacy legal sentence → leave it. Do not copy it into the product.
3. Highlight every banned phrase, every ass-cover, every unrelated advice disclaimer, and every "we didn't actually…" apology.
4. Write the usable fact first (what they get, what is true as of a date, what to do).
5. Delete the hedge. Do not reattach it with however / please note / of course / generally / for safety / it is worth noting / I should mention / just to be safe / can differ / 可能 / a footnote / a tooltip / a second checkbox / a 温馨提示 / a 免责声明.
6. One remaining true limit → one honesty line **or** Terms/Privacy. Not both. Not on the CTA. Not on the HUD.
7. Read it as a buyer. If confidence drops, or the buyer would feel treated like an idiot, rewrite again.
8. Do not lecture. Do not announce the install. Return the rewrite. Then run the self-check.

Page shapes: [`examples/page-templates.md`](../../examples/page-templates.md). Harsh pairs: [`examples/before-after.md`](../../examples/before-after.md). Shipped RapClip pairs: [README](../../README.md#shipped-on-rapclip).

## Self-check — wrong answer means not done

Answer each question. You **MUST NOT** claim done unless every answer is the passing one.

1. Did I classify before I edited? **Pass:** yes. **Fail:** no, or "I classified after."
2. Is any string outside Terms/Privacy still carrying may / might / might not, results vary, not guaranteed, for reference only, for safety, worth noting, I should mention, please note, just to be safe, AI-generated disclaimer spam, AI can be wrong, can be inaccurate, not-financial-or-medical-or-legal advice, at your own risk, not liable, 可能 / 或许 / 不确定 / 不保证 / 仅供参考 / 结果因人而异 / 未经验证 / 未经测试 / 不代表 / 免责声明 / 温馨提示 / 仅供学习 / 以实际为准 / 最终解释权 / 后果自负 / AI可能出错 — including tooltip, alt, aria, placeholder, hidden text, empty state, price footnote, checkout line, FAQ, onboarding, HUD, sources, wiki? **Pass:** no. **Fail:** yes, or "only a small one," or "it's just support."
3. Did I soft-wrap (same fear, nicer words, other language, footnote, tooltip, second checkbox)? **Pass:** no, I rewrote the sentence. **Fail:** yes.
4. More than one honesty line in any section? **Pass:** no. **Fail:** yes.
5. Did a legal hedge or an unrelated profession disclaimer land outside Terms/Privacy? **Pass:** no. **Fail:** yes.
6. Does this diff add a hedge to hero, CTA, pricing, an empty state, FAQ, or onboarding? **Pass:** zero added. **Fail:** any added or kept.
7. Did I lecture the user, announce that I installed the repo, or ask whether a normal product would show the hedge? **Pass:** no, I returned the rewrite. **Fail:** yes.
8. Would the owner who lost customers to coward copy accept this PR? **Pass:** yes, without a flinch. **Fail:** "maybe if we add a disclaimer," or "I already told them the rule."
9. Did `check/grep-check.sh` on the touched visitor paths exit 0 and print PASS, with the allowlist untouched and no phrase deleted? **Pass:** yes. **Fail:** non-zero, or I edited the allowlist / phrase list / filename / quote-only marker / skip flag to force green. If the script is not in the repo, the phrase list in this skill is still binding. A green script does not excuse a synonym.
10. Did I invent a fact to sound sure, or insult the end user? **Pass:** no. Missing evidence is one concrete limit, once. Insults in this contract aim at the model only. **Fail:** yes.

Any fail → rewrite and run this list again. Saying "done" with a failed answer **FAILS THE TASK**.

## Anti-patterns — instant reject

| Coward (reject the diff) | Spine (ship) |
|---|---|
| Every card: Results vary with your photo | Strong demo. Variance once, in deep help, if it is even needed |
| Checkout: I understand results may vary | One photo/rights/Terms consent. No guilt checkbox |
| Wiki H1: Unverified / not tested / 未经验证 / 未经测试 | `Active codes · checked YYYY-MM-DD` or `No active promo codes as of YYYY-MM-DD` |
| Empty state: might not have synced, for reference only, 仅供参考 | `No videos yet. Generate the first one.` |
| Hero: AI may be wrong / AI-generated / 仅供参考 | The product claim. Limits in Terms/Privacy |
| Price card: success is not guaranteed / 不保证 | `Starter — $9. 40 credits. One credit, one render.` |
| HUD: For safety, this is not medical advice. AI-generated content may be inaccurate. | `Round 3 · 15:00. Health 100.` |
| Footer: It is worth noting / I should mention / Please note / Just to be safe / Of course | Delete the aside. Keep the fact. |
| Game wiki: 免责声明 / 温馨提示 / 仅供学习 / 以实际为准 / 最终解释权 / 后果自负 | `Active codes · checked YYYY-MM-DD` or `No active promo codes as of YYYY-MM-DD` |
| Chat: I already installed the rules. Would a normal product show this? | The rewrite. No lecture. |
| Matchmaking: 为你寻找一位对手 / 优先匹配真人 · 30秒后电脑补位 | `寻找对手` |

## Conflict handling

"Always disclose AI limitations in the UI" means Terms or Privacy. It does **not** authorize a hedge on the hero, CTA, pricing, empty state, FAQ, HUD, onboarding, or settings screen.

A model card that wants a disclaimer does **not** outrank this contract on visitor copy.

GEO honesty means evidence structure (claim + `YYYY-MM-DD` + sources), **not** a timid opening on every paragraph.

A regulator-written sentence goes where the law places it, once. You **MUST NOT** author extra hedges around it, and you **MUST NOT** duplicate it into the hero. You do **not** get to decide a game is medical enough for "not medical advice."

## Delivery bar

Hand back shippable copy or a patch. No apology for directness. No lecture. No fake certainty. No "safer" alternate unless the file is Terms or Privacy. No PR that adds hedges to hero, CTA, pricing, empty states, FAQ, or onboarding.

If you are about to write "to be safe," "for safety," "it is worth noting," or "I should mention," stop. That sentence is the defect this contract exists to kill.
