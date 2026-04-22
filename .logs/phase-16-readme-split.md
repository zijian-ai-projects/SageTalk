# Phase 16: Split README Files

## Initial State

- `README.md` contained both Chinese and English documentation in one file with anchor-based language
  switching.
- The user noted that many repositories use separate language-specific README files.
- The README did not clearly distinguish Codex-first automatic discovery from portable/manual use in
  other environments.

## Design Decisions

- Keep root `README.md` as a concise language entrypoint.
- Add `README.zh-CN.md` for complete Chinese documentation.
- Add `README.en.md` for complete English documentation.
- Clarify platform support: SageTalk is not limited to Codex as Markdown skill content, but automatic
  discovery and routing are currently designed around Codex repo skills.
- Keep `.agents/skills/` as the canonical executable skill directory.
- Add static checks so future README edits preserve the split structure and platform boundary.

## Created Or Modified Files

- Updated `README.md`.
- Created `README.zh-CN.md`.
- Created `README.en.md`.
- Updated `evals/check-static.sh`.
- Updated `PLAN.md`.
- Created `.logs/phase-16-readme-split.md`.

## Key Tradeoffs

- Separate README files are easier to scan on GitHub than a long bilingual document.
- The root README is intentionally short, so installation details live only in the language-specific
  files.
- The documentation avoids claiming universal agent compatibility; it states the portability boundary
  explicitly.

## Unresolved Issues

- There is still no installer script for global or cross-repo installation.
- Other agent platforms may need their own directory adapters.
- GitHub rendering of the language links should be checked after push.

## Next Recommendation

Review the rendered README files on GitHub, then commit and push this documentation split if the
rendered navigation is satisfactory.
