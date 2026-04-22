#!/bin/sh
set -eu

fail() {
  echo "FAIL: $1" >&2
  exit 1
}

pass() {
  echo "PASS: $1"
}

test -f .agents/skills/sage-confucius/SKILL.md || fail "missing sage-confucius SKILL.md"
test -f .agents/skills/sage-laozi/SKILL.md || fail "missing sage-laozi SKILL.md"
test -f .agents/skills/sage-hanfeizi/SKILL.md || fail "missing sage-hanfeizi SKILL.md"
test -f .agents/skills/sage-sunzi/SKILL.md || fail "missing sage-sunzi SKILL.md"
test -f .agents/skills/sage-mozi/SKILL.md || fail "missing sage-mozi SKILL.md"
test -f .agents/skills/sage-mencius/SKILL.md || fail "missing sage-mencius SKILL.md"
test -f .agents/skills/sage-zhuangzi/SKILL.md || fail "missing sage-zhuangzi SKILL.md"
test -f .agents/skills/sage-wang-yangming/SKILL.md || fail "missing sage-wang-yangming SKILL.md"
test -f .agents/skills/sage-talk/references/sage-registry.yaml || fail "missing sage registry"
pass "required skill entrypoints exist"

implemented_count=$(grep -c 'status: implemented' .agents/skills/sage-talk/references/sage-registry.yaml)
test "$implemented_count" -eq 8 || fail "expected exactly 8 implemented skills, found $implemented_count"
grep -A8 'id: confucius' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "confucius not implemented"
grep -A8 'id: mencius' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "mencius not implemented"
grep -A8 'id: laozi' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "laozi not implemented"
grep -A8 'id: zhuangzi' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "zhuangzi not implemented"
grep -A8 'id: hanfeizi' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "hanfeizi not implemented"
grep -A8 'id: sunzi' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "sunzi not implemented"
grep -A8 'id: mozi' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "mozi not implemented"
grep -A8 'id: wang-yangming' .agents/skills/sage-talk/references/sage-registry.yaml | grep -q 'status: implemented' || fail "wang-yangming not implemented"
pass "registry implementation status is accurate"

for dir in .agents/skills/sage-confucius .agents/skills/sage-mencius .agents/skills/sage-laozi .agents/skills/sage-zhuangzi .agents/skills/sage-hanfeizi .agents/skills/sage-sunzi .agents/skills/sage-mozi .agents/skills/sage-wang-yangming; do
  test -f "$dir/README.md" || fail "missing $dir/README.md"
  test -f "$dir/examples/demo-conversation.md" || fail "missing $dir/examples/demo-conversation.md"
  test "$(find "$dir/references/research" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')" -ge 6 || fail "missing research files in $dir"
done
pass "implemented leaf skill structure is complete"

if grep -R -n -E '今言之|现代解释|古意短判|判断：|建议：|理由：' \
  .agents/skills/sage-confucius/examples \
  .agents/skills/sage-mencius/examples \
  .agents/skills/sage-laozi/examples \
  .agents/skills/sage-zhuangzi/examples \
  .agents/skills/sage-hanfeizi/examples \
  .agents/skills/sage-sunzi/examples \
  .agents/skills/sage-mozi/examples \
  .agents/skills/sage-wang-yangming/examples >/tmp/sagetalk-disallowed-labels.txt; then
  cat /tmp/sagetalk-disallowed-labels.txt >&2
  fail "immersive examples contain report labels"
fi
pass "immersive examples avoid report labels"

if grep -R -n -E '正名|修己以安人|无为|水的策略|反者道之动' .agents/skills/sage-talk >/tmp/sagetalk-router-persona.txt; then
  cat /tmp/sagetalk-router-persona.txt >&2
  fail "router appears to contain leaf persona details"
fi
pass "router does not contain leaf persona details"

grep -q 'Do not use visible labels' .agents/skills/sage-confucius/SKILL.md || fail "confucius missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-mencius/SKILL.md || fail "mencius missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-laozi/SKILL.md || fail "laozi missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-zhuangzi/SKILL.md || fail "zhuangzi missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-hanfeizi/SKILL.md || fail "hanfeizi missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-sunzi/SKILL.md || fail "sunzi missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-mozi/SKILL.md || fail "mozi missing immersive label guardrail"
grep -q 'Do not use visible labels' .agents/skills/sage-wang-yangming/SKILL.md || fail "wang-yangming missing immersive label guardrail"
grep -q 'natural invitation' .agents/skills/sage-talk/references/council-protocol.md || fail "council protocol missing natural invitation"
pass "immersive protocol guardrails exist"

