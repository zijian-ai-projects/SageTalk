# SageTalk.skill

> Bring Confucius, Laozi, Han Feizi, Wang Yangming, and other ancient Chinese thinkers into modern
> problems as callable repo skills.

Other Languages:
[中文](README.md) · [日本語](README_JA.md) · [한국어](README_KO.md) · [Español](README_ES.md)

SageTalk is a multi-skill monorepo for immersive, multi-perspective dialogue with ancient Chinese
thinkers.

It is not a quotation generator and not generic roleplay. It splits a sage council system into skills
that an agent can discover and invoke:

- `sage-talk`: routing, council orchestration, comparison, debate, and follow-up ownership.
- `sage-*`: one independent leaf skill per sage, with its own sources, worldview, judgment models,
  voice rules, and examples.

## Examples

User:

```text
I am accountable for a project, but I do not have decision authority. When things go wrong, I am blamed.
What should I do?
```

Possible output:

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

Your immediate danger is not simply doing the work badly. It is being placed in a role where title and
authority do not match. Start by making the decision owner, executor, risks, and confirmation trail
explicit.

I ask you: who is making you carry the blame, your direct manager, a peer decision-maker, or another
department?
```

User:

```text
Let Wang Yangming and Zhuangzi examine this: I know what I should do, but I keep delaying.
```

Expected contrast:

- Wang Yangming asks what you already know but refuse to put into action.
- Zhuangzi asks whether the "should" comes from an external measuring stick that traps you in one
  standard.

## Install

### One-command install into global Codex skills

```bash
curl -fsSL https://raw.githubusercontent.com/zijian-ai-projects/SageTalk/main/scripts/install-codex-skills.sh | sh
```

Restart Codex after installation. This command installs `sage-talk` and every `sage-*` leaf skill as a
pack.

### Option 2: Clone and install locally

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
scripts/install-codex-skills.sh
```

Options:

```bash
scripts/install-codex-skills.sh --force
scripts/install-codex-skills.sh --dest /path/to/skills
scripts/install-codex-skills.sh --dry-run
```

### Option 3: Use SageTalk as a Codex repo-skill repository

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

Open this repository in Codex. Codex discovers repo skills from `.agents/skills/`.

### Option 4: Copy into your own repository

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

Open your target repository in Codex. `sage-talk` and the `sage-*` skills will be discovered as repo
skills for that project.

## Platform Support

SageTalk is not limited to Codex as content, but it is currently Codex-first:

- Codex repo skills: the main supported path, using `.agents/skills/` discovery.
- Codex global skills: copy to `$CODEX_HOME/skills/`.
- Other agents with a `SKILL.md`-style mechanism: portable with directory adjustments.
- Ordinary ChatGPT or platforms without skill discovery: manual-context use only; provide the relevant
  `SKILL.md` and references yourself.

## What SageTalk Extracts

| Layer | What it means |
| --- | --- |
| Worldview | What each sage notices first and what each tends to ignore. |
| Judgment model | How ancient principles become modern, actionable reasoning by analogy. |
| Expression | A short character-colored opening followed by clear modern language. |
| Anti-patterns | No quote collage, fake classical prose, mystical productivity, or invented sayings. |
| Boundaries | Ancient thinkers do not know modern facts; professional domains need professional support. |

## Implemented Sages

| Skill | Sage | Best for |
| --- | --- | --- |
| `sage-confucius` | Confucius | roles, duty, relationships, education, trust repair |
| `sage-mencius` | Mencius | righteousness vs profit, moral courage, dignity, public duty |
| `sage-laozi` | Laozi | over-effort, desire, restraint, low-disturbance action |
| `sage-zhuangzi` | Zhuangzi | perspective shifts, identity anxiety, status traps, uselessness |
| `sage-mozi` | Mozi | public benefit, frugality, merit, anti-aggression, cost and effect |
| `sage-hanfeizi` | Han Feizi | authority, institutions, incentives, evidence, enforcement |
| `sage-sunzi` | Sunzi | objective, terrain, cost, timing, winning without direct battle |
| `sage-wang-yangming` | Wang Yangming | conscience, unity of knowing and acting, procrastination, self-deception |

## Usage

Default council:

```text
I am anxious because the harder I work, the more unfinished everything feels. What should I do?
```

Named sage:

```text
Ask Han Feizi: I am responsible without authority. How do I protect myself?
```

Multi-sage council:

```text
Let Confucius, Laozi, and Han Feizi answer: my role and authority are unclear.
```

Comparison:

```text
Compare Mencius and Mozi: should I take a high-paying job at a company that misleads users?
```

Follow-up:

```text
Han Feizi asked who is making me carry the blame. My answer: my direct manager.
```

## How It Works

```text
User problem
  ↓
sage-talk classifies the mode: default council / named sage / comparison / follow-up
  ↓
It reads lightweight registry metadata and selects implemented sage-* skills
  ↓
Each sage-* answers from its own sources, models, and voice rules
  ↓
sage-talk preserves disagreement and carries the next follow-up
```

`sage-talk` does not store full personas. Complete worldviews, mental models, source notes, and voice
rules belong to the individual `sage-*` skills.

## Repository Structure

```text
.
├── README.md
├── README_EN.md
├── README_JA.md
├── README_KO.md
├── README_ES.md
├── .agents/
│   └── skills/
│       ├── sage-talk/
│       ├── sage-confucius/
│       ├── sage-mencius/
│       ├── sage-laozi/
│       ├── sage-zhuangzi/
│       ├── sage-mozi/
│       ├── sage-hanfeizi/
│       ├── sage-sunzi/
│       └── sage-wang-yangming/
├── shared/
├── evals/
├── legacy/
└── references/
```

## Verification

```bash
sh evals/check-static.sh
```
