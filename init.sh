#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# Editorial Documentation Engineering Template - Project Initializer (v2)
#
# Creates a new project workspace from the template, copies the initial project
# templates, and initializes corpus / graph / session / checkpoint structures.
#
# Usage:
#   ./init.sh --project-name "AI Systems Engineering" --output-dir "../ai-systems-engineering"
#
# Optional:
#   --project-type "book|manual|whitepaper|docs"
#   --domain "ai-systems-engineering"
#   --language "en|es"
# -----------------------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$SCRIPT_DIR"

PROJECT_NAME=""
OUTPUT_DIR=""
PROJECT_TYPE="book"
DOMAIN="general"
LANGUAGE="en"

usage() {
  cat <<'EOF'
Usage:
  ./init.sh --project-name "my-doc-project" --output-dir "../my-doc-project" [options]

Required:
  --project-name   Name of the new project
  --output-dir     Directory where the new project will be created

Optional:
  --project-type   book | manual | whitepaper | docs   (default: book)
  --domain         Project domain                       (default: general)
  --language       Project language                     (default: en)
  -h, --help       Show this help
EOF
}

log() { printf '[init] %s\n' "$1"; }
fail() { printf '[init][error] %s\n' "$1" >&2; exit 1; }

copy_if_exists() {
  local src="$1"
  local dst="$2"
  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
  else
    log "Skipping missing template: $src"
  fi
}

write_file_if_missing() {
  local path="$1"
  local content="$2"
  if [[ ! -f "$path" ]]; then
    mkdir -p "$(dirname "$path")"
    printf '%s\n' "$content" > "$path"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-name) PROJECT_NAME="${2:-}"; shift 2 ;;
    --output-dir) OUTPUT_DIR="${2:-}"; shift 2 ;;
    --project-type) PROJECT_TYPE="${2:-}"; shift 2 ;;
    --domain) DOMAIN="${2:-}"; shift 2 ;;
    --language) LANGUAGE="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) fail "Unknown argument: $1" ;;
  esac
done

[[ -n "$PROJECT_NAME" ]] || fail "Missing required argument: --project-name"
[[ -n "$OUTPUT_DIR" ]] || fail "Missing required argument: --output-dir"

PROJECT_SLUG="$(printf '%s' "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-_')"
TARGET_DIR="$(cd "$(dirname "$OUTPUT_DIR")" && pwd)/$(basename "$OUTPUT_DIR")"

if [[ -e "$TARGET_DIR" ]]; then
  fail "Output directory already exists: $TARGET_DIR"
fi

log "Creating project: $PROJECT_NAME"
log "Target directory: $TARGET_DIR"

# -----------------------------------------------------------------------------
# Base structure
# -----------------------------------------------------------------------------
mkdir -p "$TARGET_DIR"/{docs/checkpoints,index/history,references,schemas}
mkdir -p "$TARGET_DIR"/corpus/{raw/human,raw/ai-generated,raw/provided,notes,evidence,validation,meta}
mkdir -p "$TARGET_DIR"/manuscript/{chapters,metadata}
mkdir -p "$TARGET_DIR"/editorial/{policies,checkpoints,reports,decisions}
mkdir -p "$TARGET_DIR"/editorial-graph/schema
mkdir -p "$TARGET_DIR"/editorial-graph/data/{nodes,edges,snapshots}
mkdir -p "$TARGET_DIR"/editorial-graph/session-packs/{chapters,blocks,terminology,grounding,qa}
mkdir -p "$TARGET_DIR"/editorial-graph/reports
mkdir -p "$TARGET_DIR"/sessions/{checkpoints,logs,templates,prompts}
mkdir -p "$TARGET_DIR"/{scripts,prompts,templates,phases}

# -----------------------------------------------------------------------------
# Copy reusable repo assets
# -----------------------------------------------------------------------------
for path in \
  README.md LICENSE CONTRIBUTING.md CODE_OF_CONDUCT.md SECURITY.md \
  .gitignore .editorconfig .gitattributes requirements.txt pyproject.toml Makefile
do
  copy_if_exists "$TEMPLATE_ROOT/$path" "$TARGET_DIR/$path"
