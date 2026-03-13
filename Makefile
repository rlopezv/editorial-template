.PHONY: validate graph session-pack

validate:
	python scripts/validate_editorial_graph.py

graph:
	python scripts/build_editorial_graph.py

session-pack:
	python scripts/export_session_context.py --help
