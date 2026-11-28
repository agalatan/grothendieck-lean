"""Replay the 11.61 exempt box [1/1000, 3/2000] x [0, 13/2] in (u, sqrt(chi)) from committed inputs.

Agent-ID: claude-b9ee. Issue #858. Route found by codex-062a (#858 comment, 28 Nov 2026).

The box is split at sqrt(chi) = 23/4.
  * Lower piece [0, 23/4]: the cost of the 7/25 allowance is at most (2/25) u^2 chi <= (2/25)(3/2000)^2 (23/4)^2,
    which is below the exempt allowance EPS = 6e-6.
  * Upper piece [23/4, 13/2]: cap 0 of the committed witness alone suffices. It is regenerated here from its two
    nodes with 128-bit Arb and must equal the stored rationals. The Gaussian benchmark lower bounds at both energy
    ends must equal the stored values. All 16 bidegree-(3,3) Bernstein coefficients of the margin on the box must be
    positive.

Needs python-flint (tested with 0.8.0). Run from the repository root:

    python3 -IB research/conjecture-K/code/tilted-sector-2026-11-15/exempt_box_11_61.py
"""
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path[:0] = [
    str(ROOT / "code/audit-2026-11-15-codex-a7c4/remote_stein_original"),
    str(ROOT / "code/tilted-sector-2026-11-15"),
]
import deficit_moment_verify as v  # noqa: E402

WITNESS = ROOT / "sources/received-2026-11-15-tilted-sector/deficit_moment_verify_witness.json"


def check(condition, message):
    if not condition:
        raise SystemExit(f"FAIL: {message}")


def main():
    w = json.loads(WITNESS.read_text())
    v.ALPHA = Q(7, 25)
    lo, hi, split, top = Q(1, 1000), Q(3, 2000), Q(23, 4), Q(13, 2)

    lower_cost = Q(2, 25) * hi**2 * split**2
    check(lower_cost <= v.EPS, f"lower piece cost {lower_cost} exceeds the allowance {v.EPS}")

    cap = v.fresh_cap(*map(Q, w["caps"][0]["nodes"]))
    check(cap == tuple(map(Q, w["caps"][0]["coefficients"])), "cap 0 does not regenerate from its nodes")
    for u in (lo, hi):
        check(v.blo(u) == Q(w["benchmark_lower"][str(u)]), f"benchmark lower bound changed at u = {u}")

    coeffs = v.bernstein2(v.margin(cap, (lo, hi), 0), (lo, hi, split, top))
    check(len(coeffs) == 16, "expected 16 bidegree-(3,3) Bernstein coefficients")
    least = min(coeffs)
    check(least > Q(92455, 10**10), f"upper piece margin {least} is not above 9.2455e-6")

    print(f"lower piece: cost {lower_cost} = {float(lower_cost):.3e} <= {v.EPS}")
    print(f"upper piece: cap 0 regenerated; 16 Bernstein coefficients, minimum {float(least):.6e} > 0")
    print("exempt box [1/1000, 3/2000] x [0, 13/2] certified from committed inputs")


if __name__ == "__main__":
    main()
