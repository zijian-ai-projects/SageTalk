# Phase 08: Route Preface Leak

## Initial State

- After Phase 07, Han Feizi and Confucius answers matched the intended immersive style.
- The user still saw a route/setup explanation before the answer.
- `sage-talk` frontmatter still began with `Route and orchestrate...`, and the first heading was
  `# SageTalk Router`.

## Root Cause

The body rules said routing should be silent, but the highest-exposure skill metadata and heading still
used routing language. When a model loads or announces the skill, those terms are likely to be reused
as visible setup prose.

There is also a host-runtime boundary: if the platform itself displays skill-use announcements,
progress logs, or tool traces, repository skill text cannot fully suppress that UI. The repository can
only ensure the final answer and skill guidance do not repeat that setup text.

## Design Decisions

- Remove routing language from the `sage-talk` frontmatter and first heading.
- Use conversation-orchestration language in high-exposure lines.
- Add a first-visible-token rule: ordinary implemented-sage answers should begin with `【`.
- Keep routing language inside deeper implementation references where it describes internal mechanics,
  but prevent it from appearing in top-level trigger text.

## Created Or Modified Files

- `.agents/skills/sage-talk/SKILL.md`
- `.agents/skills/sage-talk/references/council-protocol.md`
- `evals/check-static.sh`
- `evals/immersive-conversation.md`
- `PLAN.md`
- `.logs/phase-08-route-preface-leak.md`

## Key Tradeoffs

- The repository still uses router architecture internally, but the user-facing and metadata language
  now avoids inviting route-preface narration.
- Static checks target the frontmatter/top heading because those are the highest-risk leakage points;
  deeper internal references may still use routing terms for maintainability.

## Verification

- Added a static check that initially failed on `Route and orchestrate` and `# SageTalk Router`.
- Updated the wording and reran the check.
- `sh evals/check-static.sh` passed.

## Unresolved Issues

- No repository-only change can hide host-platform tool logs or mandatory skill-use announcements if
  the runtime displays them.
- A real prompt should be retested in the target runtime to confirm whether the remaining visible text
  is final-answer text or host UI chrome.

## Next Recommendation

Retest the exact prompt and distinguish where the route explanation appears:

- If it appears inside the final answer body, tighten `sage-talk` further.
- If it appears as platform progress/tool output before the final answer, treat it as runtime UI and
  solve through host configuration or a wrapper prompt outside the repo skill.
