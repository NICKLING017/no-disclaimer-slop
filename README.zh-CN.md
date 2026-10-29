<!-- have-a-spine-rulebook: quote-only -->

[English →](./README.md)

# Have a Spine（别当怂逼）

> **别让写代码的 AI 把怂文案写进你的产品。**
>
> 给 Codex、Cursor、Claude Code、Copilot、Gemini CLI 和同类代理的即插即用规则。
> 你的站点该像一个真产品 —— 不像一个怕说错话的模型。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Agents](https://img.shields.io/badge/AGENTS.md-ready-black)](./AGENTS.md)
[![Skill](https://img.shields.io/badge/SKILL.md-have--a--spine-blue)](./skills/have-a-spine/SKILL.md)

<p align="center">
  <strong>产品语气压过模型的怂。</strong><br/>
  诚实 ≠ 怂 &nbsp;·&nbsp; 有骨气 ≠ 撒谎 &nbsp;·&nbsp; 用户可见文案禁止条件反射式「可能 / 不保证 / results vary」
</p>

---

## 这是强制合同

这是执行合同，不是文风建议，不是「尽量」，也不是模型卡片喜欢免责声明就可以写软的东西。

写代码的 agent 若在首屏、CTA、定价或空状态上加怂话——换个更软的同义词、脚注、tooltip、第二颗勾选框——这次任务失败。不许提交。不许开这个 PR。

声称做完之前，必须逐条跑完 [FAIL CONDITIONS](./AGENTS.md#fail-conditions)。[`check/grep-check.sh`](./check/grep-check.sh) 在条款 / 隐私以外扫到禁词时，必须以非零状态退出并打印 `FAIL`。来源页、FAQ、方法论、营销路径都不在白名单里。为了变绿去改白名单或删禁词，同样算失败。

English: [`README.md`](./README.md)

---

## 为什么有这个仓库

写代码的 agent 被训练成**先打太极**。落到营销页上就变成：

- “Results may vary”
- “Availability is checked again before you buy”
- “Not verified / not tested / we cannot confirm”
- “仅供参考 / AI 可能出错 / 结果因人而异”

访客不会把这读成诚实。他们读到的是：**这帮人自己都没把握 → 走人。**

相邻项目治的是相近的病（[反谄媚](https://github.com/FerroxLabs/agents-md)、[禁止 hedging 的提示词](https://github.com/lordon1a/agents.md)、[AGENTS.md 格式](https://github.com/agentsmd/agents.md)）。**Have a Spine** 专门打**已经上线的界面和公开文案**。

## 你拿到什么

| 文件 | 用途 |
|---|---|
| [`AGENTS.md`](./AGENTS.md) | 硬执行合同。[FAIL CONDITIONS](./AGENTS.md#fail-conditions) 不过就不能说做完 |
| [`skills/have-a-spine/SKILL.md`](./skills/have-a-spine/SKILL.md) | 同一份合同的技能版：触发条件、决策树、改写步骤、卡住「做完」的自检 |
| [`examples/`](./examples/) | 更狠的改前改后 + 按页面类型的改写模板 |
| [`check/grep-check.sh`](./check/grep-check.sh) | 条款 / 隐私以外扫到禁词时，非零退出并打印 `FAIL` |

## 安装（60 秒）

### 方案 A — Codex / 任何读 AGENTS.md 的 agent

```bash
# 单个项目
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md \
  -o AGENTS.md

# 或者合并：把 "Have a Spine" 那一段贴进你现有的 AGENTS.md

# 全部项目（Codex 家目录）
mkdir -p ~/.codex
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/AGENTS.md \
  -o ~/.codex/AGENTS.md
```

重启，或新开一个 Codex 会话，让它重新加载指令。

### 方案 B — Cursor / Claude Code 技能

```bash
mkdir -p .cursor/skills/have-a-spine   # 或你的 skills 目录
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/skills/have-a-spine/SKILL.md \
  -o .cursor/skills/have-a-spine/SKILL.md
```

然后：改落地页文案、FAQ、wiki、结账字符串时 `@have-a-spine`。

### 方案 C — 把整个仓库 vendor 进来

```bash
git submodule add https://github.com/NICKLING017/no-disclaimer-slop.git vendor/have-a-spine
# 把 AGENTS.md / skills 指到 vendor/have-a-spine
```

### 验证

```bash
mkdir -p check
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/grep-check.sh -o check/grep-check.sh
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/banned-phrases.txt -o check/banned-phrases.txt
chmod +x check/grep-check.sh

# 先证明这道门是失败关闭的，再扫访客文案。
bash check/grep-check.sh --self-test
bash check/grep-check.sh app/ components/ src/
```

`--self-test` 必须打印 `self-test PASS`。扫到怂话会打印 `FAIL` 并以非零状态退出。这个结果卡住「做完」。白名单**只有条款 / 隐私** —— 写在 [`check/grep-check.sh`](./check/grep-check.sh) 开头。FAQ、来源页、方法论、首屏、定价、空状态都在扫描范围内。

## 一屏规则

下面每条都是义务。卡住完成的清单在 [FAIL CONDITIONS](./AGENTS.md#fail-conditions)。漏一条，任务失败。

1. **改之前先给每句文案分类**：`visitor` | `support` | `legal`。
2. **访客面**（首屏、CTA、卡片、定价、空状态）：把事实说死。禁词在 FAQ 和来源页同样不算豁免。
3. **每个版块最多一行诚实标记**（`Checked DATE · sources`）—— 不要堆一串「我们本人并没有……」。
4. **真不知道** → 一个具体缺口 + 下一步。不要每句话都起雾。
5. **法律免责只留在条款 / 隐私。** FAQ 不行。首屏不行。
6. **有骨气 ≠ 撒谎。** 没有证据 → 把限度说一次，然后停止打太极。

**条款 / 隐私以外的禁词：**  
`may` / `might` / `might not` / `results vary` / `not guaranteed` / `for reference only` / `AI-generated` / `可能` / `或许` / `不确定` / `不保证` / `仅供参考` / `结果因人而异` / `未经验证` / `未经测试` / `不代表`……

完整合同：[`AGENTS.md`](./AGENTS.md)。

## 改前 → 改后

```diff
- Same scene. A new lead. Results vary with your photo.
+ Same scene. Your photo in the lead. Play both to compare.

- This page has not tested a redeem button… schedule is not verified…
+ No active promo codes as of 2026-10-23.
  Sources & method in the footer — once.
```

更多：[`examples/before-after.md`](./examples/before-after.md) · [`examples/page-templates.md`](./examples/page-templates.md)

## 给谁用

- 用 coding agent 上线 AI / SaaS / 游戏 wiki 的独立开发者
- 审 PR 审到「免责声明沙拉」已经烦了的团队
- GEO「诚实」语气不小心写成**胆怯营销**的人

## 这不是

- 不是允许编造假确定性
- 不是支付 / 隐私 / 监管声明的豁免
- 不是一整套品牌系统 —— 只给**用户看得见的语言**一条脊梁

## 贡献

欢迎 PR：更硬的反模式、更好的 grep、更多来自真实站点的改前改后（抹掉密钥）。[FAIL CONDITIONS](./AGENTS.md#fail-conditions) 留在 `AGENTS.md` 里，别稀释成一篇博文。长文和改写放 `examples/`。

## 许可证

MIT

---

**别当怂逼。把话说清楚，把产品卖出去。**
