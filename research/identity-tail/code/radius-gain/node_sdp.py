#!/usr/bin/env python3
"""Is the first-moment (radius) constraint active in the law problem behind a plain Stein row?

For a row of data/tail-rows/plain, a scale sigma and a shape x (E U^2 = 2 + x^2), solve

    sup  E Psi_up(sigma sqrt U)
    s.t. E 1 = 1, E U = 1, E U^2 = 2 + x^2, E U^3 <= 6 + 9x^2 + C6 x^3,
         E G_z(U) >= 0 for every cut z in the committed banks of the row (all its cells),
         [E sqrt U <= r]

over measures on a grid of v = sqrt U (finite support).  Psi_up is the chord interpolation of
the row's node caps (the potential bound the Lean check uses).  The cut bank is POOLED over
all shape cells of the row, whereas a Lean node uses the bank of its own cell.  Each value is
a lower bound of the supremum over all laws, so the difference of the value without and with
the radius constraint is an indication only: it is not a one-sided bound on what a
re-optimised node could gain, and it says nothing about shapes or scales outside the sampled
grid (label N: floating point).
With rounds > 1 eigenvector cuts of the full quadratic family are added (slow to converge;
not used for the recorded numbers).  Needs numpy and scipy (HiGHS).
Usage: node_sdp.py ROW SHARD NSHARDS OUT   (rows: 0.82 0.83 0.835 0.845 ...); the grids can be
restricted with the environment variables SIGMAS and XS (comma separated); existing records
of the output file are kept.
Agent-ID: claude-b9ee
"""
from fractions import Fraction as Q
from pathlib import Path
import json
import os
import sys

import numpy as np
from scipy.optimize import linprog

ROOT = Path(__file__).resolve().parents[4]
C6 = 40.45313
SIGMAS = [0.12, 0.16, 0.19, 0.21, 0.23, 0.25, 0.27, 0.29, 0.31, 0.33, 0.36, 0.40, 0.45,
          0.50, 0.55, 0.60, 0.65, 0.70, 0.7377, 0.75]
XS = [0.0, 0.2, 0.3, 0.4, 0.5, 0.65, 0.8, 1.0, 1.5, 2.5]
RADII = [0.93, 0.9148, 0.9142, 0.9, 0.88623]


def setup(name):
    row = json.loads((ROOT / f"data/tail-rows/plain/row_{name}.json").read_text())
    t = np.array([float(Q(s)) for s in row["mesh"]])          # knots in u, t[0] = 0
    nodes = np.array([float(Q(s)) for s in row["nodes"]])
    caps = np.array([float(Q(s)) for s in row["caps"]])
    smax = float(Q(row["smax"]))
    kappa = float(Q(row["kappa"]))
    v = np.unique(np.concatenate([np.arange(0, 3.2, 0.004), np.arange(3.2, 9.0001, 0.02),
                                  np.sqrt(t)]))
    u = v * v
    K = len(t) - 1                                            # free knot values z_0..z_{K-1}
    # hat functions h_k(u) and their primitives H_k(u), k = 0..K-1 (value 0 at t_K and beyond)
    h = np.zeros((len(u), K))
    H = np.zeros((len(u), K))
    for k in range(K):
        e = np.zeros(K + 1)
        e[k] = 1.0
        h[:, k] = np.interp(u, t, e, right=0.0)
        fine = np.concatenate([[0.0], np.cumsum((e[1:] + e[:-1]) / 2 * np.diff(t))])
        idx = np.clip(np.searchsorted(t, u, side="right") - 1, 0, K - 1)
        du = np.minimum(u, t[-1]) - t[idx]
        slope = (e[idx + 1] - e[idx]) / (t[idx + 1] - t[idx])
        H[:, k] = fine[idx] + e[idx] * du + slope * du * du / 2
    n = K + 2
    a = np.zeros((len(u), n)); a[:, :K] = h; a[:, K] = 1.0     # phi + beta'
    b = np.zeros((len(u), n))
    pos = u > 0
    b[pos, :K] = h[pos] - H[pos] / u[pos, None]               # phi - Phi/u  (limit 0 at u = 0)
    c = np.zeros((len(u), n)); c[:, :K] = H - h               # Phi - phi
    return dict(row=row, v=v, u=u, a=a, b=b, c=c, n=n, K=K, nodes=nodes, caps=caps,
                smax=smax, kappa=kappa)


def psi_up(S, w):
    out = np.interp(w, S["nodes"], S["caps"])
    far = w > S["nodes"][-1]
    out[far] = S["caps"][-1] + S["smax"] * (w[far] - S["nodes"][-1])
    return out


