# Elicitation Prompts

Prompts for extracting tacit knowledge from the author
through structured conversation.

## When to use

Use elicitation prompts when:
- Starting a new domain area with no notes yet
- The coverage matrix shows a chapter with no candidate notes
- A Field Pattern chapter needs specific operational experience
- Gate 1 reveals chapters without real author knowledge behind them

## How to use

1. Select the prompt for the relevant domain from `by-domain/`
2. Read the prompt fully before starting — understand what
   knowledge it is trying to surface
3. Use it as a conversation guide, not a rigid script —
   follow the author's answers into adjacent knowledge
4. Document the output as a note in `corpus/notes/[domain]/`
   with origin: elicitado
5. Have the author review the note before marking it validated

## What elicitation produces

Elicitation surfaces knowledge the author has but has not
documented. The output is always labelled `elicitado` —
it came from the author, surfaced through conversation.

It is distinct from `ia-generado-sin-base` — the AI
did not provide the knowledge, it drew it out.

## Model and cost

Elicitation uses a large model with no context optimisation.
This is the highest-cost operation in the process and
the most irreplaceable. See ai-usage-policy.yml.

Plan elicitation sessions by domain — not by chapter —
to maximise the value of each session.
