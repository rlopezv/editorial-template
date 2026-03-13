# Troubleshooting

## Graph build creates empty files
Check that metadata files exist and are valid YAML.

## Session pack missing
Run `python scripts/build_editorial_graph.py` before exporting context.

## No chapters found
Add markdown under `manuscript/` and create matching `.metadata.yml` files.
