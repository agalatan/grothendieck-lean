#!/usr/bin/env python3
"""Generate the common-law (mixed) certificate data module (exact rationals only):

  Grothe/Lower/MixedData.lean   the batches of exact node certificates for the mixed potentials
                                (`mixedBatches`), the boxes of the cover of [0, 9/10] × [0, ρ] × [0, 31/4]
                                (`coverBoxes`) and its partition certificate (`coverCuts`), as strings
                                parsed at check time (`parseWit`, `parseSWit`, `parseBox`, `parseTree` in
                                Mixed.lean/Boxes.lean)

Usage: tools/gen_lower_mixed.py [CERT_DIR]   (default handoff/lower-stein/cert-finemesh/certificate, the certificate on master)

CERT_DIR holds the cover (`improved_cover.json` with `regions`, or `joint_cover_certificate.json` with one
`domain`) and the batch files it references by hash (`joint_batches`): Stein batches (witnesses with a bank
of cut vectors and multipliers) and spectral batches (`cut_family` = `separate_spectral_nu_zero` or
`separate_spectral_covariance`: one spectral cut `(λ, μ, t, β, ν, φ)` per witness on the batch's own test
mesh, whose knots must be rational squares; the format of `verify_spectral_batch.py`).  The source rows are
`handoff/lower-stein/cert-0745e/` (or `cert-0745d/`, `cert-0745c/`, whichever the cover pins by the hash of
its manifest; every file of the manifest and the exact row constants are hash-checked), and they are
cross-checked field by field against the committed `RowData*.lean` (so that the node references index the
same Stein nodes); row indices refer to `rowData` (rows sorted by their nominal `t`).

Cover cells: source (two rows `i, j` with weight `θ`, node references `(cell, node)` per row, `(-1, -1)` the
zero node), `joint` (a batch, witness indices) and `joint_mix` (two batches mixed with weight `λ` before the
gate completion).  Only the batches some cell references are emitted (indices remapped).  Every cell becomes
a box with one component (`b|…`) or two mixed components (`m|…`); outside the central slab the scalar
envelope of `envelope.json` gives cap boxes (`c|…`, maximal runs of cells with the same mixture).  Every box
value is replayed here with the Lean semantics (virtual rows, pinned gate price, chords in τ, `x` endpoints,
quadratic maxima, one pad) and compared with the stored bound and the cap, and a guillotine partition
certificate (axis cuts, replayed) is produced for the boxes.
"""
import hashlib
import json
import os
import re
import sys
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

sys.setrecursionlimit(100000)
ROOT = Path(__file__).resolve().parent.parent
HANDOFF = Path(os.environ.get("GROTHE_HANDOFF", ROOT / "handoff"))   # the (git-ignored) data folder; set it when running from a worktree
# the pinned source rows: whichever per-row certificate the cover pins by its manifest hash
SOURCES = [(HANDOFF / "lower-stein" / "cert-0745e", HANDOFF / "lower-stein" / "cert-0745e" / "rows_final_e.json"),
           (HANDOFF / "lower-stein" / "cert-0745d", HANDOFF / "lower-stein" / "cert-0745d" / "rows_final_d.json"),
           (HANDOFF / "lower-stein" / "cert-0745c", HANDOFF / "lower-stein" / "cert-0745c" / "rows_final_c.json")]
NEW = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else HANDOFF / "lower-stein" / "cert-finemesh" / "certificate"
OUT = ROOT / "Grothe" / "Lower" / "MixedData.lean"
EPS = Q(149, 200); RHO = Q(973612157, 10**9); C6 = Q(4045313, 100000); PAD = Q(1, 10**11); XMAX = Q(31, 4)

def qs(x):
    x = Q(x); return f"{x.numerator}/{x.denominator}" if x.denominator != 1 else f"{x.numerator}"
def q(x):
    x = Q(x); return f"({x.numerator} : ℚ) / {x.denominator}" if x.denominator != 1 else f"({x.numerator} : ℚ)"
def rsqrt(x):
    x = Q(x); a, b = isqrt(x.numerator), isqrt(x.denominator); assert a * a == x.numerator and b * b == x.denominator, x; return Q(a, b)
def lean_str(s): return '"' + s + '"'
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()
def mpoly(yjson):  # JSON order y0,y1,y2,y3,y4 -> MPoly order a0,a1,a2,a4,a6 = y0,y4,y1,y2,y3
    y = [Q(v) for v in yjson]; assert len(y) == 5; return (y[0], y[4], y[1], y[2], y[3])

