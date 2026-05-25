#!/usr/bin/env bash
#
# generate-ko-catalog.sh — 扫描 ko repo 的 agent 文件，从 frontmatter 抽 name，生成 CATALOG.md
#
# Usage: scripts/generate-ko-catalog.sh <target_repo_dir>

set -euo pipefail

TARGET="${1:?target repo dir required}"
OUT="$TARGET/CATALOG.md"

if [ ! -d "$TARGET" ]; then
  echo "[ERR] $TARGET does not exist"
  exit 1
fi

dept_name() {
  case "$1" in
    academic)            echo "📖 أكاديمي" ;;
    design)              echo "🎨 التصميم" ;;
    engineering)         echo "🛠️ الهندسة" ;;
    finance)             echo "🏦 المالية" ;;
    game-development)    echo "🎮 تطوير الألعاب" ;;
    hr)                  echo "👔 الموارد البشرية" ;;
    legal)               echo "⚖️ القانوني" ;;
    marketing)           echo "📢 التسويق" ;;
    paid-media)          echo "💰 الإعلانات المدفوعة" ;;
    product)             echo "📦 المنتج" ;;
    project-management)  echo "📋 إدارة المشاريع" ;;
    sales)               echo "💼 المبيعات" ;;
    spatial-computing)   echo "🥽 الحوسبة المكانية" ;;
    specialized)         echo "🔬 تخصصات" ;;
    supply-chain)        echo "🚚 سلسلة التوريد" ;;
    support)             echo "🤝 الدعم" ;;
    testing)             echo "🧪 الاختبار" ;;
    *)                   echo "$1" ;;
  esac
}

DEPT_ORDER="academic design engineering finance game-development marketing paid-media product project-management sales spatial-computing specialized support testing"

cat > "$OUT" <<'HEADER_EOF'
# كتالوج الوكلاء

> Ctrl+F / Cmd+F 로 ابحث بالاسم العربي، اعثر على مسار الملف، وأخبر أداة AI بتحميله.
>
> 사용 예: `engineering/engineering-software-architect.md كدور لمراجعة بنيتي المعمارية`

---

HEADER_EOF

extract_name() {
  local f="$1"
  awk 'BEGIN{c=0} /^---$/{c++; if(c>=2)exit; next} c==1 && /^name:/{sub(/^name:[[:space:]]*/, ""); gsub(/["'\''`]/, ""); sub(/[[:space:]]*$/, ""); print; exit}' "$f"
}

for dept in $DEPT_ORDER; do
  if [ ! -d "$TARGET/$dept" ]; then
    continue
  fi
  files=$(find "$TARGET/$dept" -name "*.md" -not -name "README.md" | sort)
  count=$(echo "$files" | grep -c '^.' || true)
  if [ "$count" -eq 0 ]; then
    continue
  fi
  dname=$(dept_name "$dept")
  printf "\n## %s (%d)\n\n| الاسم | مسار الملف |\n|---------|-----------|\n" "$dname" "$count" >> "$OUT"
  echo "$files" | while read -r f; do
    [ -z "$f" ] && continue
    name=$(extract_name "$f")
    rel=${f#"$TARGET/"}
    echo "| $name | \`$rel\` |" >> "$OUT"
  done
done

printf "\n---\n\n" >> "$OUT"
TOTAL=$(find "$TARGET" -name "*.md" -not -path "*/.*" -not -name "README.md" -not -name "CATALOG.md" -not -name "CONTRIBUTING.md" -not -name "UPSTREAM.md" -not -name "AGENT-LIST.md" -not -name "LICENSE*" -not -path "*/scripts/*" | wc -l | tr -d ' ')
echo "**총 $TOTAL وكيلاً** · الترجمة العربية لـ upstream agency-agents" >> "$OUT"

echo "[ok] generated $OUT ($(wc -l < "$OUT" | tr -d ' ') lines, $TOTAL agents)"
