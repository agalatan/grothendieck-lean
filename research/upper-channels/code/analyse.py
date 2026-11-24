#!/usr/bin/env python3
"""Validation (task A), LPs (task B) and report data (task C) for the union mixture.
Research script, Agent-ID: claude-b9ee (worker).  Floating-point model + exact interval rechecks.
Usage: analyse.py CHANNELDIR OUTJSON"""
import json, math, sys
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
from scipy.optimize import linprog
import mpmath as mp

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / "src18" / "tools"))
import replay_private_upper_budget as rp  # noqa: E402
import channels as C  # noqa: E402

mp.mp.dps = 40
D = 1 << 128
M = 251
SC = 10**15
out = {}

def f(q, n=20):
    return mp.nstr(mp.mpf(q.numerator) / q.denominator, n)

chans = [json.loads((Path(sys.argv[1]) / f"channel-{i:02d}.json").read_text()) for i in range(24)]
for c in chans:
    c["iv"] = [(int(a), int(b)) for a, b in c["head"]]
    c["wq"] = Q(c["w"])
names = [c["name"] for c in chans]
SIX = list(range(6)); EIGHT = list(range(6, 24)); ALL = list(range(24))

def interval_head(idx, w):
    """Outward-rounded mixture head exactly as the Lean checks form it."""
    return rp.sum_l([[rp.mul_i(rp.of_rat_i(wi), x) for x in chans[i]["iv"]] for i, wi in zip(idx, w)])

def head_numbers(idx, w):
    h = interval_head(idx, w)
    return dict(lin_lo=Q(h[0][0], D), lin_hi=Q(h[0][1], D),
                nonlin_hi=Q(sum(max(-lo, hi, 0) for lo, hi in h[1:]), D),
                nonlin_mid=sum(abs(Q(lo + hi, 2 * D)) for lo, hi in h[1:]),
                width=Q(sum(hi - lo for lo, hi in h), D), head=h)

# ---------------- A. validation ----------------
print("== A. validation ==")
w6 = [chans[i]["wq"] for i in SIX]; assert sum(w6) == 1
c6 = Q(711974258589, 10**12); cap6 = Q(6157850, 10**12)
n6 = head_numbers(SIX, w6)
h = n6["head"]
shifted = [(h[0][0] - rp.of_rat_hi(c6), h[0][1] - rp.of_rat_lo(c6))] + h[1:]
abs6 = Q(sum(max(-lo, hi, 0) for lo, hi in shifted), D)
tail6 = [Q(n, 10**12) for n in (50024, 49816, 1785796, 110835, 3, 57619)]
T6 = sum(w * t for w, t in zip(w6, tail6))
print("six: H0 in [%s, %s]" % (f(n6["lin_lo"]), f(n6["lin_hi"])))
print("six: nonlinear head sum (upper endpoint) =", f(n6["nonlin_hi"], 12), " midpoint model =", f(n6["nonlin_mid"], 12))
print("six: Lean quantity absSum(head - c) =", f(abs6, 12), "<= headCap 6.15785e-6 :", abs6 <= cap6, " slack", f(cap6 - abs6, 4))
print("six: weighted tails =", f(T6, 8), " c - absSum - tails =", f(c6 - abs6 - T6, 15), " (certified: c - delta = %s)" % f(c6 - Q(6205314847032059049, 10**24), 15))
ok6 = abs6 <= cap6 and cap6 - abs6 < Q(1, 10**10)
out["six_validation"] = dict(H0_lo=f(n6["lin_lo"]), H0_hi=f(n6["lin_hi"]), nonlinear_hi=f(n6["nonlin_hi"], 14),
                             absSum_minus_c=f(abs6, 14), headCap="6.15785e-6", passed=bool(ok6), weighted_tail=f(T6, 10))

w18 = [chans[i]["wq"] for i in EIGHT]; assert sum(w18) == 1
n18 = head_numbers(EIGHT, w18)
print("eighteen: H0 lower endpoint =", f(n18["lin_lo"], 22), " (document: above 0.71196461874608628686)")
print("eighteen: nonlinear head upper =", f(n18["nonlin_hi"], 14), " (document: below 0.000000873503594735)")
ok18 = (Q(71196461874608628686, 10**20) < n18["lin_lo"] < Q(71196461874608628687, 10**20)
        and Q(873503594734, 10**18) < n18["nonlin_hi"] < Q(873503594735, 10**18))
