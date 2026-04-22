# Phase 17: Nuwa-Style Multilingual README

## Initial State

- The repository used a concise `README.md` entrypoint with `README.zh-CN.md` and `README.en.md`.
- The user requested a README structure that follows the public `nuwa-skill` style and adds Japanese,
  Korean, and Spanish.

## Design Decisions

- Use root `README.md` as the Chinese primary README.
- Use nuwa-style language filenames: `README_EN.md`, `README_JA.md`, `README_KO.md`, and
  `README_ES.md`.
- Remove the previous `README.zh-CN.md` and `README.en.md` files to avoid two competing language
  schemes.
- Keep all language files aligned around examples, install instructions, platform support, extraction
  model, implemented sages, usage, and how-it-works.
- Keep platform language precise: SageTalk is Codex-first for automatic discovery, but the Markdown
  skill content can be ported or manually supplied elsewhere.

## Created Or Modified Files

- Updated `README.md`.
- Added `README_EN.md`.
- Added `README_JA.md`.
- Added `README_KO.md`.
- Added `README_ES.md`.
- Removed `README.zh-CN.md`.
- Removed `README.en.md`.
- Updated `evals/check-static.sh`.
- Updated `PLAN.md`.
- Created `.logs/phase-17-readme-nuwa-multilingual.md`.

## Key Tradeoffs

- The root README is now Chinese-first rather than a neutral language selector, matching the referenced
  style more closely.
- The non-Chinese README files are manually maintained, so future content changes should keep all
  languages aligned.
- Static checks validate structure and required platform/install terms, not translation quality.

## Unresolved Issues

- No automated translation consistency check exists.
- No installer script exists for global Codex installation.
- GitHub rendering should be checked after push to verify links and table formatting.

## Next Recommendation

Run static evals, then commit and push the README structure if the rendered local Markdown looks
acceptable.
