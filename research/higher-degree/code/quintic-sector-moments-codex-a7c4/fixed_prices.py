"""Exact obstruction to changing only the sector LP while retaining its Holder prices.
Agent-ID: codex-a7c4. The test vector is feasible in the sector-price relaxation.
"""

import sys, json, argparse
from pathlib import Path
from fractions import Fraction as Q

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import cover, spiked_p7 as p7, mass_gram as mg


def check(repo):
    code = repo / "research/higher-degree/code"
    old = cover.module(code / "quintic-mixed-sectors-codex-a7c4/all_sector.py")
    j = cover.module(code / "joint-spectral-cubic-lift-codex-a7c4/verify.py")
    v = cover.module(code / "spiked-cubic-radius-gemini-4c4c/verify.py")
    h, p0, w = old.gram_prices()
    bank = mg.make_rows(old.gram, w)
    t, y, A = Q(".4085"), Q("2.305"), Q(".695")
    chi = y * y
    beta = p7.BETA
    pv = p7.ELL**2
    lower = max(j.A_MIN, (cover.TARGET - j.H - (1 - j.H) * t * t) / (j.E - j.H))
    pool = j.witnesses((repo / "Grothe/Lower/MassWitnessData.lean").read_text())
    choices = [(p, a + b * chi + c * y**3) for p, a, b, c in pool]
    p, J = max(choices, key=lambda z: 2 * j.EH * z[0] * j.sqrt_lo(A) - z[1])
    mass = lambda a: (2 * j.EH * p * j.sqrt_lo(a) - J) / j.MC
    # Measure raw P7 sector E_10 in the normalized test, not physical x_10.
    old_cap = (j.E - p0 + (j.H + old.L + (1 - h) * t * t - cover.TARGET) / A) * beta**2
    limits = [(old_cap, w[2])]
    scaled_caps = [old_cap]
    for r, g in zip(bank, mg.TRIALS):
        base = r.constant + (1 - r.visible_price) * t * t - cover.TARGET
        d = r.mass_price
        rhs = beta**2 * (
            j.E - r.remote_price + max((base - d * mass(A)) / A, (base - d * mass(lower)) / lower)
        )
        five = [Q(x, 10**7) - r.remote_price for x in g[-1][2:]]
        limits.append((rhs, five[2]))
        scaled_caps.append(rhs / r.sector_scale)
    # Maximum allowed E10 when all four other tested visible slots vanish.
    E10 = min([beta**2] + [rhs / c for rhs, c in limits])
    cover.need(
        E10 >= 0 and all(c * E10 <= rhs for rhs, c in limits) and E10 <= beta**2,
        "feasible primal energy",
    )
    cover.need(
        j.H + (1 - j.H) * t * t + j.E * A - j.H * mass(A) > cover.TARGET + Q(".00202"),
        "mass-only payoff at the trial energy",
    )
    raw = json.loads((HERE / "p7_stein_rows.json").read_text())
    row = next(row for row in raw["rows"] if Q(row["s_lo"]) == Q("5.3"))
    lam2 = Q(row["lam"][2])
    l3 = sum(map(Q, row["l3"]))
    dd = max(Q(0), lam2 + 2 * Q(row["m_del"]))
    cf = lam2 + Q(row["mu_a"]) + Q(row["mu_rho"]) + Q(row["vr"][0]) + Q(row["mu_F4"]) / 8

    def sec(name):
        r = row["sec_dual"][name]
        th = Q(r["theta_12"])
        return [
            cf * pv * df + dd * pv * dew + Q(row["mu_w1"]) * pv * ed + 15 * l3 * pv**2 * T + Q(hol)
            for df, dew, ed, T, hol in zip(
                (4, 0, 0, 4, 4),
                (4 * (1 + th), 8 * (1 + 1 / th), 8, 0, 16),
                (1, 2, 1, 0, 2),
                (12, 10, 4, 4, 22),
                r["a_hol"],
            )
        ]

    coeff = {name: sec(name) for name in ("lo", "hi")}
    for name in coeff:
        cover.need(
            0 <= min(coeff[name]) <= max(coeff[name]) < 1,
            "identity multipliers majorize the sector coefficients",
        )
        row["sec_dual"][name]["y_sec"] = ["1"] * 5
    I = [[Q(i == k) for i in range(5)] for k in range(5)]
    res = v.verify_spiked_row(row, p7.ABC, I, [Q(0)] * 5, {"new": raw["knots"]}, quiet=True)
    cover.need(res["ok"], "upstream fixed-potential checks")

    def support(offset):
        vals = [res["bounds"][e] + offset(e) for e in ("lo", "hi")]
        frac = (chi - Q(row["s_lo"])) / (Q(row["s_hi"]) - Q(row["s_lo"]))
        return vals[0] * (1 - frac) + vals[1] * frac

    obstacle = support(lambda e: coeff[e][2] * E10)
    upper = support(lambda e: max(c / ww for c, ww in zip(coeff[e], w)) * min(scaled_caps))
    required = p7.ELL * t + beta * j.sqrt_hi(A)
    cover.need(obstacle > required + Q(13197, 10**9), "frozen-price lower obstruction")
    cover.need(0 <= upper - obstacle < Q(4751, 10**12), "gain from six separate weights")
    print("All six raw Gram rows and simplex satisfy a single E10-only primal test.")
    print(
        "Frozen C3 obstruction exceeds required support by",
        ((obstacle - required) * 10**9) // 1,
        "billionths.",
    )
    print(
        "Best possible gain over the collapsed price is less than",
        -(-(upper - obstacle) * 10**12 // 1),
        "trillionths.",
    )


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--repo", type=Path, default=HERE.parents[3])
    check(p.parse_args().repo)
