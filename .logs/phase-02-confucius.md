# Phase 02: Confucius Leaf Skill

## Initial State

- `.agents/skills/sage-confucius/SKILL.md` existed only as a scaffold.
- `.agents/skills/sage-talk/references/sage-registry.yaml` marked Confucius as `scaffold`.
- The former aggregate Confucius profile remained in `references/sages.yaml` as a legacy migration seed.
- No repository-level `PLAN.md` or `.logs/` process-record convention existed.

## Design Decisions

- Implement Confucius as the first full leaf skill because he is the most common baseline for role,
  trust, learning, family, and social repair questions.
- Keep `sage-confucius/SKILL.md` concise enough for skill loading and move detailed evidence notes
  into `references/research/`.
- Use three major stage lenses: early service and ritual-order repair, wandering and frustrated
  persuasion, late teaching and textual ordering.
- Treat precise life-stage psychology as inference unless supported by stable textual or historical
  patterns.
- Update `sage-talk` only through registry status and README notes; do not copy the Confucius
  worldview into router files.

## Created Or Modified Files

- `PLAN.md`
- `.logs/README.md`
- `.logs/phase-02-confucius.md`
- `AGENTS.md`
- `.agents/skills/sage-confucius/README.md`
- `.agents/skills/sage-confucius/SKILL.md`
- `.agents/skills/sage-confucius/references/research/01-writings.md`
- `.agents/skills/sage-confucius/references/research/02-conversations.md`
- `.agents/skills/sage-confucius/references/research/03-expression-dna.md`
- `.agents/skills/sage-confucius/references/research/04-external-views.md`
- `.agents/skills/sage-confucius/references/research/05-decisions.md`
- `.agents/skills/sage-confucius/references/research/06-timeline.md`
- `.agents/skills/sage-confucius/examples/demo-conversation.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-talk/README.md`

## Key Tradeoffs

- The skill uses reliable concepts and source categories rather than long quotation blocks, reducing
  the risk of fabricated or decorative quotes.
- Research notes are separated by function instead of compressed into one profile file, making the
  next sage migrations easier to mirror.
- The router registry is intentionally lightweight and does not become a second Confucius source of truth.

## Unresolved Issues

- No machine validator exists yet for `shared/schemas/sage-profile.schema.yaml`.
- The remaining seven `sage-*` skills are still scaffolds.
- `references/sages.yaml` still contains aggregate legacy profiles and needs gradual extraction.
- Future work should decide whether each leaf skill also needs a structured `references/profile.yaml`.

## Next Recommendation

Implement `sage-laozi` next. Laozi creates a strong contrast with Confucius: subtraction/restraint
versus role repair/cultivation. That contrast will quickly test whether `sage-talk` can preserve
real disagreement in council answers.
