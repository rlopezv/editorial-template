from pathlib import Path

GRAPH_NODE_FILES = [
    "books.yml","parts.yml","blocks.yml","chapters.yml","concepts.yml","terms.yml",
    "claims.yml","references.yml","corpus-notes.yml","rules.yml","audiences.yml"
]
GRAPH_EDGE_FILES = [
    "structural.yml","conceptual.yml","terminology.yml","grounding.yml",
    "pedagogical.yml","provenance.yml","conflicts.yml"
]

def graph_root(base="."):
    return Path(base) / "editorial-graph"
