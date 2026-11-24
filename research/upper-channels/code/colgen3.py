#!/usr/bin/env python3
"""Third pass: the simplest candidates.  (a) the six channels plus re-preprocessed copies of the
eighteen's cell channel with R = [a, -(1-a)], 0.90 <= a <= 0.95 (contour comparable to the committed
a = 0.9194 at radius 1.09); (b) the same on top of all 24.  Exact interval rechecks.  New-channel
allowances are ASSUMED.  Agent-ID: claude-b9ee (worker).  Usage: colgen3.py CHANNELDIR OUTJSON"""
import sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
exec((HERE / "colgen2.py").read_text().split("cands = []")[0])
cands = []
for n in range(9000, 9501, 5):
    A = Q(n, 10000)
    cands.append(("cell18", f"R=[{A}, -{1-A}]", [A, A - 1], oned(g18, [float(A), float(A) - 1], 126)))
D = 1 << 128
g = C.grades18()
names = [c["name"] for c in chans]
def run(label, base_idx, allow, ncap=None):
    Hm = np.vstack([H[base_idx]] + [c[3] for c in cands]); av = np.concatenate([np.array(a)[base_idx], [allow] * len(cands)])
    w, Dv, Hk = solve(Hm, av)
    labels = [names[i] for i in base_idx] + ["NEW cell18 " + c[1] for c in cands]
    ivs = [[(int(x), int(y)) for x, y in chans[i]["head"]] for i in base_idx]
    aq = [Q(res["allowances"][names[i]]["certified_exact"]) for i in base_idx]
    for c in cands:
        aq.append(Q(allow).limit_denominator(10**15)); ivs.append(None)
    den = 10**12
    wq = [Q(round(x * den), den) for x in w]; j = max(range(len(wq)), key=lambda i: wq[i]); wq[j] += 1 - sum(wq)
    idx = [i for i, x in enumerate(wq) if x > 0]
    for i in idx:
        if ivs[i] is None:
            ch = rp.compose(126, cands[i - len(base_idx)][2], g); ivs[i] = list(ch) + [(0, 0)] * (251 - len(ch))
    head = rp.sum_l([[rp.mul_i(rp.of_rat_i(wq[i]), x) for x in ivs[i]] for i in idx])
    lin = Q(head[0][0], D); non = Q(sum(max(-lo, hi, 0) for lo, hi in head[1:]), D); al = sum(wq[i] * aq[i] for i in idx)
    Dx = lin - non - al
    print("\n%s\n   float LP D = %.13f ; EXACT interval at 10^-12 weights: H0 >= %s  nonlinear <= %s  allowances %s  D = %s  1/D = %s"
          % (label, Dv, f(lin, 15), f(non, 8), f(al, 6), f(Dx, 13), f(1 / Dx, 13)))
    top = sorted(range(1, 251), key=lambda k: -abs(head[k][0]))[:6]
    print("   largest |H_k|:", ", ".join("k=%d: %.2e" % (k, head[k][0] / D) for k in top))
    for i in sorted(idx, key=lambda i: -wq[i]):
        print("   %-34s %s   a_p %s" % (labels[i], f(wq[i], 12), f(aq[i], 4)))
    out[label] = dict(D_float_lp=float(Dv), H0_lo=f(lin, 16), nonlinear_hi=f(non, 10), allowances=f(al, 8), D=f(Dx, 14), invD=f(1 / Dx, 14),
                      weights={labels[i]: str(wq[i]) for i in idx}, new_channel_allowance_assumed=allow)
out = {}
run("six + cell18 copies (a in [0.90,0.95]), assumed a_p = 1e-8", list(range(6)), 1e-8)
run("six + cell18 copies (a in [0.90,0.95]), assumed a_p = 1e-6", list(range(6)), 1e-6)
run("six + committed tiger_fw_18 only (certified allowances, no new channel)", list(range(6)) + [21], 1e-8) if False else None
run("24 + cell18 copies (a in [0.90,0.95]), assumed a_p = 1e-8", list(range(24)), 1e-8)
# reference without new channels: six + the committed eighteen cell channel
cands = []
Hm = H[list(range(6)) + [21]]; w, Dv, Hk = solve(Hm, np.array(a)[list(range(6)) + [21]])
print("\nsix + committed tiger_fw_18 (certified allowances): float D = %.13f  1/D = %.12f  weights %s" % (Dv, 1 / Dv, np.round(w, 9)))
out["six + committed tiger_fw_18"] = dict(D=float(Dv), invD=float(1 / Dv), weights=[float(x) for x in w])
Hm = H[list(range(6)) + [6, 7, 21]]; w, Dv, Hk = solve(Hm, np.array(a)[list(range(6)) + [6, 7, 21]])
print("six + GT_altP_1_0.993 + GT_altP_3_0.993 + tiger_fw_18 (certified allowances): float D = %.13f  1/D = %.12f  weights %s" % (Dv, 1 / Dv, np.round(w, 9)))
out["six + 2 GT + tiger_fw_18"] = dict(D=float(Dv), invD=float(1 / Dv), weights=[float(x) for x in w])
Path(sys.argv[2]).write_text(json.dumps(out, indent=1))
