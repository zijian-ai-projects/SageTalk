# Phase 04: Lightweight Evals

## Initial State

- Confucius and Laozi were implemented as complete leaf skills.
- `sage-talk` had an immersive conversation protocol.
- No eval directory or repeatable static check existed.

## Design Decisions

- Add a dependency-free shell script for structural checks so contributors can run it without setting up a test framework.
- Keep behavior evaluation manual for now because there is no model runner or deterministic LLM judge.
- Protect the most regression-prone rules: implemented/scaffold status, leaf skill structure, absence of report labels, and router/persona separation.
- Add manual cases that cover role authority, burnout, family duty, conflict escalation, unavailable sages, and debate follow-up.

## Created Or Modified Files

- `evals/README.md`
- `evals/check-static.sh`
- `evals/immersive-conversation.md`
- `README.md`
- `PLAN.md`
- `.logs/phase-04-evals.md`

## Key Tradeoffs

- Static checks cannot prove answer quality, but they catch common repository regressions quickly.
- Manual eval cases are slower, but they judge immersion and sage contrast better than simple grep checks.
- The script intentionally avoids package dependencies until the repo has a real runtime harness.

## Unresolved Issues

- No automated model runner exists.
- No scored rubric or golden-output comparison exists yet.
- Static checks do not validate YAML syntax beyond targeted text patterns.

## Next Recommendation

Run the manual evals against live prompts for Confucius and Laozi. If the outputs are stable, implement
the next contrastive leaf skill, preferably `sage-hanfeizi` for制度, incentives, power, and enforcement.
