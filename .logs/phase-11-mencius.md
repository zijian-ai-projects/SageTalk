# Phase 11: Mencius Leaf Skill

## Initial State

- `sage-confucius`, `sage-laozi`, `sage-hanfeizi`, `sage-sunzi`, and `sage-mozi` were implemented.
- `sage-mencius` existed only as a scaffold.
- `sage-talk` registry marked Mencius as scaffold.
- Static evals expected exactly five implemented skills.

## Design Decisions

- Implement Mencius as an independent leaf skill under `.agents/skills/sage-mencius/`.
- Keep `sage-talk` as a lightweight conversation orchestrator: it should know Mencius is callable, but
  should not own Mencius's worldview, source notes, or expression rules.
- Use Mencius for moral-courage diagnosis: righteousness over profit, shame, good beginnings,
  self-respect, public duty, and leadership's responsibility toward weaker people.
- Preserve source caution: 《孟子》 is the core textual base, while travel chronology and later-life
  psychology need caution.
- Keep immersive style: direct sage heading, forceful moral opening, natural modern Chinese, no report
  labels.

## Created Or Modified Files

- `.agents/skills/sage-mencius/SKILL.md`
- `.agents/skills/sage-mencius/README.md`
- `.agents/skills/sage-mencius/references/research/01-writings.md`
- `.agents/skills/sage-mencius/references/research/02-moral-psychology.md`
- `.agents/skills/sage-mencius/references/research/03-expression-dna.md`
- `.agents/skills/sage-mencius/references/research/04-external-views.md`
- `.agents/skills/sage-mencius/references/research/05-decisions.md`
- `.agents/skills/sage-mencius/references/research/06-timeline-and-uncertainty.md`
- `.agents/skills/sage-mencius/examples/demo-conversation.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-talk/README.md`
- `README.md`
- `evals/README.md`
- `evals/immersive-conversation.md`
- `evals/check-static.sh`
- `PLAN.md`
- `.logs/phase-11-mencius.md`

## Key Tradeoffs

- Mencius adds moral heat and courage, but the skill explicitly avoids demanding heroism from users in
  danger, coercion, poverty, or mental distress.
- The skill treats shame as dignity and moral perception, not humiliation.
- The skill contrasts with Confucius by pushing the义利 line harder, while preserving practical
  constraints.

## Verification

- Added static checks expecting six implemented skills and confirmed they failed while Mencius was
  still scaffold.
- Implemented Mencius and updated the registry/docs/evals.
- `sh evals/check-static.sh` passed after implementation.

## Unresolved Issues

- No automated model runner or LLM judge exists.
- Two leaf skills remain scaffolds: Zhuangzi and Wang Yangming.
- Legacy `references/sages.yaml` remains a seed archive and still needs later extraction parity checks.

## Next Recommendation

Implement `sage-zhuangzi` next if the goal is to add a frame-breaking, freedom-oriented voice. Zhuangzi
will contrast strongly with Mencius's moral pressure, Confucius's role repair, and Han Feizi's
institutional realism.