done

for dir in docs phases prompts scripts templates schemas; do
  if [[ -d "$TEMPLATE_ROOT/$dir" ]]; then
    cp -R "$TEMPLATE_ROOT/$dir/." "$TARGET_DIR/$dir/"
  fi
done

if [[ -d "$TEMPLATE_ROOT/sessions/templates" ]]; then
  cp -R "$TEMPLATE_ROOT/sessions/templates/." "$TARGET_DIR/sessions/templates/"
fi
if [[ -d "$TEMPLATE_ROOT/sessions/prompts" ]]; then
  cp -R "$TEMPLATE_ROOT/sessions/prompts/." "$TARGET_DIR/sessions/prompts/"
fi
if [[ -d "$TEMPLATE_ROOT/editorial-graph/schema" ]]; then
  cp -R "$TEMPLATE_ROOT/editorial-graph/schema/." "$TARGET_DIR/editorial-graph/schema/"
fi

# -----------------------------------------------------------------------------
# Project config
# -----------------------------------------------------------------------------
cat > "$TARGET_DIR/editorial/project.yml" <<EOF
project:
  name: "$PROJECT_NAME"
  slug: "$PROJECT_SLUG"
  type: "$PROJECT_TYPE"
  domain: "$DOMAIN"
  language: "$LANGUAGE"

editorial:
  contract: "editorial/editorial-contract.md"
  style_guide: "editorial/style-guide.md"
  terminology: "editorial/terminology.yml"

graph:
  enabled: true
  root: "editorial-graph"

sessions:
  root: "sessions"

corpus:
  modes:
    - human
    - ai-generated
    - provided
EOF

# -----------------------------------------------------------------------------
# Copy project starter templates
# -----------------------------------------------------------------------------
copy_if_exists "$TEMPLATE_ROOT/templates/index/index-template.md" "$TARGET_DIR/manuscript/index.md"
copy_if_exists "$TEMPLATE_ROOT/templates/chapter/chapter-template.md" "$TARGET_DIR/manuscript/chapters/ch01-introduction.md"
copy_if_exists "$TEMPLATE_ROOT/templates/metadata/chapter.metadata.yml" "$TARGET_DIR/manuscript/metadata/ch01-introduction.metadata.yml"

copy_if_exists "$TEMPLATE_ROOT/templates/editorial/editorial-contract.md" "$TARGET_DIR/editorial/editorial-contract.md"
copy_if_exists "$TEMPLATE_ROOT/templates/editorial/style-guide.md" "$TARGET_DIR/editorial/style-guide.md"
copy_if_exists "$TEMPLATE_ROOT/templates/editorial/terminology.yml" "$TARGET_DIR/editorial/terminology.yml"
copy_if_exists "$TEMPLATE_ROOT/templates/editorial/audience.yml" "$TARGET_DIR/editorial/audience.yml"
copy_if_exists "$TEMPLATE_ROOT/templates/editorial/chapter-types.yml" "$TARGET_DIR/editorial/chapter-types.yml"

# Fallbacks if template files are absent
write_file_if_missing "$TARGET_DIR/manuscript/index.md" "# $PROJECT_NAME\n\n## Contents\n\n- Chapter 1 — Introduction\n"
write_file_if_missing "$TARGET_DIR/manuscript/chapters/ch01-introduction.md" "# Introduction\n\nThis is the first chapter of $PROJECT_NAME.\n"
write_file_if_missing "$TARGET_DIR/manuscript/metadata/ch01-introduction.metadata.yml" "id: ch01_introduction\ntitle: Introduction\npath: manuscript/chapters/ch01-introduction.md\n\nchapter_type: concept-introduction\ndomain: $DOMAIN\nstatus: draft\nowner: editorial\naudience: general\n\nconcepts_explained: []\nconcepts_assumed: []\n\nprimary_terms: []\nsecondary_terms: []\n\nprerequisites: []\nrelated_chapters: []\n\nreferences: []\ncorpus_sources: []\n\nclaims: []\n\ncoverage_role: primary\ngrounding_level: unknown\nai_risk_level: unknown\n\nsession_tags: []\n"

