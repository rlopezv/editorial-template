import argparse
from pathlib import Path
from scripts.utils.yaml_tools import read_yaml

def build_chapter_pack(chapter_id):
    root = Path(".")
    for meta in root.glob("manuscript/**/*.metadata.yml"):
        data = read_yaml(meta, default={})
        if data.get("id") == chapter_id:
            lines = [
                f"# Session Pack — {data.get('title', chapter_id)}",
                "",
                f"- Chapter ID: {data.get('id','')}",
                f"- Type: {data.get('chapter_type','')}",
                f"- Domain: {data.get('domain','')}",
                "",
                "## Concepts Explained",
            ]
            lines += [f"- {x}" for x in data.get("concepts_explained", [])] or ["- (none)"]
            lines += ["", "## Concepts Assumed"]
            lines += [f"- {x}" for x in data.get("concepts_assumed", [])] or ["- (none)"]
            lines += ["", "## Canonical Terms"]
            lines += [f"- {x}" for x in data.get("primary_terms", [])] or ["- (none)"]
            lines += ["", "## References"]
            lines += [f"- {x}" for x in data.get("references", [])] or ["- (none)"]
            return "\n".join(lines)
    raise SystemExit(f"Chapter not found: {chapter_id}")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--chapter")
    args = parser.parse_args()
    if not args.chapter:
        parser.print_help()
        return
    pack = build_chapter_pack(args.chapter)
    out = Path("editorial-graph/session-packs/chapters") / f"{args.chapter}.md"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(pack, encoding="utf-8")
    print(f"Wrote {out}")

if __name__ == "__main__":
    main()
