#!/usr/bin/env python3
"""Generate the bisection trees certifying `φ² ≤ 99/100` (Grothe/UpperChaos/PhiAbsData*.lean).

φ = D e^{−ε(U+V)} S(U,V,W), D² = UV − W², ε = 21/20, S the phase polynomial of
`data/upper-preprocess/certificate.json` ("phase").  The box U, V ∈ [0, 64], W ∈ [−32, 32] (units 2^−SC,
SC = 16) is first split into 512 cubes of side 8 (splits U V W U V W U V W, `phiSplit`); each cube gets its own
tree (string over U V W = split along that axis, lower half first; L = checked leaf; F = far leaf
U_lo + V_lo ≥ 60; X = empty leaf, min W² > U_hi V_hi).

Leaf test (mirrors `GrotheKernel.leafOK` exactly, integer arithmetic), on a centred box with centre m and
half-widths r: either the corner test (e^{−ε(U+V)} ≤ e^{−ε(U_lo+V_lo)}, |S| ≤ |B|_r) or the first-order test
  B  = Taylor shift of the integer array A0 (A0(2^SC U, …) = L 2^{17 SC} S(U, …)) to the centre;
  P1 = 20·2^SC·B − 21·(y_U + y_V)·B   (S·(1 − ε h_s) scaled by 20·2^SC);
  |e^{−ε h_s} S| ≤ (|P1|_r/(20·2^SC) + |B|_r (a²/2 + 2a³/9)) / (L 2^{17 SC}),  a = ε (r_U + r_V)/2^SC ≤ 1
  (|e^{−t} − 1 + t| ≤ t²/2 + (2/9)|t|³ for |t| ≤ 1, Mathlib `Real.exp_bound` with n = 3);
  UV − W² ≤ min(U_h V_h − minW², m_U m_V − m_W² + m_V r_U + m_U r_V + 2|m_W| r_W + r_U r_V) / 2^{2 SC};
  e^{−x} ≤ (q_n/q_d)^n · 720 den⁶ / Σ_{k≤6} (720/k!) f^k den^{6−k},  x = 21 s/den = n + f/den, s = m_U + m_V.
Usage:
  python3 tools/gen_phi_abs_cover.py search [NPROC]   -> data/phi-abs-cover/trees.json (512 trees; slow)
  python3 tools/gen_phi_abs_cover.py lean             -> Grothe/UpperChaos/PhiCoverData.lean,
                                                         PhiCoverCheck0..7.lean, PhiCoverCheck.lean
The Lean files are reproducible byte for byte from trees.json.
"""
import json, math, sys, time
from fractions import Fraction as Q
from multiprocessing import Pool
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SC = 16; DEG = 17; FAR = 60; ONE = 1 << SC
TN, TD = 99, 100                 # target: φ² ≤ 99/100
QN, QD = 10**9, 2718281828
FACT = [1, 1, 2, 6, 24, 120, 720]
SPLIT = "UVWUVWUVW"

cert = json.load(open(ROOT / "data" / "upper-preprocess" / "certificate.json"))
assert Q(cert["phaseEpsQ"]) == Q(21, 20)
TERMS = [(tuple(t["powers"]), Q(t["coefficient"])) for t in cert["phase"]]
L = 1
for _, c in TERMS:
    L = L * c.denominator // math.gcd(L, c.denominator)
A0 = {}
for (i, j, k), c in TERMS:
    n = c * L
    assert n.denominator == 1 and i + j + k <= DEG
    A0[(i, j, k)] = A0.get((i, j, k), 0) + int(n) * (1 << (SC * (DEG - i - j - k)))
KS = (L * ONE ** DEG) ** 2


def shift(P, axis, m):
    out = {}; lines = {}
    for e, c in P.items():
        lines.setdefault(e[:axis] + e[axis + 1:], {})[e[axis]] = c
    for key, line in lines.items():
        acc = []
        for i in range(max(line), -1, -1):
            new = [0] * (len(acc) + 1)
            for t, a in enumerate(acc):
                new[t] += a * m; new[t + 1] += a
            new[0] += line.get(i, 0); acc = new
        for t, a in enumerate(acc):
            if a:
                e = key[:axis] + (t,) + key[axis:]
                out[e] = out.get(e, 0) + a
    return out


def absr(P, r):
    return sum(abs(c) * r[0] ** e[0] * r[1] ** e[1] * r[2] ** e[2] for e, c in P.items())


def w2lo(Wl, Wh):
    return 0 if Wl <= 0 <= Wh else min(Wl * Wl, Wh * Wh)


