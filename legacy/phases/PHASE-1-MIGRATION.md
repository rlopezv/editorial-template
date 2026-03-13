# Phase 1 — Migration

## Purpose

Moving existing notes into the project repository structure
without transforming them. Notes arrive as they are.
Migration does not edit, reformat, or restructure content.

---

## Input

- Author's existing notes in any format or location
- `index/history/index-v0.md` — for context during inventory generation
- `inception/editorial-config.yml` — for corpus directory structure

---

## Process

### Step 1 — Copy notes into repository structure

Copy all existing notes into `corpus/notes/[domain]/`.
Domain directories correspond to the sections declared
in the index v0. Do not create new domain structure —
use what the index v0 establishes.

No content editing. No reformatting. Notes arrive as they are.

### Step 2 — Generate corpus inventory

Generate `corpus/notes/inventory.yml` — a structured catalogue
of what exists in the corpus. For each note:

```yaml
- id: foundations-introduction
  fichero: foundations/introduction-to-ai-systems-engineering.md
  dominio: foundations
  conceptos_principales:
    - AI Systems Engineering como disciplina
    - sistemas AI como sistemas compuestos
    - modelo de ocho capas
    - ciclo de vida de sistemas AI
  nivel: pedagogico
  longitud_aproximada: largo
  notas_editoriales: >
    Nivel de entrada más bajo del necesario para el público
    objetivo. Cubre conceptos que el lector senior ya conoce.
    Valor diferencial en la sección de artifact dependency graph
    y en el modelo de ocho capas.
```

The inventory is the input Phase 2 needs to build
the alignment matrix. Quality of the inventory
determines quality of the alignment.

---

## Output Artefacts

```
corpus/notes/[domain]/[note].md    ← notes in repository
corpus/notes/inventory.yml         ← structured corpus catalogue
```

---

## Exit Criteria

- [ ] All existing notes are in `corpus/notes/`
- [ ] Inventory covers every migrated note
- [ ] No note content was modified during migration
- [ ] Structural validation script passes
