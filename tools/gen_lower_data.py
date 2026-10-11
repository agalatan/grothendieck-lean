#!/usr/bin/env python3
"""Generate the lower-bound certificate data modules (exact rationals only):

  Grothe/Lower/RowData01.lean …   one module per row: header (ℓ, β, δ, κ, smax, cap, M_E, M_R, b,
                                  N⁻¹b, LDL certificates of the gates), node caps, mesh, and the
                                  x-cells (moment rectangles, bank of cut vectors, nodes) as strings
  Grothe/Lower/RowData.lean       the list of rows, the fixed mixtures and the scalar cover

Inputs: `handoff/lower-stein/cert-0745/` (manifest.json, row_<t>.json, envelope.json) and the exact
row constants `handoff/lower-stein/rows_final.json` written by the reference verifier
(`verify_cert.py cert-0745 --rows rows_final.json`).  The row cap is the exact row maximum rounded up
to a multiple of 10⁻¹²; the scalar envelope is replayed here with the Lean semantics.
"""
import hashlib
import json
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CERT = ROOT / "handoff" / "lower-stein" / "cert-0745"
ROWS = ROOT / "handoff" / "lower-stein" / "rows_final.json"
OUT = ROOT / "Grothe" / "Lower"
RHO = Q(973612157, 10**9)
PAD = Q(1, 10**11)

def qs(x) -> str:
    x = Q(x)
    return f"{x.numerator}/{x.denominator}" if x.denominator != 1 else f"{x.numerator}"

def q(x) -> str:
    x = Q(x)
    return f"({x.numerator} : ℚ) / {x.denominator}" if x.denominator != 1 else f"({x.numerator} : ℚ)"

def ldl3(m, strict):
    m11, m12, m13, m22, m23, m33 = m
    d1 = m11
    assert d1 > 0 if strict else d1 >= 0, (m, strict)
    if d1 == 0:
        assert m12 == 0 and m13 == 0; l21 = l31 = Q(0)
    else:
        l21, l31 = m12 / d1, m13 / d1
    d2 = m22 - d1 * l21 * l21
    assert d2 > 0 if strict else d2 >= 0, (m, strict)
    r = m23 - d1 * l21 * l31
    if d2 == 0:
        assert r == 0; l32 = Q(0)
    else:
        l32 = r / d2
    d3 = m33 - d1 * l31 * l31 - d2 * l32 * l32
    assert d3 > 0 if strict else d3 >= 0, (m, strict)
    return (d1, d2, d3, l21, l31, l32)

def ldl2(m, strict):
    m11, m12, m22 = m
    d1 = m11
    assert d1 > 0 if strict else d1 >= 0, (m, strict)
    l21 = Q(0) if d1 == 0 else m12 / d1
    d2 = m22 - d1 * l21 * l21
    assert d2 > 0 if strict else d2 >= 0, (m, strict)
    return (d1, d2, l21)

def solve3(M, b):
    A = [list(M[i]) + [b[i]] for i in range(3)]
    for i in range(3):
        p = next(r for r in range(i, 3) if A[r][i] != 0); A[i], A[p] = A[p], A[i]
        A[i] = [v / A[i][i] for v in A[i]]
        for r in range(3):
            if r != i: A[r] = [v - A[r][i] * w for v, w in zip(A[r], A[i])]
    return [A[i][3] for i in range(3)]

def fmt(c): return "⟨" + ", ".join(q(v) for v in c) + "⟩"

def rsqrt(x):
    a, b = isqrt(x.numerator), isqrt(x.denominator)
    assert a * a == x.numerator and b * b == x.denominator
    return Q(a, b)

def lean_str(s): return '"' + s + '"'

man = json.load(open(CERT / "manifest.json"))
EPS = Q(man["eps"]); B = Q(man["B"])
assert EPS == Q(149, 200) and B == Q(713467303, 10**9)
for fn, h in man["files"].items():
    assert hashlib.sha256(open(CERT / fn, "rb").read()).hexdigest() == h, fn
