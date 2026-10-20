#!/usr/bin/env python3
"""Generate the common-law (mixed) certificate data module (exact rationals only):

  Grothe/Lower/MixedData.lean   the batches of exact node certificates for the mixed potentials
                                and the regions covering t ∈ [0, 9/10] with their boxes, as strings
                                parsed at check time (`parseWit`, `parseBox` in Mixed.lean/Boxes.lean):
                                outside the central slab one cap box per region (the scalar
                                envelope of `envelope.json`), on the slab the boxes of the cover

Usage: tools/gen_lower_mixed.py [CERT_DIR]   (default handoff/lower-stein/cert-1401619290904)

CERT_DIR holds the cover (`improved_cover.json` with `regions`, or `joint_cover_certificate.json`
with one `domain`) and the batch files it references (`review/*.json`); the source rows are
`handoff/lower-stein/cert-0745e/`, `cert-0745d/`, `cert-0745c/` or `cert-0745/` (whichever the cover pins by hash).  Row indices refer to `rowData`
(rows sorted by their nominal `t`).  Cell kinds: source (two rows, node references
`(cell, node)`, `(-1, -1)` the zero node), `joint` (a batch, witness indices) and `joint_mix`
(two batches mixed with weight `λ` before the gate completion).  Every box value is replayed
here with the Lean semantics (virtual rows, quadratic maxima) and compared with the stored bound
and the cap; the dyadic coverage of every region and the cap boxes of the envelope are replayed too.
"""
import hashlib
import json
import os
import sys
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HANDOFF = Path(os.environ.get("GROTHE_HANDOFF", ROOT / "handoff"))   # the (git-ignored) data folder; set it when running from a worktree
# the pinned source rows: whichever per-row certificate the cover pins by its manifest hash
SOURCES = [(HANDOFF / "lower-stein" / "cert-0745e", HANDOFF / "lower-stein" / "cert-0745e" / "rows_final_e.json"),
           (HANDOFF / "lower-stein" / "cert-0745d", HANDOFF / "lower-stein" / "cert-0745d" / "rows_final_d.json"),
           (HANDOFF / "lower-stein" / "cert-0745c", HANDOFF / "lower-stein" / "cert-0745c" / "rows_final_c.json"),
           (HANDOFF / "lower-stein" / "cert-0745", HANDOFF / "lower-stein" / "rows_final.json")]
NEW = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else HANDOFF / "lower-stein" / "cert-1401619290904"
OUT = ROOT / "Grothe" / "Lower" / "MixedData.lean"
EPS = Q(149, 200); RHO = Q(973612157, 10**9); C6 = Q(4045313, 100000); PAD = Q(1, 10**11); XMAX = Q(31, 4)

def qs(x):
    x = Q(x); return f"{x.numerator}/{x.denominator}" if x.denominator != 1 else f"{x.numerator}"
def q(x):
    x = Q(x); return f"({x.numerator} : ℚ) / {x.denominator}" if x.denominator != 1 else f"({x.numerator} : ℚ)"
def rsqrt(x):
    a, b = isqrt(x.numerator), isqrt(x.denominator); assert a * a == x.numerator and b * b == x.denominator; return Q(a, b)
def lean_str(s): return '"' + s + '"'
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()

# ----- the cover and the pinned source rows
cover_file = next(f for f in ("improved_cover.json", "joint_cover_certificate.json") if (NEW / f).exists())
cert = json.load(open(NEW / cover_file))
CERT, ROWS_FILE = next((c, r) for c, r in SOURCES if hashlib.sha256(open(c / "manifest.json", "rb").read()).hexdigest() == cert["source_manifest_sha256"])
if "source_rows_sha256" in cert: assert hashlib.sha256(open(ROWS_FILE, "rb").read()).hexdigest() == cert["source_rows_sha256"]
man = json.load(open(CERT / "manifest.json"))
assert sha(CERT / "manifest.json") == cert["source_manifest_sha256"]
for fn, h in man["files"].items(): assert sha(CERT / fn) == h, fn
rowfiles = sorted((f for f in man["files"] if f.startswith("row_")), key=lambda f: Q(json.load(open(CERT / f))["t"]))
rows = [json.load(open(CERT / f)) for f in rowfiles]
index = {R["name"]: k for k, R in enumerate(rows)}
B = Q(cert["target"])
regions_json = cert["regions"] if "regions" in cert else [dict(domain=cert["domain"], cells=cert["cells"])]
for r in regions_json:
    d = tuple(map(Q, r["domain"])); assert d[2:] == (0, RHO, 0, XMAX) and d[0] < d[1]