out["eighteen_validation"] = dict(H0_lo=f(n18["lin_lo"], 22), nonlinear_hi=f(n18["nonlin_hi"], 14), passed=bool(ok18))
print("validation passed: six", ok6, " eighteen", ok18)

# allowances of the eighteen (replay of tools/replay_private_upper_budget.py main)
cols = C.columns18()
tails18 = []
for i, col in enumerate(cols):
    weight = Q(col["w_Q"])
    radius = Q(51, 50) if weight < Q(1, 1000) else Q(col["info"][0])
    if i == 0:
        radius = Q(1033, 1000)
    budget = {0: Q(7, 5), 7: Q(13, 10), 15: Q(2)}.get(i, Q(3))
    primary = Q(col.get("P_Q", col.get("R_Q"))[0])
    first = {"GT": Q(7181579359, 10**10), "phase": Q(785398163397, 10**12), "tiger": Q(0)}
    tails18.append(rp.hardy_ceiling(radius, budget, 251, first[col["kind"]] * primary))
trunc = rp.hardy_ceiling(Q(109, 100), Q(2), 126)
masses = [Q(n, 10**12) for n in (999411428628, 995201080567, 91640672869, 995201080567, 91640672869, 979402692536, 198981329621)]
whole = [Q(1, 10**18)] + [Q(n, SC) for n in (6338057765, 1086368451, 334910976)]
low = [Q(n, SC) + Q(1, 2**e) for n, e in ((9, 41), (17, 42), (1132, 45))]
errors = [whole[0], low[0], whole[1], low[1] / 2, whole[2], low[2] / 6, whole[3]]
table = json.loads((HERE / "src18/data/upper-preprocess/certificate.json").read_text())
gt_error = 2 * sum(m * e for m, e in zip(masses, errors)) + sum(whole) ** 2 + Q(table["energyErrQ"])
by_kind = {"GT": gt_error, "phase": Q(0), "tiger": trunc}
T18 = sum(Q(c["w_Q"]) * t for c, t in zip(cols, tails18))
E18 = sum(Q(c["w_Q"]) * by_kind[c["kind"]] for c in cols)
print("eighteen: weighted tail T =", f(T18, 10), "(doc 2.251685e-7);  comparison E =", f(E18, 11), "(doc 1.467492832e-6)")
print("eighteen: GT comparison error per unit GT weight =", f(gt_error, 10), "; cell truncation =", f(trunc, 6))
assert math.ceil(T18 * SC) == 225168500 and math.ceil(E18 * SC) == 1467492832
gap18 = n18["lin_lo"] - n18["nonlin_hi"] - E18 - T18
print("eighteen: gap from these vectors =", f(gap18, 15), "(doc 0.711962052581159)")
if not (ok6 and ok18):
    print("VALIDATION FAILED - stopping"); sys.exit(1)

# allowance vectors
a_cert = tail6 + [t + by_kind[c["kind"]] for c, t in zip(cols, tails18)]
# hypothetical: the search's own tail estimate info[3] for the eighteen's channels where smaller (NOT certified)
a_hyp = tail6 + [min(t, Q(c["info"][3])) + by_kind[c["kind"]] for c, t in zip(cols, tails18)]
# *_exact fields hold the rationals as "p/q" and are the ones other scripts read; the decimal fields are for display only
out["allowances"] = {n: dict(certified=f(a, 8), hypothetical=f(b, 8), certified_exact=str(a), hypothetical_exact=str(b))
                     for n, a, b in zip(names, a_cert, a_hyp)}
out["gt_error_per_unit"] = f(gt_error, 12); out["cell_truncation"] = f(trunc, 8)
out["gt_error_per_unit_exact"] = str(gt_error); out["cell_truncation_exact"] = str(trunc)

# ---------------- B. LP ----------------
Hmid = np.array([[float(Q(lo + hi, 2 * D)) for lo, hi in c["iv"]] for c in chans])  # 24 x 251
S = 1e6

