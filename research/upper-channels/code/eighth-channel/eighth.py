#!/usr/bin/env python3
"""An eighth channel for the seven-channel upper certificate of master (issue #723).

Reads the columns of columns.py and builds copies of the eighteen-channel branch's cell channel with
R = [a, -(1-a)] on demand (exact 2^-128 interval composition of the Lean-verified grades, as in mixture_real.py).
For each set of columns: a float LP over the weights (HiGHS), then the EXACT value at the weights rounded to 10^-12
    D = H0_lo - sum_{1<=k<=320} max|H_k interval| - sum_p w_p a_p
with the exact head intervals and exact allowances (the same evaluation as verify.fixed_lower of the angular-selector
note).  The LP optimum is label N; the value at the printed weights is exact given the inputs, and every input is
rigorous except the allowance of a new cell copy, whose circle budget 2 at radius 109/100 rests on a float Schur mean
(ledger 4.4: 1.18 at a = 93079/100000; a Lean contour fact would be needed).
Agent-ID: claude-b9ee (worker).
Usage: eighth.py SOURCES COLUMNS.json OUT.json"""
import json
import sys
from fractions import Fraction as Q
from pathlib import Path

import numpy as np
from scipy.optimize import linprog, minimize_scalar

HERE = Path(__file__).resolve().parent
CODE = HERE.parent
SRC = Path(sys.argv[1]).resolve()
sys.path.insert(0, str(SRC / "src18" / "tools"))
sys.path.insert(0, str(CODE))
import replay_private_upper_budget as rp  # noqa: E402
from cmp_grades import lean_grades  # noqa: E402

MAXK = 320
D128 = 1 << 128
DEN = 10 ** 12
MASTER = Q(711968565817136711740669035, 10 ** 27)
MASTER_BOUND = Q(1404556392, 10 ** 9)
LEAN_SELECTOR_BUDGET = Q(162464451464, 10 ** 15)
MASTER_W = [Q(n, DEN) for n in (855319787049, 87572726557, 156179458, 116127273, 56396941183, 351079163, 87159317)]
SEVEN = ["six_0", "six_1", "six_2", "six_3", "six_4", "six_5", "sel_d1"]

raw = json.loads(Path(sys.argv[2]).read_text())
COL = {}
for name, c in raw.items():
    head = [(Q(lo), Q(hi)) for lo, hi in c["head"]]
    COL[name] = dict(head=head, allow=Q(c["allowance"]), label=c.get("name", name))

G = lean_grades(SRC / "src18")
NEW_ALLOW = rp.hardy_ceiling(Q(109, 100), Q(2), 126) + rp.hardy_ceiling(Q(109, 100), Q(2), 251)


def cell(a):
    a = Q(a)
    name = f"cell({a})"
    if name not in COL:
        ch = rp.compose(126, [a, a - 1], G)
        COL[name] = dict(head=[(Q(lo, D128), Q(hi, D128)) for lo, hi in ch], allow=NEW_ALLOW, label=name)
    return name


Gf = [(lo + hi) / 2 / D128 for lo, hi in G]


def cell_float(a):
    """Float composition of the cell copy (for scans only)."""
    P = np.array([float(a), float(a) - 1]); Y = np.concatenate([[0.0], np.convolve(P, P)])
    acc = np.zeros(0)
    for c in Gf[::-1]:
        t = np.convolve(Y, acc)[:126] if len(acc) else np.zeros(0)
        acc = np.zeros(max(len(t), 1)); acc[:len(t)] = t; acc[0] += c
    h = np.convolve(P, acc)[:126]; out = np.zeros(MAXK + 1); out[:len(h)] = h
    return out


def fvec(name):
    v = np.zeros(MAXK + 1)
    for k, (lo, hi) in enumerate(COL[name]["head"][:MAXK + 1]):
        v[k] = float((lo + hi) / 2)
    return v


