"""All-energy elimination from the individual prices of the first three radial rows.

Agent-ID: codex-a7c4. Run python3 -IB joint_sector.py --repo .
"""

from fractions import Fraction as Q
from functools import lru_cache
from pathlib import Path
from math import isqrt
import argparse
import importlib.util
import json
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from matched_coefficients import coefficients


def load(path):
    spec = importlib.util.spec_from_file_location(path.parent.name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def need(ok, description):
    if not ok:
        raise ValueError(description)


def root(x, up=False):
    den = 10**12
    n = isqrt(x.numerator * den**2 // x.denominator)
    return Q(n + int(up and n * n * x.denominator != x.numerator * den**2), den)


EPS = Q(".78")
ETA = Q(".0779")
TARGET = 1 / Q("1.4023") - Q(".00001")
ELL, BETA = Q(1100, 2621), Q(2379, 2621)
LAMBDAS = tuple(
    Q(x, 100)
    for x in (
        18,
        20,
        22,
        24,
        25,
        26,
        28,
        30,
        32,
        34,
        36,
        39,
        42,
        46,
        50,
        52,
        54,
        57,
        60,
        65,
        70,
        75,
        85,
        100,
        120,
        160,
    )
)


def bernstein(coeffs, x, x1):
    c0, c1, c2, c3 = coeffs

    def val(z):
        return ((c3 * z + c2) * z + c1) * z + c0

    def der(z):
        return (3 * c3 * z + 2 * c2) * z + c1

    length = (x1 - x) / 3
    a, b = val(x), val(x1)
    return max(a, a + length * der(x), b - length * der(x1), b)


class Proof:
    def __init__(self, repo):
        code = repo / "research/higher-degree/code"
        sys.path.insert(0, str(code / "quintic-product-support-codex-a7c4"))
        import p7_product as products
        import step_charges as step

        self.products = products
        self.j = load(code / "joint-spectral-cubic-lift-codex-a7c4/verify.py")
        self.pool = self.j.witnesses(
            (repo / "Grothe/Lower/MassWitnessData.lean").read_text()
        )
        self.ver = load(code / "spiked-cubic-radius-gemini-4c4c/verify.py")
        bank = json.loads(
            (code / "quintic-sector-moments-codex-a7c4/p7_stein_rows.json").read_text()
        )
        row = next(r for r in bank["rows"] if Q(r["s_lo"]) == Q("4.1"))
        self.lo, self.hi = Q(row["s_lo"]), Q(row["s_hi"])
        need(
            tuple(bank["abc"]) == (1100, 2379, 2621) and self.hi == Q("5.3"),
            "same potential and ray",
        )
        result = self.ver.verify_spiked_row(
            row,
            bank["abc"],
            [[Q(0)] * 5] * 2,
            [Q(0)] * 2,
            {"new": bank["knots"]},
            quiet=True,
        )
        need(result["ok"], "pointwise Sturm check")
        self.ends = []
        for side in ("lo", "hi"):
            vec, H, c = coefficients(row, BETA, self.ver, side)
            self.ends.append(
                (result["bounds"][side] - c, [BETA**2 * x for x in vec], H * BETA)
            )
        self.profiles = []
        helper = step.load_step(repo)
        grid = tuple(step.bins(helper))
        for model in step.ROWS[:3]:
            step.check_row(helper, grid, step.WEIGHTS, model)
            const, h, p, *others = (Q(x, 10**9) for x in model[-1])
            self.profiles.append(
                (const, h, p, ETA - Q(model[0], 10**6), tuple(x - p for x in others))
            )

    @lru_cache(None)
    def intercept(self, chi, idx, lam, symmetric=True):
        need(self.lo <= chi <= self.hi and lam > 0, "scope and multiplier")
        frac = (chi - self.lo) / (self.hi - self.lo)
        u = 1 - frac
        a, b = self.ends
        base = u * a[0] + frac * b[0]
        H = u * a[2] + frac * b[2]
        L = tuple(u * x + frac * y for x, y in zip(a[1], b[1]))
        p = self.profiles[idx][-1]
        prices = [lam * d - z for d, z in zip(p, L)]
        if min(prices) <= 0:
            return None
        weights = [(H * k) ** 2 / (4 * y) for k, y in zip(self.ver.KAPPA_HI, prices)]
        by = [Q(0)] * 7
        parts = self.products.product_factors()
        freq = self.products.FREQUENCIES
        for i, m in enumerate(freq):
            for j, n in enumerate(freq):
                by[m + n + 2] += parts[i][j] * weights[i] * weights[j]
        unsym = root(max(by), True)
        if not symmetric:
            return base + unsym
        return base + min(
            unsym, self.products.symmetric_product.intercept(weights, parts, freq)
        )

    @lru_cache(None)
    def witnesses(self, chi0, chi1):
        def offset(b, c, x):
            return b * x + c * x * root(x, True)

        return tuple(
            (
                2 * self.j.EH * p / self.j.MC,
                (a + max(offset(b, c, chi0), offset(b, c, chi1))) / self.j.MC,
            )
            for p, a, b, c in self.pool
        )

    @lru_cache(None)
    def candidates(self, lo, hi, symmetric=True):
        rows = []
        for index, (c, h, p, d, _) in enumerate(self.profiles):
            for lam in LAMBDAS:
                a = self.intercept(lo, index, lam, symmetric)
                b = self.intercept(hi, index, lam, symmetric)
                if a is not None and b is not None:
                    rows.append((max(a, b), lam, c, h, p, d, index))
        return rows

    def cell(self, t0, t1, s0, s1, x0, x1):
        mass = self.witnesses(s0, s1)
        mid = (x0 + x1) / 2
        u, v0 = max(mass, key=lambda w: w[0] * mid - w[1])
        w0, w1 = ETA + (1 - ETA) * t1 * t1 + ETA * v0 - TARGET, -ETA * u
        raw = bernstein((w0, w1, EPS, Q(0)), x0, x1)
        if raw < 0:
            return raw, None
        params = self.candidates(s0, s1)

        def guess(row):
            I, lam, c, h, p, d, _ = row
            t = (t0 + t1) / 2
            return (
                I
                + lam
                * (
                    EPS
                    - p
                    + (c + (1 - h) * t * t - TARGET - d * (u * mid - v0)) / mid**2
                )
                - ELL * t
                - BETA * mid
            )

        for I, lam, c, h, p, d, index in sorted(params, key=guess)[:5]:
            worst = Q(-100)
            for t in (t0, t1):
                co = (
                    lam * (c + (1 - h) * t * t - TARGET + d * v0),
                    -lam * d * u,
                    I + lam * (EPS - p) - ELL * t,
                    -BETA,
                )
                worst = max(worst, bernstein(co, x0, x1))
            if worst < 0:
                return worst, (index, lam)
        return None, None

    def cover(self, t0, t1, s0, s1):
        # Uniform physical A<=1 by orthogonal projection and pair normalization.
        small = ETA + (1 - ETA) * t1 * t1 + (EPS - ETA) * Q(".55")
        need(small < TARGET, "small physical energy")
        stack = [(t0, t1, s0, s1, Q(".74"), Q(1), 0)]
        need(Q(".74") ** 2 < Q(".55"), "overlap with the small-energy arm")
        n = 0
        area = Q(0)
        max_gap = Q(-1)
        while stack:
            a, b, c, d, x, y, depth = stack.pop()
            z, profile = self.cell(a, b, c, d, x, y)
            if z is not None:
                max_gap = max(max_gap, z)
                n += 1
                area += (b - a) * (d - c) * (y - x)
                continue
            if depth >= 36:
                raise ValueError(
                    f"remaining cell {float(a):.9f} {float(c):.9f} {float(x*x):.9f}"
                )
            # The t residual changes by at most a few times the other derivatives locally.
            dist = [10 * (b - a), (d - c) / 100, (y - x)]
            at = dist.index(max(dist))
            p = [a, c, x]
            q = [b, d, y]
            m = (p[at] + q[at]) / 2
            pp = p.copy()
            qq = q.copy()
            pp[at] = m
            qq[at] = m
            for l, h in ((p, qq), (pp, q)):
                stack.append((l[0], h[0], l[1], h[1], l[2], h[2], depth + 1))
        need(area == (t1 - t0) * (s1 - s0) * Q(".26"), "all sector/energy rectangle")
        print(
            f"Covered t=[{t0},{t1}], fourth excess [{s0},{s1}] in {n} closed boxes; extra contradiction clearance > {(-max_gap)*10**12//1} trillionths."
        )
        return -max_gap

    def point(self, t, s, x, symmetric=True):
        # At a singleton, the largest mass lower bound is best for every nonnegative mass price.
        u, offset = max(self.witnesses(s, s), key=lambda w: w[0] * x - w[1])
        mass = u * x - offset
        raw = ETA + (1 - ETA) * t * t + EPS * x * x - ETA * mass - TARGET
        gaps = [
            (I + lam * (EPS - p) - ELL * t - BETA * x) * x * x
            + lam * (c + (1 - h) * t * t - TARGET - d * mass)
            for I, lam, c, h, p, d, _ in self.candidates(s, s, symmetric)
        ]
        return min(raw, *gaps)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    proof = Proof(parser.parse_args().repo.resolve())
    lo, hi = Q(".4173"), Q(".4201")
    clearance = proof.cover(lo, hi, Q("4.1"), Q("5.3"))
    need(clearance > Q(276249, 10**12), "published uniform contradiction clearance")
    t, s, x = Q(".42"), Q("4.1"), Q(".8248")
    need(
        proof.point(t, s, x, False) > Q(".0000188")
        and proof.point(t, s, x) < -Q(".0000211"),
        "same-physical-sector symmetric control",
    )
    need(
        proof.point(Q(".4202"), Q("4.1"), Q(".82455")) > Q(".00000739"),
        "outside the published fixed profile bank",
    )
    print("Fixed model deletion and outside-rectangle controls passed.")


if __name__ == "__main__":
    main()