def cut_rows(S, Z):
    """Rows  wgt_i * z^T Q_i z  for the test vectors in the rows of Z."""
    n = S["n"]
    Qt = S["Q"].reshape(len(S["u"]), n, n)
    return np.einsum("ikj,jk->ji", np.tensordot(Qt, Z.T, axes=([2], [0])), Z)


def prepare(S):
    v, u, n, K = S["v"], S["u"], S["n"], S["K"]
    S["wgt"] = 1.0 / (1.0 + u ** 3)                            # p = wgt * q keeps the rows O(1)
    A, B, Cc = S["a"], S["b"], S["c"]
    e = np.zeros(n); e[K + 1] = 1.0
    Qm = (np.einsum("ij,ik->ijk", A, A) + 2 * np.einsum("ij,ik->ijk", B, B)
          + np.einsum("ij,k->ijk", Cc, e) + np.einsum("j,ik->ijk", e, Cc)
          + ((u * u - 2) / 3)[:, None, None] * np.outer(e, e)[None])
    S["Q"] = (Qm * S["wgt"][:, None, None]).reshape(len(u), n * n)
    # start from every cut of the row's committed banks (what the node certificates use)
    Z = np.array([z for cell in S["row"]["cells"] for z in cell["bank"]], dtype=float) / 1e7
    Z = np.unique(Z, axis=0)
    Z /= np.linalg.norm(Z, axis=1)[:, None]
    S["bank_cuts"] = cut_rows(S, Z)


def solve(S, sigma, x, r=None, tol=2e-10, rounds=1):
    """LP (HiGHS) over the cuts of the committed banks; rounds > 1 adds eigenvector cuts."""
    if "Q" not in S:
        prepare(S)
    v, u, n, wgt = S["v"], S["u"], S["n"], S["wgt"]
    f = psi_up(S, sigma * v)
    m3 = 6 + 9 * x * x + C6 * x ** 3
    Aeq = np.vstack([wgt, wgt * u, wgt * u * u])
    beq = np.array([1.0, 1.0, 2 + x * x])
    ub_rows = [wgt * u ** 3 / m3]
    ub_rhs = [1.0]
    if r is not None:
        ub_rows.append(wgt * v)
        ub_rhs.append(r)
    cuts = S["bank_cuts"]
    last = None
    for it in range(rounds):
        res = linprog(-(wgt * f), A_ub=np.vstack(ub_rows + [-cuts]),
                      b_ub=np.array(ub_rhs + [0.0] * len(cuts)), A_eq=Aeq, b_eq=beq,
                      bounds=(0, None), method="highs",
                      options=dict(primal_feasibility_tolerance=1e-10,
                                   dual_feasibility_tolerance=1e-10))
        if res.status != 0:
            return float("nan"), float("nan"), f"lp status {res.status}"
        q = res.x
        M = (S["Q"].T @ q).reshape(n, n)
        M = (M + M.T) / 2
        w, V = np.linalg.eigh(M)
        if w[0] >= -tol or it == rounds - 1:
            return -res.fun, float(q @ (wgt * v)), f"{it + 1} rounds, min eig {w[0]:.1e}"
        last = -res.fun
        cuts = np.vstack([cuts, cut_rows(S, V[:, : min(4, int((w < -tol).sum()))].T)])
    return -res.fun, float(q @ (wgt * v)), f"round limit, min eig {w[0]:.1e}"


def main():
    name, shard, nshards, out = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), Path(sys.argv[4])
    S = setup(name)
    sigmas = [float(z) for z in os.environ["SIGMAS"].split(",")] if "SIGMAS" in os.environ else SIGMAS
    xs = [float(z) for z in os.environ["XS"].split(",")] if "XS" in os.environ else XS
    jobs = [(s, x) for s in sigmas for x in xs]
    path = out / f"sdp_{name}_{shard}.jsonl"
    done = set()
    if path.exists():                                          # resume: keep what is there
        done = {(r["sigma"], r["x"]) for r in map(json.loads, path.read_text().splitlines())}
    with open(path, "a") as fh:
        for j, (sigma, x) in enumerate(jobs):
            if j % nshards != shard or (sigma, x) in done:
                continue
            val, m, status = solve(S, sigma, x)
            rec = dict(row=name, sigma=sigma, x=x, value=val, first_moment=m, status=status,
                       net=val - S["kappa"] * sigma ** 2, constrained={})
            for r in RADII:
                vr, mr, st = solve(S, sigma, x, r)
                rec["constrained"][str(r)] = dict(value=vr, saving=val - vr, first_moment=mr)
            fh.write(json.dumps(rec) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
