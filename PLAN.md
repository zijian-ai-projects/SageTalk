# SageTalk Implementation Plan

## Current Phase

Phase 14: run a full conversation-protocol acceptance pass across the eight implemented leaf skills.

## Goal

Check that the completed first-pass monorepo behaves as an immersive multi-sage conversation system:
`sage-talk` should route silently, all eight original sages should be callable, and follow-up ownership
should keep the conversation from becoming a repetitive panel report.

## Milestones

1. Review the current manual eval suite in `evals/immersive-conversation.md`.
2. Verify all original eight `sage-*` entrypoints exist and are marked implemented in the registry.
3. Audit router protocol files for silent routing, first-visible-token behavior, and follow-up
   ownership.
4. Audit leaf-skill output contracts for immersive headings, no visible report labels, and direct
   first-person sage speech.
5. Record pass/fail findings in `.logs/phase-14-manual-eval.md`.
6. Run `sh evals/check-static.sh` as the static acceptance gate.

## In Scope For This Round

- Conversation-protocol acceptance across all eight implemented leaf skills.
- Static verification of registry, examples, guardrails, and router/persona boundaries.
- Process record updates for this evaluation phase.
- Small documentation or guardrail fixes if the audit finds gaps.

## Out Of Scope For This Round

- Implementing new sages beyond the original eight.
- Rewriting any leaf skill's research body without a concrete failed eval.
- Building an automated LLM judge or external runner.
- Deleting legacy files.
- Committing or pushing changes.

## Acceptance Criteria

- All eight original leaf skills are present under `.agents/skills/`.
- `sage-talk` registry marks exactly eight skills as implemented.
- Router docs preserve silent routing and do not become a persona source of truth.
- Manual eval notes cover the current 14 conversation cases.
- `sh evals/check-static.sh` passes.
