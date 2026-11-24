#!/usr/bin/env python3
"""Column-generation experiment (floating point, HYPOTHETICAL allowances for the new channels):
would extra copies of the existing channel types with other preprocessors raise the union optimum?
Research script, Agent-ID: claude-b9ee (worker).  Usage: colgen.py CHANNELDIR OUTJSON"""
import json, sys, itertools
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
from scipy.optimize import linprog
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / "src18" / "tools"))
import replay_private_upper_budget as rp  # noqa: E402
import channels as C  # noqa: E402
M = 251; D = float(1 << 128); S = 1e6
mid = lambda iv: (iv[0] + iv[1]) / 2 / D

def pows(P, N):
    out = np.zeros((N + 1, M)); out[0, 0] = 1
    P = np.asarray(P, float)
    for n in range(1, N + 1):
        out[n] = np.convolve(out[n - 1], P)[:M]
    return out

def bivar(rows, P, Qp):
    pp = pows(P, 503); pq = pows(Qp, 167) if len(Qp) else None
    tot = np.zeros(M)
    for m, ent in rows:
        r = np.zeros(M)
        for n, e in ent:
            sh = n // 2
            if sh < M:
                r[sh:] += e * pp[n][:M - sh]
        if m:
            r = np.convolve(pq[m], r)[:M]
        sh = m // 2
        tot[sh:] += r[:M - sh]
    return tot

def oned(nu, P, m=M):
    P = np.asarray(P, float); Y = np.concatenate([[0.0], np.convolve(P, P)])
    acc = np.zeros(0)
    for c in nu[::-1]:
        t = np.convolve(Y, acc)[:m] if len(acc) else np.zeros(0)
        acc = np.zeros(max(len(t), 1)); acc[:len(t)] = t; acc[0] += c
    h = np.convolve(P, acc)[:m]
    out = np.zeros(M); out[:len(h)] = h
    return out

chans = [json.loads((Path(sys.argv[1]) / f"channel-{i:02d}.json").read_text()) for i in range(24)]
H = np.array([[ (int(a) + int(b)) / 2 / D for a, b in c["head"]] for c in chans])
res = json.loads((HERE / "results.json").read_text())
a = [float(res["allowances"][c["name"]]["certified"]) for c in chans]

tig, rows6 = C.six_tables()
tigf = [mid(x) for x in tig]
rows6f = [(m, [(n, mid(e)) for n, e in ent]) for m, ent in rows6]
gtf = [(m, [(n, mid(e)) for n, e in ent]) for m, ent in rp.load_energy_rows(HERE / "src18")]
haag = [float(r) * np.pi / 4 for r in rp.haag_list(M)]
g18 = [mid(x) for x in C.grades18()]

# accuracy of the float recomputation against the exact vectors
def fr(l): return [float(Q(x)) for x in l]
errs = []
for i, c in enumerate(chans):
    P = fr(c["P"]); Qp = fr(c["Q"])
    k = c["kind"]
    if k == "cell": v = bivar(rows6f, P, Qp)
    elif k == "oned_haag" or k == "phase": v = oned(haag, P)
    elif k == "oned_tig": v = oned(tigf, P)
    elif k == "GT": v = bivar(gtf, P, Qp)
    else: v = oned(g18, P, 126)
    errs.append(float(np.abs(v - H[i]).sum()))
print("float recomputation, sum_k |error| per channel: max %.2e" % max(errs))

GT_ERR = float(res["gt_error_per_unit"])
ASSUMED = {"tig": 1.10835e-7, "cell": 5.7619e-8, "phase": 1.785796e-6, "GT": GT_ERR + 2.74e-7, "cell18": 1e-8}
cands = []
grid = [0.90, 0.92, 0.94, 0.95, 0.96, 0.97, 0.975, 0.98, 0.985, 0.99, 0.992, 0.994, 0.996, 0.998, 0.999]
shapes = []
for A in grid:
    b = 1 - A
    for deg in (1, 2, 3, 4, 5):
        for sg in (-1, 1):
            P = [A] + [0] * (deg - 1) + [sg * b]
            shapes.append((f"a={A},deg={deg},sg={sg:+d}", P))
    for sg1, sg2 in itertools.product((-1, 1), repeat=2):
        shapes.append((f"a={A},X:{sg1:+d}/2,X3:{sg2:+d}/2", [A, sg1 * b / 2, 0, sg2 * b / 2]))