def solve(idx, a):
    n = len(idx); K = M - 1
    cvec = np.array([Hmid[i, 0] - float(a[i]) for i in idx])
    # variables: w (n), u (K), v (K) ; H_k*S = u_k - v_k ; maximise c.w - (sum u+v)/S
    obj = -np.concatenate([cvec, -np.ones(2 * K) / S])
    Aeq = np.zeros((K + 1, n + 2 * K))
    Aeq[:K, :n] = Hmid[idx, 1:].T * S
    Aeq[:K, n:n + K] = -np.eye(K); Aeq[:K, n + K:] = np.eye(K)
    Aeq[K, :n] = 1
    beq = np.zeros(K + 1); beq[K] = 1
    res = linprog(obj, A_eq=Aeq, b_eq=beq, bounds=(0, None), method="highs-ds",
                  options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10, presolve=False))
    assert res.status == 0, res.message
    w = res.x[:n]
    y = np.asarray(res.eqlin.marginals[:K]) * S
    return w, y, -res.fun

def round_w(w, den):
    r = [Q(round(x * den), den) for x in w]
    j = max(range(len(r)), key=lambda i: r[i])
    r[j] += 1 - sum(r)
    assert sum(r) == 1 and min(r) >= 0
    return r

def evaluate(idx, wq, a):
    """Exact evaluation: midpoint model and outward interval value (what a Lean head check would see)."""
    nums = head_numbers(idx, wq)
    al = sum(w * a[i] for i, w in zip(idx, wq))
    H0mid = (nums["lin_lo"] + nums["lin_hi"]) / 2
    return dict(H0=H0mid, H0_lo=nums["lin_lo"], nonlin_mid=nums["nonlin_mid"], nonlin_hi=nums["nonlin_hi"],
                allow=al, D_mid=H0mid - nums["nonlin_mid"] - al, D_iv=nums["lin_lo"] - nums["nonlin_hi"] - al,
                head=nums["head"])

def dual_bound(idx, y, a):
    best = None
    for s in (np.clip(y, -1, 1), np.clip(-y, -1, 1)):
        ss = [Q(float(x)) for x in s]
        vals = []
        for i in idx:
            mids = [Q(lo + hi, 2 * D) for lo, hi in chans[i]["iv"]]
            vals.append(mids[0] - a[i] - sum(sk * hk for sk, hk in zip(ss, mids[1:])))
        b = max(vals)
        if best is None or b < best[0]:
            best = (b, s, vals)
    return best

def run(label, idx, a, den=10**12):
    w, y, obj = solve(idx, a)
    wq = round_w(w, den)
    ev = evaluate(idx, wq, a)
    ub, s, vals = dual_bound(idx, y, a)
    print(f"\n-- {label} --")
    print("LP objective (float) %.15f ; exact midpoint D at rounded weights %s ; dual upper bound on LP optimum %s"
          % (obj, f(ev["D_mid"], 15), f(ub, 15)))
    print("   D (midpoint model) = %s   1/D = %s" % (f(ev["D_mid"], 13), f(1 / ev["D_mid"], 13)))
    print("   D (outward intervals, as a Lean head check would give) = %s   1/D = %s" % (f(ev["D_iv"], 13), f(1 / ev["D_iv"], 13)))
    print("   H0 = %s  nonlinear head = %s  allowances = %s" % (f(ev["H0"], 15), f(ev["nonlin_mid"], 8), f(ev["allow"], 8)))
    for i, x in zip(idx, wq):
        if x > 0:
            print("   %-18s w = %s  (%s/10^12)  a_p = %s" % (names[i], f(x, 12), x * den, f(a[i], 6)))
    rec = dict(label=label, lp_objective=obj, D_mid=f(ev["D_mid"], 16), invD_mid=f(1 / ev["D_mid"], 16),
               D_interval=f(ev["D_iv"], 16), invD_interval=f(1 / ev["D_iv"], 16), dual_upper_bound=f(ub, 16),
               H0=f(ev["H0"], 16), nonlinear_head=f(ev["nonlin_mid"], 10), nonlinear_head_interval_upper=f(ev["nonlin_hi"], 10),
               allowances=f(ev["allow"], 10),
               weights={names[i]: str(x) for i, x in zip(idx, wq) if x > 0})
    return rec, wq, ev, s, vals, w

out["lp"] = {}
for label, idx in (("six alone", SIX), ("eighteen alone", EIGHT), ("union of 24", ALL)):
    rec, wq, ev, s, vals, wfl = run(label + " [certified allowances]", idx, a_cert)
    out["lp"][label] = rec
    if idx is ALL:
        best = (rec, wq, ev, s, vals, wfl)
