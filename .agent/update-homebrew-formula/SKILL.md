---
name: update-homebrew-formula
description: 指定したレポジトリのリリースをghで取得してhomebrew-tapのバージョンを更新する
---

# Homebrewフォーミュラの更新

このスキルは、GitHubリポジトリの最新リリース情報を取得し、Homebrewのフォーミュラファイル（`.rb`）を自動的に更新します。

## 前提条件

- `gh` CLIがインストールされ、認証されていること。
- リポジトリに `checksums.txt` が資産として含まれていること（GoReleaserなどの標準的な出力）。

## 実行手順

1. 最新のリリースバージョンを確認する
```bash
gh release list -R <owner>/<repo> -L 1
```

2. 資産（assets）に `checksums.txt` または個別のアーカイブが含まれているか確認する
```bash
gh release view <tag> -R <owner>/<repo> --json assets
```

3. 更新スクリプトを実行してフォーミュラを更新する
```bash
python3 scripts/update_formula.py <formula_path> <owner>/<repo> <tag>
```

4. 更新内容を確認する
```bash
git diff <formula_path>
```

5. 必要に応じて `brew` で動作確認を行う
```bash
brew install --formula <formula_path>
```
