"""Replay the degree-five region proofs in isolated Python interpreters. Agent-ID: codex-a7c4."""

from pathlib import Path
import subprocess
import sys


def main():
    here = Path(__file__).resolve().parent
    repo = here.parents[3]
    # Source checkers import different siblings under the historical name "verify".
    # Use a fresh isolated interpreter per proof, including the high-amplitude splice.
    for path in (
        here / "sector_gram.py",
        here / "step_shoulder.py",
        here.parent / "quintic-node-pilot-codex-a7c4/free_tangent.py",
        here / "transfer.py",
        here / "all_sector.py",
    ):
        print(f"Replaying {path.relative_to(repo)}", flush=True)
        subprocess.run([sys.executable, "-IB", "-O", str(path)], cwd=repo, check=True)


if __name__ == "__main__":
    main()
