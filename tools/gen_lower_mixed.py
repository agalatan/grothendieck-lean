#!/usr/bin/env python3
"""Generate the common-law (mixed) certificate data module (exact rationals only):

  Grothe/Lower/MixedData.lean   the batches of exact node certificates for the mixed potentials
                                (`mixedBatches`), the boxes of the cover of [0, 9/10] × [0, ρ] × [0, 31/4]
                                (`coverBoxes`) and its partition certificate (`coverCuts`), as strings
                                parsed at check time (`parseWit`, `parseBox`, `parseTree` in
                                Mixed.lean/Boxes.lean)

Usage: tools/gen_lower_mixed.py [CERT_DIR]   (default handoff/lower-stein/cert-joint, the certificate on master)

CERT_DIR is the spectral-envelope package: `inherited.json` (the 19 source rows parsed from
`RowData*.lean`, the inherited batches of Stein node certificates with their witnesses (meshes in `v = √u`), and the
inherited boxes `kind|bounds|refs`), and `cover.json` (`target`, `lower`, the mixtures `groups`, the
node references `nodes`, the new spectral nodes `newnodes` (one spectral cut `(λ, μ, t, β, ν)` with
`ν ≥ 0` (absent means `0`) on the test mesh `rv` of the node, the majorant `P = (a₀, a₁, a₂, a₄, a₆)`),
and the `boxes` of the partition, each evaluated through an inherited box (`original`) or a `choice`
of one or two groups with four bracketing node references each, the chords optionally taken on a
larger `scale_domain` and restricted to the box). Spectral nodes of one mixed potential sharing a
test mesh form one batch.

The rows of `inherited.json` are cross-checked field by field against the committed `RowData*.lean`
(so that the node references index the same Stein nodes), every box value is replayed with the Lean
semantics (virtual rows, pinned gate price, chords and re-chords in τ, `x` endpoints, quadratic
maxima, one pad) and compared with the stored bound and the cap, and a guillotine partition
certificate (axis cuts, replayed) is produced for the boxes.
"""
import json
import os
import re
import sys
from fractions import Fraction as Q
from pathlib import Path

sys.setrecursionlimit(100000)
ROOT = Path(__file__).resolve().parent.parent
HANDOFF = Path(os.environ.get("GROTHE_HANDOFF", ROOT / "handoff"))   # the (git-ignored) data folder; set it when running from a worktree
NEW = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else HANDOFF / "lower-stein" / "cert-joint"
OUT = ROOT / "Grothe" / "Lower" / "MixedData.lean"
EPS = Q(149, 200); RHO = Q(973612157, 10**9); C6 = Q(4045313, 100000); PAD = Q(1, 10**11); XMAX = Q(31, 4)

def qs(x):
    x = Q(x); return f"{x.numerator}/{x.denominator}" if x.denominator != 1 else f"{x.numerator}"
def q(x):
    x = Q(x); return f"({x.numerator} : ℚ) / {x.denominator}" if x.denominator != 1 else f"({x.numerator} : ℚ)"
def lean_str(s): return '"' + s + '"'

inh = json.load(open(NEW / "inherited.json")); cov = json.load(open(NEW / "cover.json"))
for key, value in (("eps", EPS), ("rho", RHO), ("C6", C6), ("xmax", XMAX), ("pad", PAD)): assert Q(inh[key]) == value, key
B = Q(cov["target"]); L = Q(cov["lower"]); assert cov["fails"] == [] and B * L < 1
rows = inh["rows"]

# ----- the rows: cross-check against the committed RowData modules (field by field, exact)
NUM = re.compile(r"\((-?\d+) : ℚ\)(?: / (\d+))?")
for k, R in enumerate(rows):
    text = (ROOT / "Grothe" / "Lower" / f"RowData{k + 1:02d}.lean").read_text()
    nums = [Q(int(a), int(b) if b else 1) for a, b in NUM.findall(text)]
    assert nums[:6] == [Q(R[f]) for f in ("ell", "beta", "delta", "kappa", "smax", "cap")], ("row header", k)
    assert nums[6:12] == [Q(v) for v in R["E"]] and nums[12:15] == [Q(v) for v in R["b"]], ("row gate", k)
    strs = re.findall(r'"([^"]*)"', text)
    assert [(Q(a), Q(b)) for a, b in (s.split(":") for s in strs[0].split(";"))] == [(Q(x), Q(y)) for x, y in R["table"]], ("row table", k)
    assert [Q(v) for v in strs[1].split(",") if v] == [Q(v) for v in R["mesh"][1:]] and Q(R["mesh"][0]) == 0, ("row mesh", k)
    cells = strs[2:]; assert len(cells) == len(R["cells"]), ("row cells", k)
    for cl, cj in zip(cells, R["cells"]):
        xlo, xhi, _, _, nodes = cl.split("|")
        assert [Q(xlo), Q(xhi)] == [Q(v) for v in cj["x"]]
        ln = [(Q(s.split(":")[0]), [Q(v) for v in s.split(":")[1].split(",")]) for s in nodes.split(";")] if nodes else []
        assert ln == [(Q(n["tau"]), [Q(v) for v in n["P"]]) for n in cj["nodes"]], ("row nodes", k)

