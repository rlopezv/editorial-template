from pathlib import Path
from scripts.utils.yaml_tools import read_yaml, write_yaml

def main():
    root = Path(".")
    chapter_nodes = []
    for meta in root.glob("manuscript/**/*.metadata.yml"):
        data = read_yaml(meta, default={})
        if not data:
            continue
        chapter_nodes.append({
            "id": data.get("id", meta.stem),
            "type": "chapter",
            "label": data.get("title", meta.stem),
            "attrs": {
                "path": data.get("path", ""),
                "chapter_type": data.get("chapter_type", ""),
                "domain": data.get("domain", ""),
            }
        })
    write_yaml(root / "editorial-graph/data/nodes/chapters.yml", {"nodes": chapter_nodes})
    print(f"Wrote {len(chapter_nodes)} chapter nodes.")

if __name__ == "__main__":
    main()