regions_json.sort(key=lambda r: Q(r["domain"][0]))
SLAB = (Q(regions_json[0]["domain"][0]), Q(regions_json[-1]["domain"][1]))
for a, b in zip(regions_json, regions_json[1:]): assert Q(a["domain"][1]) == Q(b["domain"][0])

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
def vrow(R):   # (ell, beta, delta, N (6 entries), g1, g2, g3)
    th = [Q(v) for v in R["theta"]]; d = th[9]
    return (th[13], th[14], d, (th[0] - (EPS - d), th[1], th[2], th[3], th[4], th[5]), d * th[10], d * th[11], d * th[12])
def vmix(th, a, b):
    return tuple((1 - th) * u + th * v for u, v in zip(a[:3], b[:3])) + (tuple((1 - th) * u + th * v for u, v in zip(a[3], b[3])),) + \
        tuple((1 - th) * u + th * v for u, v in zip(a[4:], b[4:]))
def gatePrice(N, g):
    m11, m12, m13, m22, m23, m33 = N; w1, w2 = m12 + g[1], m13 + g[2]; det = m22 * m33 - m23 * m23
    assert m22 > 0 and det > 0
    return m11 + 2 * g[0] - (m33 * w1 * w1 - 2 * m23 * w1 * w2 + m22 * w2 * w2) / det
def vprice(a): return a[2] + gatePrice(a[3], a[4:])
def rowPriceOK(R):
    a = vrow(R); return Q(R["kappa"]) * a[2] * a[2] <= vprice(a)
def tnode(R, ref):
    ci, ni = ref
    if ci < 0: return (Q(0), (Q(R["caps"][0]), Q(0), Q(0), Q(0), Q(0)))
    n = R["cells"][ci]["nodes"][ni]; return (Q(n["sigma"]) / vrow(R)[2], mpoly(n["y"]))
def tchord(n0, n1, s):
    assert 0 <= n0[0] <= s <= n1[0]
    if n0[0] < n1[0]: return lin((n1[0] - s) / (n1[0] - n0[0]), (s - n0[0]) / (n1[0] - n0[0]), n0[1], n1[1])
    return n0[1]
def boxVal(a, Lm, Lp, tl, tu, sl, su, xl, xu):
    ell, beta, D = a[0], a[1], vprice(a); assert Lm[4] >= 0 and Lp[4] >= 0
    def xPart(xh):
        lo, hi = J(Lm, xh), J(Lp, xh); m = (hi - lo) / (su - sl)
        return quadMax(lo - m * sl, m, -D, sl, su)
    return quadMax(Q(0), -2 * ell, Q(1), tl, tu) + 2 * beta * beta / EPS + max(xPart(xl), xPart(xu)) + PAD

# ----- batches
batches = []
for bref in cert["joint_batches"]:
    p = NEW / bref["file"]; assert sha(p) == bref["sha256"], bref["file"]
    b = json.load(open(p))
    assert b["source_manifest_sha256"] == cert["source_manifest_sha256"]
    names = b["rows"]; w = list(map(Q, b["weights"])); assert len(names) == 2 and w[0] + w[1] == 1 and min(w) >= 0
    th = w[1]; Ri, Rj = rows[index[names[0]]], rows[index[names[1]]]
    # the stored mixed table is exactly the one of the source rows (exact rationals, no node rounding)
    def capAt(R, s):
        ns, cs = [Q(v) for v in R["nodes"]], [Q(v) for v in R["caps"]]
        if s >= ns[-1]: return cs[-1] + Q(R["smax"]) * (s - ns[-1])
        k = max(k for k in range(len(ns) - 1) if ns[k] <= s); return cs[k] + (cs[k + 1] - cs[k]) * (s - ns[k]) / (ns[k + 1] - ns[k])
    assert all(isinstance(v, str) for R in (Ri, Rj) for v in R["nodes"] + R["caps"])
    dd = [Q(R["theta"][9]) for R in (Ri, Rj)]
    mn = sorted(set(Q(z) / d for R, d in zip((Ri, Rj), dd) for z in R["nodes"]))
    assert mn == [Q(v) for v in b["nodes"]], "mixed nodes differ from the exact row nodes"
    assert [w[0] * capAt(Ri, dd[0] * z) + w[1] * capAt(Rj, dd[1] * z) for z in mn] == [Q(v) for v in b["caps"]], "mixed caps differ"
    mesh = [Q(v) for v in b["mesh"]]; assert mesh[0] == 0 and all(u < v for u, v in zip(mesh, mesh[1:]))
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
    tn = [(Q(wit["tau"]), mpoly(wit["y"])) for wit in b["witnesses"]]
    assert all(u[0] < v[0] for u, v in zip(tn, tn[1:]))
    batches.append(dict(i=index[names[0]], j=index[names[1]], th=th, smax=Q(b["smax"]), nodes=nodes, vs=vs, wits=wits,
                        tnodes=tn, vrow=vmix(th, vrow(Ri), vrow(Rj))))