# ----- Lean-side arithmetic (mirrors Basic.lean / Gate.lean / Mixed.lean / Boxes.lean)
def quadVal(c0, c1, c2, t): return c0 + c1 * t + c2 * t * t
def quadMax(c0, c1, c2, a, b):
    e = max(quadVal(c0, c1, c2, a), quadVal(c0, c1, c2, b))
    if c2 < 0:
        v = -c1 / (2 * c2)
        if a <= v <= b: return max(e, quadVal(c0, c1, c2, v))
    return e
def J(y, x):   # y = (a0, a1, a2, a4, a6); J 0 1 x
    a0, a1, a2, a4, a6 = y
    return a0 + RHO * a1 + a2 + a4 * (2 + x * x) + a6 * (6 + 9 * x * x + C6 * x ** 3)
def lin(a, b, p, r): return tuple(a * u + b * v for u, v in zip(p, r))
def vrow(R):   # VRow: (ell, beta, delta, N (6 entries), g1, g2, g3) with N = E − diag(ε − δ, 0, 0), g = δ b
    E = [Q(v) for v in R["E"]]; d = Q(R["delta"]); b = [Q(v) for v in R["b"]]
    return (Q(R["ell"]), Q(R["beta"]), d, (E[0] - (EPS - d), E[1], E[2], E[3], E[4], E[5]), d * b[0], d * b[1], d * b[2])
def vmix(th, a, b):
    return tuple((1 - th) * u + th * v for u, v in zip(a[:3], b[:3])) + (tuple((1 - th) * u + th * v for u, v in zip(a[3], b[3])),) + \
        tuple((1 - th) * u + th * v for u, v in zip(a[4:], b[4:]))
def gatePrice(N, g):
    m11, m12, m13, m22, m23, m33 = N; w1, w2 = m12 + g[1], m13 + g[2]; det = m22 * m33 - m23 * m23
    assert m22 > 0 and det > 0, "gateOK"
    return m11 + 2 * g[0] - (m33 * w1 * w1 - 2 * m23 * w1 * w2 + m22 * w2 * w2) / det
def vprice(a): return a[2] + gatePrice(a[3], a[4:])
def tchord(n0, n1, s):   # tchordOK and tchordP
    assert 0 <= n0[0] <= s <= n1[0], "tchordOK"
    if n0[0] < n1[0]: return lin((n1[0] - s) / (n1[0] - n0[0]), (s - n0[0]) / (n1[0] - n0[0]), n0[1], n1[1])
    return n0[1]
def boxVal(a, Lm, Lp, tl, tu, sl, su, xl, xu):
    ell, beta, D = a[0], a[1], vprice(a); assert Lm[4] >= 0 and Lp[4] >= 0 and 0 <= sl < su and 0 <= xl
    def xPart(xh):
        lo, hi = J(Lm, xh), J(Lp, xh); m = (hi - lo) / (su - sl)
        return quadMax(lo - m * sl, m, -D, sl, su)
    return quadMax(Q(0), -2 * ell, Q(1), tl, tu) + 2 * beta * beta / EPS + max(xPart(xl), xPart(xu)) + PAD
def capAt(xs, ys, smax, s):   # capAt: the interpolant of the caps, continued by the Lipschitz line
    if s >= xs[-1]: return ys[-1] + smax * (s - xs[-1])
    k = max(k for k in range(len(xs) - 1) if xs[k] <= s); return ys[k] + (ys[k + 1] - ys[k]) * (s - xs[k]) / (xs[k + 1] - xs[k])
