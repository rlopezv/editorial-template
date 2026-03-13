# Synthesis Prompts

Prompts for generating chapter drafts from candidate note fragments,
mapped to the destination format of each chapter type.

## When to use

Use synthesis prompts in Phase 4 — Enrichment, for each chapter
that has candidate notes in the coverage matrix.

## How to use

1. Identify the chapter type from metadata.yml
2. Select the corresponding prompt from `by-chapter-type/`
3. Assemble the input:
   - Chapter description from index-current.md
   - Candidate note fragments from coverage-matrix.yml
   - Destination format from chapter-types.yml
   - Relevant references from domain-refs.yml
4. Run the prompt section by section — not the full chapter at once
5. Review the output for gaps (explicitly annotated by the prompt)
6. Fill gaps with author knowledge or elicitation
7. Set origin label on each section of the output

## What synthesis produces

A structured draft that:
- Selects and organises the best content from candidate notes
- Maps content to the correct sections of the destination format
- Explicitly annotates gaps — sections with no note coverage
- Labels discarded fragments with the reason for discarding

Synthesis does not produce final content. It produces
the best draft possible from available material, with
gaps made explicit for human completion.

## Model and optimisation

Synthesis uses a large model with chunked context.
Process one section at a time — include only the relevant
note fragments for that section, not the entire note corpus.
See ai-usage-policy.yml.
