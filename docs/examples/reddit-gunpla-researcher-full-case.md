# Reddit Gunpla Researcher 完整使用案例

这个案例用于演示团队如何把一个 Reddit 公开评论交给 `reddit-gunpla-researcher` skill，并得到一套可执行的调研动作：公开破冰、许可式转入、概念测试、深访问题和结构化记录。

示例内容是虚构的，不对应真实 Reddit 用户。

## 1. 团队给 AI 的输入

```text
请使用 reddit-gunpla-researcher skill。

公开上下文：
r/Gunpla 里有用户评论：
“My Detolf still gets dusty somehow, and the LED strip I added makes my RG Nu look super flat. Printed backdrops also look kind of cheap, so I just leave the shelf plain. I’m also worried about sunlight yellowing the white parts.”

阶段：
public reply

调研目标：
验证玩家是否真的同时在意防尘、灯光、背景展示和 UV 保护。

约束：
公开评论，不要像销售，不要邀请私信。
```

## 2. Skill 输出：公开破冰回复

Risk check: OK

Strategy:
这条公开回复只引用对方明确说过的痛点，不提产品，不要求 DM。目标是让对方自然展开“最痛的展示问题”。

Ready-to-send Reddit text:

```text
Yeah, that dust + flat LED look is a rough combo. I’ve been comparing Gunpla display setups lately, and it feels like normal cases solve one problem while creating another. For your Detolf setup, what’s the most annoying part day to day: cleaning access, glare/flat lighting, or keeping the kit protected from sunlight?
```

Why this works:

- “dust + flat LED look” 只引用公开评论里的具体痛点。
- “comparing Gunpla display setups” 给出轻量背景，不像销售。
- 最后是三选一问题，容易回复，也能判断核心痛点。

Next questions:

1. 如果对方说 cleaning access：追问清洁频率和最怕碰坏的部位。
2. 如果对方说 lighting：追问是 glare、shadow、color 还是 setup 麻烦。
3. 如果对方说 sunlight：追问是否已经买过 UV film、curtain 或 enclosed case。

Research notes:

- User segment: RG 收藏/展示玩家
- Current setup: Detolf + LED strip + plain shelf
- Pain points: dust, flat lighting, cheap-looking printed backdrop, sunlight/yellowing concern
- Existing workarounds: LED strip, printed backdrop abandoned
- Strong signals: 已经投入展示柜和灯光
- Weak signals: 尚未表达购买预算
- Open questions: 最核心痛点排序、是否愿意为一体化展示方案付费
- Next action: 等公开回复，不主动 DM

## 3. 假设用户回复

```text
Honestly glare and cleaning are the worst. I clean every few weeks but I hate moving kits around because decals and funnels are fragile. The lighting looks cool in photos sometimes, but in person it washes everything out.
```

## 4. 团队第二次调用

```text
请使用 reddit-gunpla-researcher skill。

阶段：
permission bridge

此前对话：
[粘贴上面的用户回复]

调研目标：
请求对方允许进入更细的问题，准备测试智能展示柜概念。
```

## 5. Skill 输出：转入许可式深聊

Risk check: OK

Ready-to-send Reddit text:

```text
That makes sense, especially with funnels and decals. Small disclosure before I ask anything more specific: I’m a Gunpla hobbyist, and I’m exploring an early display-cabinet concept around better lighting, easier care, and more interesting backdrops. I’m not selling anything here; I’m trying to avoid designing from guesses. Would you be open to a few detailed questions about what would actually be useful in a display setup? Totally fine if not.
```

Why this works:

- “funnels and decals” 承接对方刚刚说的脆弱部位。
- “Small disclosure” 在进入产品调研前透明披露身份和目的。
- “Totally fine if not” 降低压力，避免把对话变成强推。

## 6. 假设用户同意后：概念测试

Ready-to-send Reddit text:

```text
Imagine a cabinet where the kit sits in a protected display space, while the background and lighting can switch together between scenes like a hangar, space battle, or neutral photo mode. The goal would be less “screen gimmick” and more making one favorite build feel staged without needing a full handmade diorama.

For your setup, which part would matter most?
1. Less dust and safer cleaning access
2. Lighting that makes details look better in person
3. A background that looks better than printed inserts
4. UV/sunlight protection
5. Scene-linked lighting for photos
```

Follow-up:

```text
Also, what would make this feel cheap or annoying instead of premium?
```

Why this works:

- 描述最终效果，不解释技术实现，避免让用户评价一个尚未成型的工程方案。
- 同时测试防尘、灯光、背景、UV、拍照效果的优先级。
- 追问“cheap or annoying”可以提前暴露反对理由。

## 7. 深访问题组

```text
1. Which kit would you put in this first, and why that one?
2. What do you currently spend on display upgrades: cases, LEDs, risers, backgrounds, UV film, or diorama parts?
3. What would be an immediate deal breaker: price, heat, noise, cables, app control, cleaning access, or cabinet size?
4. Would you prefer one premium “hero kit” bay, or a larger cabinet for multiple kits?
5. What proof would you need before trusting it with painted or topcoated kits?
6. If it solved your top two display problems, what price range would feel worth considering?
```

## 8. 调研记录示例

```markdown
- Reddit context: User complained about Detolf dust, flat LED lighting, cheap printed backdrops, sunlight yellowing.
- Segment: Display-focused RG collector
- Kit types/scales: RG, example kit RG Nu
- Display setup: Detolf + LED strip + plain shelf
- Main pain: Glare/washed-out lighting and risky cleaning
- Workaround: LED strip; stopped using printed backdrops
- Desired outcome: Better in-person lighting, safer cleaning, protection for fragile parts
- Concept reaction: Needs testing after consent
- Care concerns: Decals, funnels, yellowing, dust
- Lighting concerns: Glare, flat look, washed-out details
- Purchase trigger: Protect fragile favorite kits while improving display quality
- Deal breakers: Unknown; ask about heat, cables, price, app control
- Price anchor: Unknown
- Quote-worthy phrase: “I hate moving kits around because decals and funnels are fragile.”
- Confidence: Medium
- Next action: Run concept ranking, then ask price/proof requirements
```

## 9. 使用判断

这个案例说明 skill 的目标不是直接提高私信转化，而是让团队在 Reddit 上获得更可信的调研反馈：

- 先在公开评论中低压参与，不主动拉私信。
- 在进入产品调研前透明披露身份和目的。
- 只基于对方公开表达过的痛点提问。
- 用概念测试验证需求优先级，而不是直接问“你会不会买”。
- 用结构化记录区分强信号、弱信号、购买触发点和待验证假设。
