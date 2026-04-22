# SageTalk

[English](README.en.md) | [返回入口](README.md)

SageTalk 是一个多 skill monorepo，用中国古代思想家提供沉浸式、多视角的对话分析。

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

### 方式三：安装到 Codex 全局 skills

如果你希望在多个仓库中都能使用 SageTalk，可以把所有 skill 复制到 Codex 全局 skills 目录：

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R .agents/skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

然后重启 Codex 以重新加载 skills。

全局安装时也要复制所有 `sage-*` 目录。`sage-talk` 的 registry 使用相对路径引用 sibling skills，只有这些目录保持为兄弟目录时，路由才能稳定工作。

### 目录约定

可执行 skill 的 canonical 路径是：

```text
.agents/skills/
```

根目录旧 `SKILL.md` 已迁移到 `legacy/single-skill/`，只作为迁移参考，不再是当前规范入口。

## 平台支持

SageTalk **不只限于 Codex**，但目前是 **Codex-first**：

- 在 Codex 中：`.agents/skills/` 可以作为 repo skills 被自动发现，这是当前主要支持路径。
- 在 Codex 全局 skills 中：可以把 `.agents/skills/*` 复制到 `$CODEX_HOME/skills/`，让这些 skills 在多个仓库中可用。
- 在其他支持 `SKILL.md` 机制的 agent 中：可以移植这些目录，但需要按对方的目录约定调整安装位置。
- 在普通 ChatGPT 或不支持 skill 自动发现的平台中：不能“安装”这个 repo skill，只能手动把相关 `SKILL.md` 和 references 作为上下文提供给模型。

因此，SageTalk 的内容本身是可移植的 Markdown skill set；自动发现、自动路由和调用体验目前以 Codex repo skill 机制为准。

## 使用

### 默认会审

直接描述你的问题，`sage-talk` 会选择适合的 3 到 5 位圣贤视角：

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
