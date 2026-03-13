#!/bin/bash
# ============================================================
# init.sh — Initialize a new project from editorial-template
# ============================================================
# Usage:
#   ./init.sh --project-name "my-book" --output-dir "../my-book"
#
# This script:
#   1. Creates the project directory structure
#   2. Copies template artefacts into inception/
#   3. Initialises WORKFLOW.md at Phase 0 — Inception
#   4. Creates empty placeholder files for index and references
#   5. Initialises git repository
# ============================================================

set -e

# ------------------------------------------------------------
# Parse arguments
# ------------------------------------------------------------
PROJECT_NAME=""
OUTPUT_DIR=""

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --project-name) PROJECT_NAME="$2"; shift ;;
    --output-dir) OUTPUT_DIR="$2"; shift ;;
    *) echo "Unknown parameter: $1"; exit 1 ;;
  esac
  shift
done

if [ -z "$PROJECT_NAME" ] || [ -z "$OUTPUT_DIR" ]; then
  echo "Usage: ./init.sh --project-name <name> --output-dir <path>"
  exit 1
fi

TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TODAY=$(date +%Y-%m-%d)

echo "Initialising project: $PROJECT_NAME"
echo "Output directory: $OUTPUT_DIR"
echo "Template: $TEMPLATE_DIR"
echo ""

# ------------------------------------------------------------
# Create directory structure
# ------------------------------------------------------------
echo "Creating directory structure..."

mkdir -p "$OUTPUT_DIR/inception/config/paths"
mkdir -p "$OUTPUT_DIR/index/history"
mkdir -p "$OUTPUT_DIR/corpus/notes/meta"
mkdir -p "$OUTPUT_DIR/content"
mkdir -p "$OUTPUT_DIR/references"
mkdir -p "$OUTPUT_DIR/snapshots"
mkdir -p "$OUTPUT_DIR/.editorial/checkpoints"

# ------------------------------------------------------------
# Copy template artefacts
# ------------------------------------------------------------
echo "Copying template artefacts..."

cp "$TEMPLATE_DIR/templates/inception/editorial-config.yml" "$OUTPUT_DIR/inception/"
cp "$TEMPLATE_DIR/templates/inception/ai-usage-policy.yml" "$OUTPUT_DIR/inception/"
cp "$TEMPLATE_DIR/templates/inception/config/chapter-types.yml" "$OUTPUT_DIR/inception/config/"
cp "$TEMPLATE_DIR/templates/inception/config/paths/profile.yml" "$OUTPUT_DIR/inception/config/paths/"

# Initialise changelog with project header
cat > "$OUTPUT_DIR/inception/changelog-editorial.md" << CHANGELOG
# CHANGELOG EDITORIAL
# $PROJECT_NAME
# ============================================================
# Record of editorial decisions with rationale.
# Not a git history — a reasoning record.
# ============================================================

---
## [$TODAY] INCEPTION — Project initialised from editorial-template

**Template version:** $(git -C "$TEMPLATE_DIR" describe --tags 2>/dev/null || echo "unversioned")
**Next step:** Complete Phase 0 — Inception decisions
**Reference:** See editorial-template/phases/PHASE-0-INCEPTION.md

---
CHANGELOG

# Create empty index and references placeholders
cat > "$OUTPUT_DIR/index/history/index-v0.md" << INDEX
---
version: v0
instancia: pendiente-de-configuracion
estado: pendiente-inception
generado_en: pendiente-phase-0-inception
fecha: $TODAY
nota: >
  Generate this file as part of Phase 0 — Inception Decision 7.
  See editorial-template/phases/PHASE-0-INCEPTION.md
---

# Index v0 — Pending Generation

This file is a placeholder.
Generate index-v0 as part of Phase 0 — Inception, Decision 7,
after scope, audience profiles, and chapter taxonomy are defined.
INDEX

cat > "$OUTPUT_DIR/references/domain-refs.yml" << REFS
# ============================================================
# DOMAIN REFERENCES — $PROJECT_NAME
# ============================================================
# Placeholder — generate as part of Phase 0 — Inception, Decision 7.
# See editorial-template/phases/PHASE-0-INCEPTION.md
# ============================================================

meta:
  version: v0
  generado_en: pendiente-phase-0-inception
  fecha: $TODAY
  estado: pendiente

canonicas: []
REFS

# ------------------------------------------------------------
# Create project README and WORKFLOW
# ------------------------------------------------------------
echo "Creating project files..."

cat > "$OUTPUT_DIR/README.md" << README
# $PROJECT_NAME

> Project initialised from [editorial-template](../editorial-template).
> Current phase: **Phase 0 — Inception**

## Quick Start

Open \`WORKFLOW.md\` to see the current phase and next actions.

## Process

This project follows the editorial process defined in
\`editorial-template/phases/\`. See the template README for
full process documentation.
README

cat > "$OUTPUT_DIR/WORKFLOW.md" << WORKFLOW
# WORKFLOW — $PROJECT_NAME

## Current Phase
**Phase 0 — Inception**
Started: $TODAY

## Status
- [ ] Decision 1 — Scope and objective
- [ ] Decision 2 — Audience profiles
- [ ] Decision 3 — Author's knowledge perimeter
- [ ] Decision 4 — Chapter taxonomy
- [ ] Decision 5 — AI usage policy
- [ ] Decision 6 — Publishing criteria
- [ ] Decision 7 — Index v0 and domain references

## Next Action
Start Phase 0 — Inception with the editorial config prompt.
Follow: editorial-template/phases/PHASE-0-INCEPTION.md

## Prompts for Phase 0 — Inception
- Step 1 — Editorial config: editorial-template/prompts/inception/fill-editorial-config.md
- Step 2 — Corpus analysis: editorial-template/prompts/inception/analyse-corpus-notes.md
- Step 3 — Index v0: editorial-template/prompts/inception/generate-index-v0.md
- Step 4 — Domain references: editorial-template/prompts/inception/generate-domain-refs.md

## Checkpoints
Store session checkpoints in: .editorial/checkpoints/

## Open Decisions
_(none yet — Inception not started)_

## Phase History
| Phase | Started | Completed |
|-------|---------|-----------|
| Phase 0 — Inception | $TODAY | — |
WORKFLOW

cat > "$OUTPUT_DIR/CONTRIBUTING.md" << CONTRIB
# Contributing to $PROJECT_NAME

This project follows the editorial process defined in
\`editorial-template\`. Before contributing, read:

1. \`WORKFLOW.md\` — current phase and open decisions
2. \`inception/editorial-config.yml\` — project configuration
3. \`editorial-template/phases/PHASE-[current].md\` — current phase guide

## Content Origin Policy

All content must be labelled with its origin.
See \`inception/ai-usage-policy.yml\` for labelling requirements.

## Editorial Decisions

Significant changes to the index, scope, or chapter structure
require an entry in \`inception/changelog-editorial.md\`
with rationale and impact analysis.
CONTRIB

# ------------------------------------------------------------
# Initialise git repository
# ------------------------------------------------------------
echo "Initialising git repository..."

cd "$OUTPUT_DIR"
git init
git add .
git commit -m "chore: initialise project from editorial-template

Project: $PROJECT_NAME
Template: editorial-template
Phase: 0 — Inception (pending)
Date: $TODAY"

echo ""
echo "✓ Project initialised successfully"
echo ""
echo "Next steps:"
echo "  cd $OUTPUT_DIR"
echo "  Open WORKFLOW.md for current phase and next actions"
echo "  Follow editorial-template/phases/PHASE-0-INCEPTION.md"
