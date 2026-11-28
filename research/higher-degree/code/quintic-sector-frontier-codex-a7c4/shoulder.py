"""Match the six-profile support estimates to physical Gram prices over a full amplitude strip.
Agent-ID: codex-a7c4. Run python3 -IB shoulder.py --repo /path/to/grothendieck-lean.
"""

import argparse
from fractions import Fraction as Q
from pathlib import Path
from functools import lru_cache
import json, sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from joint_sector import root, bernstein, need, ELL, BETA, EPS, ETA, TARGET
from matched_coefficients import coefficients


def ceil(x):
    return Q((x * 10**12).__ceil__(), 10**12)


def read_models(repo, wide, trials):
    code = repo / "research/higher-degree/code"
    package = code / "quintic-product-support-codex-a7c4"
    sys.path.insert(0, str(package))
    import p7_product as prod, step_charges as step
    import cover, spiked_p7

    need(
        (ELL, BETA) == (spiked_p7.ELL, spiked_p7.BETA)
        and EPS == wide.joint.E
        and ETA == wide.joint.H,
        "matched normalization",
    )
    v = cover.module(code / "spiked-cubic-radius-gemini-4c4c/verify.py")
    first = json.loads(
        (code / "quintic-sector-moments-codex-a7c4/p7_stein_rows.json").read_text()
    )["rows"]
    four = json.loads((package / "p7_product_rows.json").read_text())["rows"]
    rows = (
        first
        + four
        + [
            json.loads((package / name).read_text())
            for name in ("crossing_row.json", "wide_row.json")
        ]
    )
    need(
        len(first) == 6 and len(rows) == 12 and len(wide.spiked) == 13,
        "all production support profiles",
    )
    grams = []
    for ci, _, _, _, receipt in step.ROWS:
        C, h, p, *others = [Q(k, 10**9) for k in receipt]
        grams.append((C, h, p, ETA - Q(ci, 10**6), tuple(pi - p for pi in others)))
    need(all(0 <= h <= 1 and d >= 0 for _, h, _, d, _ in grams), "Gram signs in the payoff")
    W = spiked_p7.WEIGHTS

    @lru_cache(None)
    def source(i):
        r = rows[i]
        # wide inserts a repricing of one inherited model immediately after the six inherited rows.
        slab = wide.spiked[i if i < len(first) else i + 1]
        lo, hi = Q(r["s_lo"]), Q(r["s_hi"])
        need(
            (slab.low, slab.high) == (lo, hi) and r["v3_mode"] == "holder",
            "matched source and charge convention",
        )
        result = []
        for side, (_, old) in zip(("lo", "hi"), slab.endpoints):
            L, H, zero = coefficients(r, BETA, v, side)
            dual = r["sec_dual"][side]
            a = tuple(map(Q, dual["a_hol"]))
            y, b = map(Q, dual["y_sec"])
            old_linear = [l + z for l, z in zip(L, a)]
            # Undo exactly the sector part of the verified C3 upper enclosure.
            # Its first constraint RHS is 0 when extracting the intercept, its second RHS is beta².
            old_young = zero - BETA**2 * sum(max(Q(0), w) for w in old_linear)
            old_cost = old_young + BETA**2 * (
                b + sum(max(Q(0), w - y * q - b) for w, q in zip(old_linear, W))
            )
            base = old + prod.reduction(v, r, BETA, side, symmetric=True) - old_cost
            result.append((base, [BETA**2 * l for l in L], BETA * H))
        return lo, hi, result

    models = []
    for i, g, n in trials:
        need(0 <= i < len(rows), "valid source potential")
        lo, hi, ends = source(i)
        lam = Q(n, 50)
        need(lam > 0 and 0 <= g < len(grams), "positive Gram multiplier and valid row")
        ds = grams[g][4]
        need(min(ds) > 0, "nonnegative sector budget")
        off = []
        for base, L, H in ends:
            prices = [lam * d - l for d, l in zip(ds, L)]
            need(min(prices) > 0, "strictly positive Young prices")
            terms = [(H * k) ** 2 / (4 * a) for k, a in zip(v.KAPPA_HI, prices)]
            pair = prod.product_factors()
            freq = prod.FREQUENCIES
            groups = [Q(0)] * 7
            for k, f in enumerate(freq):
                for j, b in enumerate(freq):
                    groups[f + b + 2] += pair[k][j] * terms[k] * terms[j]
            loss = min(
                root(max(groups), True),
                prod.symmetric_product.intercept(terms, pair, freq),
            )
            off.append(ceil(base + loss))
        models.append((lo, hi, g, lam, *off))
    return grams, models


