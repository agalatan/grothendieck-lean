#!/usr/bin/env python3
"""Second pass: finer preprocessor grid for the eighteen's cell channel type (and the six's tiger and
cell types), then an EXACT interval evaluation of the best mixture found.  The allowances of the new
channels are ASSUMED (no contour fact exists for them).  Agent-ID: claude-b9ee (worker).
Usage: colgen2.py CHANNELDIR OUTJSON"""
import json, sys
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
HERE = Path(__file__).resolve().parent
sys.argv_saved = sys.argv[:]
import importlib.util
src = (HERE / "colgen.py").read_text().split("GT_ERR = ")[0]
exec(src)  # tables, float evaluators, chans, H, a, res
import mpmath as mp
mp.mp.dps = 30
f = lambda q, n=15: mp.nstr(mp.mpf(q.numerator) / q.denominator, n)
exec((HERE / "colgen.py").read_text().split("def solve(Hm, av):")[1].split("out = {")[0].join(["def solve(Hm, av):", ""]))
GT_ERR = float(res["gt_error_per_unit"])
D0 = solve(H, np.array(a))[1]
out = {}
# how much head mass lies beyond index 125 for a 1D tiger-type channel with a ~ 0.93 (six's table, which goes to 250)
for A in (0.90, 0.92, 0.94, 0.96):
    v = oned(tigf, [A, -(1 - A)])
    print("six tiger table, R=[%.2f, -%.2f]: sum_{k=126..250}|h_k| = %.3e" % (A, 1 - A, np.abs(v[126:]).sum()))
cands = []
for n in range(8600, 9900, 25):
    A = Q(n, 10000)
    for lab, P in ((f"R=[{A}, -{1-A}]", [A, A - 1]), (f"R=[{A}, 0, -{1-A}]", [A, 0, A - 1]),
                   (f"R=[{A}, -{(1-A)/2}, -{(1-A)/2}]", [A, (A - 1) / 2, (A - 1) / 2]),
                   (f"R=[{A}, -{(1-A)*3/4}, 0, -{(1-A)/4}]", [A, (A - 1) * 3 / 4, 0, (A - 1) / 4])):
        Pf = [float(x) for x in P]
        cands.append(("cell18", lab, P, oned(g18, Pf, 126)))
        cands.append(("tig", lab, P, oned(tigf, Pf)))
for n in range(9800, 9990, 5):
    A = Q(n, 10000)
    cands.append(("cell", f"P=[{A}, -{1-A}], Q=-X", [A, A - 1], bivar(rows6f, [float(A), float(A) - 1], [0, -1.0])))
print("candidates", len(cands))
def run(label, kinds, allow):
    sel = [c for c in cands if c[0] in kinds]
    Hm = np.vstack([H] + [c[3] for c in sel]); av = np.concatenate([a, [allow[c[0]] for c in sel]])
    w, Dv, Hk = solve(Hm, av)
    labels = [c["name"] for c in chans] + [f"NEW {c[0]} {c[1]}" for c in sel]
    print("\n%s: D = %.13f  1/D = %.12f  gain over the 24: %.3e ; H0 %.12f nonlinear %.4e allowances %.4e" %
          (label, Dv, 1 / Dv, Dv - D0, Hk[0], np.abs(Hk[1:]).sum(), av @ w))
    used = [(i, labels[i], float(w[i])) for i in np.argsort(-w) if w[i] > 1e-13]
    for _, l, x in used: print("   %-50s %.12f  a_p %.3e" % (l, x, av[_]))
    out[label] = dict(D=float(Dv), invD=float(1 / Dv), gain=float(Dv - D0), H0=float(Hk[0]), nonlinear=float(np.abs(Hk[1:]).sum()),
                      allowances=float(av @ w), weights=[(l, x, float(av[i])) for i, l, x in used])
    return w, sel, av
BASE = {"tig": 1.10835e-7, "cell": 5.7619e-8, "cell18": 1e-8}
w, sel, av = run("24 + fine grid, cell18 only (assumed a_p = 1e-8)", ("cell18",), BASE)
run("24 + fine grid, cell18 only (assumed a_p = 1e-6, pessimistic)", ("cell18",), dict(BASE, cell18=1e-6))
run("24 + fine grid, six tiger type only", ("tig",), BASE)
w, sel, av = run("24 + fine grid, cell18 + tig + cell", ("cell18", "tig", "cell"), BASE)
w, sel, av = run("24 + fine grid, cell18 only (assumed a_p = 1e-8) [for exact recheck]", ("cell18",), BASE)

# exact interval evaluation of the last mixture
D = 1 << 128
g = C.grades18()
ivs = [[(int(x), int(y)) for x, y in c["head"]] for c in chans]
aq = [Q(res["allowances"][c["name"]]["certified"]) for c in chans]
for c in sel:
    ch = rp.compose(126, c[2], g); ivs.append(list(ch) + [(0, 0)] * (251 - len(ch))); aq.append(Q(1, 10**8))
den = 10**12
wq = [Q(round(x * den), den) for x in w]; j = max(range(len(wq)), key=lambda i: wq[i]); wq[j] += 1 - sum(wq)
idx = [i for i, x in enumerate(wq) if x > 0]
head = rp.sum_l([[rp.mul_i(rp.of_rat_i(wq[i]), x) for x in ivs[i]] for i in idx])
lin = Q(head[0][0], D); non = Q(sum(max(-lo, hi, 0) for lo, hi in head[1:]), D); al = sum(wq[i] * aq[i] for i in idx)
Dx = lin - non - al
print("\nEXACT interval evaluation at weights rounded to 10^-12: H0 >= %s, nonlinear head <= %s, allowances %s (new channels: ASSUMED 1e-8 each)"
      % (f(lin, 16), f(non, 10), f(al, 8)))
print("D = %s   1/D = %s" % (f(Dx, 14), f(1 / Dx, 14)))
out["exact_recheck"] = dict(H0_lo=f(lin, 16), nonlinear_hi=f(non, 10), allowances=f(al, 8), D=f(Dx, 14), invD=f(1 / Dx, 14),
                            weights={([c["name"] for c in chans] + ["NEW cell18 " + c[1] for c in sel])[i]: str(wq[i]) for i in idx})
Path(sys.argv[2]).write_text(json.dumps(out, indent=1))
