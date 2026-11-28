"""Sector-reweighted elliptic support and conditional Gaussian contrast.
Agent-ID: codex-a7c4. Pure rational verification.
"""

import argparse
from fractions import Fraction as F
from pathlib import Path
from importlib.util import module_from_spec, spec_from_file_location
import json


def load(path):
    spec = spec_from_file_location(path.stem, path)
    lib = module_from_spec(spec)
    spec.loader.exec_module(lib)
    return lib


def need(cond, why):
    if not cond:
        raise ValueError(why)


def main(repo):
    packet = Path(__file__).resolve().parent
    proof = load(packet / "shape_radius.py").Proof(repo)
    j = proof.j
    pi_lo, pi_hi = load(
        repo / "research/conjecture-K/code/real-stein-501-gemini-8732/verify.py"
    ).verify_pi_bounds()
    mu2 = pi_hi / 4
    target = proof.target
    for local in (proof.rows, proof.refined):
        need(
            all((price - F(1, j.SCALE)) * (pi_lo / pi_hi)**2 > mu2
                for lo, hi, price in local if lo <= 9),
            "all recorded squared prices dominate pi/4 on real excess [0,9]",
        )
    need(proof.rho**2 > mu2 and j.RATE > 0, "global and OU prices")
    # Twelve independent unit triples in the remote sector; one fresh triple in (1,0).
    t, A, ar, m, K = map(F, (".47", ".62", ".56", ".06", ".637"))
    excess = (F(6, 12) * ar**2 + 6 * m * m) / A**2
    need(A == ar + m and K >= A and t * t + K < 1, "Parseval and energies")
    need(
        A + F(".864") ** 2 * t * t < pi_lo / 4,
        "all nonnegative weighted elliptic tests, even up to carrier .864",
    )
    need(ar + t * t < pi_lo / 4, "independent diffuse remote arm")
    ymax = j.sqrt_hi(excess)
    ymin = j.sqrt_lo(excess)
    J = [
        (p, min(a + b * excess + d * ymin**3, a + b * excess + d * ymax**3))
        for p, a, b, d in proof.pool
    ]
    need(
        all(2 * j.EH * p * j.sqrt_hi(A) - cost <= j.MC * K for p, cost in J),
        "all 24 mass cuts",
    )
    need(j.EH * A - j.MC * K <= j.MS, "global mass cut")
    for name in ("mixed.json", "unmixed.json"):
        raw_prices = json.loads((packet / name).read_text())[4][3:]
        need(
            len(raw_prices) == 5 and raw_prices[2] == min(raw_prices),
            "minimum price in true (1,0) sector",
        )
    payoffs = [j.H + (1 - j.H) * t * t + j.E * A - j.H * K]
    for gross, h, p0, gap, d, _ in proof.gram:
        payoffs.append(gross + (1 - h) * t * t + (j.E - p0) * A - gap * m - d * K)
    need(min(payoffs) - target > F(".0013"), "prices admit a violation")
    print(
        "Mixed-sector trial obstruction. True excess",
        excess,
        "payoff room floor",
        int((min(payoffs) - target) * 10**9),
        "billionths.",
    )
    r = 2 * j.AXIS**2 - 1
    var = 1 + r * r
    third = 2 + 6 * r * r

    def energy(t):
        ell2 = j.C**2 * t * t
        wl = ell2 / mu2
        debit = wl**2 * var**2 / (4 * (2 * var + third * wl))
        need(0 <= debit < 1, "valid relative deficit")
        return mu2 * (1 - debit) ** 2 - ell2

    row = next(row for row in proof.gram if row[4] == 0)
    gross, h, p0, gap, _, _ = row

    need(j.E - p0 >= gap and 1 - h >= gap, "monotone projected-energy payoff")

    def bound(lo, hi, outside=0):
        a = energy(lo) + outside
        # Increasing in both energy and squared amplitude at the two breakpoints.
        return (
            gross
            + (1 - h) * hi**2
            + (j.E - p0) * a
            - gap * max(0, a + hi**2 - proof.rho**2)
        )

    for stop, outside in (
        (F(".4814"), F(0)),
        (F(".480"), F(".0006")),
        (F(".470"), F(".005")),
    ):
        pending = [(F(0), stop)]
        length = F(0)
        count = 0
        margin = target
        while pending:
            lo, hi = pending.pop()
            spare = target - bound(lo, hi, outside)
            if spare > 0:
                length += hi - lo
                count += 1
                margin = min(margin, spare)
            else:
                need(hi - lo > F(1, 10**8), "failed conditional Gaussian tube")
                mid = (lo + hi) / 2
                pending.extend(((lo, mid), (mid, hi)))
        need(length == stop, "complete amplitude prefix")
        need(margin > F(1, 10**7), "conditional cover clearance")
        print(
            f"t through {stop}, orthogonal physical energy <= {outside}: {count} intervals, clearance floor {int(margin*10**12)} trillionths."
        )
    fail = F(".4815")
    need(bound(fail, fail) > target, "later frozen relaxation control")
    # The original relaxation tuple is ruled out by the new class-specific lift.
    need(energy(t) < A - F(".007"), "conditional Gaussian deficit excludes tuple")
    print("Its class-specific energy cap falls below the proposed tuple by >.007.")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", type=Path, default=Path.cwd())
    a = ap.parse_args()
    main(a.repo.resolve())
