"""Verify the whole-line polynomial majorants and the peak deficit cover.

Run under ordinary isolated Python (-IB). The imported public KRAW polynomial
benchmark uses assertions and expressly refuses -O. Agent-ID: codex-a7c4.
"""

import argparse
import copy
import hashlib
import importlib.util
import json
from fractions import Fraction as Q
from math import comb, isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
BENCH_SHA = "ab237e8081dce81cecc82240690f6b5d41f46ebebf725acf75615645d76c20c0"
CAP_SHA = "01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514"


def need(ok, msg):
    if not ok:
        raise ArithmeticError(msg)


def bernstein(c, lo, hi):
    """Bernstein coefficients after the affine substitution x = lo + (hi-lo)t."""
    n = len(c) - 1
    aff = [
        sum(c[i] * comb(i, j) * lo ** (i - j) * (hi - lo) ** j for i in range(j, n + 1))
        for j in range(n + 1)
    ]
    return [
        sum(aff[j] * Q(comb(i, j), comb(n, j)) for j in range(i + 1))
        for i in range(n + 1)
    ]


def positive(c, lo, hi, depth=0):
    b = bernstein(c, lo, hi)
    if min(b) >= 0:
        return True
    if depth >= 20 or min(b[0], b[-1]) < 0:
        return False
    m = (lo + hi) / 2
    return positive(c, lo, m, depth + 1) and positive(c, m, hi, depth + 1)


def read_inputs(repo):
    code = repo / "research/conjecture-K/code"
    capsfile = (
        code / "audit-2026-11-15-codex-a7c4/remote_stein_original/profile-caps.json"
    )
    need(
        hashlib.sha256(capsfile.read_bytes()).hexdigest() == CAP_SHA,
        "wrong profile caps",
    )
    data = json.loads(capsfile.read_bytes())
    caps = [
        (Q(t["interval"][0]), Q(t["interval"][1]), list(map(Q, t["coefficients"])))
        for t in data["cells"]
    ]
    need(
        caps[0][0] == 0
        and caps[-1][1] == 2
        and all(a < b for a, b, _ in caps)
        and all(l[1] == r[0] for l, r in zip(caps, caps[1:])),
        "caps gap",
    )
    tail = list(map(Q, data["tail"]))
    bench = code / "raw-content-2026-11-17-gemini-5331/verify_raw_content.py"
    need(
        hashlib.sha256(bench.read_bytes()).hexdigest() == BENCH_SHA,
        "wrong Rice benchmark source",
    )
    spec = importlib.util.spec_from_file_location("peak_benchmark", bench)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    a, b = Q(699, 1250), Q(179, 1250)
    _, bl = mod.compute_deficit_moments_and_rice_poly(
        a,
        b,
        mod.single_pole_integrals(a, b, n=26),
        mod.single_pole_integrals(a, 3 * b, n=26),
    )
    need(
        len(caps) == 68 and len(tail) == 2 and all(len(t[2]) == 4 for t in caps),
        "unexpected profile envelope",
    )
    need(len(bl) == 9, "degree-eight Rice lower bound required")
    return caps, tail, bl