write_file_if_missing "$TARGET_DIR/editorial/editorial-contract.md" "# Editorial Contract\n\nProject: $PROJECT_NAME\n"
write_file_if_missing "$TARGET_DIR/editorial/style-guide.md" "# Style Guide\n\nDefine editorial and formatting conventions here.\n"
write_file_if_missing "$TARGET_DIR/editorial/terminology.yml" "terms: []\n"
write_file_if_missing "$TARGET_DIR/editorial/audience.yml" "audience:\n  primary: general\n"
write_file_if_missing "$TARGET_DIR/editorial/chapter-types.yml" "chapter_types: []\n"

# Index / references / corpus
write_file_if_missing "$TARGET_DIR/index/index.md" "# Index\n\n- Chapter 1 — Introduction\n"
write_file_if_missing "$TARGET_DIR/index/history/index-v0.md" "# Index v0\n\n- Chapter 1 — Introduction\n"
write_file_if_missing "$TARGET_DIR/index/chapter-map.csv" "chapter_id,title,path\nch01_introduction,Introduction,manuscript/chapters/ch01-introduction.md\n"

write_file_if_missing "$TARGET_DIR/references/domain-refs.yml" "references: []\n"
write_file_if_missing "$TARGET_DIR/references/bibliography.yml" "bibliography: []\n"

write_file_if_missing "$TARGET_DIR/corpus/meta/corpus-register.yml" "corpus_sources: []\n"
write_file_if_missing "$TARGET_DIR/corpus/meta/corpus-trust-map.yml" "summary:\n  total_items: 0\n"
write_file_if_missing "$TARGET_DIR/corpus/meta/provenance-rules.yml" "rules: []\n"
write_file_if_missing "$TARGET_DIR/corpus/meta/corpus-policy.yml" "policy:\n  supported_modes:\n    - human\n    - ai-generated\n    - provided\n"

# -----------------------------------------------------------------------------
# Graph placeholders
# -----------------------------------------------------------------------------
write_file_if_missing "$TARGET_DIR/editorial-graph/README.md" "# Editorial Graph\n\nThis directory contains the Editorial Knowledge Graph data, schema, reports, and session packs.\n"

for nodefile in books parts blocks chapters concepts terms claims references corpus-notes rules audiences; do
  write_file_if_missing "$TARGET_DIR/editorial-graph/data/nodes/${nodefile}.yml" "nodes: []"
done
for edgefile in structural conceptual terminology grounding pedagogical provenance conflicts; do
  write_file_if_missing "$TARGET_DIR/editorial-graph/data/edges/${edgefile}.yml" "edges: []"
done
for report in duplicate-coverage missing-prereqs terminology-conflicts grounding-gaps orphan-concepts session-impact; do
  write_file_if_missing "$TARGET_DIR/editorial-graph/reports/${report}.yml" "issues: []"
done

# -----------------------------------------------------------------------------
# Checkpoint
# -----------------------------------------------------------------------------
cat > "$TARGET_DIR/docs/checkpoints/CHECKPOINT-project-initialized.md" <<EOF
# Project Initialized

## Project
- Name: $PROJECT_NAME
- Slug: $PROJECT_SLUG
- Type: $PROJECT_TYPE
- Domain: $DOMAIN
- Language: $LANGUAGE

## Status
The project workspace has been initialized from the Editorial Documentation Engineering Template.

## Initialized Components
- corpus structure
- manuscript starter files
- editorial governance files
- editorial graph placeholders
- sessions folders
- initial project configuration

## Next Steps
1. Review editorial/project.yml
2. Review editorial/editorial-contract.md
3. Review manuscript/index.md
4. Start Phase 0 — Inception
5. Populate corpus sources
EOF

log "Project initialized successfully"
log "Next recommended actions:"
log "  1. Review: $TARGET_DIR/editorial/project.yml"
log "  2. Review: $TARGET_DIR/manuscript/index.md"
log "  3. Review: $TARGET_DIR/docs/checkpoints/CHECKPOINT-project-initialized.md"
log "  4. Start Phase 0 — Inception"
