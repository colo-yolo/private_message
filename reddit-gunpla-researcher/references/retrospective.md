## Retrospective Tasks

Use this reference when the user asks for comment retrospective, DM retrospective, comment-log cleanup, user-record consolidation, or any request that turns screenshots into table-ready user records.

Treat the target output as two concrete tables, not a loose narrative:

- `用户主表`
- `沟通记录表`

Always keep the order:

1. Confirm the retrospective type.
2. Check for missing evidence.
3. Identify the user from screenshots first, not from the post link alone.
4. Draft the user master record.
5. Draft the communication records.
6. End with a short value judgment and next step only after both tables are complete.

The post link is used to anchor the source context and the origin thread. It is not enough by itself to identify a user unless the user is also visible in the screenshot or clearly named by the human.

## Trigger Phrases

Treat these requests as retrospective tasks:

- `评论复盘`
- `复盘评论区`
- `整理评论记录`
- `私信复盘`
- `整理 DM 记录`
- `根据截图写用户记录`
- `帮我写用户主表`
- `帮我写沟通记录`

Map them as follows:

- Comment retrospective: public-thread screenshots plus a post link.
- DM retrospective: DM screenshots plus the origin post link that first surfaced the user.

The default expectation is not "write a retrospective paragraph." The default expectation is "fill the user master table first, then fill the communication log table."

## Required Inputs

### Comment Retrospective

Ask for:

- Post link
- Comment screenshots

Prefer screenshots that clearly show:

- Username
- User comment
- Team reply
- Enough surrounding context to tell whether the interaction was useful

Remind the human that the post link is used to anchor the `来源帖子链接` field, while the screenshots are used to locate the specific user and reconstruct the exchange.

If the screenshot does not show the username clearly, say:

```text
I can draft the record, but the username or user ID will need to stay as 待分配 until a clearer screenshot is provided.
```

### DM Retrospective

Ask for:

- Origin post link
- DM screenshots

Prefer screenshots that clearly show:

- Username or handle
- User messages
- Team replies
- Message order

Remind the human that the origin post link is used to anchor where the user first came from, while the DM screenshots are used to reconstruct the user record and the communication log.

If the screenshots show only part of the exchange, mark uncertain fields as `待判断`.

## Extraction Rules

Extract only what is supported by the screenshots or the human's written context. Do not invent:

- Exact dates
- Pain points
- User level
- Conversion intent
- Relationship stage

If a field is not directly supported, use a conservative placeholder:

- `待分配` for missing IDs
- `待判断` for uncertain classification fields
- `缺失` for a missing post link or missing source field

## 用户主表

Use this exact structure:

- 用户ID
- 用户名
- 首次接触时间
- 来源帖子链接
- 用户需求
- 用户等级
- 当前状态
- 核心痛点
- 是否转化
- 备注

### Field Mapping

#### 用户ID

Use the existing known ID if the human provides one or if prior records already map this username.

If there is no reliable ID yet, output:

```text
待分配
```

#### 用户名

Use the Reddit username or DM-visible handle from the screenshot exactly as shown.

#### 首次接触时间

Use this rule:

- Comment retrospective: use the date of the first visible or user-stated comment interaction.
- DM retrospective: if the screenshots or context show an earlier public-thread interaction, keep that earlier date. Otherwise use the first visible DM date.

If there is no visible date in the screenshot and the human did not provide one, output `待判断`.

#### 来源帖子链接

Use the supplied post link. If the human did not provide it yet, output `缺失`.

#### 用户需求

Write only the needs explicitly implied by the user's own words.

Good examples:

- 想更真实地预览 custom / recolor 效果
- 想提升展示 / diorama / cinematic 氛围
- 想优化 shelf 展示与主题统一性

Avoid broad filler such as `对产品感兴趣`.

#### 用户等级

Use these standards:

- `高价值`: clear need, repeated engagement, and concept-level interest or actionable pain
- `中高价值`: meaningful pain or curiosity with some willingness to discuss, but not yet deep
- `普通`: light reaction, single exchange, or weak signal only
- `待判断`: evidence is too thin

#### 当前状态

Use one of:

