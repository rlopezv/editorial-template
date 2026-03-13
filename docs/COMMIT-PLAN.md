# Suggested commit grouping

This bundle contains the **final consolidated repository content**.

If you want to reconstruct the history cleanly, these are the recommended grouped commits:

## 1. Initial repository bootstrap

Includes:
- README bootstrap version
- LICENSE
- CONTRIBUTING
- CODE_OF_CONDUCT
- SECURITY
- .gitignore
- .editorconfig
- .gitattributes
- docs/VISION.md

## 2. docs(readme): introduce professional repository README

Includes:
- upgraded README with badges
- branching model
- editorial pipeline diagram
- editorial knowledge graph diagram

## 3. feat(template): introduce production repository structure

Includes:
- corpus/
- manuscript/
- editorial/
- templates/
- prompts/
- scripts/
- phases/
- docs/
- references/
- schemas/
- examples/

## 4. feat(workflow): add editorial pipeline definition

Includes:
- phase documents
- gates
- workflow documentation
- quickstart and repository-structure docs

## 5. feat(sessions): introduce session-based editorial workflow

Includes:
- sessions/
- session templates
- session prompts
- session strategy docs
- checkpoint structure

## 6. feat(graph): introduce editorial knowledge graph foundation

Includes:
- editorial-graph/
- graph schema
- graph nodes and edges placeholders
- session-packs/
- graph reports
- graph documentation

## 7. feat(tooling): add automation and phase-oriented placeholders

Includes:
- scripts/phases/*
- prompts/phases/*
- graph scripts
- bootstrap.py
- init.sh
- Makefile
- requirements.txt
- pyproject.toml

## Recommended branching

- `main` -> stable, publishable
- `develop` -> integration
- `feature/*` -> new functionality
- `docs/*` -> documentation
- `fix/*` -> fixes
- `chore/*` -> maintenance
- `experiment/*` -> research
