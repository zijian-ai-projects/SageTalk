# Phase 09: Sunzi Leaf Skill

## Initial State

- `sage-confucius`, `sage-laozi`, and `sage-hanfeizi` were implemented.
- `sage-sunzi` existed only as a scaffold.
- `sage-talk` registry marked Sunzi as scaffold.
- Static evals expected exactly three implemented skills.

## Design Decisions

- Implement Sunzi as an independent leaf skill under `.agents/skills/sage-sunzi/`.
- Keep `sage-talk` as a lightweight conversation orchestrator: it should know Sunzi is callable, but
  should not own Sunzi's worldview, source notes, or expression rules.
- Use Sunzi for strategic diagnosis: objective, terrain, timing, cost, intelligence, weak points,
  indirect route, and whether direct conflict is necessary.
- Preserve source caution: 《孙子兵法》 is the core textual base, while Sun Wu biography and text
  formation are debated.
- Keep the immersive style: direct sage heading, restrained strategic opening, natural modern Chinese,
  no report labels.

## Created Or Modified Files

- `.agents/skills/sage-sunzi/SKILL.md`
- `.agents/skills/sage-sunzi/README.md`
- `.agents/skills/sage-sunzi/references/research/01-writings.md`
- `.agents/skills/sage-sunzi/references/research/02-strategy-and-cost.md`
- `.agents/skills/sage-sunzi/references/research/03-expression-dna.md`
- `.agents/skills/sage-sunzi/references/research/04-external-views.md`
- `.agents/skills/sage-sunzi/references/research/05-decisions.md`
- `.agents/skills/sage-sunzi/references/research/06-timeline-and-uncertainty.md`
- `.agents/skills/sage-sunzi/examples/demo-conversation.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-talk/README.md`
- `README.md`
- `evals/README.md`
- `evals/immersive-conversation.md`
- `evals/check-static.sh`
- `PLAN.md`
- `.logs/phase-09-sunzi.md`

## Key Tradeoffs

- Sunzi adds a competitive strategy voice, but the skill explicitly prevents over-militarizing intimate
  or ethical situations.
- The skill uses Art of War textual patterns without pretending Sun Wu's biography is fully settled.
- Static evals now require four implemented skills, increasing protection against registry drift.

## Verification

- Added static checks expecting four implemented skills and confirmed they failed while Sunzi was still
  scaffold.
- Implemented Sunzi and updated the registry/docs/evals.
- `sh evals/check-static.sh` passed after implementation.

## Unresolved Issues

- No automated model runner or LLM judge exists.
- Four leaf skills remain scaffolds: Mencius, Zhuangzi, Mozi, and Wang Yangming.
- Legacy `references/sages.yaml` remains a seed archive and still needs later extraction parity checks.

## Next Recommendation

Implement `sage-mozi` next if the goal is to add a public-benefit and anti-waste voice. Mozi contrasts
well with Sunzi: Sunzi asks how to win with acceptable cost; Mozi asks whether the action benefits
people broadly and avoids waste or aggression.
