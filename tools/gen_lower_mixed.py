#!/usr/bin/env python3
"""Generate the common-law (mixed) certificate data module (exact rationals only):

  Grothe/Lower/MixedData.lean   the three batches of exact node certificates for the mixed
                                potentials and the 863 boxes of the central slab, as strings
                                parsed at check time (`parseWit`, `parseBox` in Boxes.lean/Mixed.lean)

Inputs: `handoff/lower-stein/cert-1401616861/joint_cover_certificate.json` and
`handoff/lower-stein/cert-1401616861/review/joint_nodes_*.json` (the certificate of the
common-law refinement), together with the source rows `handoff/lower-stein/cert-0745/` (pinned by
hash in the certificate).  Row indices refer to `rowData` (rows sorted by their nominal `t`).
Every box value is replayed here with the Lean semantics (quadratic maxima) and compared with the
stored bound and the cap; the dyadic coverage is replayed too.
"""
import hashlib
import json
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CERT = ROOT / "handoff" / "lower-stein" / "cert-0745"
NEW = ROOT / "handoff" / "lower-stein" / "cert-1401616861"
OUT = ROOT / "Grothe" / "Lower" / "MixedData.lean"
EPS = Q(149, 200); RHO = Q(973612157, 10**9); C6 = Q(4045313, 100000); PAD = Q(1, 10**11); XMAX = Q(31, 4)
SLAB = tuple(map(Q, json.load(open(Path(__file__).resolve().parent.parent / "handoff" / "lower-stein" / "cert-1401616861" / "joint_cover_certificate.json"))["domain"][:2]))

def qs(x):
    x = Q(x); return f"{x.numerator}/{x.denominator}" if x.denominator != 1 else f"{x.numerator}"
def q(x):
    x = Q(x); return f"({x.numerator} : ℚ) / {x.denominator}" if x.denominator != 1 else f"({x.numerator} : ℚ)"
def rsqrt(x):
    a, b = isqrt(x.numerator), isqrt(x.denominator); assert a * a == x.numerator and b * b == x.denominator; return Q(a, b)
def lean_str(s): return '"' + s + '"'
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()

# ----- source rows (pinned) and their Lean indices
man = json.load(open(CERT / "manifest.json"))
cert = json.load(open(NEW / "joint_cover_certificate.json"))
assert sha(CERT / "manifest.json") == cert["source_manifest_sha256"]
for fn, h in man["files"].items(): assert sha(CERT / fn) == h, fn
rowfiles = sorted((f for f in man["files"] if f.startswith("row_")), key=lambda f: Q(json.load(open(CERT / f))["t"]))
rows = [json.load(open(CERT / f)) for f in rowfiles]
index = {R["name"]: k for k, R in enumerate(rows)}
B = Q(cert["target"]); assert B == Q(356730868227, 500000000000)
assert tuple(map(Q, cert["domain"])) == (SLAB[0], SLAB[1], 0, RHO, 0, XMAX)

# ----- Lean-side arithmetic (mirrors Basic.lean / Gate.lean / Boxes.lean)
def quadVal(c0, c1, c2, t): return c0 + c1 * t + c2 * t * t
def quadMax(c0, c1, c2, a, b):
    e = max(quadVal(c0, c1, c2, a), quadVal(c0, c1, c2, b))
    if c2 < 0:
        v = -c1 / (2 * c2)
        if a <= v <= b: return max(e, quadVal(c0, c1, c2, v))
    return e
def J(y, x):   # y = (a0, a1, a2, a4, a6) = (y0, y4, y1, y2, y3); J 0 1 x
    a0, a1, a2, a4, a6 = y
    return a0 + RHO * a1 + a2 + a4 * (2 + x * x) + a6 * (6 + 9 * x * x + C6 * x ** 3)
def lin(a, b, p, r): return tuple(a * u + b * v for u, v in zip(p, r))
def mpoly(yjson):  # JSON order y0,y1,y2,y3,y4 -> MPoly order a0,a1,a2,a4,a6
    y = list(map(Q, yjson)); return (y[0], y[4], y[1], y[2], y[3])
def N_of(R):
    th = [Q(v) for v in R["theta"]]; d = th[9]
    return [th[0] - (EPS - d), th[1], th[2], th[3], th[4], th[5]], d, [d * th[10], d * th[11], d * th[12]], th[13], th[14]
def gatePrice(N, g):
    m11, m12, m13, m22, m23, m33 = N; w1, w2 = m12 + g[1], m13 + g[2]; det = m22 * m33 - m23 * m23
    assert m22 > 0 and det > 0
    return m11 + 2 * g[0] - (m33 * w1 * w1 - 2 * m23 * w1 * w2 + m22 * w2 * w2) / det
def mixPrice(Ri, Rj, th):
    Ni, di, gi, _, _ = N_of(Ri); Nj, dj, gj, _, _ = N_of(Rj)
    N = [(1 - th) * a + th * b for a, b in zip(Ni, Nj)]; g = [(1 - th) * a + th * b for a, b in zip(gi, gj)]
    return (1 - th) * di + th * dj + gatePrice(N, g)
