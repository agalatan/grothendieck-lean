"""Direct matched P7/Gram replay for the degree-five low-excess sector. Agent-ID: codex-a7c4."""

from pathlib import Path
from fractions import Fraction as F
import argparse
import json
import sys


def check(cond, msg):
    if not cond:
        raise ValueError(msg)


def gram_models(repo):
    code = repo / "research/higher-degree/code"
    pkg = code / "quintic-double-ellipse-codex-a7c4"
    sys.path.insert(0, str(code / "quintic-product-support-codex-a7c4"))
    import step_charges as st

    step = st.load_step(repo)
    grid = tuple(st.bins(step))
    raw = [
        json.loads((pkg / name).read_text()) for name in ["mixed.json", "unmixed.json"]
    ]
    raw += list(st.ROWS)
    gram = []
    for rr in raw:
        rr = list(rr)
        rr[4] = tuple(rr[4])
        st.check_row(step, grid, st.WEIGHTS, rr)
        ci, _, _, _, prices = rr
        C, h, p, *ds = [F(v, 10**9) for v in prices]
        mass_price = step.ETA - F(ci, 10**6)
        gaps = [sector_price - p for sector_price in ds]
        check(
            0 <= mass_price and h <= 1 and len(gaps) == 5 and min(gaps) > 0,
            "mass price, amplitude coefficient and five forced-energy debits",
        )
        check(all(g > p for g in ds), "each nonremote price exceeds the remote price")
        gram.append((C, h, p, mass_price, gaps))
    return gram


def radii(repo, grams, which):
    code = repo / "research/higher-degree/code"
    pkg = code / "spiked-cubic-radius-gemini-4c4c"
    sys.path.insert(0, str(pkg))
    import verify as ver
    from matched_coefficients import coefficients
    from p7_product import product_factors, FREQUENCIES, symmetric_product

    pair = product_factors()
    f = FREQUENCIES
    cert = json.loads((pkg / "cert_spiked.json").read_text())
    rows = []

    def loss(terms):
        groups = [F(0)] * 7
        for i in range(5):
            for j in range(5):
                groups[f[i] + f[j] + 2] += pair[i][j] * terms[i] * terms[j]
        return min(
            ver.root_interval(max(groups))[1],
            symmetric_product.intercept(terms, pair, f),
        )

    for index in which:
        ray = cert["rays"][index]
        abc = ray["abc"]
        ell, beta = F(abc[0], abc[2]), F(abc[1], abc[2])
        for row in ray["rows"][:1]:
            lo, hi = map(F, (row["s_lo"], row["s_hi"]))
            check(row["v3_mode"] == "holder", "holder row")
            for sd in row["sec_dual"].values():
                sd["y_sec"] = ["0"]
            res = ver.verify_spiked_row(
                row, abc, [[0] * 5], [0], cert["knot_sets"], quiet=True
            )
            check(res["ok"], "upstream C1-C3")
            ends = []
            for side in ("lo", "hi"):
                L, H, orig = coefficients(row, beta, ver, side)
                ends.append((res["bounds"][side] - orig, L, H))
            for gi, (_, _, _, _, g) in enumerate(grams):
                if gi > 1 or min(g) <= 0:
                    continue
                for lam in [F(k, 5) for k in (1, 2, 3, 4, 5)]:
                    costs = []
                    for base, L, H in ends:
                        a = [lam * d - l for d, l in zip(g, L)]
                        if min(a) <= 0:
                            break
                        terms = [
                            (H * k) ** 2 / (4 * u) for k, u in zip(ver.KAPPA_HI, a)
                        ]
                        costs.append(base + loss(terms))
                    if len(costs) == 2:
                        rows.append((lo, hi, ell, beta, gi, lam * beta**2, *costs))
            print("verified", abc, lo, hi, len(rows), flush=True)
    return rows