consts = json.load(open(ROWS))
rowfiles = sorted((f for f in man["files"] if f.startswith("row_")), key=lambda f: Q(json.load(open(CERT / f))["t"]))
rows = []
for idx, fn in enumerate(rowfiles, 1):
    R = json.load(open(CERT / fn))
    th = [Q(v) for v in R["theta"]]
    E = tuple(th[0:6]); Rm = tuple(th[6:9]); delta = th[9]; b = th[10:13]; ell, beta = th[13], th[14]
    assert 0 < delta < EPS and ell >= 2 * beta >= 0
    g = (ldl3(E, True), ldl3((E[0] + 1, E[1], E[2], E[3] - EPS, E[4], E[5] - EPS), False),
         ldl3((E[0] - (EPS - delta), E[1], E[2], E[3], E[4], E[5]), False), ldl2(Rm, True),
         ldl2((Rm[0] + 1, Rm[1], Rm[2] - EPS), False), ldl2((Rm[0] - EPS, Rm[1], Rm[2]), False))
    N = (E[0] - (EPS - delta), E[1], E[2], E[3], E[4], E[5])
    nPD = ldl3(N, True)
    c = solve3([[N[0], N[1], N[2]], [N[1], N[3], N[4]], [N[2], N[4], N[5]]], b)
    kappa = Q(R["kappa"]); assert 0 < kappa <= 1 / delta - sum(x * y for x, y in zip(b, c))
    smax = Q(R["smax"])
    assert smax >= 2 * (abs(1 + b[0]) + Q(7358, 10000) * abs(b[1]) + Q(707107, 10**6) * abs(b[2]))
    K = consts[R["name"]]
    assert Q(K["ell"]) == ell and Q(K["beta"]) == beta
    cap_exact = Q(K["C"]) - PAD - 2 * beta * beta / EPS
    cap = Q(-((-cap_exact.numerator * 10**12) // cap_exact.denominator), 10**12)   # rounded up
    assert cap_exact <= cap < cap_exact + Q(1, 10**12)
    nodes = ";".join(f"{qs(r)}:{qs(cc)}" for r, cc in zip(R["nodes"], R["caps"]))
    mesh = [Q(v) for v in R["mesh"]]
    assert not mesh or mesh[0] == 0
    vs = ",".join(qs(rsqrt(t)) for t in mesh[1:])
    cells = []
    for cell in R["cells"]:
        rects = cell["rects"] if cell["kind"] == "moment" else cell["small"]
        rs = ";".join(f"{qs(r['s'][0])}:{qs(r['s'][1])}:" + ",".join(qs(v) for v in r["P"]) for r in rects)
        bank = ";".join(",".join(str(int(v)) for v in z) for z in cell.get("bank", []))
        ns = []
        for n in cell.get("nodes", []):
            y = n["y"]
            assert len(n["mu"]) == len(n["cuts"])
            ns.append(f"{qs(n['sigma'])}:" + ",".join(qs(v) for v in (y[0], y[4], y[1], y[2], y[3])) + ":" +
                      ",".join(f"{int(m)},{int(k)}" for m, k in zip(n["mu"], n["cuts"])))
        cells.append(f"{qs(cell['x'][0])}|{qs(cell['x'][1])}|{rs}|{bank}|" + ";".join(ns))
    name = f"row{idx:02d}"
    body = (f"/-- The row `{R['name']}`. -/\ndef {name} : Row :=\n  ⟨{lean_str(R['name'])}, {q(ell)}, {q(beta)}, {q(delta)}, {q(kappa)}, {q(smax)}, {q(cap)},\n"
            f"   {fmt(E)},\n   {fmt(Rm)},\n   {q(b[0])}, {q(b[1])}, {q(b[2])},\n   {q(c[0])}, {q(c[1])}, {q(c[2])},\n"
            f"   ⟨" + ", ".join(fmt(x) for x in g) + f"⟩,\n   {fmt(nPD)},\n   {lean_str(nodes)},\n   {lean_str(vs)},\n   [" +
            ",\n    ".join(lean_str(s) for s in cells) + "]⟩\n\n")
    nst = sum(len(c.get("nodes", [])) for c in R["cells"])
    text = ("import Grothe.Lower.Rows\n\n/-!\n# Row `" + R["name"] + "` (generated by `tools/gen_lower_data.py`; do not edit)\n\n"
            f"Header, node caps, mesh and the {len(cells)} `x`-cells ({nst} nodes) of the row with nominal point `t = {R['name']}`.\n-/\n\n"
            "namespace Grothe.Lower\n\n" + body + "end Grothe.Lower\n")
    (OUT / f"RowData{idx:02d}.lean").write_text(text)
    rows.append(dict(name=R["name"], lean=name, ell=ell, beta=beta, C=2 * beta * beta / EPS + cap + PAD))

# ----- the scalar envelope, replayed with the Lean semantics (rows: crude first)
env_rows = [dict(name="crude", ell=Q(0), beta=Q(0), C=EPS * RHO ** 2)] + rows
index = {r["name"]: i for i, r in enumerate(env_rows)}
env = json.load(open(CERT / "envelope.json")); step = Q(env["step"])
assert len(env["cells"]) * step == Q(9, 10)
models = []; mindex = {}; cells = []
for k, (i, j, th) in enumerate(env["cells"]):
    key = (index[i], index[j], Q(th))
    if key not in mindex: mindex[key] = len(models); models.append(key)
    m = mindex[key]
    if cells and cells[-1][2] == m: cells[-1][1] = (k + 1) * step
    else: cells.append([k * step, (k + 1) * step, m])
worst = None
for lo, hi, m in cells:
    i, j, th = models[m]; a, b = env_rows[i], env_rows[j]; w = 1 - th
    assert 0 <= th <= 1
    c0 = w * a["C"] + th * b["C"] - 2 * w * th * (a["beta"] - b["beta"]) ** 2 / EPS
    c1 = -2 * (w * a["ell"] + th * b["ell"])
    for t in (lo, hi):
        v = c0 + c1 * t + t * t
        assert v <= B, (float(lo), float(hi), float(v))
        if worst is None or v > worst[0]: worst = (v, t)
defs = ("/-- The rows of the certificate. -/\ndef rowData : List Row :=\n  [" + ", ".join(r["lean"] for r in rows) + "]\n\n"
        "/-- Fixed mixtures `(i, j, θ)` of the rows (index `0` is the crude row). -/\ndef envModels : List EnvModel :=\n[" +
        ",\n".join(f"  ⟨{i}, {j}, {q(th)}⟩" for i, j, th in models) + "]\n\n"
        "/-- Cells `(lo, hi, model)` of the scalar cover of `[0, 9/10]`. -/\ndef envCells : List EnvCell :=\n[" +
        ",\n".join(f"  ⟨{q(l)}, {q(h)}, {k}⟩" for l, h, k in cells) + "]\n\n")
text = ("".join(f"import Grothe.Lower.RowData{i:02d}\n" for i in range(1, len(rows) + 1)) + "import Grothe.Lower.Support\n\n/-!\n"
        "# Rows, fixed mixtures and the scalar cover (generated by `tools/gen_lower_data.py`; do not edit)\n\n"
        f"The {len(rows)} rows at the witness parameter `ε = 149/200`, the {len(models)} fixed mixtures and the {len(cells)} cells of the\nscalar cover.\n-/\n\n"
        "namespace Grothe.Lower\n\n" + defs + "end Grothe.Lower\n")
(OUT / "RowData.lean").write_text(text)
print("ok", json.dumps(dict(rows=len(rows), models=len(models), envcells=len(cells), envelope_max=float(worst[0]), at=float(worst[1]),
                            bytes=sum((OUT / f"RowData{i:02d}.lean").stat().st_size for i in range(1, len(rows) + 1)))))
