# Phase 07: Immersive Routing And Follow-Up Ownership

## Initial State

- A real test conversation showed router meta-talk before the actual sage answer:
  `我会按 SageTalk 路由...`.
- Han Feizi's answer style worked well.
- Confucius still leaked report-like phrasing and visible stage caveats, such as
  `阶段细节多为推断`.
- Multi-sage answers had no clear rule for which sage should continue after the user answered one of
  several questions.

## Design Decisions

- Use silent routing: `sage-talk` may choose sages internally, but user-facing answers should begin
  directly with a sage heading and voice.
- Keep default headings simple: `【孔子】`, `【老子】`, `【韩非子】`. Stage labels and inference caveats are
  reserved for explicit source-analysis or historical-staging requests.
- Make each sage speak directly. Avoid third-person phrases like `孔子会先问`, `韩非子会说`, or
  `从孔子的角度`.
- Add follow-up ownership: after a council answer, the next user reply should usually be handled by
  one sage, not all sages again.
- Use an internal anchor sage so the last question gives the user a natural default path.

## Created Or Modified Files

- `.agents/skills/sage-talk/SKILL.md`
- `.agents/skills/sage-talk/references/council-protocol.md`
- `.agents/skills/sage-talk/references/routing-rules.md`
- `.agents/skills/sage-confucius/SKILL.md`
- `.agents/skills/sage-confucius/references/research/03-expression-dna.md`
- `.agents/skills/sage-confucius/examples/demo-conversation.md`
- `evals/check-static.sh`
- `evals/immersive-conversation.md`
- `PLAN.md`
- `.logs/phase-07-immersive-routing.md`

## Key Tradeoffs

- Removing visible stage labels improves immersion, but stage-aware reasoning is still retained
  internally inside the single-sage skill.
- Silent routing makes the answer feel more natural, but implementation status should still be visible
  when the user asks for an unavailable sage.
- Choosing one follow-up owner avoids repetitive council rounds, while still allowing the user to ask
  for all sages to respond again.

## Verification

- Added static checks first and confirmed they failed on the observed Confucius stage-caveat leak.
- Updated router and Confucius rules.
- `sh evals/check-static.sh` then passed.

## Unresolved Issues

- There is still no automated model runner to execute real prompts against an LLM.
- Manual evals describe expected behavior, but actual model compliance still depends on skill loading
  and runtime context.
- The remaining scaffold sages still need their own direct-speech guardrails when implemented.

## Next Recommendation

Run the user's exact prompt again:

```text
我是负责人但没有决策权，出了问题却让我背锅怎么办？
```

The expected result is a direct answer beginning with a sage heading, no router preface, Confucius
using `【孔子】`, and the next user reply being continued by the sage whose question was answered.