def exp_test(M, s, G, Gd):
    den = 10 * ONE
    n = 21 * s // den
    f = 21 * s - den * n
    T = sum((720 // FACT[k]) * f ** k * den ** (6 - k) for k in range(7))
    return s >= 0 and Gd > 0 and TD * M * QN ** n * den ** 6 * 720 * G ** 2 <= TN * ONE ** 2 * QD ** n * T * Gd ** 2 * KS


def leaf_ok(box):
    Ul, Uh, Vl, Vh, Wl, Wh = box
    mU, mV, mW = (Ul + Uh) // 2, (Vl + Vh) // 2, (Wl + Wh) // 2
    if not (Uh - mU == mU - Ul and Vh - mV == mV - Vl and Wh - mW == mW - Wl):
        return False
    rU, rV, rW = mU - Ul, mV - Vl, mW - Wl
    if Ul < 0 or Vl < 0 or rU < 0 or rV < 0 or rW < 0:
        return False
    B = shift(shift(shift(A0, 0, mU), 1, mV), 2, mW)
    M = max(0, min(Uh * Vh - w2lo(Wl, Wh),
                   mU * mV - mW * mW + mV * rU + mU * rV + 2 * abs(mW) * rW + rU * rV))
    Sn = absr(B, (rU, rV, rW))
    # corner test: e^{-ε(U+V)} ≤ e^{-ε(Ul+Vl)}, |S| ≤ |B|_r
    if exp_test(M, Ul + Vl, Sn, 1):
        return True
    rs = rU + rV
    if not 21 * rs <= 20 * ONE:
        return False
    P1 = {e: 20 * ONE * c for e, c in B.items()}
    for (i, j, k), c in B.items():
        for e in ((i + 1, j, k), (i, j + 1, k)):
            P1[e] = P1.get(e, 0) - 21 * c
    Pn = absr(P1, (rU, rV, rW))
    Gn = 18 * (20 * ONE) ** 2 * Pn + Sn * (180 * ONE * (21 * rs) ** 2 + 4 * (21 * rs) ** 3)
    Gd = 18 * (20 * ONE) ** 3
    return exp_test(M, mU + mV, Gn, Gd)


def build(box, out, stats):
    Ul, Uh, Vl, Vh, Wl, Wh = box
    if Ul + Vl >= FAR * ONE:
        out.append("F"); return
    if 0 <= Ul and 0 <= Vl and Uh * Vh < w2lo(Wl, Wh):
        out.append("X"); return
    if leaf_ok(box):
        out.append("L"); stats[0] += 1; return
    w = [Uh - Ul, Vh - Vl, Wh - Wl]
    ax = max(range(3), key=lambda i: w[i])
    lo, hi = box[2 * ax], box[2 * ax + 1]
    assert hi - lo >= 2, "too deep"
    mid = (lo + hi) // 2
    out.append("UVW"[ax])
    b1 = list(box); b1[2 * ax + 1] = mid
    b2 = list(box); b2[2 * ax] = mid
    build(tuple(b1), out, stats); build(tuple(b2), out, stats)


def split_box(b, c):
    ax = "UVW".index(c); mid = (b[2 * ax] + b[2 * ax + 1]) // 2
    b1 = list(b); b1[2 * ax + 1] = mid; b2 = list(b); b2[2 * ax] = mid
    return tuple(b1), tuple(b2)


def split_all(cs, b):
    if not cs:
        return [b]
    l, r = split_box(b, cs[0])
    return split_all(cs[1:], l) + split_all(cs[1:], r)


def run(box):
    sys.setrecursionlimit(100000)
    out = []; stats = [0]; t = time.time()
    build(box, out, stats)
    return "".join(out), stats[0], time.time() - t


NMOD = 8
NCUBE = 2 ** len(SPLIT)


def write_lean(data):
    trees, leaves = data["trees"], data["leaves"]
    assert len(trees) == NCUBE
    out = ROOT / "Grothe" / "UpperChaos"
    # data
    L = ["/-! Generated by `tools/gen_phi_abs_cover.py lean` from `data/phi-abs-cover/trees.json`:",
         f"the bisection trees of the {NCUBE} cubes of the phase cover (`U V W` split, `L` checked leaf,",
         "`F` far leaf, `X` empty leaf). -/", "", "namespace Grothe.UpperChaos", ""]
    for i, t in enumerate(trees):
        L.append(f"/-- Cube {i} ({leaves[i]} checked leaves). -/")
        L.append(f"def phiTree{i:03d} : String :=")
        for j in range(0, len(t), 96):
            L.append(('  "' if j == 0 else '  ++ "') + t[j:j + 96] + '"')
        if not t:
            L.append('  ""')
        L.append("")
    L.append(f"/-- The trees of the {NCUBE} cubes, in the order of `GrotheKernel.splitAll GrotheKernel.phiSplit`. -/")
    L.append("def phiTrees : List String := [" + ", ".join(f"phiTree{i:03d}" for i in range(NCUBE)) + "]")
    L += ["", "end Grothe.UpperChaos", ""]
    (out / "PhiCoverData.lean").write_text("\n".join(L))
    # ranges: contiguous, at most ~tot/NMOD leaves each (a heavier cube stays alone)
    tot = sum(leaves); target = tot / NMOD; bounds = [0]; acc = 0
    for i, l in enumerate(leaves):
        if acc > 0 and acc + l > target:
            bounds.append(i); acc = 0
        acc += l
    bounds.append(NCUBE)
    ranges = list(zip(bounds[:-1], bounds[1:]))
    for j, (lo, hi) in enumerate(ranges):
        n = sum(leaves[lo:hi])
        (out / f"PhiCoverCheck{j}.lean").write_text("\n".join([
            "import GrotheKernel.PhiCheck", "import Grothe.UpperChaos.PhiCoverData", "import Grothe.Upper.Data", "",
            f"/-! Generated by `tools/gen_phi_abs_cover.py lean`: cubes {lo}–{hi - 1} of the phase cover ({n} checked",
            "leaves; one single-threaded `native_decide`). -/", "", "namespace Grothe.UpperChaos", "",
            f"/-- **The phase cover on the cubes {lo}–{hi - 1}.** -/",
            f"theorem phi_cover_check_{j} : GrotheKernel.phiRangeOK Grothe.Upper.phaseStrs phiTrees {lo} {hi} = true := by",
            "  native_decide", "", "end Grothe.UpperChaos", ""]))
    C = ["import Grothe.UpperChaos.PhiCover"] + [f"import Grothe.UpperChaos.PhiCoverCheck{j}" for j in range(len(ranges))]
    C += ["", "/-! Generated by `tools/gen_phi_abs_cover.py lean`: the range checks combined. -/", "",
          "open GrotheKernel", "", "namespace Grothe.UpperChaos", "",
          f"/-- **The phase cover**: admissible data, the far field and all {NCUBE} cubes pass. -/",
          "theorem phi_cubes_ok :",
          "    termsOK (Grothe.Upper.phaseStrs.map parseTerm) = true ∧ farOK (Grothe.Upper.phaseStrs.map parseTerm) = true ∧",
          f"      ∀ i, i < {NCUBE} → phiCubeOK (commonDen (Grothe.Upper.phaseStrs.map parseTerm))",
          "        (denseA0 (Grothe.Upper.phaseStrs.map parseTerm)) phiTrees i = true := by"]
    for j in range(len(ranges)):
        C.append(f"  have h{j} := phiRangeOK_cube phi_cover_check_{j}")
    C.append("  refine ⟨h0.1, h0.2.1, fun i hi => ?_⟩")
    for j, (lo, hi) in enumerate(ranges[:-1]):
        C.append(f"  {'' if j == 0 else ''}by_cases c{j} : i < {hi}")
        C.append(f"  · exact h{j}.2.2 i (by omega) c{j}")
    j = len(ranges) - 1
    C.append(f"  exact h{j}.2.2 i (by omega) hi")
    C += ["", "end Grothe.UpperChaos", ""]
    (out / "PhiCoverCheck.lean").write_text("\n".join(C))
    print("ranges", ranges, [sum(leaves[a:b]) for a, b in ranges])


if __name__ == "__main__":
    mode = sys.argv[1] if len(sys.argv) > 1 else "search"
    outdir = ROOT / "data" / "phi-abs-cover"
    if mode == "lean":
        write_lean(json.load(open(outdir / "trees.json")))
        sys.exit(0)
    nproc = int(sys.argv[2]) if len(sys.argv) > 2 else 6
    root = (0, 64 * ONE, 0, 64 * ONE, -32 * ONE, 32 * ONE)
    subs = split_all(SPLIT, root)
    with Pool(nproc) as p:
        res = p.map(run, subs, chunksize=1)
    trees = [r[0] for r in res]
    leaves = [r[1] for r in res]
    outdir.mkdir(parents=True, exist_ok=True)
    json.dump({"target": f"{TN}/{TD}", "split": SPLIT, "leaves": leaves, "trees": trees},
              open(outdir / "trees.json", "w"), indent=0)
    print("leaves per cube", leaves)
    print("total checked leaves", sum(leaves), "tree chars", sum(map(len, trees)),
          "max cube seconds", max(r[2] for r in res))
