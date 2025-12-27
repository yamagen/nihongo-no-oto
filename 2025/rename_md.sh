
#!/usr/bin/env bash
set -euo pipefail

# 使い方:
#   ./rename_md.sh            # カレントディレクトリで実行
#   ./rename_md.sh /path/to   # 対象ディレクトリを指定
#
# 変換規則:
#   YYYY-MM-DD_xxx_yy.md  ->  YYYYMMDD-xxx-yy.md
#     - 日付のハイフン削除
#     - 最初の区切り "_" を "-" に
#     - 残りの "_" も "-" に（結果として xxx-yy）
#     - .md のみ対象

dir="${1:-.}"

shopt -s nullglob
for f in "$dir"/*.md; do
  base="$(basename "$f")"

  # YYYY-MM-DD_..._.. .md だけ処理
  if [[ "$base" =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})_(.+)_([A-Za-z]{2})\.md$ ]]; then
    y="${BASH_REMATCH[1]}"
    m="${BASH_REMATCH[2]}"
    d="${BASH_REMATCH[3]}"
    mid="${BASH_REMATCH[4]}"   # 例: justfantastic
    lang="${BASH_REMATCH[5]}"  # 例: ja

    new="${y}${m}${d}-${mid}-${lang}.md"

    # もし mid の中に "_" があれば "-" にして統一したい場合
    new="${new//_/-}"

    if [[ "$base" != "$new" ]]; then
      echo "mv -n -- '$f' '$dir/$new'"
      mv -n -- "$f" "$dir/$new"
    fi
  fi
done
