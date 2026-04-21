# SageTalk

SageTalk is a Codex/Claude-style skill for multi-sage decision making, Q&A, and dialogue. It distills ancient Chinese thinkers into distinct cognitive operating systems so they can analyze the same modern problem from different worldviews.

This is not a quotation generator and not simple roleplay. The skill asks: if each sage reasoned from his era, life stage, social position, values, mental models, and blind spots, what would he notice first, advise, warn against, and refuse to assume?

## MVP Scope

SageTalk currently supports 8 sages:

- 孔子: role ethics, trust, ritual order, cultivation
- 孟子: moral courage, righteousness vs profit, humaneness
- 老子: non-coercive action, simplicity, reversal, restraint
- 庄子: frame-breaking, freedom, uselessness, perspective shifts
- 墨子: public benefit, anti-aggression, frugality, merit
- 韩非子: incentives, institutions, power asymmetry, rule enforcement
- 孙子: strategy, cost, timing, terrain, victory without battle
- 王阳明: conscience, unity of knowing and acting, practice under pressure

## What It Does

Users can bring:

- a decision they need to make
- a real-world difficulty
- a dilemma with no clean answer
- emotional, relationship, career, learning, or social confusion
- an ongoing dialogue with one sage or a council of sages

By default, SageTalk selects 3-5 contrasting sages, generates parallel answers, then summarizes:

- where they disagree
- where they agree
- who each answer fits
- what risks to watch
- what the user can do next in real life

## Interaction Modes

### Default Council

```text
我现在该不该换工作？
我和家人关系很紧张怎么办？
我想创业，但又怕失败。
我应该坚持还是放弃？
```

### Single Sage

```text
切换到孔子
让老子回答
从韩非子的角度看这件事
用王阳明的视角继续跟我聊
```

### Multi-Sage Review

```text
让孔子、庄子、韩非子一起回答
群贤会审：我现在要不要离职创业？
```

### Comparison

```text
比较孟子和墨子对这个问题的看法
如果是孙子和老子，会怎么建议我？
```

### Follow-Up

```text
孔子为什么会这样判断？
庄子的建议适合现在的职场吗？
韩非子的方案风险是什么？
```

## Output Shape

Typical council output:

```markdown
【问题重述】

【圣贤：孔子（周游列国受挫期）】
- 判断：
- 先看见的矛盾：
- 建议：
- 理由：
- 提醒：
- 适合/不适合：

【圣贤：老子（乱世旁观与退藏视角）】
...

【分歧点】
【共识点】
【适用人群】
【风险提醒】
【现实落地建议】
```

## Design Principles

- Do not make a shell over famous quotes.
- Do not make all sages sound alike.
- Do not modernize ancient thinkers until they become unrecognizable.
- Do not deify ancient thinkers until they become unusable.
- Preserve school-level conflict: Confucian, Daoist, Mohist, Legalist, military, and Neo-Confucian answers should disagree.
- Transfer principles to modern issues by analogy; do not pretend ancient thinkers knew modern facts.
- Label weak historical or stage-specific claims as inference.

## Repository Structure

```text
.
├── SKILL.md
├── README.md
├── references/
│   ├── distillation-method.md
│   ├── sage-profile-template.yaml
│   └── sages.yaml
└── examples/
    └── dialogues.md
```

## Key Files

- `SKILL.md`: runtime instructions, trigger conditions, mode parsing, sage selection, response protocol, and quality checks.
- `references/sages.yaml`: structured profiles for all supported sages.
- `references/distillation-method.md`: adapted distillation method for ancient figures.
- `references/sage-profile-template.yaml`: template for adding more sages.
- `examples/dialogues.md`: sample inputs and expected output style.

## Extending SageTalk

To add another sage, copy the structure from `references/sage-profile-template.yaml` and add the completed profile to `references/sages.yaml`.

Required fields:

- `name`
- `era`
- `life_stages`
- `context`
- `worldview`
- `mental_models`
- `decision_heuristics`
- `anti_patterns`
- `tone_style`
- `honest_boundaries`

Before adding a profile, use `references/distillation-method.md` to distinguish:

- primary texts
- letters, sayings, or collected writings
- historical biographies
- disciple records
- reliable commentaries
- later legends or weakly evidenced interpretations

## Honest Boundaries

SageTalk is a reasoning and reflection aid, not a historical oracle.

- It does not fabricate ancient quotations.
- It does not treat later stories as reliable history.
- It does not pretend ancient figures know current events or modern technical details.
- It marks uncertain stage interpretations as inference.
- It should not replace professional advice for legal, medical, financial, or safety-critical decisions.

## Example

```text
用户：我想创业，但又怕失败。如果是孙子和老子，会怎么建议我？
```

```text
孙子会先问：你有没有做过庙算，是否必须正面开战。
老子会先问：你创业是顺势而为，还是为了证明自己。

现实落地建议：两周内只做一个最小付费实验，不辞职、不融资、不讲宏大故事。
```

See `examples/dialogues.md` for fuller examples.

