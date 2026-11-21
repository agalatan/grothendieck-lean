#!/usr/bin/env python3
"""Generate Grothe/LowerAnalytic/RadiusRows/Row00.lean .. Row22.lean from cert_N_final/.

Verifies the SHA-256 of the joined certificate against join_cert_N.py's pinned hash,
computes the minimal exact integer-Bernstein subdivision trees (Cover1) for each cell,
and emits one Lean module per row proving `checkRadiusRow radiusRowNN (93 / 100) = true`
by kernel reduction (`decide +kernel`).

Usage:
  python3 tools/gen_radius_data.py          # write Row00.lean .. Row22.lean
  python3 tools/gen_radius_data.py --check  # verify files match byte-for-byte
"""
import argparse
import glob
import hashlib
import json
import os
import sys
from fractions import Fraction as Fr
from math import comb, gcd

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CERT_DIR = os.path.join(
    REPO, "research", "conjecture-K", "code", "radius-relaxation", "cert_N_final"
)
OUT_DIR = os.path.join(REPO, "Grothe", "LowerAnalytic", "RadiusRows")
EXPECTED_SHA256 = "fb7d22b8bf268bc2960d5f5ffa522d0dddf8b4daa6a95110afd8a13ba321df44"

S_A = 1 << 36
S_M = 1 << 50
S_L = 1 << 62
R_MA = S_M // S_A
R_LM = S_L // S_M

CUT_MAP = {
    "n": ".n",
    "h": ".h",
    "b": ".b",
    "y": ".y",
    "z": ".z",
    "bn": ".bn",
    "yz": ".yz",
    "h0": ".h0",
    "m": ".m",
    "c1": ".c1",
    "c2+": ".c2p",
    "c2-": ".c2m",
}


def exact_scaled_int(s: str, scale: int) -> int:
    val = Fr(s) * scale
    if val.denominator != 1:
        raise ValueError(f"{s} * {scale} is not an integer: {val}")
    return val.numerator


def p_add(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]


def p_sub(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) - (b[i] if i < len(b) else 0) for i in range(n)]


def p_scale(c, a):
    return [c * x for x in a]


def p_mul(a, b):
    if not a or not b:
        return []
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def p_shift(k, a):
    return [0] * k + list(a)


def p_in_sq(a):
    if not a:
        return []
    out = []
    for i, x in enumerate(a):
        out.append(x)
        if i + 1 < len(a):
            out.append(0)
    return out


def p_affine(p, d, a, w):
    res = []
    lin = [a, w]
    for j in range(d, -1, -1):
        c = p[j] if j < len(p) else 0
        res = p_add(p_mul(res, lin), [c])
    while len(res) < d + 1:
        res.append(0)
    return res[: d + 1]


def lcm_choose(d):
    m = 1
    for j in range(d + 1):
        m = m * comb(d, j) // gcd(m, comb(d, j))
    return m


