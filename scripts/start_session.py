import argparse
from pathlib import Path
from datetime import datetime

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--type", required=True)
    parser.add_argument("--name", required=True)
    args = parser.parse_args()

    sid = datetime.now().strftime("session-%Y%m%d-%H%M%S")
    path = Path("sessions/checkpoints") / f"{sid}-{args.name}.md"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        f"# {sid}\n\nType: {args.type}\nName: {args.name}\n\n## Objective\n\n## Inputs\n\n## Outputs\n\n## Next Session\n",
        encoding="utf-8"
    )
    print(f"Started session: {path}")

if __name__ == "__main__":
    main()
