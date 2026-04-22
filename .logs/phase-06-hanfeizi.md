# Phase 06: Han Feizi Leaf Skill

## Initial State

- `sage-confucius` and `sage-laozi` were implemented.
- `sage-hanfeizi` existed as a scaffold target and had a legacy seed in `references/sages.yaml`.
- `sage-talk` registry still marked Han Feizi as scaffold.
- Static evals expected exactly two implemented skills.

## Design Decisions

- Implement Han Feizi as an independent leaf skill under `.agents/skills/sage-hanfeizi/`.
- Keep `sage-talk` as a lightweight router: it should know Han Feizi is callable, but should not own
  his worldview, source notes, or expression rules.
- Use Han Feizi mainly for institutional diagnosis: power, incentives, enforceability, role/result
  mismatch, evidence, and risk under asymmetry.
- Preserve historical caution: `《韩非子》` is the core textual base, with chapter-authenticity and
  compilation debates; `《史记·老子韩非列传》` provides broad biographical framing only.
- Keep immersive conversation style: short ancient-flavored opening, natural modern Chinese after
  that, no visible translation/report labels.

## Created Or Modified Files

- `.agents/skills/sage-hanfeizi/SKILL.md`
- `.agents/skills/sage-hanfeizi/README.md`
- `.agents/skills/sage-hanfeizi/references/research/01-writings.md`
- `.agents/skills/sage-hanfeizi/references/research/02-power-and-institutions.md`
- `.agents/skills/sage-hanfeizi/references/research/03-expression-dna.md`
- `.agents/skills/sage-hanfeizi/references/research/04-external-views.md`
- `.agents/skills/sage-hanfeizi/references/research/05-decisions.md`
- `.agents/skills/sage-hanfeizi/references/research/06-timeline.md`
- `.agents/skills/sage-hanfeizi/examples/demo-conversation.md`
- `.agents/skills/sage-talk/references/sage-registry.yaml`
- `.agents/skills/sage-talk/README.md`
- `README.md`
- `evals/README.md`
- `evals/immersive-conversation.md`
- `evals/check-static.sh`
- `PLAN.md`
- `.logs/phase-06-hanfeizi.md`

## Key Tradeoffs

- The skill is intentionally cold and structural, but its boundary rules prevent it from becoming
  cruelty, legal advice, or a total life philosophy.
- The router gains only routing metadata so council answers can select Han Feizi without making
  `sage-talk` a second persona source.
- Manual evals now include a three-sage council case, while unsupported-sage guarding moves to Sunzi.

## Unresolved Issues

- There is still no automated model runner or LLM judge.
- Five leaf skills remain scaffolds: Mencius, Zhuangzi, Mozi, Sunzi, and Wang Yangming.
- Legacy `references/sages.yaml` remains a seed archive and still needs later extraction parity checks.

## Verification

- `sh evals/check-static.sh` passes with three implemented skills.
- A targeted grep found no forbidden report labels in `sage-hanfeizi/examples/`.
- A targeted grep found no Han Feizi persona-detail phrases copied into `sage-talk`.

## Next Recommendation

Implement `sage-sunzi` next if the goal is to expand practical decision coverage. Sunzi complements
Han Feizi without overlapping it: Han Feizi diagnoses internal制度 and incentives, while Sunzi can own
competition, timing, cost, terrain, and winning without direct conflict.