def rowTable(R): return [Q(x) for x, y in R["table"]], [Q(y) for x, y in R["table"]], Q(R["smax"]), Q(R["delta"])
def rowTNode(R, ref):   # the zero node or a Stein node rescaled to τ = σ/δ
    xs, ys, _, d = rowTable(R)
    if ref is None: assert xs[0] == 0; return (Q(0), (ys[0], Q(0), Q(0), Q(0), Q(0)))
    ci, ni = ref; n = R["cells"][ci]["nodes"][ni]; return (Q(n["tau"]) / d, tuple(Q(v) for v in n["P"]))
def samePot(a, b, al, c, d, ga):
    return (a == c and b == d and al == ga) or (al == 0 and ga == 0 and a == c) or (al == 1 and ga == 1 and b == d)
VR = [vrow(R) for R in rows]

# ----- the inherited batches (Stein witnesses) and the new spectral batches
batches = []   # dicts: i, j, th, smax, nodes, vs, spec, wits, tnodes
for b in inh["batches"]:
    i, j, th = int(b["i"]), int(b["j"]), Q(b["theta"]); assert 0 <= th <= 1
    mesh = [Q(v) for v in b["mesh"]]; assert mesh[0] == 0 and all(u < v for u, v in zip(mesh, mesh[1:]))
    wits = []; tn = []
    for n in b["nodes"]:
        P = [Q(v) for v in n["P"]]; assert len(P) == 5 and P[1] >= 0 and P[4] >= 0
        mu = [Q(v) * 10**10 for v in n["mu"]]; assert all(m.denominator == 1 and m >= 0 for m in mu)
        bank = []
        for z in n["bank"]:
            zz = [Q(v) * 10**8 for v in z]; assert all(v.denominator == 1 for v in zz) and len(zz) == len(mesh) + 1
            bank.append(",".join(str(v.numerator) for v in zz))
        assert len(mu) == len(bank)
        wits.append(f"{qs(n['tau'])}:" + ",".join(qs(v) for v in P) + ":" + ",".join(str(m.numerator) for m in mu) + "|" + ";".join(bank))
        tn.append((Q(n["tau"]), tuple(P)))
    assert all(u[0] < v[0] for u, v in zip(tn, tn[1:]))
    batches.append(dict(i=i, j=j, th=th, smax=Q(b["smax"]), nodes=";".join(f"{qs(x)}:{qs(y)}" for x, y in b["table"]),
                        vs=",".join(qs(v) for v in mesh[1:]), spec=False, wits=wits, tnodes=tn))
NINH = len(batches)
newnodes = cov["newnodes"]; groups_new = {}
for name, n in newnodes.items():
    groups_new.setdefault((n["i"], n["j"], Q(n["theta"]), tuple(Q(v) for v in n["rv"])), []).append(name)
newref = {}; meshes = set()
for (i, j, th, rv), names in sorted(groups_new.items(), key=lambda kv: (kv[0][:3], len(kv[0][3]), kv[0][3])):
    assert 0 <= th <= 1; meshes.add(len(rv))
    Ri, Rj = rows[i], rows[j]; (xi, yi, si, di), (xj, yj, sj, dj) = rowTable(Ri), rowTable(Rj)
    # the mixed table: the mixed interpolants at the union of the rescaled abscissae, the mixed Lipschitz constant
    xs = sorted(set([x / di for x in xi] + [x / dj for x in xj]))
    ys = [(1 - th) * capAt(xi, yi, si, di * x) + th * capAt(xj, yj, sj, dj * x) for x in xs]
    smax = (1 - th) * di * si + th * dj * sj
    rv = list(rv); assert rv[0] == 0 and all(u < v for u, v in zip(rv, rv[1:]))
    names.sort(key=lambda nm: (Q(newnodes[nm]["tau"]), nm)); wits = []; tn = []
    for k, nm in enumerate(names):
        n = newnodes[nm]; assert [Q(v) for v in n["rv"]] == rv and n.get("eta") is None
        lam, mu, t, be, tau = (Q(n[f]) for f in ("lam", "mu", "t", "beta", "tau")); assert lam > 0 and mu > 0 and tau > 0
        nu = Q(n.get("nu") or 0); assert nu >= 0
        phi = [Q(v) for v in n["phi"]]; assert len(phi) == len(rv) - 1
        P = [Q(v) for v in n["P"]]; assert len(P) == 5 and P[1] >= 0 and P[4] >= 0
        wits.append(f"{qs(tau)}:" + ",".join(qs(v) for v in P) + f":{qs(lam)},{qs(mu)},{qs(t)},{qs(be)},{qs(nu)}|" + ",".join(qs(v) for v in phi))
        tn.append((tau, tuple(P))); newref[nm] = (len(batches), k)
    assert all(u[0] <= v[0] for u, v in zip(tn, tn[1:]))
    batches.append(dict(i=i, j=j, th=th, smax=smax, nodes=";".join(f"{qs(x)}:{qs(y)}" for x, y in zip(xs, ys)),
                        vs=",".join(qs(v) for v in rv[1:]), spec=True, wits=wits, tnodes=tn))
