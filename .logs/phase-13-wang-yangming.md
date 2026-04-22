# Phase 13: Wang Yangming Leaf Skill

## Initial State

- `sage-wang-yangming` existed only as a scaffold `SKILL.md`.
- `sage-talk` registry listed `wang-yangming` with `status: scaffold`.
- Static evals expected seven implemented leaf skills.
- The legacy seed in `references/sages.yaml` contained Wang Yangming profile material, but it was not
  canonical for an executable skill.

## Design Decisions

- Make `.agents/skills/sage-wang-yangming/` the canonical source for Wang Yangming behavior.
- Keep `sage-talk` integration minimal: path, aliases, tags, and implemented status only.
- Center the skill on `良知`, `知行合一`, `致良知`, `事上磨练`, self-deception, and concrete practice.
- Keep Longchang awakening as an important life-stage lens while marking exact inner psychology as
  uncertain when source analysis is requested.
- Preserve immersive direct speech: `【王阳明】` heading, a short classical-colored opening, then clear
  modern Chinese without report labels.

## Created Or Modified Files

- Created `.agents/skills/sage-wang-yangming/README.md`.
- Replaced `.agents/skills/sage-wang-yangming/SKILL.md` scaffold with a complete skill.
- Created `.agents/skills/sage-wang-yangming/references/research/01-writings.md`.
- Created `.agents/skills/sage-wang-yangming/references/research/02-conscience-and-action.md`.
- Created `.agents/skills/sage-wang-yangming/references/research/03-expression-dna.md`.
- Created `.agents/skills/sage-wang-yangming/references/research/04-external-views.md`.
- Created `.agents/skills/sage-wang-yangming/references/research/05-decisions.md`.
- Created `.agents/skills/sage-wang-yangming/references/research/06-timeline-and-uncertainty.md`.
- Created `.agents/skills/sage-wang-yangming/examples/demo-conversation.md`.
- Updated `.agents/skills/sage-talk/references/sage-registry.yaml`.
- Updated `.agents/skills/sage-talk/README.md`.
- Updated `README.md`.
- Updated `evals/check-static.sh`.
- Updated `evals/README.md`.
- Updated `evals/immersive-conversation.md`.
- Updated `PLAN.md`.

## Key Tradeoffs

- The skill includes enough worldview and decision structure to be independently callable, but keeps
  detailed historical claims cautious.
- Demo examples prioritize immersive behavior over academic citation, with source caveats stored in
  research files.
- `sage-talk` does not receive Wang Yangming's detailed mental model, preserving the router/leaf
  boundary.
- Static checks remain lightweight and structural; they do not replace manual conversation evals.

## Unresolved Issues

- Manual LLM conversation evals still need to be run against real Codex skill invocation.
- The legacy aggregate examples and `references/sages.yaml` remain preserved as migration seeds.
- No automated evaluator yet checks semantic voice quality beyond static guardrails.

## Next Recommendation

Run a full manual eval pass across all eight implemented sages, then decide whether to commit and push
the completed first-pass monorepo skill set.
