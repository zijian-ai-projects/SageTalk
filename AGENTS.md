# SageTalk Repository Instructions

## Repository Direction

This repository is being migrated from a single aggregate skill into a multi-skill monorepo.

The target architecture is:

- `sage-talk`: a routing and orchestration skill.
- one independent skill per sage, modeled as a Nuwa-style single-person skill.
- shared references, schemas, templates, and examples that support the skills without becoming the source of any single sage's persona.

Canonical executable skills live under `.agents/skills/`.

Do not use top-level `skills/` as the final standard path for repo skills. A top-level `skills/`
directory may exist only as a thin explanatory layer if explicitly needed, not as the executable
skill source.

## Core Boundary

`sage-talk` must only own:

- request parsing and mode detection
- selecting one or more sage skills
- multi-sage council orchestration
- comparison orchestration
- follow-up context handling
- synthesis of disagreement, agreement, risks, fit, and next actions

`sage-talk` must not own:

- full sage biographies
- detailed life-stage profiles
- sage-specific mental models
- sage-specific voice rules
- sage-specific source notes
- sage-specific example dialogues beyond orchestration examples

Each sage skill owns its own personality and evidence model.

## Source of Truth Rules

- Do not keep treating `references/sages.yaml` as the only source of truth for all sages.
- During migration, `references/sages.yaml` may be used only as a seed/archive for extracting individual skills.
- New sage-specific truth must live inside that sage's own skill directory.
- Shared files may define schemas, templates, evidence rules, and routing metadata, but not complete sage personas.
- A router registry may contain only lightweight metadata: id, display name, aliases, school/tradition tags, use-case tags, contrast tags, and path to the owning skill.

## Planned Monorepo Shape

Use this shape as the default direction for future changes:

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
│       ├── sage-laozi/
│       ├── sage-zhuangzi/
│       ├── sage-mozi/
│       ├── sage-hanfeizi/
│       ├── sage-sunzi/
│       └── sage-wang-yangming/
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
└── legacy/
    └── single-skill/
        ├── README.md
        └── SKILL.md
```

Do not create all of these directories at once unless the user explicitly asks for the scaffold. Prefer incremental migration.

## Single-Sage Skill Contract

Every `.agents/skills/sage-*` directory should be understandable and usable without reading `sage-talk`.

Each single-sage skill should include:

- trigger conditions for that sage
- source basis and evidence caveats
- life stages or situations
- worldview and value tensions
- mental models
- decision heuristics
- anti-patterns
- tone and voice rules
- honest boundaries
- examples showing the expected answer shape

Single-sage skills may reference shared templates and schemas, but their own `references/profile.yaml` and `references/source-notes.md` are authoritative for that sage.

## Historical and Reasoning Constraints

- Do not fabricate ancient quotations, events, letters, or exact positions.
- Reject unsourced internet quotes, dramatic novels, and motivational paraphrases as evidence.
- Transfer ancient thought to modern problems by analogy, not by pretending the sage knew modern facts.
- Mark weak biographical or stage-specific claims as inference.
- Preserve disagreement across traditions. Do not flatten Confucian, Daoist, Mohist, Legalist, military, and Neo-Confucian perspectives into generic advice.
- Keep practical output concrete: each answer should identify the core tension, reason for the judgment, risk, fit, and next action.

## Migration Principles

- Make small, reviewable changes.
- Do not rewrite all eight sage skills in one pass.
- Preserve existing content until its replacement exists and is reviewed.
- When extracting a sage, move responsibility from the aggregate source into that sage's own skill, then update the router registry.
- Keep compatibility intentionally: if a root `SKILL.md` remains temporarily, it should be a wrapper or legacy entry point, not a second source of truth.
- Prefer structured files for profile data and concise Markdown for protocols, examples, and source notes.
- Update examples alongside behavior changes.

## Process Records

- Every implementation round must update `PLAN.md`.
- Every implementation round must create or update a matching `.logs/phase-XX-short-topic.md` file.
- `.logs/README.md` defines the naming convention and minimum sections.
- Logs should record conclusions, decisions, created/modified files, tradeoffs, unresolved issues, and next recommendations.
- Logs must not expose private chain-of-thought or internal reasoning traces.

## Implementation Phases

1. Establish the `.agents/skills` monorepo skeleton and shared contracts without migrating all content.
2. Extract `sage-talk` as the router/orchestrator skill and introduce a lightweight registry.
3. Migrate sage skills one at a time from the current aggregate source into independent `.agents/skills/sage-*` directories.
4. Retire or archive the legacy aggregate layout after parity checks and documentation updates.
