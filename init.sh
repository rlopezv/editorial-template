#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME=""
OUTPUT_DIR=""

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --project-name) PROJECT_NAME="$2"; shift 2 ;;
    --output-dir) OUTPUT_DIR="$2"; shift 2 ;;
    *) echo "Unknown parameter: $1"; exit 1 ;;
  esac
done

if [[ -z "${PROJECT_NAME}" || -z "${OUTPUT_DIR}" ]]; then
  echo "Usage: ./init.sh --project-name <name> --output-dir <path>"
  exit 1
fi

TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$OUTPUT_DIR"

copy_tree() {
  local src="$1"
  local dst="$2"
  mkdir -p "$dst"
  cp -R "$src"/. "$dst"/
}

# copy reusable operating system folders
for item in docs phases corpus references editorial editorial-graph sessions prompts scripts templates schemas .devcontainer; do
  copy_tree "$TEMPLATE_DIR/$item" "$OUTPUT_DIR/$item"
done

# root files
for f in README.md LICENSE .gitignore requirements.txt pyproject.toml Makefile bootstrap.py; do
  cp "$TEMPLATE_DIR/$f" "$OUTPUT_DIR/$f"
done

# initialize project-specific README/WORKFLOW
cat > "$OUTPUT_DIR/README.md" <<EOF
# ${PROJECT_NAME}

Project initialized from editorial-template.

## Start here

1. docs/QUICKSTART.md
2. WORKFLOW.md
3. docs/SESSION-STRATEGY.md
EOF

cat > "$OUTPUT_DIR/WORKFLOW.md" <<EOF
# WORKFLOW — ${PROJECT_NAME}

Current phase: Phase 0 — Inception

## Recommended first steps

1. Review docs/QUICKSTART.md
2. Review docs/EDITORIAL-PIPELINE.md
3. Complete the prompts in prompts/phases/phase-0-inception/
4. Run:
   - python scripts/extract_chapter_metadata.py
   - python scripts/build_editorial_graph.py
   - python scripts/validate_editorial_graph.py
EOF

# tailor base placeholders
mkdir -p "$OUTPUT_DIR/manuscript"
mkdir -p "$OUTPUT_DIR/index/history"
mkdir -p "$OUTPUT_DIR/editorial/checkpoints" "$OUTPUT_DIR/sessions/checkpoints"

echo "# ${PROJECT_NAME}" > "$OUTPUT_DIR/index/index.md"

echo "Initialized project at $OUTPUT_DIR"
