from datetime import datetime
from pathlib import Path

def session_id(prefix="session"):
    return f"{prefix}-{datetime.now().strftime('%Y%m%d-%H%M%S')}"