def matched(wide, grams, models, t0, t1, y0, y1, target=TARGET):
    j = wide.joint
    need(0 <= t0 <= t1 and 0 <= y0 <= y1, "closed nonnegative parameter box")
    cuts = sorted(
        {y0 * y0, y1 * y1}
        | {x for low, high, *_ in models for x in (low, high) if y0 * y0 < x < y1 * y1}
    )
    witnesses = [(2 * j.EH * p / j.MC, J / j.MC) for p, J in wide.costs(y0, y1)]
    low = root(j.A_MIN)
    for slope, offset in witnesses:
        g = target - ETA - (1 - ETA) * t1**2 - ETA * offset
        if g > 0:
            low = max(
                low, (ETA * slope + root((ETA * slope) ** 2 + 4 * EPS * g)) / (2 * EPS)
            )
    low = Q((low * 10**12).__floor__(), 10**12)
    high = min(
        root(wide.old.RHO**2 - (j.C * t0) ** 2, True),
        (Q(582, 625) - wide.old.ELL * t0) / wide.old.BETA,
    )
    if low > high:
        return True
    middle = (low + high) / 2
    slope, offset = max(witnesses, key=lambda z: z[0] * middle - z[1])
    for cl, ch in zip(cuts, cuts[1:]) if len(cuts) > 1 else [(cuts[0], cuts[0])]:
        polynomials = []
        for l, h, g, lam, b1, b2 in models:
            if not l <= cl <= ch <= h:
                continue
            C, ph, p, d, _ = grams[g]
            x = ch if b2 >= b1 else cl
            radius = b1 + (b2 - b1) * (x - l) / (h - l)
            polynomials.append(
                tuple(
                    ceil(z)
                    for z in (
                        lam * (C + (1 - ph) * t1**2 - target + d * offset),
                        -lam * d * slope,
                        radius + lam * (EPS - p) - ELL * t0,
                        -BETA,
                    )
                )
            )
        if not polynomials:
            return False
        stack = [(low, high, 0)]
        while stack:
            a, b, depth = stack.pop()
            if any(bernstein(poly, a, b) < 0 for poly in polynomials):
                continue
            middle = (a + b) / 2
            if depth == 8 or all(
                ((r * middle + q) * middle + p) * middle + c >= 0
                for c, p, q, r in polynomials
            ):
                return False
            stack.extend(((a, middle, depth + 1), (middle, b, depth + 1)))
    return True


def tiles(wide, grams, models, left, right, k=Q("1.4023")):
    target = 1 / k - Q(1, 10**5)
    initial = (
        wide.joint.H
        + (1 - wide.joint.H) * right**2
        + (wide.joint.E - wide.joint.H) * wide.joint.A_MIN
    )
    need(initial < target, "small cubic energy")
    initial_y = Q(13, 2)
    todo = [(left, right, Q(0), initial_y, 0)]
    area = Q(0)
    counts = [0, 0]
    while todo:
        t0, t1, y0, y1, depth = todo.pop()
        if wide.cell(t0, t1, y0, y1, target) < target:
            method = 0
        elif y1 - y0 < Q("0.4") and matched(wide, grams, models, t0, t1, y0, y1, target):
            method = 1
        else:
            need(depth < 55, f"uncovered cell at {t0}, {y0}")
            if 30 * (t1 - t0) > y1 - y0:
                u = (t0 + t1) / 2
                todo.extend(((t0, u, y0, y1, depth + 1), (u, t1, y0, y1, depth + 1)))
            else:
                u = (y0 + y1) / 2
                todo.extend(((t0, t1, y0, u, depth + 1), (t0, t1, u, y1, depth + 1)))
            continue
        counts[method] += 1
        area += (t1 - t0) * (y1 - y0)
    need(
        area == (right - left) * initial_y and initial_y**2 >= 42 and min(counts) > 0,
        "complete closed rectangle and both methods",
    )
    print(
        f"{k}: [{left}, {right}] with all shapes. Inherited {counts[0]}, matched {counts[1]}, area {area}.",
        flush=True,
    )


def outside_control(wide, grams, models):
    """Exhibit a common projected energy left over by the fixed matched prices."""
    t, y, energy = Q(".4201"), Q("2.03"), Q(3403, 5000)
    chi = y**2
    root_up = root(energy, True)
    j = wide.joint
    mass = ceil(
        max((2 * j.EH * p * root_up - cost) / j.MC for p, cost in wide.costs(y, y))
    )
    raw = ETA + (1 - ETA) * t**2 + EPS * energy - ETA * mass - TARGET
    gaps = []
    for left, right, gram, lam, b1, b2 in models:
        if left <= chi <= right:
            C, h, p, d, _ = grams[gram]
            budget = EPS - p + (C + (1 - h) * t**2 - TARGET - d * mass) / energy
            chord = b1 + (b2 - b1) * (chi - left) / (right - left)
            gaps.append(chord + lam * budget - ELL * t - BETA * root_up)
    need(
        wide.cell(t, t, y, y, TARGET) >= TARGET,
        "outside control already closed by inherited cover",
    )
    need(
        energy <= mass <= 1 - t * t
        and raw > Q(".0012975")
        and min(gaps) > Q(".00000952"),
        "outside control for these prices",
    )
    print(
        "At .4201, y=2.03, all retained matched support surpluses exceed 0.00000952.",
        flush=True,
    )


def replay(repo, wide):
    table = json.loads((HERE / "prices.json").read_text())
    trials = [(i, g, n) for i, g, ns in table for n in ns]
    need(len(set(trials)) == len(trials), "distinct price choices")
    grams, models = read_models(repo, wide, trials)
    t, y = Q(".4174"), Q("2.569047")
    need(
        wide.cell(t, t, y, y, TARGET) > TARGET
        and not matched(wide, grams, [], t, t, y, y),
        "deleting matched rows restores old failure at the shape seam",
    )
    need(
        matched(wide, grams, models, t, t, y, y),
        "full mixed-sector certificate at the same point",
    )
    outside_control(wide, grams, models)
    for a, b in ((".4173", ".418"), (".418", ".419"), (".419", ".420")):
        tiles(wide, grams, models, Q(a), Q(b))
    for k, a, b in (
        ("1.4025", ".4166", ".4185"),
        ("1.4025", ".4185", ".4190"),
        ("1.4025", ".4190", ".4193"),
        ("1.403", ".4154", ".4170"),
        ("1.403", ".4170", ".4175"),
        ("1.403", ".4175", ".4180"),
    ):
        tiles(wide, grams, models, Q(a), Q(b), Q(k))


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--repo", type=Path, default=Path.cwd())
    repo = p.parse_args().repo.resolve()
    sys.path.insert(
        0, str(repo / "research/higher-degree/code/quintic-product-support-codex-a7c4")
    )
    import product_cover

    replay(repo, product_cover.build(repo)[-1])