- `仅评论互动`
- `已建立持续沟通`
- `已进入产品讨论`
- `待继续验证`
- `低优先级观察`
- `待判断`

Comment retrospective defaults:

- If only one useful public exchange exists: `仅评论互动`
- If multiple public exchanges exist with clear depth: `待继续验证` or `已建立持续沟通`

DM retrospective defaults:

- If the user is already in active private exchange: `已建立持续沟通`
- If the screenshots show concept discussion or product reaction: `已进入产品讨论`

#### 核心痛点

Write the concrete obstacle or dissatisfaction, not a theme label.

Good examples:

- 现有 line art 配色方案不够真实，且难找素材
- display setup 太依赖手动 improvisation
- 普通展示柜缺少主题感和 cinematic 呈现

#### 是否转化

Use this as pipeline intent, not paid conversion.

Allowed values:

- `潜在用户`
- `高意向用户`
- `未判断`
- `非目标用户`

#### 备注

Use this for short synthesis only:

- concept reactions
- notable constraints
- promising follow-up angle

## 沟通记录表

### Comment Retrospective Record

For comment retrospective, use this exact structure:

- 用户ID
- 用户内容
- 我们回复
- 用户情绪

#### 用户情绪

Use:

- `Positive`
- `Neutral`
- `Negative`
- `Mixed`
- `待判断`

### DM Retrospective Record

For DM retrospective, use this exact structure:

- 用户主表ID
- 用户名
- 沟通类型
- 用户内容
- 我们回复
- 用户情绪
- 是否有效互动

#### 沟通类型

Use short labels such as:

- `DM 开场`
- `DM 深聊`
- `Pain Point 调研`
- `产品反馈`
- `概念展示`
- `Display 调研`
- `用户洞察`
- `概念验证`

#### 是否有效互动

Use:

- `是`
- `否`
- `待判断`

Mark it as `是` when the user reveals a real workflow, a concrete pain point, a concept reaction, a comparison, or a next-step-worthy preference.

## Output Order

Always output retrospectives in this order:

```markdown
Risk check: OK / Need more input

Task:
[Comment retrospective / DM retrospective]

Missing input check:
- Post link / Origin post link:
- Screenshot status:
- Record confidence:

用户主表:
- 用户ID:
- 用户名:
- 首次接触时间:
- 来源帖子链接:
- 用户需求:
- 用户等级:
- 当前状态:
- 核心痛点:
- 是否转化:
- 备注:

沟通记录表:
1.
- [...]

Summary:
- 这名用户的价值判断:
- 当前所处阶段:
- 下一步建议:
```

Always place `用户主表` before `沟通记录表`.
Do not invert that order.

## Comment Retrospective Workflow

Follow this sequence:

1. Ask for the post link and comment screenshots if missing.
2. Identify the user from the screenshots.
3. Extract the user content and the team's reply.
4. Infer sentiment conservatively from wording and reaction.
5. Draft the `用户主表`.
6. Draft one or more `沟通记录表` rows using the comment-retrospective structure.
7. End with a short recommendation:
   - keep warming in public
   - move toward a share-invite
   - flag for possible DM later
   - low-priority observation only

## DM Retrospective Workflow

Follow this sequence:

1. Ask for the origin post link and DM screenshots if missing.
2. Identify the user from the screenshots.
3. Break the DM into meaningful turns.
4. Label each turn with a communication type.
5. Draft the `用户主表`.
6. Draft one or more `沟通记录表` rows using the DM-retrospective structure.
7. End with a short recommendation:
   - continue product discussion
   - validate pain point depth
   - show concept material
   - test conversion intent
   - pause and observe

## Quality Rules

- Do not write a generic retrospective paragraph and forget the tables.
- Do not output `沟通记录表` before `用户主表`.
- Do not infer a specific pain point from a vague compliment alone.
- Do not mark a user as `高价值` or `高意向用户` without evidence of real need or repeated engagement.
- Do not treat a post link as proof of user identity without screenshot support.
- If the user asks for a retrospective but provides no screenshots, explicitly request them before proceeding.
- For comment retrospective, prefer one `沟通记录表` row per meaningful public exchange.
- For DM retrospective, prefer one `沟通记录表` row per meaningful DM turn or stage rather than one row for the entire conversation.