for label, idx in (("eighteen alone", EIGHT), ("union of 24", ALL)):
    rec, *_ = run(label + " [HYPOTHETICAL tails = search estimates info[3], not certified]", idx, a_hyp)
    out["lp"][label + " (hypothetical tails)"] = rec
# committed weights for reference in the same model
for label, idx in (("six, committed weights", SIX), ("eighteen, committed weights", EIGHT)):
    ev0 = evaluate(idx, [chans[i]["wq"] for i in idx], a_cert)
    print(f"\n-- {label} -- D mid {f(ev0['D_mid'], 13)}  D interval {f(ev0['D_iv'], 13)}  1/D {f(1 / ev0['D_iv'], 13)}")
    out["lp"][label] = dict(D_mid=f(ev0["D_mid"], 16), D_interval=f(ev0["D_iv"], 16), invD_interval=f(1 / ev0["D_iv"], 16))

# ---------------- C. the best union mixture ----------------
ev6 = evaluate(SIX, w6, a_cert); hm6 = [Q(lo + hi, 2 * D) for lo, hi in ev6["head"]]
o6 = sorted(range(1, M), key=lambda k: -abs(hm6[k]))
print("\nsix alone, largest |H_k|:", ", ".join("k=%d: %.3e" % (k, float(hm6[k])) for k in o6[:12]))
out["six_largest_Hk"] = {str(k): float(hm6[k]) for k in o6[:25]}
rec, wq, ev, s, vals, wfl = best
print("\n== C. union mixture details ==")
head_mid = [Q(lo + hi, 2 * D) for lo, hi in ev["head"]]
order = sorted(range(1, M), key=lambda k: -abs(head_mid[k]))
print("largest |H_k|:", ", ".join("k=%d: %.3e" % (k, float(head_mid[k])) for k in order[:15]))
zero = [k for k in range(1, M) if abs(s[k - 1]) < 1 - 1e-7]
print("indices with |dual| < 1 (H_k pinned to 0 at the optimum, the kinks that determine the vertex):", zero)
cum = 0; parts = {}
for lo_, hi_ in ((1, 10), (11, 30), (31, 60), (61, 125), (126, 250)):
    parts[f"{lo_}-{hi_}"] = float(sum(abs(head_mid[k]) for k in range(lo_, hi_ + 1)))
print("nonlinear head by index block:", parts)
Dstar = ev["D_mid"]
print("reduced costs (value of channel p against the dual signs, minus D; 0 = in the basis, negative = not worth adding):")
red = {}
for i, v in zip(ALL, vals):
    red[names[i]] = float(v - Dstar)
    print("   %-18s %+.3e   w=%s" % (names[i], float(v - Dstar), f(wq[i], 6) if wq[i] else "0"))
sens = {}
for den in (10**15, 10**12, 10**11, 10**10, 10**9, 10**8, 10**7, 10**6):
    e2 = evaluate(ALL, round_w(wfl, den), a_cert)
    sens[str(den)] = f(e2["D_mid"], 15)
    print("weights rounded to 1/%d: D_mid = %s  loss vs 10^15: %s" % (den, f(e2["D_mid"], 15), f(Q(sens["1000000000000000"]) - e2["D_mid"], 3)))
# perturbation: move 1e-9 .. 1e-6 of weight between the two largest channels
big = sorted(range(24), key=lambda i: -wq[i])[:2]
for eps in (Q(1, 10**9), Q(1, 10**8), Q(1, 10**7), Q(1, 10**6)):
    w2 = list(wq); w2[big[0]] -= eps; w2[big[1]] += eps
    e2 = evaluate(ALL, w2, a_cert)
    print("shift %s of weight %s -> %s: D changes by %s" % (f(eps, 2), names[big[0]], names[big[1]], f(e2["D_mid"] - ev["D_mid"], 4)))
    sens["shift_" + f(eps, 2)] = f(e2["D_mid"] - ev["D_mid"], 6)
out["union_detail"] = dict(largest_Hk={str(k): float(head_mid[k]) for k in order[:25]}, pinned_indices=zero,
                           nonlinear_by_block=parts, reduced_costs=red, rounding_sensitivity=sens,
                           interval_width_total=f(sum(Q(hi - lo, D) for lo, hi in ev["head"]), 6))
print("total interval width of the union head:", out["union_detail"]["interval_width_total"])
Path(sys.argv[2]).write_text(json.dumps(out, indent=1))
