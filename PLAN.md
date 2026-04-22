# SageTalk Implementation Plan

## Current Phase

Phase 18: add a Codex skills pack installer while preserving the multi-skill monorepo architecture.

## Goal

Make SageTalk easier to install by adding a single installer script that copies `sage-talk` and all
implemented `sage-*` leaf skills into the target Codex skills directory. This keeps the router + leaf
skill design intact while giving users a one-command installation path similar in convenience to
single-skill repositories.

## Milestones

1. Add static checks for an executable installer script.
2. Confirm the static check fails before the installer exists.
3. Create `scripts/install-codex-skills.sh`.
4. Update all README language files with the one-command installer.
5. Record this phase in `.logs/phase-18-codex-pack-installer.md`.
6. Run installer dry-run and local temp install checks.
7. Run `sh evals/check-static.sh`.

## In Scope For This Round

- Codex skills pack installer.
- README installation instructions in all supported languages.
- Static eval guardrails for installer presence and docs.
- Process log for the installer phase.

## Out Of Scope For This Round

- Publishing to npm.
- Changing SageTalk into a single root `SKILL.md`.
- Removing the `.agents/skills/` canonical repo-skill structure.
- Adding new sages.
- Committing or pushing unless explicitly requested.

## Acceptance Criteria

- `scripts/install-codex-skills.sh` is executable.
- The installer supports local source install, remote one-command install, `--dest`, `--force`, and
  `--dry-run`.
- All README files mention the installer command.
- The installer can copy all nine skills into a temporary destination.
- `sh evals/check-static.sh` passes.
