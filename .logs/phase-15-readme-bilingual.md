# Phase 15: Bilingual README

## Initial State

- The root README described the monorepo architecture and current implementation status.
- It did not explain installation, usage, examples, or language switching.
- Static evals did not guard README onboarding content.

## Design Decisions

- Keep a single root `README.md` with anchor-based language switching: `中文` and `English`.
- Document two installation paths: using SageTalk as its own Codex repo-skill repository, and copying
  `.agents/skills/` into another repository.
- Keep `.agents/skills/` explicit as the canonical executable skill directory.
- Include examples that show expected immersive output without turning the README into a long transcript.
- Add static checks so README onboarding requirements remain visible in future changes.

## Created Or Modified Files

- Updated `README.md`.
- Updated `evals/check-static.sh`.
- Updated `PLAN.md`.
- Created `.logs/phase-15-readme-bilingual.md`.

## Key Tradeoffs

- Anchor-based switching works in GitHub Markdown without requiring a documentation site.
- The README gives practical install commands, while avoiding claims that depend on a specific Codex UI
  version.
- Examples describe expected shape and contrast, but detailed behavior remains owned by the skills and
  eval files.

## Unresolved Issues

- There is no dedicated installer script yet.
- The README does not include screenshots or hosted documentation.
- Actual Codex skill reload behavior should still be verified in the target runtime after pulling.

## Next Recommendation

Review the README on GitHub after push to confirm anchors and bilingual navigation render as expected.
