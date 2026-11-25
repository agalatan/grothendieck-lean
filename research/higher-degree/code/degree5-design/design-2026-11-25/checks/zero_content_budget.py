#!/usr/bin/env python3
"""The zero-content pairs of codex-a7c4's review of PR #646, on every piece of the design D* and on the published pieces of
ledger 4.17.  Exact rational interval arithmetic (Python standard library); the only inputs taken on trust are the enclosures
314159265358979/10^14 < pi < 314159265358980/10^14 and the stored row data.

The pair (review of codex-a7c4; DESIGN.md section 5.5).  eps = 39/50, eta = 779/10000, mu = sqrt(pi)/2, gamma = sqrt(3)/8.  With
independent standard complex Gaussians z, y1, y2, U, V and three events of probabilities (1 - lam + t/mu)/2, (1 - lam - t/mu)/2, lam
given by the angle 6(arg U - arg V): f = g = +-ph(z) on the first two, f = -g = ph(y1^2 conj(y2)) on the third.  It has visible
mass exactly t, G5 = nu' e32 with nu' = eta t gamma, G3 = q proportional to y1^2 conj(y2) with 0 < sqrt(u) <= eps lam, chi = 10,
and both contents zero.  With F(v) = 2 mu (l - beta/2 + gamma v) - v^2/eta (the zero-core scalar value at G5 = v e32):
    Lambda-hat_5^+(q, nu' e32) >= F(nu') - k_q u,      F(nu5) - k_q u <= Lambda_5(q) <= F(nu5) + 2 ||D||_2 sqrt(u) - k_q u,
and S_5 <= G+ = C - 2 beta^2/eps (H4).  Given G_AB(q) <= 0 (zero contents and a positive secant margin), H8 with the share kappa_h
and the room share eta_h needs
    gain(t) := F(nu') - F(nu5)  <=  kappa_h (G+ - F(nu5)) + eta_h + 2 ||D||_2 sqrt(u) + kappa_h k_q u.
Printed per piece, at the upper end t = b of the piece (gain increases with t while nu' < eta mu gamma) and lam = 10^-9:
  gain (lower bound), cap = G+ - F(nu5) (upper bound), share needed = gain/cap (with eta_h = 0 no kappa_h below it can work: a necessary lower bound, not a sufficient share, since H4 gives only S5 <= G+),
  the design's kappa_h(10) = 1 - kappa_AB(10) - 1/50 and the largest unassigned share over chi, max_chi (1 - kappa_AB(chi)),
  eta_h needed (lower bound) with the design's kappa_h(10), and the room of the piece.
A positive "eta_h needed" refutes the allocation eta_h = 0 on that piece (given H4 and H5).  "eta_h needed" is a lower bound at this lambda:
a smaller lambda forces slightly more (checks/codex_a7c4_fundmin_test.py), and a non-positive value shows only that these pairs do not
contradict eta_h = 0 on the piece, not that eta_h = 0 suffices there.
With a file name as argument it also writes the numbers of the first table as JSON (exact fractions as strings), the input of
checks/funded_rooms.py.
usage (from design-2026-11-25/):  python3 -I checks/zero_content_budget.py [tables/zero_content_budget.json] > checks/zero_content_budget.log"""
import json, os, re, sys
from fractions import Fraction as F
from math import isqrt
here = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
EPS, ETA, LAM, TOP = F(39, 50), F(779, 10000), F(1, 10 ** 9), F(886, 1000)
PI = (F(314159265358979, 10 ** 14), F(314159265358980, 10 ** 14))
def sqrt_iv(lo, hi, d=10 ** 15):                       # rational enclosure of the square roots of [lo, hi]
    a = F(isqrt(int(lo * d * d)), d); b = F(isqrt(int(hi * d * d)) + 1, d); assert a * a <= lo and hi <= b * b; return (a, b)
MU = sqrt_iv(PI[0] / 4, PI[1] / 4); G3 = sqrt_iv(F(3), F(3)); GAM = (G3[0] / 8, G3[1] / 8)
def mul(x, y): p = [a * b for a in x for b in y]; return (min(p), max(p))
def add(x, y): return (x[0] + y[0], x[1] + y[1])
def sub(x, y): return (x[0] - y[1], x[1] - y[0])
def pt(a): return (F(a), F(a))
def Fv(l, beta, v):                                    # enclosure of F(v) = 2 mu (l - beta/2 + gamma v) - v^2/eta
    return sub(mul(pt(2), mul(MU, add(pt(l - beta / 2), mul(GAM, v)))), mul(mul(v, v), pt(1 / ETA)))
def load_rows():
    out = {}
    for f, sel in (('tables/g078/rows_all.lines', lambda t: t < F(86, 100)), ('tables/g078hi/rows_all.lines', lambda t: t >= F(86, 100))):
        for l in open(os.path.join(here, f)):
            if l.strip():
                r = json.loads(l, parse_float=F)
                if sel(r['t']): out[r['t']] = r
    return out