for lab, P in shapes:
    cands.append(("tig", lab, oned(tigf, P)))
    cands.append(("phase", lab, oned(haag, P)))
    cands.append(("cell18", lab, oned(g18, P, 126)))
    for qs in (-1.0, 1.0, -0.9):
        cands.append(("cell", lab + f",Q={qs}X", bivar(rows6f, P, [0, qs])))
        cands.append(("GT", lab + f",Q={qs}X", bivar(gtf, P, [0, qs])))
print("candidates:", len(cands))
Hc = np.array([c[2] for c in cands]); ac = np.array([ASSUMED[c[0]] for c in cands])

def solve(Hm, av):
    n = len(av); K = M - 1
    obj = -np.concatenate([Hm[:, 0] - av, -np.ones(2 * K) / S])
    Aeq = np.zeros((K + 1, n + 2 * K))
    Aeq[:K, :n] = Hm[:, 1:].T * S
    Aeq[:K, n:n + K] = -np.eye(K); Aeq[:K, n + K:] = np.eye(K)
    Aeq[K, :n] = 1
    beq = np.zeros(K + 1); beq[K] = 1
    r = linprog(obj, A_eq=Aeq, b_eq=beq, bounds=(0, None), method="highs-ds",
                options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10, presolve=False))
    assert r.status == 0, r.message
    w = r.x[:n]
    Hk = Hm.T @ w
    return w, Hk[0] - np.abs(Hk[1:]).sum() - av @ w, Hk

out = {"float_error_max": max(errs), "assumed_allowances": ASSUMED, "n_candidates": len(cands)}
w0, D0, _ = solve(H, np.array(a))
print("union of 24 (float): D = %.13f" % D0)
out["D_union24"] = D0
def report(label, Hm, av, labels):
    w, Dv, Hk = solve(Hm, av)
    print("\n%s: D = %.13f  1/D = %.12f  gain over the 24: %.3e" % (label, Dv, 1 / Dv, Dv - D0))
    print("   H0 = %.12f  nonlinear = %.4e  allowances = %.4e" % (Hk[0], np.abs(Hk[1:]).sum(), av @ w))
    top = np.argsort(-np.abs(Hk[1:]))[:6] + 1
    print("   largest |H_k|:", ", ".join("k=%d: %.2e" % (k, Hk[k]) for k in top))
    used = [(labels[i], float(w[i])) for i in np.argsort(-w) if w[i] > 1e-13]
    for l, x in used: print("   %-55s %.12f" % (l, x))
    out[label] = dict(D=float(Dv), invD=float(1 / Dv), gain=float(Dv - D0), H0=float(Hk[0]),
                      nonlinear=float(np.abs(Hk[1:]).sum()), allowances=float(av @ w), weights=used)
base = [c["name"] for c in chans]
lab_c = [f"NEW {c[0]} {c[1]}" for c in cands]
report("24 + all candidates", np.vstack([H, Hc]), np.concatenate([a, ac]), base + lab_c)
for kind in ("tig", "cell", "phase", "GT", "cell18"):
    sel = [i for i, c in enumerate(cands) if c[0] == kind]
    report(f"24 + {kind} candidates only", np.vstack([H, Hc[sel]]), np.concatenate([a, ac[sel]]), base + [lab_c[i] for i in sel])
sel = [i for i, c in enumerate(cands) if c[0] in ("tig", "cell", "phase")]
six_idx = list(range(6))
report("six + six-type candidates (no GT, no eighteen)", np.vstack([H[six_idx], Hc[sel]]),
       np.concatenate([np.array(a)[six_idx], ac[sel]]), [base[i] for i in six_idx] + [lab_c[i] for i in sel])
Path(sys.argv[2]).write_text(json.dumps(out, indent=1))
