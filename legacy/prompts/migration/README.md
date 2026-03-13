# Migration Prompts

Prompts for Phase 1 — Migration. The single prompt in this
category produces a migration plan — it does not move files.

## Prompts disponibles

### plan-corpus-migration.md
Generates a migration plan mapping existing notes to their
target domain directories in `corpus/notes/[domain]/`.

**Cuándo:** At the start of Phase 1, before moving any files.
**Input:** List of existing notes + index v0 sections
**Output:** Migration plan for author review — not a file move
**Modelo:** Medium — classification task, not synthesis

---

## Why a plan before moving

Notes that end up in the wrong domain directory create
misalignment in Phase 2 — the coverage matrix maps notes
by directory, so a misplaced note looks like a gap.

The migration plan surfaces ambiguous cases — notes that
could belong to more than one domain — before they become
problems in Alignment.