BV = [vmix(b["th"], VR[b["i"]], VR[b["j"]]) for b in batches]

# ----- the node references of the cover and the groups
def refdata(r):   # (string, (i, j, θ) of its potential, τ-node)
    if r[0] == "z": i = r[1]; return f"z,{i}", (i, i, Q(0)), rowTNode(rows[i], None)
    if r[0] == "s": i, ci, ni = r[1:]; return f"s,{i},{ci},{ni}", (i, i, Q(0)), rowTNode(rows[i], (ci, ni))
    if r[0] == "b": bi, k = r[1:]; assert bi < NINH
    else: bi, k = newref[r[1]]
    b = batches[bi]; return f"b,{bi},{k}", (b["i"], b["j"], b["th"]), b["tnodes"][k]
NODES = [refdata(r) for r in cov["nodes"]]
GROUPS = []
for g in cov["groups"]:
    w = [(int(i), Q(v)) for i, v in g["weights"]]; assert sum(v for _, v in w) == 1 and all(v > 0 for _, v in w) and w == sorted(w)
    if len(w) == 1: GROUPS.append((w[0][0], w[0][0], Q(0)))
    else: assert len(w) == 2; GROUPS.append((w[0][0], w[1][0], w[1][1]))

# ----- boxes: Lean strings and the replay of their values
def comp(i, j, th, s0, s1, refs, sl, su):
    """A component `i,j,θ,s0,s1;ref;ref;ref;ref`: (string, VRow, L₋, L₊) with the chords at s0, s1 re-chorded at sl, su."""
    assert 0 <= th <= 1 and len(refs) == 4
    ns = []
    for rs, pot, tnode in refs: assert samePot(*pot, i, j, th), ("potential", rs, pot, (i, j, th)); ns.append(tnode)
    m0, m1 = (s0, tchord(ns[0], ns[1], s0)), (s1, tchord(ns[2], ns[3], s1))
    return (f"{i},{j},{qs(th)},{qs(s0)},{qs(s1)};" + ";".join(rs for rs, _, _ in refs),
            vmix(th, VR[i], VR[j]), tchord(m0, m1, sl), tchord(m0, m1, su))
def mixcomp(th, c0, c1):
    assert 0 <= th <= 1
    return vmix(th, c0[1], c1[1]), lin(1 - th, th, c0[2], c1[2]), lin(1 - th, th, c0[3], c1[3])
def srcrefs(i, s):   # the eight integers of an inherited source reference: pairs (cell, node), a negative cell the zero node
    v = list(map(int, s.split(","))); assert len(v) == 8
    return [refdata(("z", i) if c < 0 else ("s", i, c, n)) for c, n in zip(v[::2], v[1::2])]
