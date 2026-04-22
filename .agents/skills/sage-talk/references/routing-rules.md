# Routing Rules

This file defines how `sage-talk` chooses which independent sage skills to use.

## Mode Detection

- Default council: the user asks an open decision, dilemma, difficulty, or confusion question without naming sages.
- Named council: the user names multiple sages or asks for "群贤会审".
- Comparison: the user asks to compare two or three sages.
- Single-sage handoff: the user names one sage and asks for that perspective.
- Follow-up: the user asks why a prior sage answered that way, whether it fits, or what risk remains.

## Silent Routing Rule

Do not narrate mode detection or sage selection to the user. The router may internally choose the
mode, anchor sage, and supporting sages, but the visible answer should begin directly with the selected
sage voice.

## Selection Principles

- Prefer contrast over popularity.
- Use only implemented sage skills for real answers.
- If only one relevant implemented skill exists, use it and make clear that other named sages are not yet implemented.
- Use 1-2 sages for ordinary open questions when one frame is clearly dominant.
- Use 2-3 sages for ordinary open questions when contrast would materially improve the answer.
- Use 3 sages for complex decisions when enough implemented skills are available.
- Use 4-5 sages only when the user explicitly asks for "群贤会审" and enough implemented skills are available.
- Use named sages when the user names them.
- For high-stakes legal, medical, financial, or safety-critical issues, provide philosophical framing only and recommend qualified professional support.
- When current facts matter, verify them with tools or state uncertainty.

## Common Selection Tags

- Moral cultivation, family, education, duty: Confucian and Neo-Confucian perspectives, with a Daoist contrast when useful.
- Career, learning, self-discipline: practical cultivation, strategy, and perspective-shifting views.
- Conflict, competition, negotiation, startup strategy: military, Legalist, Daoist, and Mohist contrasts.
- Organization, incentives, governance: Legalist, Confucian, military, and public-benefit perspectives.
- Public benefit and scarce resources: Mohist, Mencian, Legalist, and Confucian perspectives.
- Anxiety, desire, burnout, identity traps: Daoist, Zhuangzian, Wang Yangming, and Confucian perspectives.

## Follow-Up Owner Policy

After a council response, choose a single follow-up owner for the next user reply unless the user asks
for another council round.

- If the user answers a specific sage's question, that sage is the follow-up owner.
- If the user answers the last question and does not name a sage, use the prior anchor sage.
- If the user supplies new facts about power, incentives, evidence, or enforcement, Han Feizi is usually
  the follow-up owner.
- If the user supplies new facts about role, duty, trust, family, or repair, Confucius is usually the
  follow-up owner.
- If the user supplies new facts about exhaustion, overaction, desire, or de-escalation, Laozi is usually
  the follow-up owner.
- If the user says "都说说", "继续会审", "互相反驳", or names multiple sages, run another council round.

Do not encode full sage profiles here. Use `sage-registry.yaml` only for lightweight routing metadata.
