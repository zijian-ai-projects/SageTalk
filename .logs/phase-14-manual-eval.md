# Phase 14: Manual Conversation Evaluation

## Initial State

- All original eight leaf skills were implemented in `.agents/skills/`.
- `evals/immersive-conversation.md` contained 14 manual conversation cases covering silent routing,
  single-sage routing, multi-sage contrast, unavailable sages, and follow-up ownership.
- There was no automated LLM judge or separate runtime harness; evaluation in this phase is a
  repository-level protocol audit plus static checks.

## Design Decisions

- Treat this as an acceptance pass, not a rewrite phase.
- Preserve the split between `sage-talk` orchestration and leaf-skill persona ownership.
- Record conclusions and gaps without embedding long generated transcripts.
- Use `evals/check-static.sh` as the objective gate, and use the manual cases as qualitative
  conversation criteria.

## Manual Eval Findings

| Case | Focus | Result | Notes |
| --- | --- | --- | --- |
| 1 | Role and authority | Pass by protocol | Han Feizi/Confucius routing remains covered; no router preface allowed. |
| 2 | Burnout and overcontrol | Pass by protocol | Laozi skill owns subtraction and non-coercive action. |
| 3 | Family responsibility | Pass by protocol | Confucius skill distinguishes duty from pressure. |
| 4 | Conflict escalation | Pass by protocol | Laozi skill covers over-explanation and disturbance reduction. |
| 5 | Three-sage council | Pass by protocol | Named council uses implemented Confucius, Laozi, and Han Feizi. |
| 6 | Debate follow-up | Pass by protocol | Council protocol preserves disagreement and natural invitation. |
| 7 | Sunzi council request | Pass by protocol | Sunzi and Confucius are implemented and contrast strategy vs role ethics. |
| 8 | Mozi and Sunzi contrast | Pass by protocol | Public benefit vs strategic cost distinction is explicit in skill docs. |
| 9 | Mencius and Mozi contrast | Pass by protocol | Moral integrity vs harm accounting is represented. |
| 10 | Zhuangzi and Mencius contrast | Pass by protocol | Frame-breaking vs moral courage is represented. |
| 11 | Wang Yangming and Zhuangzi contrast | Pass by protocol | Action through conscience vs loosening the frame is represented. |
| 12 | Unavailable sage request | Pass by protocol | Xunzi is not in the implemented registry and should not be voiced as a repo skill. |
| 13 | Silent routing and direct speech | Pass by static gate | Router has first-visible-token and no-preface guardrails. |
| 14 | Follow-up ownership | Pass by static gate | Council protocol has follow-up owner rules. |

## Created Or Modified Files

- Updated `PLAN.md`.
- Created `.logs/phase-14-manual-eval.md`.

## Key Tradeoffs

- This phase does not claim a separate model-run transcript. It verifies the repository protocol and
  static guardrails that govern skill behavior.
- The manual cases remain qualitative because conversation quality cannot be fully validated with
  grep-style checks.
- No leaf skill was rewritten because the audit did not reveal a concrete protocol gap.

## Unresolved Issues

- A future phase should run these prompts in the actual target Codex environment after skill reload to
  catch model-behavior drift.
- There is still no automated semantic evaluator for whether each sage voice is sufficiently distinct.
- The current session's already-loaded skill metadata may not reflect newly edited descriptions until
  the host reloads repo skills.

## Next Recommendation

Run an actual end-to-end prompt smoke test in the target Codex UI/runtime, then commit and push the
monorepo migration if the visible outputs match the manual eval criteria.
