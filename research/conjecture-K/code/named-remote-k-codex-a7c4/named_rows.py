"""Rebuild row-specific Hermite upper interpolants and Gaussian benchmarks.

Requires python-flint. Agent-ID: codex-a7c4.
"""

import argparse
from fractions import Fraction as Q
import importlib.util
from itertools import combinations
from pathlib import Path
import hashlib
import json
from functools import lru_cache
from math import isqrt
from flint import arb

HERE = Path(__file__).resolve().parent
ROWS = {
    "flank": tuple(map(Q, [".56", ".1467", ".745", ".029798", ".023", ".0325"])),
    "upper": tuple(map(Q, [".573", ".152", ".7564", ".026153", ".022", ".030"])),
}
TOP = Q(3, 20)
CHICUT = Q(1, 100)
C6 = Q(4045313, 100000)


def need(cond, msg):
    if not cond:
        raise ArithmeticError(msg)


def module(path, name, checksum):
    need(
        hashlib.sha256(path.read_bytes()).hexdigest() == checksum,
        "source hash mismatch",
    )
    spec = importlib.util.spec_from_file_location(name, path)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def ball(q):
    q = Q(q)
    return arb(q.numerator) / q.denominator


def upper(x):
    v = Q(int((x.upper() * 2**48).ceil().fmpz()), 2**48)
    need(ball(v) > x or x == ball(v), "dyadic outward rounding")
    return v


def hermite(x, y, evaluate):
    need(0 < x < y, "invalid Hermite nodes")
    fl, dl = evaluate(x)
    fr, dr = evaluate(y)
    d = ball(y - x)
    c2 = (3 * (fr - fl) - d * (2 * dl + dr)) / d**2
    c3 = (d * (dl + dr) - 2 * (fr - fl)) / d**3
    t = ball(x)
    return list(
        map(
            upper,
            [
                fl - t * dl + t * t * c2 - t**3 * c3,
                dl - 2 * t * c2 + 3 * t * t * c3,
                c2 - 3 * t * c3,
                c3,
            ],
        )
    )


def verify_outer(finite, polys, S, price, lo, hi, kraw):
    rect = [(lo, hi, Q(0), CHICUT)]
    margin = Q(1)
    for l, r, k, h, i in finite:
        need(
            0 <= l < r <= TOP
            and 0 <= k < h <= 42
            and type(i) is int
            and 0 <= i < len(polys),
            "bad cell",
        )
        rect.append((l, r, k, h))
        P = polys[i]
        for t in (k, h):
            d = 10**12
            rt = Q(isqrt(t.numerator * d * d // t.denominator) + 1, d)
            need(rt * rt >= t, "sqrt rounding")
            pol = [
                S - P[0],
                price - P[1],
                -P[2] * (2 + t),
                -P[3] * (6 + 9 * t + C6 * t * rt),
            ]
            margin = min(margin, *kraw.bernstein_1d(pol, l, r))
    for (l, r, k, h), (L, R, K, H) in combinations(rect, 2):
        need(max(l, L) >= min(r, R) or max(k, K) >= min(h, H), "overlapping rectangles")
    need(
        sum((r - l) * (h - k) for l, r, k, h in rect) == TOP * 42,
        "incomplete rectangle",
    )
    return margin


def check_row(key, dataset, profile, kraw):
    a, b, eps, ref, lo, hi = ROWS[key]
    price = 1 / eps
    _, bm = kraw.compute_deficit_moments_and_rice_poly(
        a,
        b,
        kraw.single_pole_integrals(a, b, n=26),
        kraw.single_pole_integrals(a, 3 * b, n=26),
    )
    # The helper's derivative-0 term belongs to its peak row. All higher terms
    # use its supplied a,b; the degree-zero Radau coefficient is exactly one.
    need(kraw.build_radau_sqrt_l8()[0] == 1, "unexpected Radau intercept")
    bm[0] = ((a + 3 * b / 2) * kraw.SQRT_PI).lo
    S = sum(v * ref**k for k, v in enumerate(bm)) - price * ref
    profile.a, profile.b = ball(a), ball(b)

    @lru_cache(None)
    def ev(x):
        return profile.evaluate(ball(x))

    polys = []
    for i, pts in enumerate(dataset["nodes"]):
        p = hermite(*map(Q, pts), ev)
        need(p[3] > 0, "positive cubic needed")
        polys.append(p)
    finite = [tuple(map(Q, cell[:4])) + (cell[4],) for cell in dataset["cells"]]
    margin = verify_outer(finite, polys, S, price, lo, hi, kraw)

    def must_fail(cells, group, message):
        try:
            m = verify_outer(cells, group, S, price, lo, hi, kraw)
            need(m > 0, "failed budget")
        except ArithmeticError as exc:
            need(
                message in str(exc), "unexpected reason for rejecting negative control"
            )
        else:
            raise ArithmeticError("accepted corrupt input")

    must_fail(finite[1:], polys, "incomplete rectangle")
    must_fail(finite + [finite[0]], polys, "overlapping rectangles")
    corrupted = [cub[:] for cub in polys]
    corrupted[finite[0][4]][0] += 1
    must_fail(finite, corrupted, "failed budget")
    f, df = ev(TOP)
    need(ball(price) > df, "tail derivative")
    margin = min(margin, S + price * TOP - upper(f))
    price_intervals = {
        "flank": (Q("1.34201"), Q("1.34239")),
        "upper": (Q("1.3214"), Q("1.3225")),
    }
    for endpoint in price_intervals[key]:
        witness = S + (price - endpoint) * ref
        reserve = verify_outer(finite, polys, witness, endpoint, lo, hi, kraw)
        need(reserve > 0, "price endpoint fails on a finite rectangle")
        need(
            ball(endpoint) > df and witness + endpoint * TOP > upper(f),
            "price endpoint fails on the infinite ray",
        )
    published = {"flank": 95560, "upper": 672531}
    need(
        margin > Q(published[key], 10**12), "outer rectangle or infinite Jensen reserve"
    )
    print(
        key,
        len(polys),
        "Hermite cubics,",
        len(finite),
        "outer cells, exterior reserve >",
        margin.numerator * 10**12 // margin.denominator,
        "/10^12",
        flush=True,
    )
    return margin


def main():
    args = argparse.ArgumentParser()
    args.add_argument(
        "--repo",
        type=Path,
        default=next(
            (p for p in HERE.parents if (p / "research/conjecture-K").is_dir()),
            Path.cwd(),
        ),
    )
    args.add_argument("--row", choices=ROWS, action="append")
    opt = args.parse_args()
    code = opt.repo / "research/conjecture-K/code"
    profile = module(
        code / "audit-2026-11-15-codex-a7c4/remote_stein_original/profile.py",
        "named_profile",
        "fb6a187270358a7b230a6824fa1cb9e85b8f155666d2b9cfb4df9071b9caaf0a",
    )
    raw = module(
        code / "raw-content-2026-11-17-gemini-5331/verify_raw_content.py",
        "named_kraw",
        "ab237e8081dce81cecc82240690f6b5d41f46ebebf725acf75615645d76c20c0",
    )
    for key in opt.row or ROWS:
        check_row(key, json.loads((HERE / (key + ".json")).read_bytes()), profile, raw)


if __name__ == "__main__":
    main()
