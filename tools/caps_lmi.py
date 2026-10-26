#!/usr/bin/env python3
"""S-lemma multiplier search for the localised node caps (route M), on exported piece matrices.

The Lean checker `pieceOKc` accepts a piece iff the exact LDL^T of
    K(lam, mu) = N - sum_c (lam_c A_c + mu_c B_c)            (13 x 13, rational)
has nonnegative pivots (and lam, mu >= 0, lam = 0 on halfspaces). N contains the cap only in entry (0,0).
`Grothe.LowerAnalytic.exportPieces` (Lean, same functions as the checker) writes N, A_c, B_c per piece as JSON
lines; this script searches multipliers on those matrices only (seconds instead of minutes per trial):

  tools/caps_lmi.py solve EXPORT.jsonl OUT.json [--margin 1e-9]
      for every piece: (1) maximise t with S K S >= t I (S = diagonal scaling), lam, mu >= 0;
      if t > 0, round the multipliers to rationals and verify K >= 0 EXACTLY (Fraction LDL, the same test as
      `ldlOK`); (2) otherwise minimise the cap increase d with K + d e0 e0^T >= 0 and verify exactly.
      Writes per piece: status fixed / cap_up / fail, the rational multipliers, the cap increase.
  tools/caps_lmi.py apply PIECES.json OUT.json NEWPIECES.json
      writes a copy of the pieces file with the new multipliers of the fixed pieces (and the node cap raised by
      the largest certified increase of its pieces, recorded in "cap_up").

Proposals are search output: they are certified only when the Lean check (the native range facts) passes.
Requires numpy and cvxpy (droplet: ~/grothe-cx/venv/bin/python3).
"""
import json, sys
from fractions import Fraction as F

def fr(s):
    return F(s) if s is not None else None

def ldl_ok(m):
    """Exact LDL^T as in `ldlOK`: nonnegative pivots, zero pivot only with a zero column below."""
    n = len(m)
    a = [row[:] for row in m]
    for k in range(n):
        p = a[k][k]
        if p < 0:
            return False
        if p == 0:
            if any(a[i][k] != 0 for i in range(k + 1, n)):
                return False
            continue
        for i in range(k + 1, n):
            f = a[i][k] / p
            if f != 0:
                for j in range(k + 1, n):
                    a[i][j] -= f * a[k][j]
    return True

def kmat(N, cons, lm):
    K = [[N[i][j] for j in range(13)] for i in range(13)]
    for c, (lam, mu) in zip(cons, lm):
        if lam:
            for i in range(13):
                for j in range(13):
                    K[i][j] -= lam * c["A"][i][j]
        if mu:
            for i in range(13):
                for j in range(13):
                    K[i][j] -= mu * c["B"][i][j]
    return K

def load(path):
    out = []
    for line in open(path):
        line = line.strip()
        if not line:
            continue
        d = json.loads(line)
        d["N"] = [[F(x) for x in r] for r in d["N"]]
        for c in d["cons"]:
            c["A"] = [[F(x) for x in r] for r in c["A"]]
            c["B"] = [[F(x) for x in r] for r in c["B"]]
            c["lam"], c["mu"], c["lo"], c["hi"] = F(c["lam"]), F(c["mu"]), F(c["lo"]), fr(c["hi"])
        out.append(d)
    return out

def rat(x, den=10**15):
    return max(F(0), F(x).limit_denominator(den))

def min_eig_hp(d, S, lm, dps=60):
    """Smallest eigenvalue of S K S in high precision (mpmath), K from the exact data."""
    import mpmath as mp
    mp.mp.dps = dps
    K = kmat(d["N"], d["cons"], lm)
    M = mp.matrix(13, 13)
    for i in range(13):
        for j in range(13):
            M[i, j] = mp.mpf(K[i][j].numerator) / K[i][j].denominator * S[i] * S[j]
    E = mp.eigsy(M, eigvals_only=True)
    return min(E)

def refine(d, S, x0, two, dps=60, iters=400):
    """Maximise the high-precision smallest eigenvalue over the multipliers (Nelder-Mead on log-scale
    perturbations of the solver point), returning rational multipliers."""
    import mpmath as mp
    from scipy.optimize import minimize
    nc = len(d["cons"])
    base = [(F(a), F(b)) for a, b in x0]
    def lm_of(z):
        out, k = [], 0
        for c in range(nc):
            a = base[c][0] * F(1 + z[k]).limit_denominator(10**20) if two[c] else F(0)
            if two[c]: k += 1
            b = base[c][1] * F(1 + z[k]).limit_denominator(10**20) if base[c][1] > 0 else F(0)
            if base[c][1] > 0: k += 1
            out.append((max(a, F(0)), max(b, F(0))))
        return out
    nz = sum(1 for c in range(nc) if two[c]) + sum(1 for c in range(nc) if base[c][1] > 0)
    if nz == 0:
        return base, float(min_eig_hp(d, S, base, dps))
    f = lambda z: -float(min_eig_hp(d, S, lm_of(z), dps) * 10**12)
    r = minimize(f, [0.0] * nz, method="Nelder-Mead",
                 options={"maxiter": iters, "xatol": 1e-14, "fatol": 1e-6, "initial_simplex": None})
    lm = lm_of(r.x)
    return lm, float(min_eig_hp(d, S, lm, dps))

