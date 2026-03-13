# Phase 0 — Inception

## Purpose

Inception is a decision phase, not a production phase.
Its output is a set of configuration artefacts that govern
every subsequent phase. Decisions made here prevent rework later.
Decisions skipped here surface as problems in Phase 4 — at much higher cost.

Inception is complete only when all output artefacts exist,
have no empty required fields, and are internally consistent.

---

## Input

- Author's existing notes (any format, any location)
- Author's domain knowledge and experience
- Clarity about the intended audience

---

## Decision Sequence

Follow this sequence. Each decision produces part of the output artefacts.
Do not skip decisions — an incomplete decision produces an incomplete artefact
that will fail validation later.

### Decision 1 — Scope and Objective

**Questions to answer:**
- What is the book's objective — pedagogical, technical reference, or hybrid?
- What territory does the book cover exactly?
- What does it deliberately NOT cover? Boundaries matter as much as scope.
- What is the differential value proposition — what does this book have
  that no existing resource has?

**Output:** `inception/editorial-config.yml` — `scope` section

**Warning:** A scope that cannot answer the differential value proposition
question clearly is a scope that does not need to exist as a book.

---

### Decision 2 — Audience Profiles

**Questions to answer:**
- Who are the readers exactly — with what prior knowledge do they arrive?
- What is their dominant question about the domain?
- How do they read — linearly, as reference, or mixed?
- What dangerous knowledge transfers exist — analogies from their
  prior domain that are partially correct but lead to wrong decisions?
- Are the profiles distinct enough to justify separate paths,
  or is the distinction artificial?

**Output:** `inception/editorial-config.yml` — `publico` section
and `inception/config/paths/[profile].yml` (structure only — chapter
sequences populated in Phase 3)

---

### Decision 3 — Author's Knowledge Perimeter

**Questions to answer:**
- In which domains can the author validate content with high confidence —
  detecting both gross and subtle errors?
- In which domains does the author have peripheral knowledge —
  enough to detect gross errors but not subtle ones?
- In which domains can the author not validate — and what is the plan:
  external reviewer, explicit exclusion, or declared confidence level?

**Output:** `inception/editorial-config.yml` — `autor` section

**Warning:** This is the most uncomfortable decision and the most important
for the book's integrity. A declared perimeter protects the reader.
An undeclared perimeter produces a book where the author cannot
stand behind every claim.

---

### Decision 4 — Chapter Taxonomy

**Questions to answer:**
- What types of chapters does this book need given its objective?
- What is the destination format of each type — required sections,
  optional sections, quality criteria?
- Are there types specific to this book that the template's
  default taxonomy does not cover?

**Output:** `inception/config/chapter-types.yml`

**Note:** The template provides default taxonomies for pedagogical
and reference objectives. Review them before creating custom types —
most books do not need new types, only configuration of existing ones.

---

### Decision 5 — AI Usage Policy

**Questions to answer:**
- Which operations in this project use AI and which do not?
- What model is appropriate for each operation type?
- What is the content origin labelling policy for this project?
- What validation is required before AI-generated content
  can enter a published snapshot?

**Output:** `inception/ai-usage-policy.yml`

---

### Decision 6 — Publishing Criteria

**Questions to answer:**
- What validation state must a chapter reach to enter a published snapshot?
- What percentage of nucleus chapters must meet that threshold
  for a snapshot to be published?
- How does the snapshot declare chapter states to readers?
- Is there a publication calendar or is publishing triggered by quality criteria?

**Output:** `inception/editorial-config.yml` — `snapshots` section

---

### Decision 7 — Corpus Analysis, Index v0, and Domain References

With decisions 1-6 complete, generate three artefacts that
Phase 2 depends on. Execute in order — each step is input
to the next.

**Step 1 — Corpus analysis:**
Use prompt: `prompts/inception/analyse-corpus-notes.md`

Before generating the index, analyse the existing notes to
understand what the corpus actually contains. Notes written
by an author are rarely organised by the book's structure —
they follow the flow of thought and mix domains.