# ----- the cover and the pinned source rows (hashes of the manifest, every file of it, the row constants)
cover_file = next(f for f in ("improved_cover.json", "joint_cover_certificate.json") if (NEW / f).exists())
cov = json.load(open(NEW / cover_file))
CERT, ROWS_FILE = next((c, r) for c, r in SOURCES if sha(c / "manifest.json") == cov["source_manifest_sha256"])
assert sha(ROWS_FILE) == cov["source_rows_sha256"]
if "source_verifier_sha256" in cov and (HANDOFF / "lower-stein" / "verify_cert.py").exists():
    assert sha(HANDOFF / "lower-stein" / "verify_cert.py") == cov["source_verifier_sha256"]
man = json.load(open(CERT / "manifest.json")); assert Q(man["eps"]) == EPS
for fn, h in man["files"].items(): assert sha(CERT / fn) == h, fn
B = Q(cov["target"]); L = Q(cov["endpoint"]); assert B > 0 and L > 0 and B * L < 1
consts = json.load(open(ROWS_FILE))
rowfiles = sorted((f for f in man["files"] if f.startswith("row_")), key=lambda f: Q(json.load(open(CERT / f))["t"]))
rows = []   # the rows in the schema of the committed data: header, gate, table (x, y), mesh (in v), cells with nodes (σ, P)
for f in rowfiles:
    R = json.load(open(CERT / f)); th = [Q(v) for v in R["theta"]]; ell, beta, delta = th[13], th[14], th[9]
    K = consts[R["name"]]; assert Q(K["ell"]) == ell and Q(K["beta"]) == beta
    cap_exact = Q(K["C"]) - PAD - 2 * beta * beta / EPS
    cap = Q(-((-cap_exact.numerator * 10**15) // cap_exact.denominator), 10**15)   # rounded up, as in gen_lower_data.py
    assert all(isinstance(v, str) for v in R["nodes"] + R["caps"])
    mesh = [Q(v) for v in R["mesh"]]; assert not mesh or mesh[0] == 0
    rows.append(dict(name=R["name"], ell=ell, beta=beta, delta=delta, kappa=Q(R["kappa"]), smax=Q(R["smax"]), cap=cap,
                     E=th[0:6], b=th[10:13], table=[(Q(x), Q(y)) for x, y in zip(R["nodes"], R["caps"])], mesh=[rsqrt(t) for t in mesh],
                     cells=[dict(x=[Q(v) for v in c["x"]], nodes=[dict(tau=Q(n["sigma"]), P=mpoly(n["y"])) for n in c.get("nodes", [])])
                            for c in R["cells"]]))
index = {R["name"]: k for k, R in enumerate(rows)}
for n in cov["rows"]: assert n in index

# ----- the rows: cross-check against the committed RowData modules (field by field, exact)
NUM = re.compile(r"\((-?\d+) : ℚ\)(?: / (\d+))?")
for k, R in enumerate(rows):
    text = (ROOT / "Grothe" / "Lower" / f"RowData{k + 1:02d}.lean").read_text()
    assert f"`{R['name']}`" in text, ("row name", k)
    nums = [Q(int(a), int(b) if b else 1) for a, b in NUM.findall(text)]
    assert nums[:6] == [R[f] for f in ("ell", "beta", "delta", "kappa", "smax", "cap")], ("row header", k)
    assert nums[6:12] == R["E"] and nums[12:15] == R["b"], ("row gate", k)
    strs = re.findall(r'"([^"]*)"', text)
    assert [(Q(a), Q(b)) for a, b in (s.split(":") for s in strs[0].split(";"))] == R["table"], ("row table", k)
    assert [Q(v) for v in strs[1].split(",") if v] == R["mesh"][1:] and (not R["mesh"] or R["mesh"][0] == 0), ("row mesh", k)
    cells = strs[2:]; assert len(cells) == len(R["cells"]), ("row cells", k)
    for cl, cj in zip(cells, R["cells"]):
        xlo, xhi, _, _, nodes = cl.split("|")
        assert [Q(xlo), Q(xhi)] == cj["x"]
        ln = [(Q(s.split(":")[0]), tuple(Q(v) for v in s.split(":")[1].split(","))) for s in nodes.split(";")] if nodes else []
        assert ln == [(n["tau"], n["P"]) for n in cj["nodes"]], ("row nodes", k)

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
    E = R["E"]; d = R["delta"]; b = R["b"]
    return (R["ell"], R["beta"], d, (E[0] - (EPS - d), E[1], E[2], E[3], E[4], E[5]), d * b[0], d * b[1], d * b[2])
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
def rowTable(R): return [x for x, y in R["table"]], [y for x, y in R["table"]], R["smax"], R["delta"]
def rowTNode(R, ref):   # the zero node or a Stein node rescaled to τ = σ/δ
    xs, ys, _, d = rowTable(R)
    if ref is None: assert xs[0] == 0; return (Q(0), (ys[0], Q(0), Q(0), Q(0), Q(0)))
    ci, ni = ref; n = R["cells"][ci]["nodes"][ni]; return (n["tau"] / d, n["P"])
def samePot(a, b, al, c, d, ga):
    return (a == c and b == d and al == ga) or (al == 0 and ga == 0 and a == c) or (al == 1 and ga == 1 and b == d)
VR = [vrow(R) for R in rows]
for R, a in zip(rows, VR): assert R["kappa"] * a[2] * a[2] <= vprice(a), ("row price", R["name"])

# ----- the batches referenced by the cover (hash-pinned files; Stein witnesses or spectral witnesses)
regions_json = cov["regions"] if "regions" in cov else [dict(domain=cov["domain"], cells=cov["cells"])]
used = set()
for reg in regions_json:
    for cell in reg["cells"]:
        if cell.get("kind") == "joint": used.add(cell["batch"])
        elif cell.get("kind") == "joint_mix": used.update(cell["batches"])
batches = []; bmap = {}; meshes = {}; NALL = 0
for bk, bref in enumerate(cov["joint_batches"]):
    p = (NEW / bref["file"]).resolve(); assert p.is_relative_to(NEW) and sha(p) == bref["sha256"], bref["file"]
    b = json.load(open(p)); NALL += len(b["witnesses"])
    assert b["source_manifest_sha256"] == cov["source_manifest_sha256"]
    if bk not in used: continue
    names = b["rows"]; w = [Q(v) for v in b["weights"]]; assert len(names) == 2 and w[0] + w[1] == 1 and min(w) >= 0
    i, j, th = index[names[0]], index[names[1]], w[1]; Ri, Rj = rows[i], rows[j]
    (xi, yi, si, di), (xj, yj, sj, dj) = rowTable(Ri), rowTable(Rj)
    # the mixed table: the mixed interpolants at the union of the rescaled abscissae, the mixed Lipschitz constant
    xs = sorted(set([x / di for x in xi] + [x / dj for x in xj]))
    ys = [(1 - th) * capAt(xi, yi, si, di * x) + th * capAt(xj, yj, sj, dj * x) for x in xs]
    smax = (1 - th) * di * si + th * dj * sj
    assert xs == [Q(v) for v in b["nodes"]] and ys == [Q(v) for v in b["caps"]] and smax == Q(b["smax"]), ("mixed table", bref["file"])
    mesh = [Q(v) for v in b["mesh"]]; assert mesh[0] == 0 and all(u < v for u, v in zip(mesh, mesh[1:]))
    vs = [rsqrt(t) for t in mesh[1:]]   # the knots must be rational squares (breakpoints in v = √u)
    spec = b.get("cut_family") in ("separate_spectral_nu_zero", "separate_spectral_covariance"); assert spec or "cut_family" not in b
    wits = []; tn = []
    for wit in b["witnesses"]:
        P = mpoly(wit["y"]); assert P[1] >= 0 and P[4] >= 0; tau = Q(wit["tau"]); assert tau > 0
        ys_ = ",".join(qs(v) for v in P)
        if spec:
            # one spectral cut: a = -1/2, λ, μ > 0, ν ≥ 0 (ν = 0 for the family without the covariance order), the test
            # on the batch mesh vanishing at its last knot
            c = wit["cut"]; assert [Q(v) for v in c["mesh"]] == mesh and Q(c["a"]) == Q(-1, 2)
            lam, mu_, t, be, nu = (Q(c[k]) for k in ("lam", "mu", "t", "beta", "nu"))
            assert lam > 0 and mu_ > 0 and nu >= 0 and (nu == 0 or b["cut_family"] == "separate_spectral_covariance")
            phi = [Q(v) for v in c["phi_values"]]; assert len(phi) == len(mesh) and phi[-1] == 0
            wits.append(f"{qs(tau)}:{ys_}:{qs(lam)},{qs(mu_)},{qs(t)},{qs(be)},{qs(nu)}|" + ",".join(qs(v) for v in phi[:-1]))
        else:
            mu = [Q(v) * 10**10 for v in wit["mu"]]; assert all(m.denominator == 1 and m >= 0 for m in mu)
            bank = []
            for z in wit["bank"]:
                zz = [Q(v) * 10**8 for v in z]; assert all(v.denominator == 1 for v in zz) and len(zz) == len(mesh) + 1
                bank.append(",".join(str(v.numerator) for v in zz))
            assert len(mu) == len(bank)
            wits.append(f"{qs(tau)}:{ys_}:" + ",".join(str(m.numerator) for m in mu) + "|" + ";".join(bank))
        tn.append((tau, P))
    assert all(u[0] < v[0] for u, v in zip(tn, tn[1:]))
    if spec: meshes[len(mesh)] = meshes.get(len(mesh), 0) + len(wits)
    bmap[bk] = len(batches)
    batches.append(dict(i=i, j=j, th=th, smax=smax, nodes=";".join(f"{qs(x)}:{qs(y)}" for x, y in zip(xs, ys)),
                        vs=",".join(qs(v) for v in vs), spec=spec, wits=wits, tnodes=tn, file=bref["file"]))

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
def srcref(i, cn):   # a node reference `(cell, node)` of row `i`, a negative cell the zero node: (string, potential, τ-node)
    c, n = cn
    if c < 0: return f"z,{i}", (i, i, Q(0)), rowTNode(rows[i], None)
    return f"s,{i},{c},{n}", (i, i, Q(0)), rowTNode(rows[i], (c, n))
def batref(bk, k):
    bi = bmap[bk]; b = batches[bi]; return f"b,{bi},{k}", (b["i"], b["j"], b["th"]), b["tnodes"][k]
def batcomp(bk, refs, sl, su):   # refs = [[k0, k1], [k2, k3]]
    b = batches[bmap[bk]]; (k0, k1), (k2, k3) = refs
    return comp(b["i"], b["j"], b["th"], sl, su, [batref(bk, k) for k in (k0, k1, k2, k3)], sl, su)
boxes = []; doms = []; kinds = dict(cap=0, one=0, two=0, source=0, joint=0, joint_mix=0); worst = Q(0)
for reg in regions_json:
    d = tuple(Q(v) for v in reg["domain"]); assert d[2:] == (0, RHO, 0, XMAX) and 0 <= d[0] < d[1] <= Q(9, 10)
regions_json.sort(key=lambda r: Q(r["domain"][0]))
SLAB = (Q(regions_json[0]["domain"][0]), Q(regions_json[-1]["domain"][1]))
for a, b in zip(regions_json, regions_json[1:]): assert Q(a["domain"][1]) == Q(b["domain"][0])
for reg in regions_json:
    dom = tuple(Q(v) for v in reg["domain"])
    for cell in reg["cells"]:
        bb = tuple(Q(v) for v in cell["box"]); tl, tu, sl, su, xl, xu = bb
        assert dom[0] <= tl < tu <= dom[1] and 0 <= sl < su <= RHO and 0 <= xl < xu <= XMAX
        bs = ",".join(qs(v) for v in bb)
        if cell.get("kind") == "joint":
            c0 = batcomp(cell["batch"], cell["joint_refs"], sl, su); a, Lm, Lp = c0[1:]
            boxes.append(f"b|{bs}|{c0[0]}"); kinds["one"] += 1; kinds["joint"] += 1
        elif cell.get("kind") == "joint_mix":
            b0, b1 = cell["batches"]; lam = Q(cell["mix"]); r0, r1 = cell["refs"]
            c0, c1 = batcomp(b0, r0, sl, su), batcomp(b1, r1, sl, su); a, Lm, Lp = mixcomp(lam, c0, c1)
            boxes.append(f"m|{bs}|{qs(lam)}|{c0[0]}|{c1[0]}"); kinds["two"] += 1; kinds["joint_mix"] += 1
        else:
            assert "kind" not in cell
            i, j, th = index[cell["i"]], index[cell["j"]], Q(cell["theta"]); pi, pj = cell["points"]
            c0 = comp(i, i, Q(0), sl, su, [srcref(i, cn) for pr in pi for cn in pr], sl, su)
            c1 = comp(j, j, Q(0), sl, su, [srcref(j, cn) for pr in pj for cn in pr], sl, su)
            a, Lm, Lp = mixcomp(th, c0, c1)
            boxes.append(f"m|{bs}|{qs(th)}|{c0[0]}|{c1[0]}"); kinds["two"] += 1; kinds["source"] += 1
        val = boxVal(a, Lm, Lp, *bb)
        assert val == Q(cell["bound"]) and val <= B, ("box value", cell["box"], float(val), float(Q(cell["bound"])))
        worst = max(worst, val); doms.append(bb)
slab_max = worst

# ----- the cap boxes outside the slab (the scalar envelope, Lean semantics): maximal runs of envelope cells with the
# same mixture, cut at the slab ends; scalar row 0 is the crude row `(0, 0, ερ²)`, row k+1 the certified row k
env = json.load(open(CERT / "envelope.json")); step = Q(env["step"])
assert len(env["cells"]) * step == Q(9, 10)
envs = {"crude": (0, Q(0), Q(0), EPS * RHO ** 2)}
for k, R in enumerate(rows): envs[R["name"]] = (k + 1, R["ell"], R["beta"], 2 * R["beta"] ** 2 / EPS + R["cap"] + PAD)
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
    (ka, la, ba, Ca), (kb, lb, bb_, Cb) = envs[i], envs[j]; assert 0 <= th <= 1
    val = quadMax((1 - th) * Ca + th * Cb - 2 * (1 - th) * th * (ba - bb_) ** 2 / EPS, -2 * ((1 - th) * la + th * lb), Q(1), lo, hi)
    assert val <= B, ("cap box", lo, hi); outer = max(outer, val); worst = max(worst, val)
    boxes.append(f"c|{qs(lo)},{qs(hi)},0,{qs(RHO)},0,{qs(XMAX)}|{ka},{kb},{qs(th)}"); kinds["cap"] += 1
    doms.append((lo, hi, Q(0), RHO, Q(0), XMAX))

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
nnodes = sum(len(b["wits"]) for b in batches); nspec = sum(len(b["wits"]) for b in batches if b["spec"])
nsb = sum(1 for b in batches if b["spec"]); nstein = len(batches) - nsb
ncov = sum(1 for b in batches if b["spec"] for w in b["wits"] if Q(w.split("|")[0].split(":")[2].split(",")[4]) > 0)
ms = sorted(meshes); meshdesc = (", ".join(f"{m}-" for m in ms[:-1]) + f" and {ms[-1]}-knot test meshes") if len(ms) > 1 else f"the {ms[0]}-knot test mesh"
src = NEW.relative_to(HANDOFF) if NEW.is_relative_to(HANDOFF) else NEW.name
text = ("import Grothe.Lower.Boxes\n\n/-!\n# The common-law certificate data (generated by `tools/gen_lower_mixed.py`; do not edit)\n\n"
        f"The {len(batches)} batches of exact node certificates for the mixed potentials ({nnodes} nodes: {nstein} batches with\n"
        f"{nnodes - nspec} Stein nodes, {nsb} batches with {nspec} spectral nodes on {meshdesc}, {ncov} of them\n"
        f"with ν > 0, i.e. using the covariance order; the batches of the source package that no box references are omitted) and the\n"
        f"{len(boxes)} boxes of the partition of `[0, 9/10] × [0, ρ] × [0, 31/4]` ({kinds['cap']} cap boxes outside the central slab\n"
        f"`[{SLAB[0]}, {SLAB[1]}]`, {kinds['one']} boxes with one component, {kinds['two']} boxes mixing two components) with its\n"
        f"certificate of {len(tokens) - len(boxes)} axis cuts; source `{src}`.\n-/\n\n"
        "namespace Grothe.Lower\n\n"
        "/-- The batches: rows `(i, j)`, weight `θ`, Lipschitz constant, mixed node caps, mesh, kind (spectral or Stein) and witnesses. -/\n"
        "def mixedBatches : List JBatch :=\n[" + bt + "]\n\n" + bdefs + tdefs + "end Grothe.Lower\n")
OUT.write_text(text)
print("ok", json.dumps(dict(source=str(NEW), batches=len(batches), batches_in_package=len(cov["joint_batches"]), nodes=nnodes, nodes_in_package=NALL,
                            stein_batches=nstein, spectral_batches=nsb, spectral_nodes=nspec, covariance_nodes=ncov, spectral_meshes=meshes,
                            boxes=len(boxes), kinds=kinds, cuts=len(tokens) - len(boxes), slab=[str(SLAB[0]), str(SLAB[1])],
                            slab_max=float(slab_max), outer_max=float(outer), B=str(B), lower=str(L), slack=str(1 - B * L), bytes=OUT.stat().st_size)))