def verify_certificate(stored, caps, tail, bl):
    u_start = Q(3, 4000)
    tailstart = caps[-1][1]
    end = Q(32)
    P = [list(map(Q, p)) for p in stored["cubics"]]
    C = Q(4045313, 100000)
    for p in P:
        need(
            len(p) == 4 and p[3] > 0,
            "four entries including positive cubic coefficient required",
        )
        for l, r, v in caps:
            need(
                positive([x - y for x, y in zip(p, v)], l, r), "uncertified radial cap"
            )
        diff = [p[i] - (tail[i] if i < len(tail) else 0) for i in range(4)]
        need(
            tailstart < end and positive(diff, tailstart, end),
            "uncertified transition to ray",
        )
        excess = [
            sum(diff[i] * comb(i, j) * end ** (i - j) for i in range(j, 4))
            for j in range(4)
        ]
        need(min(excess) >= 0, "uncertified infinite ray")
    cells = [(Q(t[0]), Q(t[1]), Q(t[2]), Q(t[3]), t[4]) for t in stored["cells"]]
    u_end = Q(463, 10000)
    kmin = Q(49, 100)
    kmax = Q(42)
    need(
        all(
            u_start <= v < w <= u_end
            and kmin <= k < h <= kmax
            and type(i) is int
            and 0 <= i < len(P)
            for v, w, k, h, i in cells
        ),
        "invalid rectangle",
    )
    ugrid = sorted(
        {
            u_start,
            u_end,
            *[v for v, w, k, h, i in cells],
            *[w for v, w, k, h, i in cells],
        }
    )
    for u, v in zip(ugrid, ugrid[1:]):
        seg = sorted((k, h) for a, b, k, h, i in cells if a <= u and v <= b)
        need(
            seg
            and seg[0][0] == kmin
            and seg[-1][1] == kmax
            and all(x[1] == y[0] for x, y in zip(seg, seg[1:])),
            "incomplete shape cover",
        )
    minmargin = Q(1)
    for u, v, k, h, i in cells:
        p = P[i]
        for m in (k, h):
            scale = 10**12
            mroot = Q(isqrt(m.numerator * scale * scale // m.denominator) + 1, scale)
            need(mroot * mroot >= m, "negative square-root rounding")
            cost = [p[0], p[1], (2 + m) * p[2], (6 + 9 * m + C * m * mroot) * p[3]]
            diff = [x - (cost[j] if j < len(cost) else 0) for j, x in enumerate(bl)]
            mn = min(bernstein(diff, u, v))
            need(mn > 0, "unclosed energy interval")
            minmargin = min(minmargin, mn)
    need(minmargin > Q(138395408, 10**15), "published strict margin")
    return len(P), len(cells), minmargin


def check_controls(stored, inputs):
    def rejected(payload, expected):
        try:
            verify_certificate(payload, *inputs)
        except ArithmeticError as e:
            need(expected in str(e), "unexpected control failure: " + str(e))
        else:
            raise ArithmeticError("mutant unexpectedly accepted")

    bad = copy.deepcopy(stored)
    bad["cubics"][0][0] = "0"
    rejected(bad, "uncertified radial cap")
    bad = copy.deepcopy(stored)
    bad["cubics"][0][3] = "-1"
    rejected(bad, "positive cubic")
    bad = copy.deepcopy(stored)
    bad["cells"].pop(0)
    rejected(bad, "incomplete shape cover")
    bad = copy.deepcopy(stored)
    bad["cells"][0][-1] = len(bad["cubics"]) - 1
    rejected(bad, "unclosed energy interval")


def verify_exterior(repo, caps, tail, price, anchor, small_margin, large_margin):
    """Price against a fixed Gaussian competitor. The box coordinates are u and sqrt(chi)."""
    path = repo / "research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original/moment-boxes.json"
    need(hashlib.sha256(path.read_bytes()).hexdigest() ==
         "cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695",
         "wrong exterior Hermite data")
    left, right, shape_top = Q(463, 10000), Q(3, 20), Q(31, 4)
    sixth = Q(4045313, 100000)
    rectangles = []
    min_reserve = None
    for row in json.loads(path.read_bytes()):
        a, b, c, d = map(Q, row["box"])
        a, b = max(a, left), min(b, right)
        if a >= b:
            continue
        need(0 <= c < d <= shape_top, "exterior shape interval")
        rectangles.append((a, b, c, d))
        const, linear, square, cube = map(Q, row["coefficients"])
        need(cube > 0, "positive exterior cubic coefficient")
        for y in (c, d):
            gap = [anchor - const, price - linear, -square * (2 + y*y),
                   -cube * (6 + 9*y*y + sixth*y**3)]
            reserve = min(bernstein(gap, a, b))
            min_reserve = reserve if min_reserve is None else min(min_reserve, reserve)
    ends = sorted({left, right, *(a for a, _, _, _ in rectangles),
                   *(b for _, b, _, _ in rectangles)})
    for a, b in zip(ends, ends[1:]):
        slices = sorted((c, d) for v, w, c, d in rectangles if v <= a and b <= w)
        need(slices and slices[0][0] == 0 and slices[-1][1] == shape_top and
             all(s[1] == t[0] for s, t in zip(slices, slices[1:])), "exterior gap")
    need(len(rectangles) == 66 and shape_top**2 >= 42 and
         min_reserve > small_margin, "exterior benchmark reserve")

    # Here Jensen replaces E V(|q|²) by V(u), so there is no shape dependence.
    large_reserve = anchor - tail[0] + (price - tail[1]) * caps[-1][1]
    need(price > tail[1], "terminal ray slope")
    count = 0
    for lo, hi, coeffs in caps:
        lo = max(right, lo)
        if lo >= hi:
            continue
        v0, v1, v2, v3 = coeffs
        gap = [anchor-v0, price-v1, -v2, -v3]
        large_reserve = min(large_reserve, *bernstein(gap, lo, hi))
        count += 1
    need(count == 53 and large_reserve > large_margin, "large-energy reserve")
    return min_reserve, large_reserve


def verify(repo, cert):
    inputs = read_inputs(repo)
    stored = json.loads(cert.read_bytes())
    polys, cells, minmargin = verify_certificate(stored, *inputs)
    check_controls(stored, inputs)
    caps, tail, benchmark = inputs
    price, reference = Q(1317, 1000), Q(213, 5000)
    anchor = sum(value * reference**i for i, value in enumerate(benchmark)) - price * reference
    clearance = Q(131649, 10**12)
    verify_exterior(repo, caps, tail, price, anchor, clearance, clearance)
    print(f"Exterior: 66 moment boxes, 53 radial intervals and the full ray; clearance > {clearance}.")
    print(
        f"{polys} global radial majorants and {cells} rectangles; four failure controls passed."
    )
    print(
        "Strict B(u)-2 E|L+q| margin >",
        minmargin.numerator * 10**15 // minmargin.denominator,
        "/ 10^15",
    )


if __name__ == "__main__":
    args = argparse.ArgumentParser()
    args.add_argument(
        "--repo",
        type=Path,
        default=next(
            (p for p in HERE.parents if (p / "research/conjecture-K").is_dir()),
            Path.cwd(),
        ),
    )
    args.add_argument("--certificate", type=Path, default=HERE / "peak_cover.json")
    params = args.parse_args()
    verify(params.repo, params.certificate)