def solve(Hm, av, scale=1e6):
    """max_w  H0.w - sum_k |H_k.w| - a.w  over the simplex (float, HiGHS dual simplex)."""
    n = len(av); K = MAXK
    obj = -np.concatenate([Hm[:, 0] - av, -np.ones(2 * K) / scale])
    Aeq = np.zeros((K + 1, n + 2 * K))
    Aeq[:K, :n] = Hm[:, 1:].T * scale; Aeq[:K, n:n + K] = -np.eye(K); Aeq[:K, n + K:] = np.eye(K); Aeq[K, :n] = 1
    beq = np.zeros(K + 1); beq[K] = 1
    r = linprog(obj, A_eq=Aeq, b_eq=beq, bounds=(0, None), method="highs-ds",
                options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10, presolve=False))
    assert r.status == 0, r.message
    w = r.x[:n]; Hk = Hm.T @ w
    return w, float(Hk[0] - np.abs(Hk[1:]).sum() - av @ w)


def exact_value(names, weights, allow=None):
    """verify.fixed_lower with the allowances of COL (or the override dict)."""
    allow = allow or {}
    lin = sum(w * COL[n]["head"][0][0] for n, w in zip(names, weights))
    non = Q(0)
    for k in range(1, MAXK + 1):
        lo = hi = Q(0)
        for n, w in zip(names, weights):
            h = COL[n]["head"]
            if k < len(h) and w:
                lo += w * h[k][0]; hi += w * h[k][1]
        non += max(abs(lo), abs(hi))
    al = sum(w * allow.get(n, COL[n]["allow"]) for n, w in zip(names, weights))
    return lin - non - al, lin, non, al


def rounded(w):
    wq = [Q(round(max(x, 0.0) * DEN), DEN) for x in w]
    j = max(range(len(wq)), key=lambda i: wq[i]); wq[j] += 1 - sum(wq)
    return wq


def fmt(q, n=13):
    return f"{float(q):.{n}f}" if abs(q) > 1e-3 else f"{float(q):.4e}"


OUT = {}


def run(label, names, allow=None, note=None):
    Hm = np.array([fvec(n) for n in names]); av = np.array([float((allow or {}).get(n, COL[n]["allow"])) for n in names])
    w, Df = solve(Hm, av)
    wq = rounded(w)
    Dx, lin, non, al = exact_value(names, wq, allow)
    gain = 1 / MASTER - 1 / Dx
    hk = Hm.T @ np.array([float(x) for x in wq])
    top = sorted(range(1, MAXK + 1), key=lambda k: -abs(hk[k]))[:5]
    rec = dict(columns=names, D_float_LP=Df, D_exact_at_weights=str(Dx), D=float(Dx), invD=float(1 / Dx),
               gain_in_invD_over_master=float(gain), H0_lo=float(lin), nonlinear_hi=float(non), weighted_allowances=float(al),
               weights_over_1e12={n: int(x * DEN) for n, x in zip(names, wq)},
               zero_weight=[n for n, x in zip(names, wq) if x == 0], largest_Hk={k: float(hk[k]) for k in top})
    if note:
        rec["note"] = note
    OUT[label] = rec
    print(f"\n== {label}\n   D = {fmt(Dx, 15)}  1/D = {float(1 / Dx):.12f}  gain over 1.404556392 (exact master slope): "
          f"{float(gain):.3e}   [float LP {Df:.15f}]")
    print(f"   H0 >= {fmt(lin, 15)}, nonlinear <= {float(non):.6e}, allowances {float(al):.6e}; largest H_k: "
          + ", ".join(f"{k}: {hk[k]:.2e}" for k in top))
    print("   weights/1e12: " + ", ".join(f"{n}={int(x * DEN)}" for n, x in zip(names, wq) if x)
          + ("   zero: " + ", ".join(rec["zero_weight"]) if rec["zero_weight"] else ""), flush=True)
    return rec


# ---- 1. control ----------------------------------------------------------------------------------------------
lean_allow = {"sel_d1": LEAN_SELECTOR_BUDGET}
for tag, al in (("Lean selector budget 162464451464/10^15", lean_allow), ("research selector allowance", None)):
    Dx, lin, non, al_ = exact_value(SEVEN, MASTER_W, al)
    OUT[f"control, master weights, {tag}"] = dict(D=str(Dx), D_float=float(Dx), invD=float(1 / Dx), minus_master=float(Dx - MASTER),
                                                   H0_lo=float(lin), nonlinear_hi=float(non), weighted_allowances=float(al_))
    print(f"control ({tag}): D = {fmt(Dx, 18)}  1/D = {float(1 / Dx):.12f}  D - master = {float(Dx - MASTER):.3e}")