def setup(repo):
    code = repo / "research/higher-degree/code"
    mod = code / "quintic-double-ellipse-codex-a7c4"
    sys.path.insert(0, str(mod))
    sys.path.insert(0, str(code / "quintic-sector-frontier-codex-a7c4"))
    from joint_sector import bernstein
    from shape_radius import Proof, load
    from carrier_tilt import verified_carrier

    pr = Proof(repo)
    pr.carrier = verified_carrier(repo, load)
    pr.tilts = (F(1), F(19, 20))
    j = pr.j
    gs = gram_models(repo)
    usable = radii(repo, gs, [1])
    target = pr.target

    def box(t0, t1, y0, y1, *, with_support=True):
        base, _, A0, A1 = pr.energy_interval(t0, t1, y0, y1)
        if A1 is None or A0 > A1:
            return True
        a, b = j.sqrt_lo(A0), j.sqrt_hi(A1)
        p, cost = max(
            pr.costs(y0, y1), key=lambda pc: 2 * j.EH * pc[0] * (a + b) / 2 - pc[1]
        )
        offset = cost / j.MC
        slope = 2 * j.EH * p / j.MC
        # On a violation K>=a_open or this stronger affine function of sqrt A.
        pol = [
            tuple(map(j.up, [base - target + j.H * offset, -j.H * slope, j.E, F(0)]))
        ]
        for C, h, p, d, gaps in gs:
            # Using K>=A yields one quadratic if stronger.
            delta = max(0, A0 + t0 * t0 - pr.rho**2)
            extra = min(gaps) * delta
            pol.extend(
                [
                    tuple(
                        map(
                            j.up,
                            [
                                C + (1 - h) * t1 * t1 - target + d * offset - extra,
                                -d * slope,
                                j.E - p,
                                F(0),
                            ],
                        )
                    ),
                    tuple(
                        map(
                            j.up,
                            [
                                C + (1 - h) * t1 * t1 - target - extra,
                                F(0),
                                j.E - p - d,
                                F(0),
                            ],
                        )
                    ),
                ]
            )
        for lo, hi, ell, beta, i, scale, c1, c2 in (usable if with_support else ()):
            if not lo <= y0 * y0 <= y1 * y1 <= hi:
                continue
            C, h, p, d, gaps = gs[i]
            rad = c1 + (c2 - c1) * ((y1 * y1 if c2 >= c1 else y0 * y0) - lo) / (hi - lo)
            c = C + (1 - h) * t1 * t1 - target
            pol.append(
                tuple(
                    map(
                        j.up,
                        [
                            scale * (c + d * offset),
                            -scale * d * slope,
                            rad + scale * (j.E - p) - ell * t0,
                            -beta,
                        ],
                    )
                )
            )

        def at(z):
            return min(((s * z + r) * z + q) * z + c for c, q, r, s in pol)

        # Look for a single certificate on this interval first, or bisect A.
        q = [(a, b, 0)]
        while q:
            u, v, n = q.pop()
            if any(bernstein(r, u, v) < 0 for r in pol):
                continue
            z = (u + v) / 2
            if n > 7 or at(z) >= 0:
                return False
            q.extend(((u, z, n + 1), (z, v, n + 1)))
        return True

    return pr, box


def cover(pr, box, t0, t1, y0=None, y1=None):
    if y0 is None:
        y0 = F(0)
    if y1 is None:
        y1 = pr.j.sqrt_hi(F(42))
    check(0 <= t0 < t1 and 0 <= y0 < y1, "nonempty physical rectangle")
    # Split on exact square roots of every endpoint that has a rational root.
    cuts = sorted({y0, y1} | {v for v in [F(1)] if y0 < v < y1})
    count = [0, 0]
    area = F(0)
    maxdepth = 0
    q = [(t0, t1, a, b, 0) for a, b in zip(cuts, cuts[1:])]
    while q:
        l, r, a, b, n = q.pop()
        maxdepth = max(n, maxdepth)
        if pr.box(l, r, a, b) < pr.target:
            method = 0
        elif b - a < F(".8") and box(l, r, a, b):
            method = 1
        else:
            if n >= 37:
                raise ValueError(("open", *(float(x) for x in (l, r, a, b)), count))
            if 30 * (r - l) > b - a:
                z = (l + r) / 2
                q.extend(((l, z, a, b, n + 1), (z, r, a, b, n + 1)))
            else:
                z = (a + b) / 2
                q.extend(((l, r, a, z, n + 1), (l, r, z, b, n + 1)))
            continue
        count[method] += 1
        area += (r - l) * (b - a)
    check(area == (t1 - t0) * (y1 - y0) and sum(count) > 0, "full closed rectangle")
    print("cover", t0, t1, y0, y1, count, maxdepth, area, flush=True)
    return count


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    params = parser.parse_args()
    pr, direct = setup(params.repo.resolve())
    low, high = F(".46050"), F(".46052")
    t, y = F(".46051"), F(".701")
    check(
        pr.box(t, t, y, y) > pr.target and direct(t, t, y, y)
        and not direct(t, t, y, y, with_support=False),
        "deleting the direct support revives a known point",
    )
    a = cover(pr, direct, low, high)
    b = cover(pr, direct, F(".46"), F(".48"), F(0), F(".72"))
    c = cover(pr, direct, F(".4605"), F(".47"), F(0), F(".84"))
    check(all(counts[1] > 0 for counts in (a, b, c)),
          "direct support used on each extension")
    t, y = F(".46053"), F("1.232")
    for tilts in ((F(1), F(19, 20)), (F(1), F(19, 20), F(471, 500))):
        pr.tilts = tilts
        check(pr.box(t, t, y, y) - pr.target > F(1024217, 10**12)
              and not direct(t, t, y, y), "next amplitude still open")
    print("At t=.46053, y=1.232 both carrier choices and the direct bank miss.")