def batrefs(bi, s): return [refdata(("b", bi, int(k))) for k in s.split(",")]
envs = [(Q(0), Q(0), EPS * RHO ** 2)] + [(Q(R["ell"]), Q(R["beta"]), 2 * Q(R["beta"]) ** 2 / EPS + Q(R["cap"]) + PAD) for R in rows]
boxes = []; doms = []; kinds = dict(cap=0, one=0, two=0, original=0, choice=0); worst = Q(0)
for bx in cov["boxes"]:
    bb = tuple(Q(v) for v in bx["bounds"]); tl, tu, sl, su, xl, xu = bb; assert tl < tu and 0 <= sl < su and 0 <= xl < xu
    bs = ",".join(qs(v) for v in bb); assert ("original" in bx) != ("choice" in bx)
    if "original" in bx:
        kind, obounds, *refs = inh["boxes"][bx["original"]].split("|"); ob = [Q(v) for v in obounds.split(",")]; kinds["original"] += 1
        if kind == "c":
            i, j, th = refs[0].split(","); i, j, th = int(i), int(j), Q(th); assert 0 <= th <= 1
            a, c = envs[i], envs[j]
            val = quadMax((1 - th) * a[2] + th * c[2] - 2 * (1 - th) * th * (a[1] - c[1]) ** 2 / EPS, -2 * ((1 - th) * a[0] + th * c[0]), Q(1), tl, tu)
            boxes.append(f"c|{bs}|{i},{j},{qs(th)}"); kinds["cap"] += 1
        else:
            s0, s1 = ob[2], ob[3]; assert s0 <= sl < su <= s1
            if kind == "s":
                i, j, th = refs[0].split(","); i, j, th = int(i), int(j), Q(th)
                c0, c1 = comp(i, i, Q(0), s0, s1, srcrefs(i, refs[1]), sl, su), comp(j, j, Q(0), s0, s1, srcrefs(j, refs[2]), sl, su)
                a, Lm, Lp = mixcomp(th, c0, c1); boxes.append(f"m|{bs}|{qs(th)}|{c0[0]}|{c1[0]}"); kinds["two"] += 1
            elif kind == "j":
                bi = int(refs[0]); b = batches[bi]
                c0 = comp(b["i"], b["j"], b["th"], s0, s1, batrefs(bi, refs[1]), sl, su)
                a, Lm, Lp = c0[1:]; boxes.append(f"b|{bs}|{c0[0]}"); kinds["one"] += 1
            else:
                assert kind == "m"
                b0, b1, lam = refs[0].split(","); b0, b1, lam = int(b0), int(b1), Q(lam); B0, B1 = batches[b0], batches[b1]
                c0 = comp(B0["i"], B0["j"], B0["th"], s0, s1, batrefs(b0, refs[1]), sl, su)
                c1 = comp(B1["i"], B1["j"], B1["th"], s0, s1, batrefs(b1, refs[2]), sl, su)
                a, Lm, Lp = mixcomp(lam, c0, c1); boxes.append(f"m|{bs}|{qs(lam)}|{c0[0]}|{c1[0]}"); kinds["two"] += 1
            val = boxVal(a, Lm, Lp, *bb)
    else:
        ch = bx["choice"]; kinds["choice"] += 1
        s0, s1 = (Q(v) for v in ch.get("scale_domain", (sl, su))); assert s0 <= sl < su <= s1
        cs = [comp(*GROUPS[gi], s0, s1, [NODES[k] for k in ri], sl, su) for gi, ri in zip(ch["groups"], ch["refs"])]
        if len(cs) == 1: a, Lm, Lp = cs[0][1:]; boxes.append(f"b|{bs}|{cs[0][0]}"); kinds["one"] += 1
        else:
            assert len(cs) == 2; th = Q(ch["theta"]); a, Lm, Lp = mixcomp(th, cs[0], cs[1])
            boxes.append(f"m|{bs}|{qs(th)}|{cs[0][0]}|{cs[1][0]}"); kinds["two"] += 1
        val = boxVal(a, Lm, Lp, *bb)
    assert val == Q(bx["upper"]) and val <= B, ("box value", bx["bounds"], float(val), float(Q(bx["upper"])))
    worst = max(worst, val); doms.append(bb)

# ----- the partition certificate: guillotine cuts (axis k ∈ {0 (t), 1 (τ), 2 (x)} at `mid`), replayed
DOM = (Q(0), Q(9, 10), Q(0), RHO, Q(0), XMAX)
tokens = []
def cut(dom, ids):
    if len(ids) == 1:
        assert doms[ids[0]] == dom, "leaf"; tokens.append("."); return
    for k in (0, 1, 2):
        cands = sorted(set(doms[i][2 * k + 1] for i in ids if dom[2 * k] < doms[i][2 * k + 1] < dom[2 * k + 1]),
                       key=lambda m: abs(sum(1 for i in ids if doms[i][2 * k + 1] <= m) - len(ids) / 2))
        for mid in cands:
            if any(doms[i][2 * k] < mid < doms[i][2 * k + 1] for i in ids): continue
            Lb = [i for i in ids if doms[i][2 * k + 1] <= mid]; Rb = [i for i in ids if mid <= doms[i][2 * k]]
            if not Lb or not Rb: continue
            a, b = list(dom), list(dom); a[2 * k + 1] = mid; b[2 * k] = mid
            tokens.append(f"{k},{qs(mid)}"); cut(tuple(a), Lb); cut(tuple(b), Rb); return
    raise AssertionError("no guillotine cut")
cut(DOM, list(range(len(doms))))
assert tokens.count(".") == len(doms)

