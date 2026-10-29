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
| [`AGENTS.md`](./AGENTS.md) | 硬执行合同 —— 贴到仓库根目录或 `~/.codex/` |
| [`skills/have-a-spine/SKILL.md`](./skills/have-a-spine/SKILL.md) | 技能配方，agent 可以 `@` / 加载 |
| [`examples/`](./examples/) | 改前改后 + 按页面类型的改写模板 |
| [`check/grep-check.sh`](./check/grep-check.sh) | 怂话打到访客路径上时，CI / 本地检查直接失败 |

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
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/grep-check.sh -o /tmp/spine-check.sh
curl -fsSL https://raw.githubusercontent.com/NICKLING017/no-disclaimer-slop/main/check/banned-phrases.txt -o /tmp/banned-phrases.txt
# 把 banned-phrases.txt 放到脚本旁边的 ../check/，或改路径，然后：
bash check/grep-check.sh app/ components/ src/
```

非零退出 = 访客路径上还有怂话（条款 / 隐私 / 来源页在白名单里）。

## 一屏规则

1. **给每句文案分类**：`visitor` | `support` | `legal`。
2. **访客面**（首屏、CTA、卡片、定价）：把事实说死。禁止条件反射式打太极。
3. **每个版块最多一行诚实标记**（`Checked DATE · sources`）—— 不要堆一串「我们本人并没有……」。
4. **真不知道** → 一个具体缺口 + 下一步。不要每句话都起雾。
5. **法律免责留在条款 / FAQ。** 绝不要贴进首屏。
6. **有骨气 ≠ 撒谎。** 没有证据 → 把限度说一次，然后停止打太极。

**访客面上默认禁词：**  
`may` / `might` / `results vary` / `not guaranteed` / `for reference only` / `AI can be wrong` / `可能` / `不保证` / `仅供参考` / `结果因人而异`（刷屏）/ 标题上的 `未经验证`……

完整合同：[`AGENTS.md`](./AGENTS.md)。

## 改前 → 改后

```diff
- Same scene. A new lead. Results vary with your photo.
+ Same scene. Your photo in the lead. Play both to compare.
  (variance once in FAQ)

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

欢迎 PR：更硬的反模式、更好的 grep、更多来自真实站点的改前改后（抹掉密钥）。`AGENTS.md` 保持大约 200 行以内的*合同*，长文放 `examples/`。

## 许可证

MIT

---

**别当怂逼。把话说清楚，把产品卖出去。**
