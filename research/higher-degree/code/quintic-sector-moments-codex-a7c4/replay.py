"""Replay the exact degree-five payoff comparisons. Agent-ID: codex-a7c4."""

from pathlib import Path
import subprocess
import sys


def main():
    here = Path(__file__).resolve().parent
    repo = here.parents[3]
    previous = here.parent / "quintic-mixed-sectors-codex-a7c4"
    # These establish the prefix strips, Rice inputs and original conditional debit.
    for path in (
        previous / "all_sector.py",
        previous / "transfer.py",
        here / "restriction_controls.py",
        here / "test_mass_gram.py",
        here / "test_spiked_p7.py",
        here / "cover.py",
        here / "deformed_ray.py",
        here / "shape.py",
        here / "shape_deformed.py",
    ):
        print(f"Checking {path.relative_to(repo)}", flush=True)
        subprocess.run([sys.executable, "-IB", "-O", str(path)], check=True, cwd=repo)


if __name__ == "__main__":
    main()