# ----- boxes of every region, replayed
def batch_chords(b, refs, sl, su):
    (k0, k1), (k2, k3) = refs
    return tchord(b["tnodes"][k0], b["tnodes"][k1], sl), tchord(b["tnodes"][k2], b["tnodes"][k3], su)
regions = []; worst = Q(0); kinds = dict(src=0, joint=0, jmix=0); nboxes = 0
for reg in regions_json:
    dom = tuple(map(Q, reg["domain"])); boxes = []; doms = []
    for cell in reg["cells"]:
        box = tuple(map(Q, cell["box"])); tl, tu, sl, su, xl, xu = box
        assert 0 <= sl < su and tl < tu and 0 <= xl < xu
        bx = ",".join(qs(v) for v in box)
        if cell.get("kind") == "joint":
            bk = cell["batch"]; b = batches[bk]; (k0, k1), (k2, k3) = cell["joint_refs"]
            Lm, Lp = batch_chords(b, cell["joint_refs"], sl, su); a = b["vrow"]
            boxes.append(f"j|{bx}|{bk}|{k0},{k1},{k2},{k3}"); kinds["joint"] += 1
        elif cell.get("kind") == "joint_mix":
            b0, b1 = cell["batches"]; lam = Q(cell["mix"]); assert 0 <= lam <= 1
            r0, r1 = cell["refs"]
            Lm0, Lp0 = batch_chords(batches[b0], r0, sl, su); Lm1, Lp1 = batch_chords(batches[b1], r1, sl, su)
            Lm, Lp = lin(1 - lam, lam, Lm0, Lm1), lin(1 - lam, lam, Lp0, Lp1); a = vmix(lam, batches[b0]["vrow"], batches[b1]["vrow"])
            ks = lambda r: ",".join(str(k) for pr in r for k in pr)
            boxes.append(f"m|{bx}|{b0},{b1},{qs(lam)}|{ks(r0)}|{ks(r1)}"); kinds["jmix"] += 1
        else:
            assert "kind" not in cell
            Ri, Rj = rows[index[cell["i"]]], rows[index[cell["j"]]]; th = Q(cell["theta"]); assert 0 <= th <= 1
            pi, pj = cell["points"]
            Pim = tchord(tnode(Ri, pi[0][0]), tnode(Ri, pi[0][1]), sl); Pip = tchord(tnode(Ri, pi[1][0]), tnode(Ri, pi[1][1]), su)
            Pjm = tchord(tnode(Rj, pj[0][0]), tnode(Rj, pj[0][1]), sl); Pjp = tchord(tnode(Rj, pj[1][0]), tnode(Rj, pj[1][1]), su)
            Lm, Lp = lin(1 - th, th, Pim, Pjm), lin(1 - th, th, Pip, Pjp); a = vmix(th, vrow(Ri), vrow(Rj))
            refs = lambda pr: ",".join(f"{u},{c}" for ab in pr for u, c in ab)
            boxes.append(f"s|{bx}|{index[cell['i']]},{index[cell['j']]},{qs(th)}|{refs(pi)}|{refs(pj)}"); kinds["src"] += 1
        v = boxVal(a, Lm, Lp, *box)
        assert v == Q(cell["bound"]) and v <= B, (cell["box"], float(v), float(Q(cell["bound"])))
        worst = max(worst, v); doms.append(box)
    # coverage (dyadic partition)
    def cover(dom, ids):
        if len(ids) == 1: assert doms[ids[0]] == dom; return
        for k in (0, 2, 4):
            mid = (dom[k] + dom[k + 1]) / 2
            if any(doms[i][k] < mid < doms[i][k + 1] for i in ids): continue
            L = [i for i in ids if doms[i][k + 1] <= mid]; R = [i for i in ids if doms[i][k] >= mid]
            if not L or not R: continue
            a_, b_ = list(dom), list(dom); a_[k + 1] = mid; b_[k] = mid
            cover(tuple(a_), L); cover(tuple(b_), R); return
        raise AssertionError("not a dyadic partition")
    cover(dom, list(range(len(doms))))
    regions.append(dict(lo=dom[0], hi=dom[1], boxes=boxes)); nboxes += len(boxes)
assert all(rowPriceOK(R) for R in rows)

