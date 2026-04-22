# Phase 10: Mozi Leaf Skill

## Initial State

- `sage-confucius`, `sage-laozi`, `sage-hanfeizi`, and `sage-sunzi` were implemented.
- `sage-mozi` existed only as a scaffold.
- `sage-talk` registry marked Mozi as scaffold.
- Static evals expected exactly four implemented skills.

## Design Decisions

- Implement Mozi as an independent leaf skill under `.agents/skills/sage-mozi/`.
- Keep `sage-talk` as a lightweight conversation orchestrator: it should know Mozi is callable, but
  should not own Mozi's worldview, source notes, or expression rules.
- Use Mozi for public-benefit diagnosis: affected people, harm, cost, waste, merit, evidence, and
  low-cost practical action.
- Preserve source caution: 《墨子》 is the core textual base, while Mozi's biography is sparse and the
  received text contains later Mohist layers.
- Keep immersive style: direct sage heading, plain public-benefit opening, natural modern Chinese, no
  report labels.

## Created Or Modified Files

- `.agents/skills/sage-mozi/SKILL.md`
- `.agents/skills/sage-mozi/README.md`
- `.agents/skills/sage-mozi/references/research/01-writings.md`
- `.agents/skills/sage-mozi/references/research/02-public-benefit-and-cost.md`
- `.agents/skills/sage-mozi/references/research/03-expression-dna.md`
- `.agents/skills/sage-mozi/references/research/04-external-views.md`
- `.agents/skills/sage-mozi/references/research/05-decisions.md`
- `.agents/skills/sage-mozi/references/research/06-timeline-and-uncertainty.md`
- `.agents/skills/sage-mozi/examples/demo-conversation.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-talk/README.md`
- `README.md`
- `evals/README.md`
- `evals/immersive-conversation.md`
- `evals/check-static.sh`
- `PLAN.md`
- `.logs/phase-10-mozi.md`

## Key Tradeoffs

- Mozi adds public benefit and anti-waste reasoning, but the skill explicitly avoids reducing every
  value to crude utility math.
- The skill treats `兼爱` as practical harm reduction, not sentimental universal warmth.
- The skill uses textual patterns from 《墨子》 while marking sparse biography and later Mohist layers
  as uncertain.

## Verification

- Added static checks expecting five implemented skills and confirmed they failed while Mozi was still
  scaffold.
- Implemented Mozi and updated the registry/docs/evals.
- `sh evals/check-static.sh` passed after implementation.

## Unresolved Issues

- No automated model runner or LLM judge exists.
- Three leaf skills remain scaffolds: Mencius, Zhuangzi, and Wang Yangming.
- Legacy `references/sages.yaml` remains a seed archive and still needs later extraction parity checks.

## Next Recommendation

Implement `sage-mencius` next if the goal is to deepen the Confucian side. Mencius adds moral courage,
righteousness against profit, human nature, and public-duty language that contrasts strongly with
Mozi's public utility and Han Feizi's institutional realism.
