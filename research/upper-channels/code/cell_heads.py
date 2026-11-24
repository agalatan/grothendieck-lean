#!/usr/bin/env python3
"""Head coefficients h_k (k = 0..250) of the cell channel of the eighteen-channel certificate with
preprocessor R(X) = a - (1-a) X in both coordinates, in Arb ball arithmetic, from the grades of
cell_grades.py:   h_k = sum_{n <= k} mu_n [X^(k-n)] R(X)^(2n+1).

Checks: (1) for the committed preprocessor (a = 91942572547021/10^14) every h_k, k <= 125, lies in
the 2^-128 interval that the Lean head check forms from the Lean-verified grades (CHANNEL21.json,
written by channels.py); (2) what the certificate's truncation discards: sum_{126 <= k <= 250} |h_k|;
(3) the partial Hardy sums sum_{k <= 250} h_k^2 rho^(4k+2), lower estimates of the circle mean
that the Schur bound of schur_tail.py must exceed.
(4) for every a, the same inclusion against the exact interval composition (replay of HeadCompute.compose,
tools/replay_private_upper_budget.py of the eighteen-channel branch) of the Lean-verified grades.
Agent-ID: claude-b9ee (worker).
Usage: cell_heads.py GRADES250.json CHANNEL21.json SRC18_DIR OUT.json a1 a2 ...  (a as p/q)"""
import json, sys
from fractions import Fraction as Q
from math import comb
from pathlib import Path
from flint import arb, fmpq, ctx
ctx.prec = 512
sys.path.insert(0, str(Path(sys.argv[3]) / 'tools')); sys.path.insert(0, str(Path(__file__).resolve().parent))
import replay_private_upper_budget as rp  # noqa: E402
from cmp_grades import lean_grades  # noqa: E402

def head(mu, a, K):
    b = 1 - a
    h = [arb(0) for _ in range(K + 1)]
    for n in range(min(len(mu), K + 1)):
        d = 2 * n + 1
        for jx in range(0, min(d, K - n) + 1):
            c = comb(d, jx) * a ** (d - jx) * (-b) ** jx
            h[n + jx] += mu[n] * arb(fmpq(c.numerator, c.denominator))
    return h

if __name__ == "__main__":
    g = json.load(open(sys.argv[1])); mu = [arb(s) for s in g["grades"]]; K = g["N"]
    ch = json.load(open(sys.argv[2])); D = 1 << 128
    out = {"grades_N": K, "channels": {}}
    a0 = Q(ch["P"][0]); assert Q(ch["P"][1]) == a0 - 1 and ch["name"] == "tiger_fw_18"
    h = head(mu, a0, K)
    inside = sum(bool(h[k] > arb(fmpq(int(lo), D))) and bool(h[k] < arb(fmpq(int(hi), D))) for k, (lo, hi) in enumerate(ch["head"][:126]))
    wid = max(int(hi) - int(lo) for lo, hi in ch["head"][:126]) / D
    print("committed channel a = %s: %d of 126 head coefficients strictly inside the Lean-style 2^-128 intervals "
          "(largest interval width %.2e); h_0 = %s" % (a0, inside, wid, h[0].str(45, radius=True)))
    out["validation_committed"] = dict(a=str(a0), inside=inside, of=126, max_interval_width=wid, h0=h[0].str(60, radius=True))
    GL = lean_grades(sys.argv[3])
    for s in [str(a0)] + sys.argv[5:]:
        a = Q(s); h = head(mu, a, K)
        iv = rp.compose(126, [a, a - 1], GL)
        ins = sum(bool(h[k] > arb(fmpq(lo, D))) and bool(h[k] < arb(fmpq(hi, D))) for k, (lo, hi) in enumerate(iv))
        tr = sum((abs(x) for x in h[126:]), arb(0))
        rec = dict(a=str(a), inside_lean_style_intervals=ins, max_radius=max(float(x.rad()) for x in h), h0=h[0].str(50, radius=True),
                   sum_abs_1_125=float(sum((abs(x) for x in h[1:126]), arb(0))),
                   sum_abs_126_250=float(tr), abs_h126=float(abs(h[126])), abs_h250=float(abs(h[250])),
                   hardy_partial={}, h=[x.str(40, radius=False) for x in h])
        for rho in ("109/100", "23/20", "6/5"):
            r = Q(rho); rec["hardy_partial"][rho] = float(sum((x * x * arb(fmpq(r.numerator, r.denominator)) ** (4 * k + 2) for k, x in enumerate(h)), arb(0)))
        print("a = %-22s inside %d/126  h_0 = %s  sum_{126..250}|h_k| = %.3e  |h_126| = %.2e |h_250| = %.2e  partial Hardy sums (rho 1.09, 1.15, 1.2): %s"
              % (a, ins, h[0].str(22, radius=False), rec["sum_abs_126_250"], rec["abs_h126"], rec["abs_h250"],
                 ", ".join("%.6f" % v for v in rec["hardy_partial"].values())))
        out["channels"][str(a)] = rec
    json.dump(out, open(sys.argv[4], "w"), indent=0)
