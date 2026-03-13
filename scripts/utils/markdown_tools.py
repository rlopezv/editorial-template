from pathlib import Path

def extract_title(md_path):
    path = Path(md_path)
    if not path.exists():
        return path.stem.replace("-", " ").title()
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("# "):
            return line[2:].strip()
    return path.stem.replace("-", " ").title()
