from pathlib import Path
import yaml

def read_yaml(path, default=None):
    p = Path(path)
    if not p.exists():
        return {} if default is None else default
    with p.open("r", encoding="utf-8") as f:
        data = yaml.safe_load(f)
    return data if data is not None else ({} if default is None else default)

def write_yaml(path, data):
    p = Path(path)
    p.parent.mkdir(parents=True, exist_ok=True)
    with p.open("w", encoding="utf-8") as f:
        yaml.safe_dump(data, f, sort_keys=False, allow_unicode=True)