def rowPriceOK(R):
    N, d, g, _, _ = N_of(R); return Q(R["kappa"]) * d * d <= d + gatePrice(N, g)
def tnode(R, ref):
    ci, ni = ref
    if ci < 0: return (Q(0), (Q(R["caps"][0]), Q(0), Q(0), Q(0), Q(0)))
    n = R["cells"][ci]["nodes"][ni]; return (Q(n["sigma"]) / N_of(R)[1], mpoly(n["y"]))
def tchord(n0, n1, s):
    assert 0 <= n0[0] <= s <= n1[0]
    if n0[0] < n1[0]: return lin((n1[0] - s) / (n1[0] - n0[0]), (s - n0[0]) / (n1[0] - n0[0]), n0[1], n1[1])
    return n0[1]
def boxVal(ell, beta, D, Lm, Lp, tl, tu, sl, su, xl, xu):
    assert Lm[4] >= 0 and Lp[4] >= 0
    def xPart(xh):
        lo, hi = J(Lm, xh), J(Lp, xh); m = (hi - lo) / (su - sl)
        return quadMax(lo - m * sl, m, -D, sl, su)
    return quadMax(Q(0), -2 * ell, Q(1), tl, tu) + 2 * beta * beta / EPS + max(xPart(xl), xPart(xu)) + PAD

# ----- batches
batches = []; batch_json = []
for k, bref in enumerate(cert["joint_batches"]):
    p = NEW / bref["file"]; assert sha(p) == bref["sha256"], bref["file"]
    b = json.load(open(p)); batch_json.append(b)
    assert b["source_manifest_sha256"] == cert["source_manifest_sha256"]
    names = b["rows"]; w = list(map(Q, b["weights"])); assert len(names) == 2 and w[0] + w[1] == 1 and min(w) >= 0
    th = w[1]; Ri, Rj = rows[index[names[0]]], rows[index[names[1]]]
    mesh = [Q(v) for v in b["mesh"]]; assert mesh[0] == 0 and mesh == [Q(v) for v in Ri["mesh"]]
    vs = ",".join(qs(rsqrt(t)) for t in mesh[1:])
    nodes = ";".join(f"{qs(r)}:{qs(c)}" for r, c in zip(b["nodes"], b["caps"]))
    wits = []
    for wit in b["witnesses"]:
        y = list(map(Q, wit["y"])); mu = [Q(v) * 10**10 for v in wit["mu"]]; assert all(m.denominator == 1 and m >= 0 for m in mu)
        bank = []
        for z in wit["bank"]:
            zz = [Q(v) * 10**8 for v in z]; assert all(v.denominator == 1 for v in zz) and len(zz) == len(mesh) + 1
            bank.append(",".join(str(v.numerator) for v in zz))
        assert len(mu) == len(bank)
        wits.append(f"{qs(wit['tau'])}:" + ",".join(qs(v) for v in (y[0], y[4], y[1], y[2], y[3])) + ":" +
                    ",".join(str(m.numerator) for m in mu) + "|" + ";".join(bank))
    batches.append(dict(i=index[names[0]], j=index[names[1]], th=th, smax=Q(b["smax"]), nodes=nodes, vs=vs, wits=wits,
                        tnodes=[(Q(wit["tau"]), mpoly(wit["y"])) for wit in b["witnesses"]]))

# ----- boxes, replayed
boxes = []; worst = Q(0); nsrc = njoint = 0
for cell in cert["cells"]:
    box = tuple(map(Q, cell["box"])); tl, tu, sl, su, xl, xu = box
    assert 0 <= sl < su and tl < tu and 0 <= xl < xu
    if cell.get("kind") == "joint":
        bk = cell["batch"]; b = batches[bk]; Ri, Rj = rows[b["i"]], rows[b["j"]]; th = b["th"]
        (k0, k1), (k2, k3) = cell["joint_refs"]
        Lm = tchord(b["tnodes"][k0], b["tnodes"][k1], sl); Lp = tchord(b["tnodes"][k2], b["tnodes"][k3], su)
        boxes.append("j|" + ",".join(qs(v) for v in box) + f"|{bk}|{k0},{k1},{k2},{k3}"); njoint += 1
    else:
        Ri, Rj = rows[index[cell["i"]]], rows[index[cell["j"]]]; th = Q(cell["theta"]); assert 0 <= th <= 1
        pi, pj = cell["points"]
        Pim = tchord(tnode(Ri, pi[0][0]), tnode(Ri, pi[0][1]), sl); Pip = tchord(tnode(Ri, pi[1][0]), tnode(Ri, pi[1][1]), su)
        Pjm = tchord(tnode(Rj, pj[0][0]), tnode(Rj, pj[0][1]), sl); Pjp = tchord(tnode(Rj, pj[1][0]), tnode(Rj, pj[1][1]), su)
        Lm, Lp = lin(1 - th, th, Pim, Pjm), lin(1 - th, th, Pip, Pjp)
        refs = lambda pr: ",".join(f"{a},{c}" for ab in pr for a, c in ab)
        boxes.append("s|" + ",".join(qs(v) for v in box) + f"|{index[cell['i']]},{index[cell['j']]},{qs(th)}|{refs(pi)}|{refs(pj)}"); nsrc += 1
    _, _, _, elli, betai = N_of(Ri); _, _, _, ellj, betaj = N_of(Rj)
    v = boxVal((1 - th) * elli + th * ellj, (1 - th) * betai + th * betaj, mixPrice(Ri, Rj, th), Lm, Lp, *box)
    assert v == Q(cell["bound"]) and v <= B, (cell["box"], float(v), float(Q(cell["bound"])))
    worst = max(worst, v)
