# Phase 03: Immersive Conversation And Laozi Leaf Skill

## Initial State

- `sage-confucius` was implemented but still used a report-like default response shape.
- `sage-talk` council protocol required separated sage perspectives but did not yet define immersive conversation.
- `sage-laozi` existed only as a scaffold.
- `sage-registry.yaml` marked only Confucius as `implemented`.

## Design Decisions

- Upgrade the default user-facing style to immersive direct speech: simple sage heading, one restrained
  ancient-flavored opening, clear modern continuation, and one natural follow-up question.
- Avoid visible labels such as "今言之", "现代解释", "古意短判", "判断", or "建议" in default answers.
- Use automatic council size by complexity: fewer sages for ordinary questions, more only when needed or requested.
- Use Nuwa-style organization as a reference for leaf skills: concise `SKILL.md`, separate research notes,
  expression DNA, decision heuristics, anti-patterns, and honest boundaries.
- Implement Laozi as the first contrastive pair for Confucius: subtraction/restraint vs. role repair/cultivation.
- Treat Laozi's biography, office, departure, and authorship as uncertain; make the Dao De Jing textual
  tradition the primary reasoning source.

## Created Or Modified Files

- `PLAN.md`
- `.logs/phase-03-immersive-laozi.md`
- `README.md`
- `.agents/skills/sage-talk/SKILL.md`
- `.agents/skills/sage-talk/README.md`
- `.agents/skills/sage-talk/references/council-protocol.md`
- `.agents/skills/sage-talk/references/routing-rules.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-confucius/SKILL.md`
- `.agents/skills/sage-confucius/references/research/03-expression-dna.md`
- `.agents/skills/sage-confucius/examples/demo-conversation.md`
- `.agents/skills/sage-laozi/README.md`
- `.agents/skills/sage-laozi/SKILL.md`
- `.agents/skills/sage-laozi/references/research/01-writings.md`
- `.agents/skills/sage-laozi/references/research/02-paradox-and-non-action.md`
- `.agents/skills/sage-laozi/references/research/03-expression-dna.md`
- `.agents/skills/sage-laozi/references/research/04-external-views.md`
- `.agents/skills/sage-laozi/references/research/05-decisions.md`
- `.agents/skills/sage-laozi/references/research/06-timeline-and-uncertainty.md`
- `.agents/skills/sage-laozi/examples/demo-conversation.md`

## Key Tradeoffs

- The immersive style removes explicit explanatory labels, which improves presence but requires stronger
  examples to keep outputs clear.
- Laozi uses fewer stage lenses than Confucius because the textual tradition is more reliable than biography.
- The router now knows Laozi is callable, but it still does not store Laozi's full worldview or source notes.

## Unresolved Issues

- There is still no automated runtime harness for skill behavior tests.
- Six leaf skills remain scaffolds.
- `sage-talk` can now route Confucius and Laozi, but full multi-sage council quality will improve as more
  implemented leaf skills become available.

## Next Recommendation

Add a small eval suite for immersive outputs before implementing the third sage. The first checks should
verify that default answers do not contain report labels, that unavailable scaffold sages are not treated
as implemented, and that Confucius/Laozi produce visibly different questions.
