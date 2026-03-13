from pathlib import Path
from scripts.utils.yaml_tools import read_yaml

FILES = [
    "editorial-graph/data/nodes/chapters.yml",
    "editorial-graph/data/edges/structural.yml",
    "editorial/terminology.yml",
    "references/domain-refs.yml",
]

def main():
    ok = True
    for rel in FILES:
        path = Path(rel)
        if not path.exists():
            print(f"Missing: {rel}")
            ok = False
            continue
        try:
            read_yaml(path)
        except Exception as e:
            print(f"Invalid YAML: {rel}: {e}")
            ok = False
    if ok:
        print("Editorial graph validation passed.")
    raise SystemExit(0 if ok else 1)

if __name__ == "__main__":
    main()
