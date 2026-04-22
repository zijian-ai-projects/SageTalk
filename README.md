# SageTalk

Language / 语言: [中文](#中文) | [English](#english)

<a id="中文"></a>

## 中文

SageTalk 是一个面向 Codex repo skill 机制的多技能 monorepo，用中国古代思想家提供沉浸式、多视角的对话分析。

它不是名言生成器，也不是把所有人物写成同一种语气的角色扮演。当前结构把能力拆成：

- `sage-talk`: 路由与会审 skill，只负责选择、编排、对比、追问承接。
- `sage-*`: 独立圣贤 skill，每位人物拥有自己的资料边界、世界观、判断模型、表达规则和示例。

当前已实现 8 个 leaf skills：

- `sage-confucius`: 孔子
- `sage-mencius`: 孟子
- `sage-laozi`: 老子
- `sage-zhuangzi`: 庄子
- `sage-mozi`: 墨子
- `sage-hanfeizi`: 韩非子
- `sage-sunzi`: 孙子
- `sage-wang-yangming`: 王阳明

## 安装

### 方式一：作为独立 Codex repo skill 仓库使用

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

然后在 Codex 中打开这个仓库。Codex 会从仓库级 `.agents/skills/` 发现可用 skills。

如果你已经在 Codex 会话中打开过旧版本，更新后重新进入仓库或重启当前会话，让 repo skills 重新加载。

### 方式二：安装到你自己的项目仓库

在 SageTalk 仓库根目录执行：

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

然后在 Codex 中打开你的项目仓库。`sage-talk` 和所有 `sage-*` skills 会作为该项目的 repo skills 被发现。

建议复制整个 `.agents/skills/`，不要只复制 `sage-talk`。路由 skill 需要调用各个独立 `sage-*` leaf skills。

### 目录约定

可执行 skill 的 canonical 路径是：

```text
.agents/skills/
```

根目录旧 `SKILL.md` 已迁移到 `legacy/single-skill/`，只作为迁移参考，不再是当前规范入口。

## 使用

### 默认会审

直接描述你的问题，SageTalk 会选择适合的 3 到 5 位圣贤视角：

```text
我名义上是负责人，但没有决策权，出了问题却让我背锅。我该怎么办？
```

### 指定人物

```text
让韩非子回答：我是负责人但没有权力，如何保护自己？
```

```text
切换到王阳明：我知道该行动，但一直拖延。
```

### 多人会审

```text
让孔子、老子、韩非子一起回答：我和上级的职责边界不清。
```

### 对比与反驳

```text
比较孟子和墨子：我该不该为了高薪加入一家会误导用户的公司？
```

```text
让孔子和老子互相反驳一轮。
```

### 连续对话

如果某一位圣贤在上一轮提出问题，你直接回答即可：

```text
上一轮韩非子问我是谁让我背锅；我的回答是：直属上级。
```

`sage-talk` 会把对话交还给最合适的 follow-up owner，而不是让所有圣贤重复发言。

## 示例

输入：

```text
我是负责人但没有决策权，出了问题却让我背锅怎么办？
```

期望风格：

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

你现在最危险的不是做不好，而是组织把你放在有名无实的位置...

我问你：现在让你背锅的人，是直属上级、平级决策人，还是跨部门的人？
```

输入：

```text
让王阳明和庄子一起看：我知道该做，但总是拖着不行动。
```

期望差异：

- 王阳明会追问：你已经知道什么，却不肯让它落到行动上？
- 庄子会追问：这个“应该”是不是来自外部尺子，是否把你困在单一标准里？

## 项目结构

```text
.
├── AGENTS.md
├── PLAN.md
├── README.md
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

## 设计原则

- 不伪造古人原话、事件、书信或确定立场。
- 不把古代思想家伪装成知道现代事实的人。
- 现代问题只能做原则迁移，必要时说明不确定性。
- `sage-talk` 只负责路由、多人会审、对比、追问编排。
- 人物完整 worldview、mental models、表达规则必须属于各自 `sage-*` skill。
- 输出应是沉浸式对话，不使用“今言之”“现代解释”“古意短判”等出戏标签。

## 开发与验证

每轮实现需要更新：

- `PLAN.md`
- `.logs/phase-XX-short-topic.md`

静态检查：

```bash
sh evals/check-static.sh
```

手动会话评测：

```text
evals/immersive-conversation.md
```

[Back to top](#sagetalk) | [English](#english)

<a id="english"></a>

## English

SageTalk is a Codex repo-skill monorepo for immersive, multi-perspective dialogue with ancient
Chinese thinkers.

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

### Directory Contract

The canonical executable skill directory is:

```text
.agents/skills/
```

The old root `SKILL.md` has been moved to `legacy/single-skill/` as migration reference only. It is no
longer the canonical entrypoint.

## Usage

### Default Council

Describe the problem directly. SageTalk will choose suitable contrasting voices:

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

[Back to top](#sagetalk) | [中文](#中文)
