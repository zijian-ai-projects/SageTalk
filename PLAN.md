# SageTalk Implementation Plan

## Current Phase

Phase 17: adopt nuwa-style multilingual README files.

## Goal

Change the README presentation to match the public `nuwa-skill` style: root Chinese README with
language links, plus separate English, Japanese, Korean, and Spanish README files. Preserve accurate
platform boundaries and installation instructions across all languages.

## Milestones

1. Update static README checks for nuwa-style filenames and sections.
2. Confirm the new static check fails before the new README files exist.
3. Replace root `README.md` with a Chinese main document.
4. Add `README_EN.md`, `README_JA.md`, `README_KO.md`, and `README_ES.md`.
5. Remove previous split files `README.zh-CN.md` and `README.en.md`.
6. Record this phase in `.logs/phase-17-readme-nuwa-multilingual.md`.
7. Run `sh evals/check-static.sh`.

## In Scope For This Round

- README naming and content.
- Chinese, English, Japanese, Korean, and Spanish documentation.
- Static eval guardrails for the multilingual README structure.
- Process log for this documentation phase.

## Out Of Scope For This Round

- Changing skill behavior.
- Adding generated translation tooling.
- Adding an installer script.
- Changing the `.agents/skills/` canonical path.
- Committing or pushing unless explicitly requested.

## Acceptance Criteria

- Root `README.md` is the Chinese main README and links to all other language files.
- `README_EN.md`, `README_JA.md`, `README_KO.md`, and `README_ES.md` exist.
- Old `README.zh-CN.md` and `README.en.md` are removed.
- Every README documents install commands, `.agents/skills`, and `sage-talk`.
- Static evals pass.
