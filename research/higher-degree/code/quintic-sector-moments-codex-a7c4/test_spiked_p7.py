"""Exercise the fresh spiked support and the boundaries of its shape cover."""

from fractions import Fraction as Q
from pathlib import Path
import argparse
import importlib.util
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import spiked_p7 as p7


def require(ok, reason):
    if not ok:
        raise ValueError(reason)


def main(repo):
    path = repo / "research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/verify.py"
    spec = importlib.util.spec_from_file_location("upstream_p7", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    rows = p7.read_models(module, p7.WEIGHTS)
    # Rerun the published central radii at the generator's physical charge
    # beta^2 D = .012 with the same rational row functions.
    den = 10**10
    ceilings = (9240886067, 9254729841, 9264872770, 9268921559, 9270170991, 9266275903)
    scaled = Q(12, 1000) / p7.BETA**2
    for row, limit in zip(rows, ceilings):
        score = max(base + price * scaled for price, base in row.endpoints)
        # Five extra units allow rounding the normalized slope and intercept.
        require(score < Q(limit + 5, den), "declared slab radius")
    # A partial intersection gives no improvement for an uncontrolled remainder.
    prior, t = Q(7, 8), Q(2, 5)
    require(
        p7.energy_cap(rows, Q(1), Q(3), t, scaled, prior) == prior,
        "no extrapolation beyond the shape interval",
    )
    require(
        p7.energy_cap(rows, Q(21, 5), Q(6), t, scaled, prior) < Q(".71"),
        "active rows on a cell crossing a model boundary",
    )
    outside = p7.energy_cap(rows, Q(21, 5), Q(6), t, Q(1), prior)
    require(outside == prior, "the small-sector-charge hypothesis matters")
    try:
        p7.energy_cap(rows, Q(1), Q(2), t, Q(-1), prior)
    except ValueError:
        pass
    else:
        raise ValueError("negative charge accepted")
    print("Six P7 Sturm/Stein rows, their declared radii and four controls passed.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    main(parser.parse_args().repo)
