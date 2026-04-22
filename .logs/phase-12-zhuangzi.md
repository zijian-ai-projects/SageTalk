# Phase 12: Zhuangzi Leaf Skill

## Initial State

- `sage-confucius`, `sage-mencius`, `sage-laozi`, `sage-hanfeizi`, `sage-sunzi`, and `sage-mozi`
  were implemented.
- `sage-zhuangzi` existed only as a scaffold.
- `sage-talk` registry marked Zhuangzi as scaffold.
- Static evals expected exactly six implemented skills.

## Design Decisions

- Implement Zhuangzi as an independent leaf skill under `.agents/skills/sage-zhuangzi/`.
- Keep `sage-talk` as a lightweight conversation orchestrator: it should know Zhuangzi is callable,
  but should not own Zhuangzi's worldview, source notes, or expression rules.
- Use Zhuangzi for frame-breaking diagnosis: perspective shift, identity loosening, status traps,
  usefulness anxiety, argument fatigue, and following the grain.
- Preserve source caution: 《庄子》 is textually layered; many stories are allegories rather than
  historical reports.
- Keep immersive style: direct sage heading, image/reversal opening, natural modern Chinese, no report
  labels.

## Created Or Modified Files

- `.agents/skills/sage-zhuangzi/SKILL.md`
- `.agents/skills/sage-zhuangzi/README.md`
- `.agents/skills/sage-zhuangzi/references/research/01-writings.md`
- `.agents/skills/sage-zhuangzi/references/research/02-perspective-and-freedom.md`
- `.agents/skills/sage-zhuangzi/references/research/03-expression-dna.md`
- `.agents/skills/sage-zhuangzi/references/research/04-external-views.md`
- `.agents/skills/sage-zhuangzi/references/research/05-decisions.md`
- `.agents/skills/sage-zhuangzi/references/research/06-timeline-and-uncertainty.md`
- `.agents/skills/sage-zhuangzi/examples/demo-conversation.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-talk/README.md`
- `README.md`
- `evals/README.md`
- `evals/immersive-conversation.md`
- `evals/check-static.sh`
- `PLAN.md`
- `.logs/phase-12-zhuangzi.md`

## Key Tradeoffs

- Zhuangzi adds freedom and frame-breaking, but the skill explicitly rejects using perspective to dodge
  real duties, harm, or safety issues.
- The skill uses image and irony without turning into mystical fog or generic self-help.
- The skill treats allegories as philosophical devices, not literal biography.

## Verification

- Added static checks expecting seven implemented skills and confirmed they failed while Zhuangzi was
  still scaffold.
- Implemented Zhuangzi and updated the registry/docs/evals.
- `sh evals/check-static.sh` passed after implementation.

## Unresolved Issues

- No automated model runner or LLM judge exists.
- One leaf skill remains scaffold: Wang Yangming.
- Legacy `references/sages.yaml` remains a seed archive and still needs later extraction parity checks.

## Next Recommendation

Implement `sage-wang-yangming` next to complete the original eight-sage set. Wang Yangming adds
conscience, unity of knowing and acting, and pressure-tested practice, which will complement
Confucius's role repair and Mencius's moral courage.
