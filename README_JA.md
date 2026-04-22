# SageTalk.skill

> 孔子、老子、韓非子、王陽明などの古代中国思想家を、現代の問題に呼び出せる repo skill として扱うためのプロジェクトです。

Other Languages:
[中文](README.md) · [English](README_EN.md) · [한국어](README_KO.md) · [Español](README_ES.md)

SageTalk は、古代中国の思想家による没入型・多視点の対話を行う multi-skill monorepo です。

名言生成器ではなく、単なるロールプレイでもありません。構成は次のように分かれています。

- `sage-talk`: ルーティング、複数賢者の会議、比較、反論、フォローアップを担当します。
- `sage-*`: 各賢者ごとの独立 leaf skill。資料の境界、世界観、判断モデル、声の規則、例を持ちます。

## 効果例

ユーザー：

```text
責任者という立場なのに決定権がなく、問題が起きると自分の責任にされます。どうすればよいですか？
```

出力例：

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

危険なのは仕事が下手なことだけではありません。肩書きと権限が一致しない場所に置かれていることです。決定者、実行者、リスク、確認記録を明確にしてください。

あなたに責任を負わせているのは、直属の上司、同格の決定者、それとも別部署ですか？
```

## インストール

### 方法 1: Codex repo skill として使う

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

Codex でこのリポジトリを開くと、`.agents/skills/` から repo skills が検出されます。

### 方法 2: 自分のリポジトリにコピーする

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

対象リポジトリを Codex で開くと、`sage-talk` と各 `sage-*` skill が利用できます。

### 方法 3: Codex のグローバル skills に入れる

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R .agents/skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

コピー後に Codex を再起動してください。`sage-talk` は兄弟ディレクトリの `sage-*` skills にルーティングするため、すべての skill を一緒にコピーしてください。

## プラットフォーム対応

SageTalk の内容は Codex だけに限定されません。ただし現在は Codex-first です。

- Codex repo skills: `.agents/skills/` による自動検出が主な利用方法です。
- Codex global skills: `$CODEX_HOME/skills/` にコピーして複数リポジトリで使えます。
- `SKILL.md` 形式をサポートする他の agent: ディレクトリ規約を合わせれば移植できます。
- 通常の ChatGPT など skill 自動検出がない環境: 関連する `SKILL.md` と references を手動で文脈として渡す必要があります。

## SageTalk が抽出するもの

| 層 | 内容 |
| --- | --- |
| 世界観 | 各賢者が最初に見る問題と、見落としやすい問題。 |
| 判断モデル | 古代の原則を現代の行動判断に移す方法。 |
| 表現 | 短い人物らしい導入と、自然な現代語の説明。 |
| 反パターン | 名言の貼り合わせ、偽の古文、神秘的な成功法則を避ける。 |
| 境界 | 古人は現代事実を知らない。専門領域には専門家が必要です。 |

## 実装済みの賢者

- `sage-confucius`: 孔子
- `sage-mencius`: 孟子
- `sage-laozi`: 老子
- `sage-zhuangzi`: 荘子
- `sage-mozi`: 墨子
- `sage-hanfeizi`: 韓非子
- `sage-sunzi`: 孫子
- `sage-wang-yangming`: 王陽明

## 使い方

```text
韓非子に答えてもらう：責任はあるのに権限がない場合、どう自分を守るべきですか？
```

```text
孔子、老子、韓非子に一緒に答えてもらう：上司との責任範囲が曖昧です。
```

```text
孟子と墨子を比較してください：ユーザーを誤導する会社に高給で入るべきですか？
```

## 仕組み

```text
ユーザーの問題
  ↓
sage-talk がモードを判定
  ↓
軽量 registry から実装済みの sage-* skill を選ぶ
  ↓
各 sage-* が自分の資料、モデル、声で答える
  ↓
sage-talk が違いを保ち、次の会話につなぐ
```

`sage-talk` は完全な人物像を持ちません。worldview、mental models、source notes、voice rules は各 `sage-*` skill に属します。

## 検証

```bash
sh evals/check-static.sh
```
