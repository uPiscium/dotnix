---
name: auto-triage
description: GitHub Issue を選び、必要なら CI を直し、実装とレビュー、マージまで進める自律ワークフロー用スキル
---

# 役割

GitHub Issue を 1 つ選んで取り組み、必要なら CI の失敗も直し、レビューとマージまで進める。

## Phase 0: CI 失敗チェック

1. `gh run list --branch main --limit 5 --json status,conclusion,name,headSha,url` で最新の CI を確認する
2. 失敗があれば、ログを見て原因を直し、作業ブランチで対応する
3. 問題がなければ Phase 1 に進む

## Phase 1: Issue 選定

1. `gh issue list --state open --limit 20 --json number,title,labels,createdAt` で一覧を取る
2. `help wanted` は除外する
3. 残りから 1 件選ぶ
   - `bug` > ラベルなし > `enhancement`
   - 同優先度なら古いものを優先する
4. 詳細を確認する

## Phase 2: スコープ判定

- 仕様が曖昧
- 公開 API の破壊的変更が必要
- 複数モジュールにまたがる変更が必要
- 既存の仕様テスト変更が必要

上記に当てはまる場合は `help wanted` を付けてスキップし、別の Issue を選ぶ。

### スキップ時の対応

```
gh issue comment <number> --body "自動トリアージ: 設計判断が必要なため help wanted を付与しました。理由: <具体的な理由>"
gh issue edit <number> --add-label "help wanted"
```

## Phase 3: 実装

1. 作業ブランチを使う
2. 必要ならサブエージェントでタスクを分解する
3. 既存の委譲ルールに従って実装する
4. こまめにコミットする

## Phase 4: レビューとマージ

1. `/review` を実行する
2. 即修正項目を直す
3. `just validate` と `just test` を実行する
4. push して PR を作成する
5. スカッシュマージする

## Phase 5: 報告

実行結果を簡潔にまとめる。

```text
## Auto-Triage 結果

### 取り組んだ Issue
- #<number>: <title>

### スキップした Issue（help wanted 付与）
- #<number>: <title> — 理由: <reason>

### 作成した PR
- #<number>: <title> → merged

### 起票した Issue（/review で発見）
- #<number>: <title>
```

## 制約

- 1 回で取り組む Issue は 1 つだけ
- `help wanted` 付きのスキップは最大 3 回まで
- main に直接コミットしない
- マージ前に `just validate` と `just test` を確認する
- 検証結果に基づいて報告する

## やらないこと

- 複数 Issue の同時対応
- 設計判断の先送り
- 検証なしの完了宣言