# ----- the cap boxes outside the slab (the scalar envelope, Lean semantics): maximal runs of
# envelope cells with the same mixture, cut at the slab ends; scalar row 0 is the crude row
env = json.load(open(CERT / "envelope.json")); step = Q(env["step"])
assert len(env["cells"]) * step == Q(9, 10)
consts = json.load(open(ROWS_FILE))
env_rows = {"crude": dict(k=0, ell=Q(0), beta=Q(0), C=EPS * RHO ** 2)}
for k, R in enumerate(rows):
    K = consts[R["name"]]; ell, beta = Q(K["ell"]), Q(K["beta"])
    cap_exact = Q(K["C"]) - PAD - 2 * beta * beta / EPS
    cap = Q(-((-cap_exact.numerator * 10**15) // cap_exact.denominator), 10**15)
    env_rows[R["name"]] = dict(k=k + 1, ell=ell, beta=beta, C=2 * beta * beta / EPS + cap + PAD)
runs = []
for k, (i, j, th) in enumerate(env["cells"]):
    lo, hi = k * step, (k + 1) * step
    if SLAB[0] <= lo and hi <= SLAB[1]: continue
    assert hi <= SLAB[0] or lo >= SLAB[1]
    key = (i, j, Q(th))
    if runs and runs[-1][2] == key and runs[-1][1] == lo and lo != SLAB[1]: runs[-1][1] = hi
    else: runs.append([lo, hi, key])
outer = Q(0)
for lo, hi, (i, j, th) in runs:
    a, b = env_rows[i], env_rows[j]; assert 0 <= th <= 1
    c0 = (1 - th) * a["C"] + th * b["C"] - 2 * (1 - th) * th * (a["beta"] - b["beta"]) ** 2 / EPS
    c1 = -2 * ((1 - th) * a["ell"] + th * b["ell"])
    v = quadMax(c0, c1, Q(1), lo, hi); assert v <= B; outer = max(outer, v)
    regions.append(dict(lo=lo, hi=hi, boxes=[f"c|{qs(lo)},{qs(hi)},0,{qs(RHO)},0,{qs(XMAX)}|{a['k']},{b['k']},{qs(th)}"]))
regions.sort(key=lambda r: r["lo"])
assert regions[0]["lo"] == 0 and regions[-1]["hi"] == Q(9, 10)
assert all(r["hi"] == r2["lo"] for r, r2 in zip(regions, regions[1:]))

# ----- emit
bt = ",\n".join(f"  ⟨{b['i']}, {b['j']}, {q(b['th'])}, {q(b['smax'])},\n   {lean_str(b['nodes'])},\n   {lean_str(b['vs'])},\n   [" +
                ",\n    ".join(lean_str(w) for w in b["wits"]) + "]⟩" for b in batches)
def region(r): return f"  ⟨{q(r['lo'])}, {q(r['hi'])},\n   [" + ",\n    ".join(lean_str(s) for s in r["boxes"]) + "]⟩"
CH = 32   # regions per chunk (long list literals exceed the elaborator's recursion depth)
chunks = [regions[k:k + CH] for k in range(0, len(regions), CH)]
rg = "".join(f"/-- Regions {k * CH}–{k * CH + len(c) - 1} of the cover. -/\ndef coverRegions{k} : List Region :=\n[" + ",\n".join(region(r) for r in c) + "]\n\n"
             for k, c in enumerate(chunks))
rg += ("/-- The regions `(lo, hi)` covering `[0, 9/10]` with their boxes `kind|tl,tu,sl,su,xl,xu|…`. -/\ndef coverRegions : List Region :=\n  " +
       " ++ ".join(f"coverRegions{k}" for k in range(len(chunks))) + "\n\n")
nnodes = sum(len(b["wits"]) for b in batches)
text = ("import Grothe.Lower.Boxes\n\n/-!\n# The common-law certificate data (generated by `tools/gen_lower_mixed.py`; do not edit)\n\n"
        f"The {len(batches)} batches of exact node certificates for the mixed potentials ({nnodes} nodes) and the\n"
        f"{len(regions)} regions covering `[0, 9/10] × [0, ρ] × [0, 31/4]`: {len(runs)} cap boxes outside the central slab\n"
        f"`[{SLAB[0]}, {SLAB[1]}]` and, on the slab, {nboxes} boxes ({kinds['src']} source boxes, {kinds['joint']} joint boxes,\n"
        f"{kinds['jmix']} joint-mixture boxes); source `{NEW.name}`.\n-/\n\n"
        "namespace Grothe.Lower\n\n"
        "/-- The batches: rows `(i, j)`, weight `θ`, Lipschitz constant, mixed node caps, mesh and witnesses. -/\n"
        "def mixedBatches : List JBatch :=\n[" + bt + "]\n\n"
        + rg + "end Grothe.Lower\n")
OUT.write_text(text)
print("ok", json.dumps(dict(source=NEW.name, batches=len(batches), nodes=nnodes, regions=len(regions), caps=len(runs), boxes=nboxes, kinds=kinds,
                            slab=[str(SLAB[0]), str(SLAB[1])], slab_max=float(worst), outer_max=float(outer), B=float(B),
                            bytes=OUT.stat().st_size)))
