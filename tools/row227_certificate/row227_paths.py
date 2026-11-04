"""Explicit staging paths for row227 generation. Agent-ID: codex-aa04."""
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

def workspace():
    """Require the orchestrator-owned temporary tree; never infer output paths."""
    raw = os.environ.get("GROTHE_ROW227_GENERATION_DIR")
    if not raw:
        raise RuntimeError("Run tools/gen_row227_full_certificate.py, not a family directly")
    path = Path(raw).resolve()
    if not path.is_dir() or path == ROOT or path.is_relative_to(ROOT):
        raise RuntimeError("Generation staging must be an existing directory outside the repository")
    return path
