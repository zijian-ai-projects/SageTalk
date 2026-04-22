# SageTalk

SageTalk is a Codex repo-skill monorepo for ancient Chinese sage reasoning.

The project is being migrated from one aggregate skill plus `references/sages.yaml` into a set of
repo-discoverable skills under `.agents/skills/`:

- `sage-talk`: the router and orchestrator skill.
- `sage-*`: independent single-sage skills, one per thinker.

The router should coordinate perspectives; individual sage skills should own their own evidence,
life-stage model, voice, reasoning heuristics, and honest boundaries.

## Current Status

This repository has completed the first pass of the original eight single-sage leaf skills.

What exists now:

- canonical repo skill directory: `.agents/skills/`
- `sage-talk` router scaffold with routing references
- implemented `sage-confucius`, `sage-mencius`, `sage-laozi`, `sage-zhuangzi`, `sage-hanfeizi`,
  `sage-sunzi`, `sage-mozi`, and `sage-wang-yangming` leaf skills
- no remaining scaffold among the original eight planned `sage-*` directories
- shared distillation method, schema, and single-sage template
- legacy seed files preserved for later extraction

What is intentionally not done yet:

- the legacy aggregate profile has not been split into individual source files
- `references/sages.yaml` is not canonical anymore; it is only a migration seed

## Repository Structure

```text
.
├── AGENTS.md
├── LICENSE
├── README.md
├── .agents/
│   └── skills/
│       ├── sage-talk/
│       │   ├── SKILL.md
│       │   ├── README.md
│       │   ├── examples/
│       │   │   └── README.md
│       │   └── references/
│       │       ├── council-protocol.md
│       │       ├── routing-rules.md
│       │       └── sage-registry.yaml
│       ├── sage-confucius/
│       │   └── SKILL.md
│       ├── sage-mencius/
│       │   └── SKILL.md
│       ├── sage-laozi/
│       │   └── SKILL.md
│       ├── sage-zhuangzi/
│       │   └── SKILL.md
│       ├── sage-mozi/
│       │   └── SKILL.md
│       ├── sage-hanfeizi/
│       │   └── SKILL.md
│       ├── sage-sunzi/
│       │   └── SKILL.md
│       └── sage-wang-yangming/
│           └── SKILL.md
├── shared/
│   ├── references/
│   │   └── distillation-method.md
│   ├── schemas/
│   │   └── sage-profile.schema.yaml
│   └── templates/
│       └── sage-skill-template/
│           ├── SKILL.md
│           ├── README.md
│           ├── examples/
│           │   └── dialogues.md
│           └── references/
│               ├── profile.yaml
│               └── source-notes.md
├── references/
│   ├── sage-profile-template.yaml
│   └── sages.yaml
├── evals/
│   ├── README.md
│   ├── check-static.sh
│   └── immersive-conversation.md
├── examples/
│   └── dialogues.md
└── legacy/
    └── single-skill/
        ├── README.md
        └── SKILL.md
```

## Skill Responsibilities

### `.agents/skills/sage-talk/`

Canonical router skill for Codex.

It owns:

- request parsing
- default council selection
- named council orchestration
- comparison orchestration
- follow-up context handling
- synthesis of disagreement, agreement, risks, fit, and practical next actions

It must not own complete sage personas.

### `.agents/skills/sage-*`

Each `sage-*` directory is reserved for one independent single-sage skill.

Each completed single-sage skill should own:

- trigger conditions for that sage
- source basis and evidence caveats
- life stages or situations
- worldview and value tensions
- mental models
- decision heuristics
- anti-patterns
- tone and voice rules
- honest boundaries
- examples showing the answer shape

Currently implemented:

- `sage-confucius`
- `sage-mencius`
- `sage-laozi`
- `sage-zhuangzi`
- `sage-hanfeizi`
- `sage-sunzi`
- `sage-mozi`
- `sage-wang-yangming`

All original eight `sage-*` directories are implemented as independent leaf skills.

### `shared/`

Shared support files for the monorepo:

- `shared/references/distillation-method.md`: method for extracting a sage's cognitive operating system.
- `shared/schemas/sage-profile.schema.yaml`: profile contract for independent sage skills.
- `shared/templates/sage-skill-template/`: starter shape for future `sage-*` skills.

Shared files define method and structure, not complete sage personas.

### `references/`

Legacy migration seeds.

`references/sages.yaml` is preserved so future phases can extract one sage at a time. It is not the
canonical source of truth for new work.

### `examples/`

Legacy aggregate examples from the former single-skill layout. New router examples should go under
`.agents/skills/sage-talk/examples/`; new single-sage examples should go under that sage's own skill.

### `legacy/`

`legacy/single-skill/SKILL.md` preserves the former aggregate skill during migration. It is not the
canonical runtime path.

### `evals/`

Lightweight evaluation assets for the skill monorepo. `check-static.sh` validates structure and
regression-prone text patterns; `immersive-conversation.md` lists manual conversation cases.

## Design Principles

- Do not make a shell over famous quotes.
- Do not make all sages sound alike.
- Do not modernize ancient thinkers until they become unrecognizable.
- Do not deify ancient thinkers until they become unusable.
- Preserve school-level conflict.
- Transfer principles to modern issues by analogy.
- Label weak historical or stage-specific claims as inference.
- Keep router logic separate from single-sage persona logic.

## Migration Plan

1. Establish the `.agents/skills` monorepo skeleton and shared contracts.
2. Implement `sage-talk` as the router/orchestrator with a lightweight registry.
3. Extract single-sage skills one at a time from legacy seeds.
4. Archive or remove the legacy aggregate layout after parity checks.
