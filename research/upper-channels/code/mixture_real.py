#!/usr/bin/env python3
"""Six channels (master) + new copies of the eighteen-channel certificate's cell channel with
R(X) = a - (1-a)X, with REAL allowances for the new copies:
  allowance(new copy) = Hardy tail from index 126 (the cell head has 126 coefficients; everything
  beyond is discarded) at radius 109/100 with circle budget 2, rounded up at 10^-15, exactly as
  the eighteen-channel certificate pays for its own cell channel (889685/10^15), plus its tail
  ceiling from index 251 (1/10^15).  schur_tail.py checks (floating point) that the Schur circle
  mean at rho = 1.09 is below 2 for every a used here.
Head of a new copy: exact 2^-128 interval composition (HeadCompute.compose replay) of the
Lean-verified cell grades (HeadWitnessFacts).  LP in floating point, then exact rational/interval
evaluation at weights rounded to 10^-12, then the certificate form of the six-channel proof
(c - headCap - sum w tau, every piece rounded outward at 10^-12).
Label N for the optimum (float LP); the evaluation at fixed weights is exact given the inputs.
Agent-ID: claude-b9ee (worker).
Usage: mixture_real.py CHANNELDIR SRC18 RESULTS.json OUT.json"""
import json, math, sys
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
from scipy.optimize import linprog, minimize_scalar
HERE = Path(__file__).resolve().parent
CH, SRC18, RES, OUT = Path(sys.argv[1]), Path(sys.argv[2]), Path(sys.argv[3]), Path(sys.argv[4])
sys.path.insert(0, str(SRC18 / "tools")); sys.path.insert(0, str(HERE))
import replay_private_upper_budget as rp  # noqa: E402
from cmp_grades import lean_grades  # noqa: E402
import schur_tail as st  # noqa: E402
import mpmath as mp
mp.mp.dps = 40
f = lambda q, n=15: mp.nstr(mp.mpf(q.numerator) / q.denominator, n)
M = 251; D = 1 << 128; S = 1e6; DEN = 10 ** 12
chans = [json.loads((CH / f"channel-{i:02d}.json").read_text()) for i in range(24)]
names = [c["name"] for c in chans]
IV = [[(int(x), int(y)) for x, y in c["head"]] for c in chans]
H = np.array([[(lo + hi) / 2 / D for lo, hi in iv] for iv in IV])
res = json.loads(RES.read_text())
A = [Q(res["allowances"][n]["certified"]) for n in names]
G = lean_grades(SRC18); Gf = [(lo + hi) / 2 / D for lo, hi in G]
NEW_ALLOW = rp.hardy_ceiling(Q(109, 100), Q(2), 126) + rp.hardy_ceiling(Q(109, 100), Q(2), 251)
HEADROOM = 1.4   # certified budgets of the six exceed the float circle means by at most 34 %
_allow = {}
def allow_of(a):
    """Allowance of a copy: the eighteen's accounting (rho = 1.09, budget 2) when the float Schur mean
    there is below 2/HEADROOM; otherwise the best tail from index 126 over admissible radii with the
    float mean times HEADROOM as budget (large when the disk of analyticity is small)."""
    a = Q(a).limit_denominator(10 ** 15)
    if a not in _allow:
        R = [float(a), float(a) - 1]
        if min(st.budget(R, R, 1.09, j, 1 << 14) for j in (0.35, 0.4, 0.45)) * HEADROOM < 2:
            _allow[a] = NEW_ALLOW
        else:
            rr = st.r_reg(R); rhos = [r for r in np.arange(1.0025, 1.30, 0.0025) if r < rr - 0.002]
            b = st.best(R, R, 126, rhos, np.arange(0.05, 0.5, 0.05)) if rhos else None
            _allow[a] = Q(1) if b is None else Q(min(1.0, st.tail(b[3] * HEADROOM, b[1], 126))).limit_denominator(10 ** 15)
    return _allow[a]

def oned(nu, P, m=126):
    P = np.asarray(P, float); Y = np.concatenate([[0.0], np.convolve(P, P)])
    acc = np.zeros(0)
    for c in nu[::-1]:
        t = np.convolve(Y, acc)[:m] if len(acc) else np.zeros(0)
        acc = np.zeros(max(len(t), 1)); acc[:len(t)] = t; acc[0] += c
    h = np.convolve(P, acc)[:m]; out = np.zeros(M); out[:len(h)] = h
    return out
copy_f = lambda a: oned(Gf, [float(a), float(a) - 1])
def copy_iv(a):
    ch = rp.compose(126, [a, a - 1], G)
    return list(ch) + [(0, 0)] * (M - len(ch))

