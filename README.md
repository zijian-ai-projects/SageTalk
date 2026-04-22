# SageTalk.skill

> 让孔子、老子、韩非子、王阳明等古代思想家，像可调用的 repo skills 一样进入现代问题现场。

其他语言 / Other Languages:
[English](README_EN.md) · [日本語](README_JA.md) · [한국어](README_KO.md) · [Español](README_ES.md)

SageTalk 是一个多 skill monorepo，用中国古代思想家提供沉浸式、多视角的对话分析。

它不是名言生成器，也不是泛泛的角色扮演。它把一个“圣贤对话系统”拆成可被 agent 发现和调用的技能：

- `sage-talk`: 路由、多人会审、对比、追问承接。
- `sage-*`: 每位圣贤自己的资料边界、世界观、判断模型、表达规则和示例。

## 效果示例

用户：

```text
我是负责人但没有决策权，出了问题却让我背锅怎么办？
```

可能输出：

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

你现在最危险的不是做不好，而是组织把你放在有名无实的位置。先把决策人、执行人、风险和确认记录写清楚。

我问你：现在让你背锅的人，是直属上级、平级决策人，还是跨部门的人？
```

用户：

```text
让王阳明和庄子一起看：我知道该做，但总是拖着不行动。
```

预期差异：

- 王阳明追问：你已经知道什么，却不肯让它落到行动上？
- 庄子追问：这个“应该”是不是来自外部尺子，是否把你困在单一标准里？

## 安装

### 一键安装到 Codex 全局 skills

```bash
curl -fsSL https://raw.githubusercontent.com/zijian-ai-projects/SageTalk/main/scripts/install-codex-skills.sh | sh
```

安装后重启 Codex。这个命令会一次性安装 `sage-talk` 和所有 `sage-*` leaf skills。

### 方式二：clone 后本地安装

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
scripts/install-codex-skills.sh
```

可选参数：

```bash
scripts/install-codex-skills.sh --force
scripts/install-codex-skills.sh --dest /path/to/skills
scripts/install-codex-skills.sh --dry-run
```

### 方式三：作为 Codex repo skill 仓库使用

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

在 Codex 中打开这个仓库。Codex 会从仓库级 `.agents/skills/` 自动发现 skills。

### 方式四：复制到你的项目仓库

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

打开你的项目仓库后，`sage-talk` 和所有 `sage-*` skills 会作为该项目的 repo skills 被发现。

## 平台支持

SageTalk 不只限于 Codex，但当前是 Codex-first：

- Codex repo skill：主要支持路径，使用 `.agents/skills/` 自动发现。
- Codex global skills：可复制到 `$CODEX_HOME/skills/`。
- 其他支持 `SKILL.md` 的 agent：可以迁移目录，但需要按对方约定调整安装路径。
- 普通 ChatGPT 或不支持 skill 自动发现的平台：不能直接安装，只能手动把相关 `SKILL.md` 和 references 放入上下文。

## SageTalk 提取了什么

| 层次 | 说明 |
| --- | --- |
| 世界观 | 每位圣贤首先看见什么问题，以及默认忽略什么问题。 |
| 判断模型 | 面对现代困境时，如何把古代原则迁移为可执行判断。 |
| 表达方式 | 先用短句进入人物气质，再用现代语言自然解释。 |
| 反模式 | 避免名言拼贴、文言文生成器、玄学成功学和伪造古人原话。 |
| 边界 | 古人不知道现代事实；法律、医疗、财务、安全问题需要专业支持。 |

## 已实现圣贤

| Skill | 人物 | 适合问题 |
| --- | --- | --- |
| `sage-confucius` | 孔子 | 名分、责任、关系、教育、信任修复 |
| `sage-mencius` | 孟子 | 义利之辨、道德勇气、自尊、公共责任 |
| `sage-laozi` | 老子 | 过度用力、欲望、退让、低扰动行动 |
| `sage-zhuangzi` | 庄子 | 视角转换、身份焦虑、名利束缚、无用之用 |
| `sage-mozi` | 墨子 | 公利、节用、尚贤、反侵害、成本与效果 |
| `sage-hanfeizi` | 韩非子 | 权责、制度、激励、证据、执行与约束 |
| `sage-sunzi` | 孙子 | 目标、地形、成本、时机、避战取胜 |
| `sage-wang-yangming` | 王阳明 | 良知、知行合一、拖延、自欺、事上磨练 |

## 使用

默认会审：

```text
我最近工作压力很大，越努力越焦虑，应该怎么办？
```

指定人物：

```text
让韩非子回答：我是负责人但没有权力，如何保护自己？
```

多人会审：

```text
让孔子、老子、韩非子一起回答：我和上级的职责边界不清。
```

对比与反驳：

```text
比较孟子和墨子：我该不该为了高薪加入一家会误导用户的公司？
```

连续追问：

```text
上一轮韩非子问我是谁让我背锅；我的回答是：直属上级。
```

## 工作原理

```text
用户问题
  ↓
sage-talk 判断模式：默认会审 / 指定人物 / 对比 / 追问
  ↓
读取轻量 registry，选择已实现的 sage-* skill
  ↓
每位 sage-* 按自己的资料、模型和表达规则回答
  ↓
sage-talk 保留分歧，承接下一轮追问
```

`sage-talk` 不保存完整人物画像。完整 worldview、mental models、source notes 和 voice rules 属于各自 `sage-*` skill。

## 仓库结构

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

## 开发与验证

静态检查：

```bash
sh evals/check-static.sh
```

手动会话评测：

```text
evals/immersive-conversation.md
```
