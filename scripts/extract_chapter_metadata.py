from pathlib import Path
from scripts.utils.markdown_tools import extract_title
from scripts.utils.yaml_tools import write_yaml

TEMPLATE = {
    "id": "",
    "title": "",
    "path": "",
    "chapter_type": "",
    "domain": "",
    "status": "draft",
    "owner": "editorial",
    "audience": "",
    "concepts_explained": [],
    "concepts_assumed": [],
    "primary_terms": [],
    "secondary_terms": [],
    "prerequisites": [],
    "related_chapters": [],
    "references": [],
    "corpus_sources": [],
    "claims": [],
    "coverage_role": "primary",
    "grounding_level": "unknown",
    "ai_risk_level": "unknown",
    "session_tags": [],
}

def main():
    root = Path(".")
    for md in root.glob("manuscript/**/*.md"):
        if md.name == "index.md":
            continue
        meta = md.with_suffix(".metadata.yml")
        if meta.exists():
            continue
        rel = md.as_posix()
        data = dict(TEMPLATE)
        data["id"] = "ch_" + md.stem.replace("-", "_")
        data["title"] = extract_title(md)
        data["path"] = rel
        parts = md.parts
        data["domain"] = parts[1] if len(parts) > 2 else "general"
        write_yaml(meta, data)
        print(f"Created {meta}")

if __name__ == "__main__":
    main()