def solve(Hm, av):
    n = len(av); K = M - 1
    obj = -np.concatenate([Hm[:, 0] - av, -np.ones(2 * K) / S])
    Aeq = np.zeros((K + 1, n + 2 * K))
    Aeq[:K, :n] = Hm[:, 1:].T * S; Aeq[:K, n:n + K] = -np.eye(K); Aeq[:K, n + K:] = np.eye(K); Aeq[K, :n] = 1
    beq = np.zeros(K + 1); beq[K] = 1
    r = linprog(obj, A_eq=Aeq, b_eq=beq, bounds=(0, None), method="highs-ds",
                options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10, presolve=False))
    assert r.status == 0, r.message
    w = r.x[:n]; Hk = Hm.T @ w
    return w, Hk[0] - np.abs(Hk[1:]).sum() - av @ w

def exact(base, alist, w, allow_new=None, den=DEN):
    """Exact evaluation at weights rounded to 1/den: model value and six-style certificate value."""
    labels = [names[i] for i in base] + [f"cell18 R=[{a}, -{1 - a}]" for a in alist]
    ivs = [IV[i] for i in base] + [copy_iv(a) for a in alist]
    aq = [A[i] for i in base] + [allow_of(a) if allow_new is None else allow_new for a in alist]
    wq = [Q(round(x * den), den) for x in w]; j = max(range(len(wq)), key=lambda i: wq[i]); wq[j] += 1 - sum(wq)
    idx = [i for i, x in enumerate(wq) if x > 0]
    head = rp.sum_l([[rp.mul_i(rp.of_rat_i(wq[i]), x) for x in ivs[i]] for i in idx])
    lin = Q(head[0][0], D); non = Q(sum(max(-lo, hi, 0) for lo, hi in head[1:]), D)
    al = sum(wq[i] * aq[i] for i in idx)
    Dm = lin - non - al
    # certificate form: c = H0 rounded to 10^-12 (nearest), headCap >= |H0 - c| + sum|H_k| rounded up,
    # tau_p rounded up at 10^-12 (10^-15 for the new copies, as in the eighteen-channel certificate)
    c = Q(round((lin + Q(head[0][1], D)) / 2 * den), den)
    sh = [(head[0][0] - rp.of_rat_hi(c), head[0][1] - rp.of_rat_lo(c))] + head[1:]
    cap = Q(math.ceil(Q(sum(max(-lo, hi, 0) for lo, hi in sh), D) * 10 ** 12), 10 ** 12)
    taus = [Q(math.ceil(aq[i] * (10 ** 12 if i < len(base) else 10 ** 15)), 10 ** 12 if i < len(base) else 10 ** 15) for i in range(len(aq))]
    Dc = c - cap - sum(wq[i] * taus[i] for i in idx)
    top = sorted(range(1, M), key=lambda k: -abs(head[k][0]))[:6]
    return dict(D_model=f(Dm, 15), invD_model=f(1 / Dm, 15), H0_lo=f(lin, 16), nonlinear_hi=f(non, 10), allowances=f(al, 8),
                D_certificate_form=f(Dc, 15), invD_certificate_form=f(1 / Dc, 15), c=str(c), headCap=str(cap),
                rounding_loss=f(Dm - Dc, 4), largest_Hk={str(k): head[k][0] / D for k in top},
                weights={labels[i]: str(wq[i]) for i in idx},
                weights_over_1e12={labels[i]: int(wq[i] * den) for i in idx}), Dm, Dc

out = {"new_copy_allowance": f(NEW_ALLOW, 10), "new_copy_allowance_exact": str(NEW_ALLOW)}
six = list(range(6)); a6 = np.array([float(A[i]) for i in six])
def show(label, r):
    print("\n%s\n   model D = %s  1/D = %s   | certificate form: c = %s, headCap = %s, D = %s, 1/D = %s (loss %s)"
          % (label, r["D_model"], r["invD_model"], f(Q(r["c"]), 12), f(Q(r["headCap"]), 7), r["D_certificate_form"], r["invD_certificate_form"], r["rounding_loss"]))
    print("   H0 >= %s  nonlinear <= %s  allowances %s ; largest H_k: %s" % (r["H0_lo"], r["nonlinear_hi"], r["allowances"],
          ", ".join("k=%s: %.2e" % kv for kv in r["largest_Hk"].items())))
    for l, x in sorted(r["weights_over_1e12"].items(), key=lambda t: -t[1]): print("   %-40s %13d / 10^12" % (l, x))
    out[label] = r

# reference: six alone at their committed weights and at the LP optimum
w, Dv = solve(H[six], a6); r, *_ = exact(six, [], w); show("six alone (LP weights)", r)

# one copy: continuous search over a
def one(a):
    w, Dv = solve(np.vstack([H[six], copy_f(a)]), np.concatenate([a6, [float(allow_of(a))]])); return Dv, w