assert all(rowPriceOK(R) for R in rows)

# ----- coverage (dyadic partition)
doms = [tuple(map(Q, c["box"])) for c in cert["cells"]]
def cover(dom, ids):
    if len(ids) == 1: assert doms[ids[0]] == dom; return
    for k in (0, 2, 4):
        mid = (dom[k] + dom[k + 1]) / 2
        if any(doms[i][k] < mid < doms[i][k + 1] for i in ids): continue
        L = [i for i in ids if doms[i][k + 1] <= mid]; R = [i for i in ids if doms[i][k] >= mid]
        if not L or not R: continue
        a = list(dom); b = list(dom); a[k + 1] = mid; b[k] = mid
        cover(tuple(a), L); cover(tuple(b), R); return
    raise AssertionError("not a dyadic partition")
cover((SLAB[0], SLAB[1], Q(0), RHO, Q(0), XMAX), list(range(len(doms))))

# ----- outer envelope (the 1788 cells outside the slab, Lean semantics)
env = json.load(open(CERT / "envelope.json")); step = Q(env["step"])
consts = json.load(open(ROOT / "handoff" / "lower-stein" / "rows_final.json"))
env_rows = {"crude": dict(ell=Q(0), beta=Q(0), C=EPS * RHO ** 2)}
for R in rows:
    K = consts[R["name"]]; ell, beta = Q(K["ell"]), Q(K["beta"])
    cap_exact = Q(K["C"]) - PAD - 2 * beta * beta / EPS
    cap = Q(-((-cap_exact.numerator * 10**15) // cap_exact.denominator), 10**15)
    env_rows[R["name"]] = dict(ell=ell, beta=beta, C=2 * beta * beta / EPS + cap + PAD)
outer = Q(0); skipped = 0
for k, (i, j, th) in enumerate(env["cells"]):
    lo, hi = k * step, (k + 1) * step
    if SLAB[0] <= lo and hi <= SLAB[1]: skipped += 1; continue
    a, b = env_rows[i], env_rows[j]; th = Q(th); w = 1 - th
    c0 = w * a["C"] + th * b["C"] - 2 * w * th * (a["beta"] - b["beta"]) ** 2 / EPS; c1 = -2 * (w * a["ell"] + th * b["ell"])
    v = quadMax(c0, c1, Q(1), lo, hi); assert v <= B; outer = max(outer, v)
assert skipped == round((SLAB[1] - SLAB[0]) / step)

# ----- emit
bt = ",\n".join(f"  ⟨{b['i']}, {b['j']}, {q(b['th'])}, {q(b['smax'])},\n   {lean_str(b['nodes'])},\n   {lean_str(b['vs'])},\n   [" +
                ",\n    ".join(lean_str(w) for w in b["wits"]) + "]⟩" for b in batches)
text = ("import Grothe.Lower.Boxes\n\n/-!\n# The common-law certificate data (generated by `tools/gen_lower_mixed.py`; do not edit)\n\n"
        f"The {len(batches)} batches of exact node certificates for the mixed potentials of rows `0.85` and `0.855`\n"
        f"({sum(len(b['wits']) for b in batches)} nodes) and the {len(boxes)} boxes of the central slab\n"
        f"`[{SLAB[0]}, {SLAB[1]}] × [0, ρ] × [0, 31/4]` ({njoint} joint boxes, {nsrc} source boxes).\n-/\n\n"
        "namespace Grothe.Lower\n\n/-- The central slab of `t` covered by the boxes. -/\n"
        f"def mixedSlabLo : ℚ := {q(SLAB[0])}\ndef mixedSlabHi : ℚ := {q(SLAB[1])}\n\n/-- The batches: rows `(i, j)`, weight `θ`, Lipschitz constant, mixed node caps, mesh and witnesses. -/\n"
        "def mixedBatches : List JBatch :=\n[" + bt + "]\n\n"
        "/-- The boxes `kind|tl,tu,sl,su,xl,xu|…` of the central slab. -/\ndef mixedBoxes : List String :=\n[" +
        ",\n".join(lean_str(s) for s in boxes) + "]\n\nend Grothe.Lower\n")
OUT.write_text(text)
print("ok", json.dumps(dict(batches=len(batches), nodes=sum(len(b["wits"]) for b in batches), boxes=len(boxes), joint=njoint, src=nsrc,
                            slab_max=float(worst), outer_max=float(outer), B=float(B), bytes=OUT.stat().st_size)))
