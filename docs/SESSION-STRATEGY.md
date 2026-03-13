# Session Strategy

A session is the operational unit of work.

## Session types

- inception
- chapter-edit
- block-review
- terminology-review
- grounding-review
- consistency-review
- qa-review
- publication-review

## Session lifecycle

1. start session
2. generate context pack
3. perform work
4. validate graph and artifacts
5. close session
6. write checkpoint

## Rules

- work by block or chapter, never by whole book
- every session must have a checkpoint
- every session should update metadata if it changes editorial meaning
