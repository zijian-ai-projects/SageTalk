# SageTalk

[中文](README.zh-CN.md) | [Back to entry](README.md)

SageTalk is a multi-skill monorepo for immersive, multi-perspective dialogue with ancient Chinese
thinkers.

It is not a quotation generator and not generic roleplay. The repository is split into:

- `sage-talk`: the router and council orchestrator. It selects, compares, coordinates follow-ups, and
  preserves disagreement.
- `sage-*`: independent single-sage skills. Each sage owns its own source boundaries, worldview,
  decision models, voice rules, and examples.

The first eight leaf skills are implemented:

- `sage-confucius`: Confucius
- `sage-mencius`: Mencius
- `sage-laozi`: Laozi
- `sage-zhuangzi`: Zhuangzi
- `sage-mozi`: Mozi
- `sage-hanfeizi`: Han Feizi
- `sage-sunzi`: Sunzi
- `sage-wang-yangming`: Wang Yangming

## Installation

### Option 1: Use SageTalk as its own Codex repo-skill repository

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

Open this repository in Codex. Codex discovers repository skills from `.agents/skills/`.

If an older version was already loaded in a Codex session, reopen the repository or restart the session
so the repo skills are reloaded.

### Option 2: Install SageTalk into another repository

From the SageTalk repository root:

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

Then open your target repository in Codex. `sage-talk` and the `sage-*` leaf skills will be discovered
as repo skills for that project.

Copy the whole `.agents/skills/` directory rather than only `sage-talk`, because the router delegates
to the independent leaf skills.

### Option 3: Install into global Codex skills

To use SageTalk across multiple repositories, copy every skill into the global Codex skills directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R .agents/skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Restart Codex after copying so skills are reloaded.

For global installation, copy every `sage-*` directory as well. `sage-talk` uses registry paths that
refer to sibling skills, so the router works best when all sage skill directories remain siblings.

### Directory Contract

The canonical executable skill directory is:

```text
.agents/skills/
```

The old root `SKILL.md` has been moved to `legacy/single-skill/` as migration reference only. It is no
longer the canonical entrypoint.

## Platform Support

SageTalk is **not limited to Codex**, but it is currently **Codex-first**:

- In Codex: `.agents/skills/` can be auto-discovered as repo skills. This is the main supported path.
- In global Codex skills: copy `.agents/skills/*` to `$CODEX_HOME/skills/` to make these skills
  available across repositories.
- In other agents that support a `SKILL.md`-style mechanism: the directories can be ported, but you may
  need to adjust the installation path to that agent's convention.
- In ordinary ChatGPT or platforms without skill discovery: you cannot install this as a repo skill,
  but you can manually provide a relevant `SKILL.md` and references as model context.

The content is a portable Markdown skill set. Automatic discovery, routing, and invocation are
designed around the Codex repo skill mechanism.

## Usage

### Default Council

Describe the problem directly. `sage-talk` will choose suitable contrasting voices:

```text
I am accountable for a project, but I do not have decision authority. When things go wrong, I am blamed.
What should I do?
```

### Named Sage

```text
Ask Han Feizi: I am responsible without authority. How do I protect myself?
```

```text
Switch to Wang Yangming: I know I should act, but I keep delaying.
```

### Multi-Sage Council

```text
Let Confucius, Laozi, and Han Feizi answer: my role and authority are unclear.
```

### Comparison And Debate

```text
Compare Mencius and Mozi: should I take a high-paying job at a company that misleads users?
```

```text
Let Confucius and Laozi refute each other once.
```

### Follow-Up Conversation

If one sage asked a question in the previous turn, answer it directly:

```text
Han Feizi asked who is making me take the blame. My answer: my direct manager.
```

`sage-talk` should continue with the most appropriate follow-up owner instead of making every sage
speak again.

## Examples

Input:

```text
I am accountable for a project, but I do not have decision authority. When things go wrong, I am blamed.
What should I do?
```

Expected style:

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

Your immediate danger is not merely doing the work badly. It is being placed in a role where the title
and the power do not match...

I ask you: who is making you carry the blame, your direct manager, a peer decision-maker, or another
department?
```

Input:

```text
Let Wang Yangming and Zhuangzi examine this: I know what I should do, but I keep delaying.
```

Expected contrast:

- Wang Yangming should ask what you already know but refuse to put into action.
- Zhuangzi should ask whether the "should" comes from an external measuring stick that traps you in
  one standard.

## Repository Structure

```text
.
├── AGENTS.md
├── PLAN.md
├── README.md
├── README.zh-CN.md
├── README.en.md
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
│   ├── references/
│   ├── schemas/
│   └── templates/
├── evals/
├── legacy/
└── references/
```

## Design Principles

- Do not fabricate ancient quotations, events, letters, or exact positions.
- Do not pretend ancient thinkers knew modern facts.
- Transfer principles to modern problems by analogy and state uncertainty when needed.
- `sage-talk` only owns routing, council orchestration, comparison, and follow-up coordination.
- Full worldview, mental models, and voice rules belong in each `sage-*` skill.
- User-facing answers should be immersive conversation, without labels such as "今言之",
  "现代解释", or "古意短判".

## Development And Verification

Every implementation round should update:

- `PLAN.md`
- `.logs/phase-XX-short-topic.md`

Static checks:

```bash
sh evals/check-static.sh
```

Manual conversation evals:

```text
evals/immersive-conversation.md
```
