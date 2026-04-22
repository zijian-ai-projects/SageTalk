# SageTalk.skill

> 공자, 노자, 한비자, 왕양명 같은 고대 중국 사상가를 현대 문제에 호출할 수 있는 repo skill 모음입니다.

Other Languages:
[中文](README.md) · [English](README_EN.md) · [日本語](README_JA.md) · [Español](README_ES.md)

SageTalk는 고대 중국 사상가들과 몰입형 다중 관점 대화를 하기 위한 multi-skill monorepo입니다.

명언 생성기도 아니고, 단순한 역할극도 아닙니다. 구조는 다음과 같습니다.

- `sage-talk`: 라우팅, 여러 현자의 회의, 비교, 반박, 후속 대화 조율을 담당합니다.
- `sage-*`: 각 현자별 독립 leaf skill입니다. 자료 경계, 세계관, 판단 모델, 말투 규칙, 예시를 가집니다.

## 예시

사용자:

```text
나는 책임자라고 불리지만 결정권은 없습니다. 문제가 생기면 나에게 책임을 돌립니다. 어떻게 해야 하나요?
```

출력 예:

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

가장 위험한 것은 일을 못하는 것이 아니라, 직함과 권한이 맞지 않는 자리에 놓이는 것입니다. 결정자, 실행자, 위험, 확인 기록을 먼저 명확히 하십시오.

당신에게 책임을 돌리는 사람은 직속 상사입니까, 동급 결정권자입니까, 아니면 다른 부서입니까?
```

## 설치

### Codex 전역 skills에 한 번에 설치

```bash
curl -fsSL https://raw.githubusercontent.com/zijian-ai-projects/SageTalk/main/scripts/install-codex-skills.sh | sh
```

설치 후 Codex를 재시작하십시오. 이 명령은 `sage-talk`와 모든 `sage-*` leaf skills를 함께 설치합니다.

### 방법 2: clone 후 로컬에서 설치

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
scripts/install-codex-skills.sh
```

옵션:

```bash
scripts/install-codex-skills.sh --force
scripts/install-codex-skills.sh --dest /path/to/skills
scripts/install-codex-skills.sh --dry-run
```

### 방법 3: Codex repo skill 저장소로 사용

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

Codex에서 이 저장소를 열면 `.agents/skills/`에서 repo skills를 발견합니다.

### 방법 4: 자신의 저장소에 복사

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

대상 저장소를 Codex에서 열면 `sage-talk`와 모든 `sage-*` skills가 해당 프로젝트의 repo skills로 발견됩니다.

## 플랫폼 지원

SageTalk의 내용은 Codex에만 제한되지 않습니다. 다만 현재는 Codex-first입니다.

- Codex repo skills: `.agents/skills/` 자동 발견이 주 사용 경로입니다.
- Codex global skills: `$CODEX_HOME/skills/`에 복사해 여러 저장소에서 사용할 수 있습니다.
- `SKILL.md` 방식의 agent: 디렉터리 규칙을 맞추면 이식할 수 있습니다.
- 일반 ChatGPT 또는 skill 자동 발견이 없는 플랫폼: 직접 설치는 불가능하며 관련 `SKILL.md`와 references를 수동으로 제공해야 합니다.

## SageTalk가 추출하는 것

| 층위 | 의미 |
| --- | --- |
| 세계관 | 각 현자가 먼저 보는 문제와 놓치기 쉬운 문제. |
| 판단 모델 | 고대 원칙을 현대의 실행 가능한 판단으로 옮기는 방식. |
| 표현 | 짧은 인물색 있는 시작과 자연스러운 현대어 설명. |
| 금지 패턴 | 명언 짜깁기, 가짜 고문체, 신비주의식 성공론을 피함. |
| 경계 | 고대 인물은 현대 사실을 모릅니다. 전문 영역에는 전문가가 필요합니다. |

## 구현된 현자

- `sage-confucius`: 공자
- `sage-mencius`: 맹자
- `sage-laozi`: 노자
- `sage-zhuangzi`: 장자
- `sage-mozi`: 묵자
- `sage-hanfeizi`: 한비자
- `sage-sunzi`: 손자
- `sage-wang-yangming`: 왕양명

## 사용법

```text
한비자에게 물어보기: 책임은 있는데 권한이 없을 때 어떻게 나를 보호해야 합니까?
```

```text
공자, 노자, 한비자가 함께 답하게 해 주세요: 상사와의 책임 경계가 모호합니다.
```

```text
맹자와 묵자를 비교해 주세요: 사용자를 오도하는 회사에 높은 연봉을 받고 들어가야 할까요?
```

## 작동 방식

```text
사용자 문제
  ↓
sage-talk가 모드 판단
  ↓
가벼운 registry에서 구현된 sage-* skill 선택
  ↓
각 sage-*가 자신의 자료, 모델, 말투 규칙으로 응답
  ↓
sage-talk가 차이를 보존하고 다음 대화를 이어감
```

`sage-talk`는 완전한 인물 프로필을 저장하지 않습니다. worldview, mental models, source notes, voice rules는 각 `sage-*` skill에 속합니다.

## 검증

```bash
sh evals/check-static.sh
```
