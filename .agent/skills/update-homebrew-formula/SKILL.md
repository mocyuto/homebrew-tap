---
name: update-homebrew-formula
description: 指定したレポジトリのリリースをghで取得して、最新(latest)と特定バージョン両方のHomebrewフォーミュラを更新・作成する
---

# Homebrewフォーミュラの更新

このスキルは、GitHubリポジトリのリリース情報を取得し、Homebrewのフォーミュラファイル（`.rb`）を自動的に更新します。**新しいリリースがある場合は、最新バージョンの更新（Latest）と、特定バージョンの作成（Versioned）の両方を行う必要があります。**

## 前提条件

- `gh` CLIがインストールされ、認証されていること。
- リポジトリに `checksums.txt` が資産として含まれていること（GoReleaserなどの標準的な出力）。

## 1. 最新バージョンの更新 (Latest)

既存のフォーミュラ（例: `Formula/git-wt.rb`）を最新リリースに更新します。

1. 最新のリリースバージョンを確認する

```bash
gh release list -R <owner>/<repo> -L 1
```

2. 更新スクリプトを実行してフォーミュラを更新する

```bash
python3 .agent/skills/update-homebrew-formula/scripts/update_formula.py Formula/<formula>.rb <owner>/<repo> <tag>
```

3. 更新内容を確認する

```bash
git diff Formula/<formula>.rb
```

## 2. 特定バージョンの作成 (Versioned)

特定のバージョンのフォーミュラを新しく作成します（例: `git-wt@0.2.2.rb`）。

1. 既存のフォーミュラをコピーして新しいファイルを作成する

```bash
cp Formula/<formula>.rb Formula/<formula>@<version>.rb
```

2. クラス名をHomebrewの規約に従って更新する

- 例: `class GitWt` -> `class GitWtAT022` (0.2.2の場合)

```ruby
# Formula/<formula>@<version>.rb
class <ClassName>AT<VersionDigits> < Formula
  ...
end
```

3. 更新スクリプトを実行して、新しく作成したフォーミュラのバージョンとチェックサムを更新する

```bash
python3 .agent/skills/update-homebrew-formula/scripts/update_formula.py Formula/<formula>@<version>.rb <owner>/<repo> v<version>
```

## 3. 動作確認

`brew` を使って、更新・作成したフォーミュラが正しくインストールできるか確認します。

```bash
brew install --formula Formula/<formula_file>.rb
```