The analysis identifies:
- The dominant domain of each note
- Secondary domains covered by each note
- Fragments that could be split before migrating
- Notes that are meta documents (indices, maps) rather than content
- Gaps — concepts the scope requires but no note covers

Store as `corpus/notes/analysis.yml`.
Review fragmentation recommendations before continuing.
Fragment notes that warrant it, then re-run analysis on new fragments.

**Step 2 — Index v0:**
Use prompt: `prompts/inception/generate-index-v0.md`

Run after corpus analysis — provide `analysis.yml` as additional
input so the index reflects what the corpus actually contains,
not only the declared scope.

The index covers the full scope — including areas where no notes
exist yet — making the gap between current corpus and full scope
explicit from the start.

Each chapter entry must include:
- chapter number and descriptive title
- chapter type from the taxonomy
- primary audience profiles
- corpus status: `[N]` has notes, `[P]` placeholder
- one-sentence description of scope

Store as `index/history/index-v0.md`.
Review all revision signals before proceeding.

**Step 3 — Domain references:**
Use prompt: `prompts/inception/generate-domain-refs.md`

Run after index v0 — the prompt needs the sections
to organise references correctly.

Generate at section granularity, not chapter granularity.
Chapters are unstable in v0. Sections are stable.
Chapter-level references are generated in Phase 4.

Store as `references/domain-refs.yml`.

**Critical:** All references generated by AI have `verificado: pendiente`.
Human verification of URLs and metadata is required before
any reference appears in published content.

---

## Output Artefacts

```
inception/
├── editorial-config.yml          ← central project configuration
├── ai-usage-policy.yml           ← AI usage by operation type
├── changelog-editorial.md        ← initialised with Inception decisions
└── config/
    ├── chapter-types.yml         ← chapter taxonomy with formats
    └── paths/
        └── [profile].yml         ← one per declared audience profile

corpus/
└── notes/
    ├── analysis.yml              ← corpus content analysis
    └── meta/                     ← index notes and maps, not content

index/
└── history/
    └── index-v0.md               ← full scope index hypothesis

references/
└── domain-refs.yml               ← domain references by section

.editorial/
└── checkpoints/                  ← session checkpoints for resuming work
```

---

## Exit Criteria

Inception is complete when ALL of the following are true:

- [ ] `editorial-config.yml` has no empty required fields
- [ ] `chapter-types.yml` has at least one chapter type with complete format
- [ ] One `[profile].yml` file exists per declared audience profile
- [ ] `ai-usage-policy.yml` covers all operation types
- [ ] `changelog-editorial.md` documents all seven Inception decisions
- [ ] `corpus/notes/analysis.yml` covers all existing notes
- [ ] All `fragmentar-antes` recommendations resolved before index generation
- [ ] `index-v0.md` covers the full declared scope with corpus status per chapter
- [ ] `domain-refs.yml` has canonical references and at least one section covered
- [ ] No internal inconsistencies between artefacts
- [ ] Author's knowledge perimeter is explicitly declared
- [ ] Plan exists for every domain outside the perimeter

Do not proceed to Phase 1 until all criteria are met.
Partial Inception creates partial foundations —
the cost appears later, not now.

---

## Common Inception Failures

**Scope too broad for the author's knowledge perimeter.**
The declared scope covers domains the author cannot validate.
Fix: either narrow the scope or establish external reviewers
before proceeding.

**Audience profiles not distinct enough.**
Two profiles share the same dominant question and the same
knowledge gaps. They do not need separate paths.
Fix: merge profiles or sharpen the distinction.

**Index v0 generated before scope is finalised.**
The index reflects an earlier version of the scope.
Misalignment surfaces in Phase 2 as unexpected revision signals.
Fix: regenerate index v0 after scope is stable.

**Domain references generated at wrong granularity.**
Only canonical references without section coverage,
or full chapter-level coverage for an unstable index.
Fix: section-level coverage is the right granularity for Inception.
Chapter-level references belong in Phase 4.
