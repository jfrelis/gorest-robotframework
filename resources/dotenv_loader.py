import os
from pathlib import Path
from dotenv import load_dotenv


def load_access_token():
    env_path = Path(__file__).resolve().parents[1] / ".env"
    load_dotenv(env_path)
    return os.environ.get("ACCESS_TOKEN", "")
