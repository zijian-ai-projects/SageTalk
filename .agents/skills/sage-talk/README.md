# sage-talk

This directory contains the canonical SageTalk router skill for Codex repo-skill discovery.

`sage-talk` is responsible for orchestration only:

- routing user requests
- selecting sage skills
- coordinating multi-sage council answers
- comparing sage perspectives
- preserving follow-up context
- synthesizing disagreement, agreement, risks, fit, and next actions

It must not become the source of truth for any individual sage. Individual profiles and voice rules
belong in `.agents/skills/sage-*`.

The current root-level legacy files are migration seeds only.

## Implemented Leaf Skills

- `../sage-confucius`: callable independent Confucius skill for role ethics, ritual order, trust,
  learning, family responsibility, mentorship, and social repair.
- `../sage-mencius`: callable independent Mencius skill for righteousness over profit, moral courage,
  self-respect, benevolent leadership, and public duty.
- `../sage-laozi`: callable independent Laozi skill for restraint, non-coercive action, desire,
  overcontrol, withdrawal, and low-disturbance action.
- `../sage-zhuangzi`: callable independent Zhuangzi skill for perspective shift, freedom, identity
  loosening, usefulness anxiety, frame-breaking, and status traps.
- `../sage-hanfeizi`: callable independent Han Feizi skill for institutions, incentives, power
  asymmetry, enforceability, governance, and role/result mismatch.
- `../sage-sunzi`: callable independent Sunzi skill for strategy, timing, terrain, cost control,
  competition, negotiation, and indirect victory.
- `../sage-mozi`: callable independent Mozi skill for public benefit, anti-aggression, fairness,
  frugality, merit, evidence, and practical action.
- `../sage-wang-yangming`: callable independent Wang Yangming skill for conscience, knowing-and-acting
  as one, self-deception, disciplined practice, and leadership under pressure.

The router registry should only store lightweight routing metadata. Do not copy the full Confucius
Mencius, Laozi, Zhuangzi, Han Feizi, Sunzi, Mozi, or Wang Yangming worldview, mental models, or
research notes into `sage-talk`.