scan = {n: one(n / 10000)[0] for n in range(9000, 9601, 25)}
n0 = max(scan, key=scan.get)
opt = minimize_scalar(lambda a: -one(a)[0], bounds=((n0 - 25) / 10000, (n0 + 25) / 10000), method="bounded", options=dict(xatol=1e-7))
print("one copy: scan", {k: "%.12f" % v for k, v in scan.items() if abs(k - n0) <= 100}, "; continuous optimum a = %.7f, D = %.13f" % (opt.x, -opt.fun))
out["one_copy_scan"] = {str(Q(k, 10000)): v for k, v in scan.items()}; out["one_copy_continuous_optimum"] = dict(a=float(opt.x), D=float(-opt.fun))
for den_a in (1000, 10000, 100000):
    a = Q(round(opt.x * den_a), den_a); Dv, w = one(a)
    r, *_ = exact(six, [a], w); show(f"six + ONE copy, a = {a}", r)
r4 = Q(930767036298, 10 ** 12); Dv, w = one(r4); r, *_ = exact(six, [r4], w); show(f"six + ONE copy with the six's own R4 coefficient a = {r4}", r)

# several copies: LP over a grid, then keep the support
grid = sorted({Q(n, 20000) for n in range(17600, 19400, 5)} | {Q(n, 2000) for n in range(1500, 1990, 5)})
Hg = np.array([copy_f(a) for a in grid]); ag = np.array([float(allow_of(a)) for a in grid])
out['grid_allowances'] = {str(a): float(allow_of(a)) for a in grid if allow_of(a) != NEW_ALLOW}
print('grid: %d values of a; %d of them not admissible at rho = 1.09 with budget 2 (own allowance, from %.1e to %.1e)' % (len(grid), len(out['grid_allowances']), min(out['grid_allowances'].values()), max(out['grid_allowances'].values())))
w, Dv = solve(np.vstack([H[six], Hg]), np.concatenate([a6, ag]))
sup = [grid[i] for i in range(len(grid)) if w[6 + i] > 1e-9]
print("\nsix + grid of %d copies (a in [0.75, 0.995]): float D = %.13f ; copies used: %s" % (len(grid), Dv, [(str(a), float(a), round(float(w[6 + grid.index(a)]), 9)) for a in sup]))
wsel = np.concatenate([w[:6], [w[6 + grid.index(a)] for a in sup]])
r, Dm, Dc = exact(six, sup, wsel); show("six + best copies from the grid (%d copies)" % len(sup), r)
best_six = (sup, r)
# best two copies: the two heaviest of the support, re-solved
if len(sup) > 2:
    two = sorted(sup, key=lambda a: -w[6 + grid.index(a)])[:2]
    w2, _ = solve(np.vstack([H[six]] + [copy_f(a) for a in two]), np.concatenate([a6, [float(allow_of(a)) for a in two]]))
    r, *_ = exact(six, two, w2); show("six + the two heaviest copies of the grid optimum", r)
# the pair found on 24 November with assumed allowances, now with the real ones
pair = [Q(931, 1000), Q(1861, 2000)]
w, Dv = solve(np.vstack([H[six]] + [copy_f(a) for a in pair]), np.concatenate([a6, [float(NEW_ALLOW)] * 2]))
r, *_ = exact(six, pair, w); show("six + copies a = 931/1000 and 1861/2000 (the pair of the first experiment)", r)
# pessimistic allowance (budget 3 at radius 1.05) for the same pair, to show the sensitivity
pess = rp.hardy_ceiling(Q(105, 100), Q(3), 126)
r, *_ = exact(six, pair, w, allow_new=pess); r["note"] = "allowance of a new copy set to %s (rho = 1.05, budget 3): sensitivity only" % f(pess, 6)
show("same pair, pessimistic allowance", r)

# all 24 + copies
allidx = list(range(24)); a24 = np.array([float(x) for x in A])
w, Dv = solve(np.vstack([H, Hg]), np.concatenate([a24, ag]))
sup = [grid[i] for i in range(len(grid)) if w[24 + i] > 1e-9]
wsel = np.concatenate([w[:24], [w[24 + grid.index(a)] for a in sup]])
r, *_ = exact(allidx, sup, wsel); show("all 24 + best copies from the grid (%d copies)" % len(sup), r)

# Schur circle means at rho = 1.09 for every a used (float): must be < 2
used = sorted(set(best_six[0]) | set(sup) | set(pair) | {r4})
out["schur_mean_rho_1.09"] = {}
for a in used:
    R = [float(a), float(a) - 1]
    B = min(st.budget(R, R, 1.09, j, 1 << 16) for j in (0.35, 0.4, 0.425, 0.45))
    out["schur_mean_rho_1.09"][str(a)] = dict(B=B, r_reg=st.r_reg(R))
    print("a = %-12s Schur circle mean at rho 1.09: %.6f (< 2 needed) ; r_reg = %.5f" % (a, B, out["schur_mean_rho_1.09"][str(a)]["r_reg"]))
OUT.write_text(json.dumps(out, indent=1))
