#!/usr/bin/env python3
"""Reflected-cubic columns (refl_cubic.py) in the LP with master's seven channels and the cell copy (issue #723).

Column at eps, preprocessors (p2, -p2) with p2 the phase preprocessor of master's six (channel 2):
    head = six_2 head + compose(p2, mu(eps) - mu(0)),   grades to degree NMAX of refl.json,
so at eps = 0 it is exactly master's phase column; grades above NMAX are taken equal to the phase grades (their
change is not computed: see the decay printed below).  Allowance: that of six_2 (its Hardy tail cap at cutoff 320),
an assumption.  Everything here is floating point (label N); the comparison is float LP against float LP.
Agent-ID: claude-b9ee (worker).
Usage: refl_lp.py SOURCES COLUMNS.json REFL.json OUT.json"""
import json
import sys
from fractions import Fraction as Q
from pathlib import Path

import numpy as np
from scipy.optimize import linprog

HERE = Path(__file__).resolve().parent
CODE = HERE.parent
SRC = Path(sys.argv[1]).resolve()
sys.path.insert(0, str(SRC / "src18" / "tools")); sys.path.insert(0, str(CODE))
import replay_private_upper_budget as rp  # noqa: E402
from cmp_grades import lean_grades  # noqa: E402
import channels  # noqa: E402

MAXK = 320
D128 = 1 << 128
cols = json.loads(Path(sys.argv[2]).read_text())
refl = json.loads(Path(sys.argv[3]).read_text())
F = {n: np.array([float((Q(lo) + Q(hi)) / 2) for lo, hi in c["head"]] + [0.0] * (MAXK + 1 - len(c["head"])))
     for n, c in cols.items()}
A = {n: float(Q(c["allowance"])) for n, c in cols.items()}
A["sel_d1"] = 162464451464e-15            # Lean's selector budget
G = lean_grades(SRC / "src18"); Gf = [(lo + hi) / 2 / D128 for lo, hi in G]
NEW_ALLOW = float(rp.hardy_ceiling(Q(109, 100), Q(2), 126) + rp.hardy_ceiling(Q(109, 100), Q(2), 251))


def compose(P, mu):
    """coefficients h_k (k <= MAXK) of sum_n mu_n r^n P(r^2)^n / r, mu indexed by degree n (odd)."""
    P = np.asarray(P, float); h = np.zeros(MAXK + 1); Pn = np.array([1.0])
    for n in range(1, len(mu)):
        Pn = np.convolve(Pn, P)[:MAXK + 1]
        if n % 2 and mu[n]:
            s = (n - 1) // 2
            if s <= MAXK:
                seg = Pn[:MAXK + 1 - s]; h[s:s + len(seg)] += mu[n] * seg
    return h


def cell_float(a):
    P = np.array([float(a), float(a) - 1]); Y = np.concatenate([[0.0], np.convolve(P, P)])
    acc = np.zeros(0)
    for c in Gf[::-1]:
        t = np.convolve(Y, acc)[:126] if len(acc) else np.zeros(0)
        acc = np.zeros(max(len(t), 1)); acc[:len(t)] = t; acc[0] += c
    h = np.convolve(P, acc)[:126]; out = np.zeros(MAXK + 1); out[:len(h)] = h
    return out


def solve(Hm, av, scale=1e6):
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


p2 = [float(x) for x in channels.six_params()[1][2][2]]
# sanity: compose(p2, exact phase grades to degree 2*MAXK+1) reproduces master's phase column
ph = np.zeros(2 * MAXK + 2); r = np.pi / 4
for k in range(MAXK + 1):
    ph[2 * k + 1] = r; r *= (2 * k + 1) ** 2 / (4 * (k + 1) * (k + 2))
check = float(np.abs(compose(p2, ph) - F["six_2"]).sum())
print(f"compose(p2, phase grades) vs master's six_2 head: sum |diff| = {check:.2e}")
assert check < 1e-12

SEVEN = ["six_0", "six_1", "six_2", "six_3", "six_4", "six_5", "sel_d1"]
base = [F[n] for n in SEVEN]; base_a = [A[n] for n in SEVEN]
mu0 = np.array(refl["runs"]["0.0"]["mu_fine"])
out = {"compose_check": check, "runs": {}}
refl_cols, labels = [], []
for eps, run in refl["runs"].items():
    if float(eps) == 0:
        continue
    d = np.array(run["mu_fine"]) - mu0
    col = F["six_2"] + compose(p2, d)
    refl_cols.append(col); labels.append(eps)
    Df_alone = col[0] - np.abs(col[1:]).sum()
    tail = np.abs(d[-20:]).sum()
    print(f"eps={eps}: sum|d mu| = {np.abs(d).sum():.3e}, |d mu| over the last 20 degrees = {tail:.2e}, "
          f"column slope (no allowance) {Df_alone:.6f} (phase column {F['six_2'][0] - np.abs(F['six_2'][1:]).sum():.6f})")
    out["runs"][eps] = dict(sum_abs_dmu=float(np.abs(d).sum()), tail20=float(tail))

for tag, extra, extra_a in (("seven", [], []), ("seven + copy 23277/25000", [cell_float(Q(23277, 25000))], [NEW_ALLOW])):
    w0, D0 = solve(np.array(base + extra), np.array(base_a + extra_a))
    for i, (eps, col) in enumerate(zip(labels, refl_cols)):
        w1, D1 = solve(np.array(base + extra + [col]), np.array(base_a + extra_a + [A["six_2"]]))
        out["runs"][eps][tag] = dict(D=D1, gain_D=D1 - D0, weight=float(w1[-1]))
        print(f"{tag} + reflected cubic eps={eps}: float D = {D1:.13f} (without: {D0:.13f}; gain {D1 - D0:+.2e}), "
              f"its weight {w1[-1]:.3e}, phase weight {w1[2]:.3e}")
    w1, D1 = solve(np.array(base + extra + refl_cols), np.array(base_a + extra_a + [A["six_2"]] * len(refl_cols)))
    out[f"{tag} + all eps"] = dict(D=D1, gain_D=D1 - D0, weights=dict(zip(labels, map(float, w1[-len(refl_cols):]))))
    print(f"{tag} + all reflected columns: float D = {D1:.13f}, gain {D1 - D0:+.2e}, 1/D = {1 / D1:.12f}")
Path(sys.argv[4]).write_text(json.dumps(out, indent=1))
