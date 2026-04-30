# Reddit Gunpla Researcher Skill Design

## Goal
Create an AI-invoked skill that helps a project team conduct Reddit research for an intelligent Gunpla display cabinet. The skill should help draft natural outreach, comment replies, DM follow-ups, concept tests, interview guides, and research notes around display backgrounds, model care, lighting, and scene-linking effects.

## Core Product Context
The product hypothesis is a smart display cabinet for Gundam/Gunpla models with:
- Custom dynamic holographic or screen-based backgrounds.
- Model care support for dust, humidity, UV exposure, and long-term display.
- Custom lighting with scene-linked effects.
- A premium display experience for collectors who care about presentation, maintenance, and build pride.

## Recommended Research Approach
Use a transparent, permission-based interview workflow. The skill should avoid delayed identity disclosure, fake intimacy, mass outreach, or any wording that feels like sales. It should let the researcher sound like a real hobbyist while clearly disclosing that they are exploring a personal/product concept before asking for deeper feedback.

## Safety And Platform Boundaries
The skill must:
- Use only user-provided public context.
- Avoid scraping, automation, or bulk messaging instructions.
- Respect subreddit rules and moderator norms.
- Avoid repeated unsolicited DMs.
- Disclose researcher intent before deeper research questions.
- Ask for consent before concept testing, image comparison, or long interviews.
- Stop after refusal, silence, or discomfort.
- Avoid collecting private, sensitive, or identifying data unless volunteered and necessary.

## Skill Outputs
For each use, the skill should produce:
- A risk check.
- A short strategy note.
- A ready-to-send Reddit message or comment in English.
- The reason each line is there.
- Follow-up question options.
- Research notes in a structured schema.

## Conversation Flow
1. Public context analysis.
2. Break-the-ice with a specific, non-creepy reference.
3. Pain-point resonance around display, dust, lighting, backdrop, space, or maintenance.
4. Early light disclosure of hobbyist/product exploration.
5. Permission request for deeper feedback.
6. Lightweight concept testing with outcome-first descriptions.
7. Deep interview questions.
8. Buying-intent and constraint validation.
9. Thank-you and graceful close.

## Verification
Create test prompts for:
- Public comment outreach after a user discusses dust and display cases.
- DM follow-up after two pain-point exchanges.
- Concept testing for holographic backgrounds and linked lighting.
- Rewriting an unsafe request that asks for hidden identity or mass outreach.