if grep -R -n '阶段细节多为推断' .agents/skills/sage-confucius/examples >/tmp/sagetalk-confucius-stage-leak.txt; then
  cat /tmp/sagetalk-confucius-stage-leak.txt >&2
  fail "confucius examples expose stage caveats in user-facing headings"
fi
pass "confucius examples keep stage caveats out of visible dialogue"

if grep -q 'Always choose a stage or situation and include it in the answer heading' .agents/skills/sage-confucius/SKILL.md; then
  fail "confucius skill still requires stage labels in visible headings"
fi
pass "confucius skill does not require visible stage headings"

grep -q 'Silent Routing' .agents/skills/sage-talk/references/council-protocol.md || fail "council protocol missing Silent Routing"
grep -q 'Follow-Up Ownership' .agents/skills/sage-talk/references/council-protocol.md || fail "council protocol missing Follow-Up Ownership"
grep -q 'follow-up owner' .agents/skills/sage-talk/references/routing-rules.md || fail "routing rules missing follow-up owner policy"
grep -q 'First visible token rule' .agents/skills/sage-talk/SKILL.md || fail "sage-talk missing first visible token rule"
grep -q 'First Visible Token' .agents/skills/sage-talk/references/council-protocol.md || fail "council protocol missing first visible token rule"
pass "router has silent routing and follow-up ownership rules"

if sed -n '1,12p' .agents/skills/sage-talk/SKILL.md | grep -E 'Route and orchestrate|Router|routing' >/tmp/sagetalk-frontmatter-route-leak.txt; then
  cat /tmp/sagetalk-frontmatter-route-leak.txt >&2
  fail "sage-talk frontmatter uses routing language that leaks into visible setup text"
fi
pass "sage-talk frontmatter avoids routing setup language"

test -f README_EN.md || fail "missing README_EN.md"
test -f README_JA.md || fail "missing README_JA.md"
test -f README_KO.md || fail "missing README_KO.md"
test -f README_ES.md || fail "missing README_ES.md"
test ! -f README.zh-CN.md || fail "legacy README.zh-CN.md should be removed"
test ! -f README.en.md || fail "legacy README.en.md should be removed"
grep -q '# SageTalk.skill' README.md || fail "Chinese README missing nuwa-style title"
grep -q '其他语言 / Other Languages' README.md || fail "Chinese README missing nuwa-style language switch"
grep -q 'README_EN.md' README.md || fail "Chinese README missing English README link"
grep -q 'README_JA.md' README.md || fail "Chinese README missing Japanese README link"
grep -q 'README_KO.md' README.md || fail "Chinese README missing Korean README link"
grep -q 'README_ES.md' README.md || fail "Chinese README missing Spanish README link"
grep -q '## 效果示例' README.md || fail "Chinese README missing examples section"
grep -q '## 安装' README.md || fail "Chinese README missing installation section"
grep -q '## SageTalk 提取了什么' README.md || fail "Chinese README missing extraction section"
grep -q '## 已实现圣贤' README.md || fail "Chinese README missing implemented sages section"
grep -q '## 工作原理' README.md || fail "Chinese README missing how-it-works section"
grep -q '## Examples' README_EN.md || fail "English README missing examples section"
grep -q '## Install' README_EN.md || fail "English README missing install section"
grep -q '## What SageTalk Extracts' README_EN.md || fail "English README missing extraction section"
grep -q '## Implemented Sages' README_EN.md || fail "English README missing implemented sages section"
grep -q '## How It Works' README_EN.md || fail "English README missing how-it-works section"
grep -q '## 効果例' README_JA.md || fail "Japanese README missing examples section"
grep -q '## インストール' README_JA.md || fail "Japanese README missing install section"
grep -q '## 예시' README_KO.md || fail "Korean README missing examples section"
grep -q '## 설치' README_KO.md || fail "Korean README missing install section"
grep -q '## Ejemplos' README_ES.md || fail "Spanish README missing examples section"
grep -q '## Instalación' README_ES.md || fail "Spanish README missing install section"
for doc in README.md README_EN.md README_JA.md README_KO.md README_ES.md; do
  grep -q 'git clone git@github.com:zijian-ai-projects/SageTalk.git' "$doc" || fail "$doc missing clone command"
  grep -q '.agents/skills' "$doc" || fail "$doc missing canonical skill directory"
  grep -q 'sage-talk' "$doc" || fail "$doc missing sage-talk entrypoint"
done
pass "README files follow nuwa-style multilingual structure and platform boundaries"

echo "All static evals passed."
