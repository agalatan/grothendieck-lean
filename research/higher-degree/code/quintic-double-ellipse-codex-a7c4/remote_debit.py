"""One verified radial Gram profile consumes the orthogonal remote-cubic ball.
Agent-ID: codex-a7c4. Run python3 -IB remote_debit.py --repo REPO.
"""

from fractions import Fraction as Q
from math import isqrt
from pathlib import Path
import argparse, json, sys

HERE = Path(__file__).resolve().parent
EPS, ETA, RHO, C = Q(39, 50), Q(779, 10000), Q(2221, 2500), Q(431, 500)
TARGET = Q(10000, 14023) - Q(1, 100000)


def need(ok, reason):
    if not ok:
        raise ValueError(reason)


def run(repo):
    p = repo / "research/higher-degree/code/quintic-product-support-codex-a7c4"
    sys.path.insert(0, str(p))
    import step_charges as st

    row = json.loads((HERE / "unmixed.json").read_text())
    row[4] = tuple(row[4])
    step = st.load_step(repo)
    need(step.EPS == EPS and step.ETA == ETA, "same physical game")
    grid = tuple(st.bins(step))
    st.check_row(step, grid, st.WEIGHTS, row)
    need(Q(row[0], 10**6) == ETA, "zero mass-price term")
    gross, h, p0, *other = [Q(v, 10**9) for v in row[4]]
    delta = min(other) - p0
    need(
        0 < p0 < p0 + delta < EPS
        and len(other) == 5
        and (other[2] == other[3] == min(other)),
        "remote and cheapest mixed price",
    )
    a = gross + (EPS - p0) * RHO**2
    coeff = 1 - h - (EPS - p0) * C**2 - delta * (1 - C**2)
    need(coeff > 0, "increasing quadratic envelope")
    for k, left in [
        (Q("1.4023"), Q(".45512648")),
        (Q("1.4025"), Q(".45482187")),
        (Q("1.403"), Q(".45405985")),
    ]:
        T = 1 / k - Q(".00001")
        # Display the largest passing truncation on the 1e-8 grid.
        v = (T - a) / coeff
        cut = Q(isqrt(v.numerator * 10**16 // v.denominator), 10**8)
        need(
            cut == left
            and a + coeff * cut * cut < T <= a + coeff * (cut + Q(1, 10**8)) ** 2,
            "sharp grid bracket",
        )
        if k == Q("1.4023"):
            need(
                a + (coeff + delta * (1 - C**2)) * cut**2 > T,
                "mixed reserve changes verdict",
            )
        print(f"{k}: all t in [0,{cut}], next 1e-8 step fails this majorant.")
    # Ancillary control: using the remote price as the nonremote price destroys the improvement.
    need(
        a + (1 - h - (EPS - p0) * C**2) * Q(".452") ** 2 > TARGET,
        "unpriced bank misses .452",
    )
    changed = list(row)
    changed[-1] = (row[4][0] - 1, *row[4][1:])
    try:
        st.check_row(step, grid, st.WEIGHTS, changed)
    except ValueError as exc:
        need("mean and seven" in str(exc), "unexpected corruption failure")
    else:
        raise ValueError("understated mean accepted")
    print("Matched-debit, higher-target and corrupted-mean controls passed.")


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path.cwd())
    run(ap.parse_args().repo.resolve())