# ----- emit
bt = ",\n".join(f"  ⟨{b['i']}, {b['j']}, {q(b['th'])}, {q(b['smax'])},\n   {lean_str(b['nodes'])},\n   {lean_str(b['vs'])},\n   {'true' if b['spec'] else 'false'},\n   [" +
                ",\n    ".join(lean_str(w) for w in b["wits"]) + "]⟩" for b in batches)
BCH = 500   # boxes per list literal (long list literals exceed the elaborator's recursion depth)
TCH = 1000  # cut tokens per string
bchunks = [boxes[k:k + BCH] for k in range(0, len(boxes), BCH)]
tchunks = [tokens[k:k + TCH] for k in range(0, len(tokens), TCH)]
bdefs = "".join(f"/-- Boxes {k * BCH}–{k * BCH + len(c) - 1} of the cover. -/\ndef coverBoxes{k} : List String :=\n[" +
                ",\n ".join(lean_str(s) for s in c) + "]\n\n" for k, c in enumerate(bchunks))
bdefs += ("/-- The boxes `kind|tl,tu,sl,su,xl,xu|…` of the cover of `[0, 9/10] × [0, ρ] × [0, 31/4]`. -/\ndef coverBoxes : List String :=\n  " +
          " ++ ".join(f"coverBoxes{k}" for k in range(len(bchunks))) + "\n\n")
tdefs = "".join(f"/-- Cut tokens {k * TCH}–{k * TCH + len(c) - 1} of the partition certificate. -/\ndef coverCuts{k} : String :=\n  " +
                lean_str("|".join(c)) + "\n\n" for k, c in enumerate(tchunks))
tdefs += ("/-- The partition certificate of the cover, in preorder: a cut `k,mid` of axis `k` (`0` for `t`, `1` for `τ`, `2` for `x`)\n"
          "at `mid` followed by its two subtrees, or a leaf `.`. -/\ndef coverCuts : List String :=\n  [" +
          ", ".join(f"coverCuts{k}" for k in range(len(tchunks))) + "].flatMap fun s => splitL s \"|\"\n\n")
nnodes = sum(len(b["wits"]) for b in batches); nspec = sum(len(b["wits"]) for b in batches if b["spec"]); nnew = len(batches) - NINH
ncov = sum(1 for b in batches if b["spec"] for w in b["wits"] if Q(w.split("|")[0].split(":")[2].split(",")[4]) > 0)
ms = sorted(meshes); meshdesc = (", ".join(f"{m}-" for m in ms[:-1]) + f" and {ms[-1]}-knot test meshes") if len(ms) > 1 else f"the {ms[0]}-knot test mesh"
text = ("import Grothe.Lower.Boxes\n\n/-!\n# The common-law certificate data (generated by `tools/gen_lower_mixed.py`; do not edit)\n\n"
        f"The {len(batches)} batches of exact node certificates for the mixed potentials ({nnodes} nodes: {NINH} batches with\n"
        f"{nnodes - nspec} Stein nodes, {nnew} batches with {nspec} spectral nodes on {meshdesc}, {ncov} of them\n"
        f"with ν > 0, i.e. using the covariance order) and the\n"
        f"{len(boxes)} boxes of the partition of `[0, 9/10] × [0, ρ] × [0, 31/4]` ({kinds['cap']} cap boxes, {kinds['one']} boxes with one\n"
        f"component, {kinds['two']} boxes mixing two components) with its certificate of {len(tokens) - len(boxes)} axis cuts;\n"
        f"source `{NEW.relative_to(HANDOFF) if NEW.is_relative_to(HANDOFF) else NEW.name}`.\n-/\n\n"
        "namespace Grothe.Lower\n\n"
        "/-- The batches: rows `(i, j)`, weight `θ`, Lipschitz constant, mixed node caps, mesh, kind (spectral or Stein) and witnesses. -/\n"
        "def mixedBatches : List JBatch :=\n[" + bt + "]\n\n" + bdefs + tdefs + "end Grothe.Lower\n")
OUT.write_text(text)
print("ok", json.dumps(dict(source=str(NEW), batches=len(batches), inherited=NINH, nodes=nnodes, spectral_nodes=nspec, covariance_nodes=ncov,
                            meshes=sorted(meshes), boxes=len(boxes), kinds=kinds,
                            cuts=len(tokens) - len(boxes), box_max=float(worst), B=float(B), lower=str(L), slack=str(1 - B * L), bytes=OUT.stat().st_size)))
