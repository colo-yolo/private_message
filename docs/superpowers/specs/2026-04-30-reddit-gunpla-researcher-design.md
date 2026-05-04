# Reddit Gunpla Researcher Skill Design

## Goal
Create an AI-invoked skill that helps a project team conduct Reddit research for an intelligent Gunpla display cabinet by starting from display-post planning rather than direct outreach. The skill should help gate images through external search, draft natural showcase posts, maintain comment sections after the post starts to ferment, identify share-heavy commenters, and only then move into DM follow-up, concept tests, interview guides, and research notes.

## Core Product Context
The product hypothesis is a smart display cabinet for Gundam/Gunpla models with:
- Custom dynamic holographic or screen-based backgrounds.
- Model care support for dust, humidity, UV exposure, and long-term display.
- Custom lighting with scene-linked effects.
- A premium display experience for collectors who care about presentation, maintenance, and build pride.

## Recommended Research Approach
Use a display-post-first workflow with a hard image-search gate. The skill should:

- Require several uploaded images before drafting a showcase post.
- Search externally for the same base image before doing any post generation, but define "external" as non-China public internet visibility that a North America-based user would commonly encounter.
- Prioritize seller and product pages first, especially sites selling finished scenes, display cases, commission builds, or complete diorama products such as TakaraModel and Etsy listings.
- For TakaraModel- and Etsy-style priority sites, require a site-specific product-page keyword pass plus manual product-image comparison in addition to broad external search.
- Prefer Google image search or Google Lens for reverse-image checking when the environment directly supports it.
- If the environment cannot directly run Google image search or Google Lens, require the system to state that explicitly and downgrade the result to manual review rather than high-confidence clearance.
- If the user explicitly reports that Google image search or Google Lens returned no match, allow the workflow to proceed into post editing even when the current environment cannot run that step directly.
- Then prioritize legacy hobby blogs, expo coverage, repost-heavy fan media, and archive-style image posts, because these often preserve older display photos that generic search can miss.
- Strong-intercept the task if the same base image is already public in that non-China search environment.
- If no non-China public match is found, write in a natural original-player voice.
- Use weak hooks in public posts and early public comments so the thread feels like natural hobbyist discussion rather than a survey.
- Keep transparent, permission-based disclosure for deeper research, DM follow-up, concept tests, interviews, and buying-intent questions.

## Safety And Platform Boundaries
The skill must:
- Use only user-provided public context.
- Require an external image-search gate for display-post tasks.
- Stop display-post generation when the same base image is found on non-China public internet results, including cropped or lightly modified versions of the same underlying image.
- Treat matches on Etsy, eBay, Shopify storefronts, independent model shops, or finished-display seller sites as high-confidence hard blocks.
- Treat an exact match found through a TakaraModel or Etsy site-specific keyword check plus manual product-image comparison as a high-confidence hard block too.
- Do not allow a high-confidence clean pass when Google image search / Google Lens was required by policy but not directly executed in the current environment.
- Treat matches on long-running hobby blogs, expo reports, or repost-heavy fan media as hard blocks too when the same base image is visible there.
- Do not block on similar scenes alone. Similar hangars, similar lighting, or similar diorama concepts are common and are not enough without the same underlying image.
- Do not use China-only platform matches as the sole hard-block reason.
- Avoid scraping, automation, or bulk messaging instructions.
- Respect subreddit rules and moderator norms.
- Avoid repeated unsolicited DMs.
- Allow weak-hook public posting, but disclose researcher intent before deeper research questions.
- Ask for consent before concept testing, image comparison, or long interviews.
- Stop after refusal, silence, or discomfort.
- Avoid collecting private, sensitive, or identifying data unless volunteered and necessary.

## Skill Outputs
For each use, the skill should produce:
- A risk check.
- A short strategy note.
- The external image-search result when the task is a display post.
- Three to five post angles when the user has not picked one yet.
- A bilingual Reddit-ready package for display posts: subreddit, flair, image order, title, body, and first comment.
- A bilingual comment-maintenance package for live threads: short replies, high-value long replies, share-invite replies, and DM-candidate notes.
- Research notes in a structured schema.

## Conversation Flow
1. Require several user-provided images for display-post work.
2. Run an external image search or reverse image search against non-China public internet results.
3. Search seller and product pages first, and for TakaraModel- and Etsy-style sites add a site-specific product keyword pass plus manual product-image comparison, then hobby blogs and expo repost pages, then image-spread platforms, then broad search engines.
4. Strong-intercept the task if the same base image is found there.
5. If no match is found there, classify the best discussion direction: lighting, cabinet, backdrop, dust/UV, layout, or collector habit.
6. Offer 3-5 weak-hook display-post angles.
7. Build the final bilingual post package.
8. Wait around 30 minutes after posting, or until several natural comments appear.
9. Clear short comments first to raise activity.
10. Reply more thoughtfully to longer technical or experience-heavy comments.
11. Invite sharing when commenters show strong setup experience or image-sharing intent.
12. Only suggest DMs after 1-2 public exchanges.
13. Use concept testing, deep interview, and buying-intent validation later in the relationship.

## Verification
Create test prompts for:
- Strong-intercepting a display-post request when the same base image is found on TakaraModel, Etsy, an independent product page, or another non-China seller site.
- Strong-intercepting a display-post request when the same base image is found on a Blogspot hobby blog or event-report archive page.
- Generating 3-5 weak-hook display-post angles after a no-match non-China image-search result, including cases where only China-platform matches exist.
- Building a bilingual showcase post package for `/r/Gunpla`.
- Maintaining a live comment section 30 minutes after posting by answering short comments first, then longer comments.
- Rewriting an unsafe request that skips image search or jumps straight to DMs.