print(f"master exact slope {fmt(MASTER, 18)}, 1/slope = {float(1 / MASTER):.12f}")
run("seven, LP re-weighting (Lean selector budget)", SEVEN, lean_allow)
run("seven, LP re-weighting (research selector allowance)", SEVEN)

# ---- 2a. the cell copy -------------------------------------------------------------------------------------
A0 = Q(93079, 100000)
c0 = cell(A0)
run("six + cell copy a = 93079/100000 (no selector)", SEVEN[:6] + [c0], lean_allow)
run("seven + cell copy a = 93079/100000 (Lean selector budget)", SEVEN + [c0], lean_allow)
run("seven + cell copy a = 93079/100000 (research selector allowance)", SEVEN + [c0])

base_f = np.array([fvec(n) for n in SEVEN]); base_a = np.array([float(lean_allow.get(n, COL[n]["allow"])) for n in SEVEN])


def one(a):
    return solve(np.vstack([base_f, cell_float(a)]), np.concatenate([base_a, [float(NEW_ALLOW)]]))[1]


scan = {n: one(Q(n, 10000)) for n in range(9000, 9501, 25)}
n0 = max(scan, key=scan.get)
opt = minimize_scalar(lambda a: -one(a), bounds=((n0 - 25) / 10000, (n0 + 25) / 10000), method="bounded",
                      options=dict(xatol=1e-8))
OUT["scan over a (seven + one copy, float LP, Lean selector budget)"] = {str(Q(k, 10000)): v for k, v in scan.items()}
OUT["continuous optimum over a"] = dict(a=float(opt.x), D=float(-opt.fun), invD=float(-1 / opt.fun))
print("\nscan a -> float D: " + ", ".join(f"{k / 10000:.4f}: {v:.12f}" for k, v in scan.items()))
print(f"continuous optimum a = {opt.x:.7f}, float D = {-opt.fun:.13f}, 1/D = {-1 / opt.fun:.12f}")
for den in (1000, 10000, 100000):
    a = Q(round(opt.x * den), den)
    run(f"seven + cell copy a = {a}", SEVEN + [cell(a)], lean_allow)
r4 = Q(930767036298, DEN)
run(f"seven + cell copy at the six's own R4 coefficient a = {r4}", SEVEN + [cell(r4)], lean_allow)

# several copies (0.90 <= a <= 0.95, where ledger 4.4 finds the committed contour admissible)
grid = [Q(n, 4000) for n in range(3600, 3801, 2)]
names = SEVEN + [cell(a) for a in grid]
rec = run("seven + 101 cell copies 0.90 <= a <= 0.95 (step 1/2000)", names, lean_allow)
sup = [n for n in names[7:] if rec["weights_over_1e12"][n] > 0]
run(f"seven + the {len(sup)} copies used by the grid optimum", SEVEN + sup, lean_allow)

# ---- 2c. more angular selectors --------------------------------------------------------------------------
SELS = ["sel_d1_unit", "sel_d3a", "sel_d3b", "sel_d4"]
run("seven + the four further selector columns (no cell copy)", SEVEN + SELS, lean_allow)
run("seven + cell copy 93079/100000 + four further selector columns", SEVEN + [c0] + SELS, lean_allow)
run("seven + d=3 selector (3/20, 197/200) only", SEVEN + ["sel_d3a"], lean_allow)

# ---- 2d. the eighteen channels of #556 (GT, phase, cell) ---------------------------------------------------
E18 = [f"e18_{i:02d}" for i in range(6, 24)]
run("seven + the eighteen channels of #556", SEVEN + E18, lean_allow)
run("seven + eighteen + cell copy 93079/100000", SEVEN + E18 + [c0], lean_allow)
run("everything: seven + eighteen + copy + four selectors", SEVEN + E18 + [c0] + SELS, lean_allow)

# ---- replacement: drop each of the seven in turn from seven + copy ----------------------------------------
for i, n in enumerate(SEVEN):
    run(f"seven + copy 93079/100000 without {n}", [m for m in SEVEN if m != n] + [c0], lean_allow)

Path(sys.argv[3]).write_text(json.dumps(OUT, indent=1))
print("DONE")