ROWS = load_rows()
def one(a, b, tprime, row, C, khs):
    l, beta, bA, bB = row; nu5 = ROWS[F(str(tprime))]['nu5']; t = min(F(b), TOP)
    assert LAM + t / MU[0] < 1 and beta > 0                      # the three probabilities are positive
    nup = mul(pt(ETA * t), GAM)
    assert l - 2 * beta - max(nup[1], nu5) > 0                   # the radial factor is positive on T >= 0 at both nu' and nu5
    assert nup[1] < ETA * MU[0] * GAM[0]                         # nu' is below the maximiser of F
    gain = sub(Fv(l, beta, nup), Fv(l, beta, pt(nu5)))
    cap = sub(pt(F(C) - 2 * beta ** 2 / EPS), Fv(l, beta, pt(nu5))); assert cap[0] > 0
    Dn = F(101, 100); assert 1 + bA ** 2 + bB ** 2 < Dn ** 2; kq = 1 / EPS - (bA ** 2 + bB ** 2) / ETA; assert 0 < kq < 2
    su = EPS * LAM; small = lambda kh: 2 * Dn * su + kh * kq * su ** 2
    need = [gain[0] - kh * cap[1] - small(kh) for kh in khs]     # lower bounds of the eta_h needed
    return t, nu5, nup, gain, cap, need
def kap(spec):
    if isinstance(spec, str): d = {k: F(v) for k, v in (x.split(':') for x in spec.split(','))}; return d['10'], min(d.values())
    return F(str(spec)), F(str(spec))
print('mu in [%s, %s], gamma in [%s, %s], lambda = %s' % (float(MU[0]), float(MU[1]), float(GAM[0]), float(GAM[1]), LAM))
print()
print('### Design D* (tables/fin_table.json, chosen cases; row constants at the radius 2287/2500)')
print('| j | piece | row | t | nu5 | nu\' | gain > | cap < | share needed > | kappa_h(10) of D* | largest unassigned share over chi | eta_h needed > (D* share) | eta_h needed > (largest share) | room | refuted with eta_h = 0 |')
print('|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|')
ft = json.load(open(os.path.join(here, 'tables', 'fin_table.json'))); chosen = {(tuple(c['piece']), c['row_tag']) for c in ft['chosen']}; j = 0; hit = []; dump = []
for c in ft['cases']:
    if (tuple(c['piece']), c['row_tag']) not in chosen: continue
    j += 1; k10, kmin = kap(c['kappa']); khd, khg = 1 - k10 - F(1, 50), 1 - kmin
    row = [F(c['row'][k]) for k in ('l', 'beta', 'bA', 'bB')]
    t, nu5, nup, gain, cap, need = one(F(c['piece'][0]), F(c['piece'][1]), c['row_tag'].rstrip('0'), row, c['C'], [khd, khg])
    verdict = 'yes' if need[1] > 0 else ('yes at the share of D*' if need[0] > 0 else 'no')
    if need[0] > 0: hit.append(j)
    dump.append(dict(j=j, name=c['name'], piece=c['piece'], row_tag=c['row_tag'], t=str(t), nu5=str(nu5), gain_lo=str(gain[0]), gain_hi=str(gain[1]), cap_lo=str(cap[0]), cap_hi=str(cap[1]),
                     kappa_h_design=str(khd), kappa_h_largest=str(khg), eta_h_needed_design_share=str(need[0]), eta_h_needed_largest_share=str(need[1]), room_exact=c['room_exact']))
    print('| %d | [%.6f, %.6f] | %s | %.6f | %.7f | %.7f | %.4e | %.4e | %.4f | %.4f | %.4f | %.4e | %.4e | %.4e | %s |' % (
        j, c['a'], c['b'], c['row_tag'], float(t), float(nu5), float(nup[0]), float(gain[0]), float(cap[1]), float(gain[0] / cap[1]), float(khd), float(khg),
        float(need[0]), float(need[1]), float(F(c['room_exact'])), verdict))
print()
print('pieces of D* on which the allocation eta_h = 0 with the split of D* is refuted (given H4, H5): %s' % (', '.join(map(str, hit)) or 'none'))
print('on the other pieces these pairs do not contradict eta_h = 0; that it suffices there is not shown')
if len(sys.argv) > 1: json.dump(dump, open(sys.argv[1], 'w'), indent=1)
print()
print('### The published pieces of ledger 4.17 (rows2b.json: row constants at 95133/100000; piece ends from A_reproduce/assemble2b_rerun.log)')
print('share needed = a lower bound of the share of X = S5 - Lambda5(q) that the non-A/B sectors must have on that piece when no part of the room is given to them (necessary, not sufficient)')
print('| row | piece | t | gain > | cap < | share needed > | eta_h needed > at kappa_h = 0.18 | room |')
print('|---|---|---|---|---|---|---|---|')
r2 = json.load(open(os.path.join(here, '..', '..', 'degree5-attack', 'rows2b.json')))['rows']; Cs = {r['tag']: r for r in r2}
log = open(os.path.join(here, 'A_reproduce', 'assemble2b_rerun.log')).read(); log = log[log.index('### final: Stein family'):]
for line in log.split('\n'):
    m = re.match(r'\| row (0\.\d+) \| \[([0-9.]+), ([0-9.]+)\] \| ([0-9.]+) \| ([0-9.e+-]+) \|', line)
    if not m or m.group(1) not in Cs: continue
    tag = m.group(1); r = Cs[tag]; row = [F(x) for x in r['row'].split(',')]
    if F(tag.rstrip('0')) not in ROWS: continue
    Cv = r.get('C_stein') or r['C_plain']
    t, nu5, nup, gain, cap, need = one(F(m.group(2)), F(m.group(3)), tag.rstrip('0'), row, Cv, [F(18, 100)])
    print('| %s | [%s, %s] | %.4f | %.4e | %.4e | %.4f | %.4e | %s |' % (tag, m.group(2), m.group(3), float(t), float(gain[0]), float(cap[1]), float(gain[0] / cap[1]), float(need[0]), m.group(5)))
