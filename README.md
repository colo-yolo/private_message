# Reddit Gunpla Researcher Skill

这是一个面向项目组内部使用的 AI skill，用于辅助团队在 Reddit 上对高达/Gunpla 拼装模型玩家进行需求调研、痛点访谈、轻量概念测试和购买意愿判断。

项目背景是一个智能高达展示柜概念，重点关注：

- 动态全息或屏幕式背景展示。
- 展示柜内模型保养，例如防尘、防 UV、湿度和长期展示保护。
- 可自定义灯光展示。
- 灯光效果与背景场景联动。
- 收藏玩家对高级展示方案的真实购买意愿。

## 目录结构

```text
.
├── README.md
├── dist/
│   └── reddit-gunpla-researcher.skill
├── docs/
│   └── superpowers/specs/2026-04-30-reddit-gunpla-researcher-design.md
└── reddit-gunpla-researcher/
    ├── SKILL.md
    ├── evals/evals.json
    └── tests/validate_skill.ps1
```

## 核心文件

- `reddit-gunpla-researcher/SKILL.md`：skill 主体说明，包含触发条件、调研流程、Reddit 话术模板、问题库、概念测试方式和合规边界。
- `reddit-gunpla-researcher/evals/evals.json`：用于测试 skill 表现的典型场景，包括公开评论破冰、DM 转深访、概念测试和不合规请求改写。
- `reddit-gunpla-researcher/tests/validate_skill.ps1`：本地结构验证脚本，检查 skill 是否包含关键章节和安全边界。
- `dist/reddit-gunpla-researcher.skill`：可分发的 skill 包。
- `docs/superpowers/specs/2026-04-30-reddit-gunpla-researcher-design.md`：设计记录。
- `docs/examples/reddit-gunpla-researcher-full-case.md`：完整使用案例，演示从公开评论破冰到概念测试和调研记录的全过程。

## 使用方式

把 `reddit-gunpla-researcher/` 作为一个 AI skill 使用。典型输入包括：

- 目标 Reddit 帖子或评论的公开内容。
- 当前互动阶段：公开评论、第一条 DM、痛点共鸣后跟进、概念测试、深访或收尾。
- 想验证的假设，例如“动态背景是否有真实需求”或“玩家是否愿意为防尘和灯光联动付费”。
- 产品关注点：背景、保养、灯光、展示柜空间、价格或购买意愿。

推荐让 AI 按以下格式工作：

```text
请使用 reddit-gunpla-researcher skill。

公开上下文：
[粘贴目标用户的公开帖子/评论，或你们此前对话内容]

阶段：
[public reply / first DM / permission bridge / concept test / deep interview / close]

调研目标：
[这轮想验证的一个具体问题]

约束：
[是否禁止 DM、是否需要很短、是否要避免产品细节等]
```

## 输出内容

skill 默认会输出：

- 风险检查。
- 中文策略说明。
- 一段可直接发送的自然英文 Reddit 文字。
- 每一句话的作用解释。
- 下一轮可追问的问题。
- 结构化调研记录。

## 调研原则

这个 skill 采用透明、许可式的 Reddit 调研方式：

- 只使用公开上下文。
- 不伪装身份。
- 不批量私信。
- 不抓取用户历史记录做过度个性化。
- 不在产品调研阶段延迟披露身份。
- 在深访、概念测试、购买意愿问题前先征得对方同意。
- 尊重 subreddit 规则和版主要求。
- 对方拒绝、沉默或表现出不适时停止跟进。

这样做的目标不是降低转化率，而是避免获得带有误导性的反馈，同时降低被 Reddit 用户或版主视为 spam、self-promotion 或 astroturfing 的风险。

## 本地验证

在仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\reddit-gunpla-researcher\tests\validate_skill.ps1
```

期望输出：

```text
Skill validation passed.
```

## 适用场景

适合用于：

- 为 r/Gunpla、r/Gundam、r/modelmakers 等社区中的公开讨论撰写自然回复。
- 把普通同好聊天自然转入用户研究。
- 为智能展示柜概念做轻量测试。
- 设计深度访谈问题。
- 从对话中整理需求、痛点、购买意愿和反对理由。
- 把不合规的外联请求改写成合规版本。

不适合用于：

- 批量自动私信。
- 隐瞒项目身份进行调研。
- 抓取或分析用户非必要的历史行为。
- 绕过 subreddit 规则或版主要求。
- 设计操纵性、误导性或骚扰性的外联话术。

## 参考边界

团队在 Reddit 上执行调研前，应阅读并遵守：

- Reddit Content Policy: https://www.redditinc.com/policies/content-policy
- Reddit User Agreement: https://www.redditinc.com/policies/user-agreement
- Reddit spam 说明: https://support.reddithelp.com/hc/en-us/articles/360043504051-What-constitutes-spam
