# Reddit Gunpla Researcher Skill

这是一个面向项目组内部使用的 AI skill，用于辅助团队在 Reddit 上围绕高达/Gunpla 展示柜场景做展示贴调研、评论区维护、轻量概念测试和后续私聊判断。

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

- `reddit-gunpla-researcher/SKILL.md`：skill 主体说明，包含搜图强拦截、展示贴策划、评论区维护、私聊前提、问题库和合规边界。
- `reddit-gunpla-researcher/evals/evals.json`：用于测试 skill 表现的典型场景，包括同底图拦截、展示贴生成、30 分钟后评论维护、分享邀请和不合规请求改写。
- `reddit-gunpla-researcher/tests/validate_skill.ps1`：本地结构验证脚本，检查 skill 是否包含关键章节和安全边界。
- `dist/reddit-gunpla-researcher.skill`：可分发的 skill 包。
- `docs/superpowers/specs/2026-04-30-reddit-gunpla-researcher-design.md`：设计记录。
- `docs/examples/reddit-gunpla-researcher-full-case.md`：完整使用案例，演示从公开评论破冰到概念测试和调研记录的全过程。

## 使用方式

把 `reddit-gunpla-researcher/` 作为一个 AI skill 使用。当前最核心的两个入口是：

- 展示贴发帖：先基于用户上传的几张图片做外网搜图。这里的“外网”指非中国地区、北美常见公开网络；而且搜索顺序有优先级，先查外网售卖成品场景箱、成品展示柜、commission build 的商品页和店铺页，特别是 `TakaraModel` 这类站点，再查 Gunpla/Gundam 老博客、展会图集、转载型资讯站，再查 Pinterest/Instagram/Reddit/YouTube 这类平台，最后才查 Google/Bing 的广义搜索结果。只有在这些结果里都没有搜到`完全命中的同底图`，才继续生成自然的展示贴方案。
- 评论区维护：帖子发出约 30 分钟后，或评论区已有数条自然评论时，优先回短评拉活跃，再处理长评和高价值分享型评论。

典型输入包括：

- 用户上传的几张 Gunpla 展示相关图片。
- 当前任务类型：展示贴策划、评论区维护、私聊判断、概念测试、深访或收尾。
- 想验证的方向，例如灯光、展示方式、背景、柜体、防尘/UV、收藏习惯。
- 目标 Reddit 帖子链接、评论区公开内容或此前对话内容。
- 约束条件，例如是否禁止 DM、是否要弱钩子、是否要避免产品细节。

推荐让 AI 按以下格式工作：

```text
请使用 reddit-gunpla-researcher skill。

任务：
[display post planning / comment maintenance / DM follow-up / concept test]

图片：
[上传几张展示相关图片]

公开上下文：
[粘贴目标帖子链接、评论区内容，或你们此前对话内容]

方向：
[lighting / display cabinet / backdrop / dust-UV / layout / no idea]

约束：
[是否禁止 DM、是否需要弱钩子、是否要避免产品细节、是否只做展示贴等]
```

## 输出内容

skill 默认会输出：

- 风险检查。
- 中文策略说明。
- 图片在非中国地区公开网络中的搜图结果与是否放行。
- 3-5 个自然的展示贴方向。
- 中英对照的最终发帖方案，包括社区、标签、图片顺序、标题、body、首评。
- 评论区维护建议，包括短评回复、长评回复、分享邀请和私聊前判断。
- 结构化调研记录。

## 调研原则

这个 skill 采用“展示贴先行 + 评论区自然发酵 + 公开互动后再深入”的 Reddit 调研方式：

- 只使用公开上下文。
- 展示贴任务必须先做外网搜图，这里的“外网”指非中国地区、北美常见公开网络。
- 搜索顺序必须优先查外网售卖成品场景箱、成品展示柜、commission build 的商品页和店铺页，例如 TakaraModel、Etsy、eBay、Shopify 独立站、成品 diorama/展示柜卖家站点。
- 对 TakaraModel、Etsy 这类重点站点，站内商品页关键词核对 + 商品图人工比对是必做项。关键词要组合机体名、场景词和图片里的显著名词，然后人工比对商品缩略图和商品大图。
- 第二层再查 Gunpla/Gundam 老博客、展会图集、转载型资讯站，例如 Blogspot、Wordpress、展会报道和长期运营的 Gunpla/Gundam 图片资讯站。
- 第三层再查 Pinterest、Instagram、Reddit、YouTube、X、Facebook、TikTok 这类图像扩散平台。
- 第四层再查 Google、Google Images、Bing 这类广义搜索引擎。若环境支持，优先使用 Google 图片搜索 / Google Lens 做图片反查。
- 只要在这类非中国公开网络里搜到完全命中的同一个底图，就直接禁止继续按原创展示贴生成。
- 如果同底图命中的是外网售卖成品场景箱或展示产品的商品页，这个命中应视为高置信度强拦截。
- 仅仅“场景很像”“产品很像”“构图接近”不作为拦截依据。
- 若当前环境无法直接执行 Google 图片搜索 / Google Lens，必须明确说明该步未完成，并将结论降级为待人工核验，不得直接给出高置信度放行。
- 例外：如果用户明确说自己已经用 Google 图片搜索 / Google Lens 搜过且没有搜到这个图，skill 可以直接进入发帖编辑阶段；只有后续又出现完全命中的同底图证据时，才改判为拦截。
- 只有明确没在这类结果里搜到同底图，才按原创玩家口吻继续。
- 中国平台上的同图结果默认不直接作为强拦截依据。
- 不伪装身份。
- 不批量私信。
- 不抓取用户历史记录做过度个性化。
- 展示贴和早期公开评论允许埋弱钩子，但不能写得像问卷或正式调研。
- 在深访、概念测试、购买意愿问题前先征得对方同意。
- 私聊必须建立在 1-2 轮公开互动之后。
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

- 为 r/Gunpla、r/modelmakers、r/dioramas 等相关社区策划展示贴。
- 先做图片查重，再生成自然、弱钩子的展示贴。
- 在帖子发出约 30 分钟后维护评论区，优先拉活跃，再做高价值互动。
- 把普通同好聊天自然转入用户研究。
- 为智能展示柜概念做轻量测试。
- 设计深度访谈问题。
- 从对话中整理需求、痛点、购买意愿和反对理由。
- 把不合规的外联请求改写成合规版本。

不适合用于：

- 跳过外网搜图直接按原创展示贴发帖。
- 在非中国公开网络里已经搜到同底图后继续生成原创口吻的帖子。
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
