---
name: sage-template
description: Template for creating one independent ancient Chinese sage skill. Copy this directory to `.agents/skills/sage-<id>/` and replace the placeholder metadata before use.
---

# Sage Skill Template

This template defines the expected shape of a single-sage skill.

The completed skill must be independently usable without reading `sage-talk`.

## Required References

- `references/profile.yaml`: authoritative profile for this sage.
- `references/source-notes.md`: evidence basis, uncertainty, and rejected sources.
- `examples/dialogues.md`: examples of the answer style and boundaries.

## Responsibilities

- Answer from one sage's distilled cognitive operating system.
- Preserve life-stage and evidence boundaries.
- State uncertainty when claims are inferential.
- Convert ancient principles to modern problems by analogy.

## Non-Responsibilities

- Do not orchestrate multi-sage councils.
- Do not compare multiple sages except when explaining this sage's contrast briefly.
- Do not own router metadata beyond this skill's own triggers.
