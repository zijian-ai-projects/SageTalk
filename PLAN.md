# SageTalk Implementation Plan

## Current Phase

Phase 16: split README into language-specific documents and clarify platform support.

## Goal

Replace the single bilingual README body with a cleaner GitHub-style entry README plus separate
Chinese and English documentation files. Clarify that SageTalk is Codex-first, but not limited to
Codex as content: other agents can port the `SKILL.md` directories if they support compatible skill
mechanisms, and ordinary ChatGPT-style use is manual-context only.

## Milestones

1. Update static README checks to require `README.zh-CN.md` and `README.en.md`.
2. Confirm the new static check fails while the repo still has only a single bilingual README.
3. Replace root `README.md` with a concise language entrypoint.
4. Add full Chinese and English README files.
5. Record this phase in `.logs/phase-16-readme-split.md`.
6. Run `sh evals/check-static.sh`.

## In Scope For This Round

- Root README structure.
- Chinese and English README content.
- Platform-support clarification.
- Static eval guardrails for the split README shape.
- Process log for this documentation phase.

## Out Of Scope For This Round

- Changing skill behavior.
- Adding a dedicated installer script.
- Adding hosted documentation or screenshots.
- Changing the `.agents/skills/` canonical path.
- Committing or pushing unless explicitly requested.

## Acceptance Criteria

- `README.md` links to `README.zh-CN.md` and `README.en.md`.
- `README.zh-CN.md` contains Chinese installation, usage, examples, and non-Codex support boundary.
- `README.en.md` contains English installation, usage, examples, and non-Codex support boundary.
- Static evals check the split README structure.
- `sh evals/check-static.sh` passes.
