# Quickstart

## 1. Create a project

```bash
./init.sh --project-name "example-docs" --output-dir "../example-docs"
```

## 2. Open the generated project

Start with:

- `README.md`
- `WORKFLOW.md`
- `docs/SESSION-STRATEGY.md`

## 3. Run inception

Use the prompts in:

- `prompts/phases/phase-0-inception/`

## 4. Build the editorial graph

```bash
python scripts/extract_chapter_metadata.py
python scripts/build_editorial_graph.py
python scripts/validate_editorial_graph.py
```

## 5. Start the first session

```bash
python scripts/start_session.py --type inception --name "project-bootstrap"
```
