# Phase 18: Codex Pack Installer

## Initial State

- SageTalk used a multi-skill monorepo layout under `.agents/skills/`.
- Installation required opening the repository in Codex, manually copying `.agents/skills/`, or copying
  every skill into global Codex skills.
- The user preferred the convenience of a single-skill repository install flow, but chose to preserve
  the pack architecture.

## Design Decisions

- Keep `sage-talk` and the eight leaf skills as separate sibling skills.
- Add an installer script rather than collapsing the project into one root `SKILL.md`.
- Support two modes with one script:
  - local checkout install from `.agents/skills/`
  - remote pipe install by downloading the GitHub tarball
- Default destination is `${CODEX_HOME:-$HOME/.codex}/skills`.
- Add `--force`, `--dest`, and `--dry-run` for practical use and testing.
- Update all README languages so the easiest install path is visible first.

## Created Or Modified Files

- Created `scripts/install-codex-skills.sh`.
- Updated `README.md`.
- Updated `README_EN.md`.
- Updated `README_JA.md`.
- Updated `README_KO.md`.
- Updated `README_ES.md`.
- Updated `evals/check-static.sh`.
- Updated `PLAN.md`.
- Created `.logs/phase-18-codex-pack-installer.md`.

## Key Tradeoffs

- The one-command install uses `curl | sh`, which is convenient but requires users to trust the script.
  Clone-and-run remains documented for users who want to inspect it first.
- The installer targets Codex skills. Other agent platforms still require their own path conventions.
- The script installs the pack as multiple skills, not as a single aggregate skill.

## Unresolved Issues

- There is no npm package yet, so this is not the same as `npx skills add`.
- No uninstall command is provided yet.
- Remote install depends on GitHub availability and `curl`/`tar`.

## Next Recommendation

After validating the installer, consider adding an uninstall script or a small npm wrapper only if the
target audience expects `npx` installation.