def solve_piece(d, margin):
    import numpy as np, cvxpy as cp
    N = np.array([[float(x) for x in r] for r in d["N"]])
    A = [np.array([[float(x) for x in r] for r in c["A"]]) for c in d["cons"]]
    B = [np.array([[float(x) for x in r] for r in c["B"]]) for c in d["cons"]]
    two = [c["hi"] is not None for c in d["cons"]]
    s = 1.0 / np.sqrt(np.maximum(np.abs(np.diag(N)), 1e-30))
    S = np.diag(s)
    nc = len(d["cons"])
    lam = cp.Variable(nc, nonneg=True)
    mu = cp.Variable(nc, nonneg=True)
    t = cp.Variable()
    K = N - sum(lam[c] * A[c] + mu[c] * B[c] for c in range(nc)) if nc else N
    KS = S @ K @ S
    cons = [ (KS + KS.T) / 2 - t * np.eye(13) >> 0, t <= 1 ]
    cons += [lam[c] == 0 for c in range(nc) if not two[c]]
    res = {"k": d["k"], "i": d["i"], "j": d["j"], "grid": d["grid"], "stored_ok": d["ok"],
           "stored_lm": [[str(c["lam"]), str(c["mu"])] for c in d["cons"]]}
    try:
        cp.Problem(cp.Maximize(t), cons).solve(solver="CLARABEL")
    except Exception as e:
        res.update(status="fail", error=str(e)[:200]); return res
    res["t_opt"] = float(t.value) if t.value is not None else None
    if t.value is not None and t.value > -1e-7:
        lm0 = [(rat(lam.value[c]) if two[c] else F(0), rat(mu.value[c], 10**20)) for c in range(nc)]
        # the solver point may be imprecise at this scale: refine in high precision, then verify exactly
        lm, emin = refine(d, list(s), [(str(a), str(b)) for a, b in lm0], two)
        res["min_eig_refined"] = emin
        if emin > 0 and ldl_ok(kmat(d["N"], d["cons"], lm)):
            res.update(status="fixed", lm=[[str(a), str(b)] for a, b in lm], cap_up="0")
            return res
    # minimal cap increase: K + dcap e0 e0^T >= margin (scaled)
    dcap = cp.Variable(nonneg=True)
    E0 = np.zeros((13, 13)); E0[0, 0] = 1.0
    K2 = K + dcap * E0
    KS2 = S @ K2 @ S
    cons2 = [(KS2 + KS2.T) / 2 - margin * np.eye(13) >> 0] + [lam[c] == 0 for c in range(nc) if not two[c]]
    try:
        cp.Problem(cp.Minimize(dcap), cons2).solve(solver="CLARABEL")
    except Exception as e:
        res.update(status="fail", error=str(e)[:200]); return res
    if dcap.value is None:
        res.update(status="fail", error="no solution"); return res
    lm = [(rat(lam.value[c]) if two[c] else F(0), rat(mu.value[c])) for c in range(nc)]
    d0 = F(dcap.value * (1 + 1e-6) + 1e-18).limit_denominator(10**18)
    for _ in range(40):
        Nd = [r[:] for r in d["N"]]; Nd[0][0] += d0
        if ldl_ok(kmat(Nd, d["cons"], lm)):
            res.update(status="cap_up", lm=[[str(a), str(b)] for a, b in lm], cap_up=str(d0),
                       cap_up_float=float(d0))
            return res
        d0 = d0 * 2 + F(1, 10**15)
    res.update(status="fail", error="exact verification failed")
    return res

def cmd_solve(src, out, margin):
    res = [solve_piece(d, margin) for d in load(src)]
    json.dump(res, open(out, "w"), indent=1)
    for r in res:
        print(r["k"], r["i"], r["j"], r["status"], r.get("t_opt"), r.get("cap_up_float", 0))

def cmd_apply(pieces_path, sol_path, out_path):
    nodes = json.load(open(pieces_path))
    sols = json.load(open(sol_path))
    by = {}
    for s in sols:
        by.setdefault((s["k"], s["i"]), []).append(s)
    for nd in nodes:
        ss = by.get((nd["k"], nd["i"]), [])
        up = F(0)
        for s in ss:
            if s["status"] not in ("fixed", "cap_up"):
                continue
            p = nd["pieces"][s["j"]]
            new = []
            for cstr, (lam, mu) in zip(p["cons"], s["lm"]):
                f = cstr.split(",")
                f[4], f[5] = lam, mu
                new.append(",".join(f))
            p["cons"] = new
            up = max(up, F(s["cap_up"]))
        if up:
            nd["cap_up"] = str(up)
    json.dump(nodes, open(out_path, "w"))

if __name__ == "__main__":
    a = sys.argv[1:]
    if a and a[0] == "solve":
        m = float(a[a.index("--margin") + 1]) if "--margin" in a else 1e-9
        cmd_solve(a[1], a[2], m)
    elif a and a[0] == "apply":
        cmd_apply(a[1], a[2], a[3])
    else:
        print(__doc__)