def to_bern_seg(p, d, a, w):
    q = p_affine(p, d, a, w)
    m = lcm_choose(d)
    return [
        sum(q[k] * (comb(i, k) * (m // comb(d, k))) for k in range(i + 1))
        for i in range(d + 1)
    ]


def to_bern_ray(p, d, a, w=10):
    q = p_affine(p, d, a, w)
    m = lcm_choose(d)
    return [q[k] * (m // comb(d, k)) for k in range(d + 1)]


def build_cover(b, depth=0):
    if all(x >= 0 for x in b):
        return ".leaf"
    if b[0] < 0 or b[-1] < 0 or depth >= 40:
        raise RuntimeError(f"Bernstein subdivision failed at depth {depth}")
    n = len(b) - 1
    rows = [b]
    for _ in range(n):
        prev = rows[-1]
        rows.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
    left = [rows[k][0] << (n - k) for k in range(n + 1)]
    right = [rows[n - j][j] << j for j in range(n + 1)]
    return f"(.split {build_cover(left, depth + 1)} {build_cover(right, depth + 1)})"


def compute_row_covers(row):
    ks = [exact_scaled_int(x, 10) for x in row["knots"]]
    k_max = len(ks) - 1
    arr = {
        nm: [exact_scaled_int(x, S_A) for x in row[nm]]
        for nm in ("phi1", "phi2", "xi2", "xi1", "xia", "th2", "th4")
    }
    lam = [exact_scaled_int(x, S_L) for x in row["lam"]]
    l3 = [exact_scaled_int(x, S_L) for x in row["l3"]]
    l3_sum = sum(l3)
    mu = [exact_scaled_int(x, S_M) for x in row["mu"]]
    slope = [exact_scaled_int(x, S_M) for x in row["slope"]]
    sigma = exact_scaled_int(row["sigma"], S_M)
    m_all = mu[0] * mu[1] * mu[2] * mu[3] * mu[4]
    m_j = [m_all // mu[j] for j in range(5)]

    g_int = [0, 0]
    covers = []
    for k in range(k_max + 1):
        tail = k == k_max
        u0 = ks[k] * ks[k]
        u1 = u0 if tail else ks[k + 1] * ks[k + 1]
        du = 1 if tail else u1 - u0

        def mk_p(nm):
            if tail:
                return [arr[nm][k_max]]
            a0, a1 = arr[nm][k], arr[nm][k + 1]
            return [a0 * u1 - a1 * u0, a1 - a0]

        ph1 = p_add(p_scale(100 * R_MA, mk_p("phi1")), [0, slope[0] * du])
        ph2 = p_add(p_scale(100 * R_MA, mk_p("phi2")), [0, slope[1] * du])

        def mk_g(g, ph):
            c0 = ph[0] if len(ph) > 0 else 0
            c1 = ph[1] if len(ph) > 1 else 0
            return [du * g - 2 * c0 * u0 - c1 * u0 * u0, 2 * c0, c1]

        g1 = mk_g(g_int[0], ph1)
        g2 = mk_g(g_int[1], ph2)
        t2 = p_scale(200 * R_MA, mk_p("th2"))
        t4 = p_scale(200 * R_MA, mk_p("th4"))
        t3 = p_sub(p_sub(p_add(p_scale(200 * R_MA, mk_p("xi1")), ph2), t2), t4)
        t1 = p_sub(p_add(p_add(p_scale(200 * R_MA, mk_p("xi2")), p_scale(2, ph1)), t2), t3)
        t5 = p_sub(
            p_add(
                p_sub(
                    p_add(p_shift(1, p_scale(400 * R_MA, mk_p("xia"))), p_shift(1, p_scale(4, ph1))),
                    p_scale(2, g1),
                ),
                p_sub(p_shift(1, p_scale(2, ph2)), g2),
            ),
            [0, 0, 4 * du * sigma],
        )
        du2m = du * du * m_all
        lam_w = [1000000 * lam[0] * du2m, 10000 * lam[1] * du2m, 100 * lam[2] * du2m, l3_sum * du2m]
        g_w = p_scale(50 * R_LM * du * m_all, p_add(g1, g2))
        lin_c = p_add(p_add(t1, t2), p_add(p_scale(3, t3), p_scale(2, t4)))
        lin_w = p_scale(5000 * R_LM * du * m_all, lin_c)
        sq_w = p_add(
            p_add(p_scale(25600 * m_j[0], p_mul(t1, t1)), p_scale(25600 * m_j[1], p_mul(t2, t2))),
            p_add(p_scale(25600 * m_j[2], p_mul(t3, t3)), p_scale(25600 * m_j[3], p_mul(t4, t4))),
        )
        br_w = p_sub(p_sub(p_add(lam_w, g_w), lin_w), sq_w)
        fv_w = p_sub(p_shift(2, br_w), p_scale(6400 * m_j[4], p_mul(t5, t5)))
        if k == 0:
            assert fv_w[0] == 0 and fv_w[1] == 0
            pr = p_sub(p_in_sq(fv_w[2:]), [0, 100000 * S_L * du2m])
            b = to_bern_seg(pr, 6, ks[0], ks[1] - ks[0])
        else:
            pr = p_sub(p_in_sq(fv_w), [0, 0, 0, 0, 0, 100000 * S_L * du2m])
            if tail:
                b = to_bern_ray(pr, 10, ks[k_max], 10)
            else:
                b = to_bern_seg(pr, 10, ks[k], ks[k + 1] - ks[k])
        covers.append(build_cover(b))
        if not tail:
            for i in range(2):
                nm = f"phi{i + 1}"
                g_int[i] = (
                    g_int[i]
                    + 100 * R_MA * (arr[nm][k] + arr[nm][k + 1]) * du
                    + slope[i] * (u1 * u1 - u0 * u0)
                )
    return ks, arr, lam, l3, mu, slope, sigma, covers


def fmt_rat(s: str) -> str:
    f = Fr(s)
    if f.denominator == 1:
        return str(f.numerator)
    return f"({f.numerator} / {f.denominator})"


def fmt_list(items, indent="    ", width=96):
    lines = []
    cur = indent
    for i, item in enumerate(items):
        tok = item + ("," if i + 1 < len(items) else "")
        if cur == indent:
            cur += tok
        elif len(cur) + 1 + len(tok) <= width:
            cur += " " + tok
        else:
            lines.append(cur)
            cur = indent + tok
    if cur.strip():
        lines.append(cur)
    return "[\n" + "\n".join(lines) + "\n  ]"


def fmt_endpar(pd, indent="  ") -> str:
    cuts_str = []
    for kind, theta, weight in pd["cuts"]:
        th_s = "0" if theta is None else fmt_rat(theta)
        cuts_str.append(f"⟨{CUT_MAP[kind]}, {th_s}, {fmt_rat(weight)}⟩")
    cuts_block = "[\n" + ",\n".join(indent + "    " + c for c in cuts_str) + f"\n{indent}  ]"
    return (
        f"{{\n"
        f"{indent}  alphaA := {fmt_rat(pd['alpha'][0])}\n"
        f"{indent}  alphaB := {fmt_rat(pd['alpha'][1])}\n"
        f"{indent}  sqrtUb := {fmt_rat(pd['sqrt_ub'])}\n"
        f"{indent}  eta := {fmt_rat(pd['eta'])}\n"
        f"{indent}  cuts := {cuts_block}\n"
        f"{indent}}}"
    )


def render_row(idx: int, row: dict) -> str:
    ks, arr, lam, l3, mu, slope, sigma, covers = compute_row_covers(row)
    par_lo = "none" if "lo" not in row["par"] else f"some {fmt_endpar(row['par']['lo'], '  ')}"
    par_hi = fmt_endpar(row["par"]["hi"], "  ")
    tag = f"{idx:02d}"
    lines = [
        "import Grothe.LowerAnalytic.RadiusRowCheck",
        "",
        "/-!",
        f"# Sharp cubic radius certificate: row {tag} (`s ∈ [{row['s_lo']}, {row['s_hi']}]`)",
        "",
        "Generated by `tools/gen_radius_data.py` from",
        "`research/conjecture-K/code/radius-relaxation/cert_N_final/`; do not edit.",
        "-/",
        "",
        "namespace Grothe.LowerAnalytic",
        "",
        f"def radiusRow{tag} : RadiusRow where",
        f"  sLo := {fmt_rat(row['s_lo'])}",
        f"  sHi := {fmt_rat(row['s_hi'])}",
        f"  knots := {fmt_list([str(x) for x in ks])}",
        f"  phi1 := {fmt_list([str(x) for x in arr['phi1']])}",
        f"  phi2 := {fmt_list([str(x) for x in arr['phi2']])}",
        f"  xi2 := {fmt_list([str(x) for x in arr['xi2']])}",
        f"  xi1 := {fmt_list([str(x) for x in arr['xi1']])}",
        f"  xia := {fmt_list([str(x) for x in arr['xia']])}",
        f"  th2 := {fmt_list([str(x) for x in arr['th2']])}",
        f"  th4 := {fmt_list([str(x) for x in arr['th4']])}",
        f"  lam0 := {lam[0]}",
        f"  lam1 := {lam[1]}",
        f"  lam2 := {lam[2]}",
        f"  l3s := {l3[0]}",
        f"  l3a := {l3[1]}",
        f"  l3b := {l3[2]}",
        f"  mu1 := {mu[0]}",
        f"  mu2 := {mu[1]}",
        f"  mu3 := {mu[2]}",
        f"  mu4 := {mu[3]}",
        f"  mu5 := {mu[4]}",
        f"  slope1 := {slope[0]}",
        f"  slope2 := {slope[1]}",
        f"  sigma := {sigma}",
        f"  parLo := {par_lo}",
        f"  parHi := {par_hi}",
        f"  covers := {fmt_list(covers)}",
        "",
        f"theorem radiusRow{tag}_ok : checkRadiusRow radiusRow{tag} (93 / 100) = true := by",
        "  decide +kernel",
        "",
        "end Grothe.LowerAnalytic",
        "",
    ]
    return "\n".join(lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true", help="verify generated files match on disk")
    args = ap.parse_args()

    head = json.load(open(os.path.join(CERT_DIR, "head.json"), encoding="utf-8"))
    row_paths = sorted(glob.glob(os.path.join(CERT_DIR, "row_*.json")))
    rows = [json.load(open(p, encoding="utf-8")) for p in row_paths]
    cert = {
        "kind": head["kind"],
        "rows": rows,
        "claim": head["claim"],
        "statement": head["statement"],
    }
    digest = hashlib.sha256(json.dumps(cert).encode()).hexdigest()
    if digest != EXPECTED_SHA256:
        sys.exit(f"SHA-256 mismatch: expected {EXPECTED_SHA256}, got {digest}")

    os.makedirs(OUT_DIR, exist_ok=True)
    mismatches = []
    for idx, row in enumerate(rows):
        out_path = os.path.join(OUT_DIR, f"Row{idx:02d}.lean")
        content = render_row(idx, row)
        if args.check:
            if not os.path.exists(out_path) or open(out_path, encoding="utf-8").read() != content:
                mismatches.append(out_path)
        else:
            with open(out_path, "w", encoding="utf-8") as f:
                f.write(content)
    if args.check:
        if mismatches:
            sys.exit("Out-of-date generated files:\n" + "\n".join(mismatches))
        print(f"OK: all {len(rows)} rows match cert_N_final (sha256 {digest[:12]}...)")
    else:
        print(f"Generated {len(rows)} row modules in {OUT_DIR} (sha256 {digest[:12]}...)")


if __name__ == "__main__":
    main()
