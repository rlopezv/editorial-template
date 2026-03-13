# Evaluation Prompts

Prompts for evaluating chapter quality against criteria
and external references.

## When to use

Use evaluation prompts:
- After synthesis, before human review (Phase 4)
- At Gate 1 to assess index chapter descriptions
- At Gate 2 to assess chapter stability before labs
- During Phase 7 Maintenance to detect obsolescence

## What evaluation covers — and what it does not

**Covered with high reliability:**
- Coverage of required sections in the destination format
- Coherence between chapter content and index description
- Level alignment with the declared audience profile
- Terminology consistency within the chapter
- Presence of unsupported claims

**Covered with medium reliability (requires human confirmation):**
- Depth relative to external references
- Gaps in domain concepts compared to references
- Terminology alignment with domain standards

**Not covered — always requires human judgment:**
- Technical correctness of original claims
- Currency of content (post-cutoff developments)
- Honesty of trade-offs
- Representativeness of examples

## Output format

Evaluation produces a structured report:
- Section coverage: present / partial / absent
- Level assessment: too basic / appropriate / too advanced
- Terminology flags: inconsistencies found
- Reference gaps: concepts in references not covered
- Unsupported claims: assertions without evidence
- Overall recommendation: ready for review / needs work / major revision

## Model and optimisation

Evaluation uses a medium model with structured criteria prompts.
Criteria prompts are reusable across chapters of the same type —
load the criteria once, evaluate multiple chapters.
See ai-usage-policy.yml.
