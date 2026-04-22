# SageTalk Implementation Plan

## Current Phase

Phase 15: improve the root README with bilingual installation, usage, and examples.

## Goal

Make the repository entrypoint useful for new users by documenting how to install SageTalk as a Codex
repo skill, how to use `sage-talk` and individual `sage-*` skills, and how to switch between Chinese
and English README sections.

## Milestones

1. Add static README checks for language switch, Chinese/English installation, usage, examples, clone
   command, `.agents/skills`, and `sage-talk`.
2. Confirm the new static check fails against the old README.
3. Rewrite `README.md` with Chinese and English sections.
4. Record this phase in `.logs/phase-15-readme-bilingual.md`.
5. Run `sh evals/check-static.sh`.

## In Scope For This Round

- Root `README.md` only for user-facing documentation.
- Static eval guardrails for README requirements.
- Process log for the README update.

## Out Of Scope For This Round

- Changing skill behavior.
- Adding new sages.
- Changing the `.agents/skills/` canonical path.
- Creating an installer script.
- Committing or pushing unless explicitly requested.

## Acceptance Criteria

- README has a visible `Language / 语言` switch.
- README has Chinese and English anchors.
- README documents installation, usage, and examples in both languages.
- README names `.agents/skills` as the canonical skill directory.
- README names `sage-talk` as the router entrypoint.
- `sh evals/check-static.sh` passes.
