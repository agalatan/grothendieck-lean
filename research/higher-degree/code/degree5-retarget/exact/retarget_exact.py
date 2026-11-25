#!/usr/bin/env python3
"""The capped degree-5 game (1, -39/50, 779/10000) at targets above 500/701: exact rational arithmetic only (standard library).
Everything is computed from committed files: the 26 certified row constants of ledger 4.42 (certB_const/out/rec_*.json; label C,
author only), the 21 pieces of the design D* (tables/fin_table.design.json), the funded parts of ledger 4.44 (tables/
zero_content_budget.json), and the formulas of the verifiers of ledger 4.18a, 4.18c, 4.18d, 4.18e, 4.18f, which are imported or
copied with the target as the only change; each copy is first checked against the endpoint its verifier certifies at 500/701.
A cutoff printed here is the largest grid point at which the SAME inequality holds with the new target, with the next grid point
shown to fail: it is what those proofs give without retuning their rows, not the best a retuned proof could give.
usage (from the repository root or anywhere): python3 -I retarget_exact.py [OUT.json]"""
import sys, os, json, runpy, importlib.util
from fractions import Fraction as F
from math import isqrt
HERE = os.path.dirname(os.path.abspath(__file__)); CODE = os.path.join(HERE, '..', '..')
DSGN = os.path.join(CODE, 'degree5-design', 'design-2026-11-25'); CERT = os.path.join(DSGN, 'certB_const')
EPS, ETA, RHO = F(39, 50), F(779, 10000), F(2287, 2500)
TARGETS = [('1.402', F(500, 701)), ('1.4021', F(10000, 14021)), ('1.4023', F(10000, 14023)), ('1.4025', F(10000, 14025)), ('1.4027', F(10000, 14027))]
def require(c, m):
    if not c: raise ArithmeticError(m)
def load(path, name):
    sp = importlib.util.spec_from_file_location(name, path); m = importlib.util.module_from_spec(sp); sp.loader.exec_module(m); return m
out = dict(game='(1, -39/50, 779/10000)', radius='2287/2500', targets=[n for n, _ in TARGETS])
fl = lambda x, d=10: '%.*f' % (d, float(x))

# ---------------------------------------------------------------- 1. the envelope and the rooms of D*
spec = json.load(open(os.path.join(CERT, 'rows2c.json'))); rows = {}
for r in spec['rows']:
    d = json.load(open(os.path.join(CERT, 'out', 'rec_%s.json' % r['tag']))); rows[r['tag']] = (F(r['l']), F(d['C']))
require(len(rows) == 26, '26 row constants')
val = lambda tag, t: t * t - 2 * rows[tag][0] * t + rows[tag][1]
TOP = F(886227, 10 ** 6)
pieces = [(F(a), F(b), tag) for a, b, tag in json.load(open(os.path.join(DSGN, 'tables', 'fin_table.design.json')))['pieces']]
require(all(pieces[i][1] == pieces[i + 1][0] for i in range(20)) and pieces[0][0] == F(649, 1000) and pieces[-1][1] >= TOP, 'the 21 pieces are contiguous from 649/1000')
ref = json.load(open(os.path.join(CERT, 'out', 'envelope_design_fin_table.json')))['design']
pmax = []
for j, (a, b, tag) in enumerate(pieces):
    m = max(val(tag, a), val(tag, min(b, TOP)))          # a parabola with leading coefficient 1: its maximum on a piece is at an end
    require(F(500, 701) - m == F(ref[j]['rooms_exact'][0]), 'piece %d: the room at 500/701 equals the committed one' % (j + 1))
    pmax.append(m)
B = max(pmax); jB = pmax.index(B)
# the full min-envelope of the 26 rows from 649/1000 (independent of the assignment): its maximum cannot be below that of D* pieces 9-21
def envelope_max(t0):
    tags = sorted(rows); cuts = {t0, TOP}
    for i, x in enumerate(tags):
        for y in tags[i + 1:]:
            (l1, c1), (l2, c2) = rows[x], rows[y]
            if l1 != l2:
                t = (c1 - c2) / (2 * (l1 - l2))
                if t0 < t < TOP: cuts.add(t)
    return max(min(val(x, t) for x in tags) for t in sorted(cuts))
Benv = envelope_max(F(81, 100))
require(Benv == B, 'the maximum of D* is the maximum of the min-envelope of all rows on [0.81, 0.886227]')
Kmax = 1 / B; k6 = (Kmax * 10 ** 6).__floor__()
print('1. THE ENVELOPE (exact, from the row constants of ledger 4.42)')
print('   B5 = max over the pieces of D* = %s at the ends of piece %d (row %s on [%s, %s])' % (fl(B, 13), jB + 1, pieces[jB][2], fl(pieces[jB][0], 6), fl(pieces[jB][1], 6)))
print('   K_max = 1/B5 = %s: with zero sector cost on every row the design proves K > x only for x < 1/B5; %d/10^6 < 1/B5 < %d/10^6' % (fl(Kmax, 10), k6, k6 + 1))
require(F(k6, 10 ** 6) < Kmax < F(k6 + 1, 10 ** 6), 'bracket of 1/B5')
out['B5'] = str(B); out['B5_float'] = float(B); out['Kmax_floor6'] = k6
budget = {b['j']: b for b in json.load(open(os.path.join(DSGN, 'tables', 'zero_content_budget.json'))) if 'j' in b and str(b.get('name', '')).startswith('_fin')}
fund = {j: F(budget[j]['gain_hi']) for j in budget if F(budget[j]['eta_h_needed_design_share']) > 0}
require(sorted(fund) == list(range(1, 12)), 'the funded pieces are 1-11')
print('   rooms of the 21 pieces (target value minus the maximum of the row on the piece), in units 1e-4; in brackets: the room left after the')
print('   funded part eta_h of ledger 4.44 (the whole gain of the zero-content pairs at the upper end of the piece; pieces 1-11)')
print('   piece        row     eta_h   ' + '   '.join('%-15s' % n for n, _ in TARGETS))
out['pieces'] = []
for j, (a, b, tag) in enumerate(pieces, 1):
    rm = [tg - pmax[j - 1] for _, tg in TARGETS]; eh = fund.get(j, F(0))
    print('   %2d [%.4f,%.4f] %s %7.3f   ' % (j, float(a), float(min(b, TOP)), tag, float(eh) * 1e4) + '   '.join('%7.3f [%6.3f]' % (float(x) * 1e4, float(x - eh) * 1e4) for x in rm))
    out['pieces'].append(dict(j=j, a=str(a), b=str(min(b, TOP)), row=tag, max=str(pmax[j - 1]), eta_h=str(eh), rooms=[str(x) for x in rm], rooms_float=[float(x) for x in rm], left_float=[float(x - eh) for x in rm]))
for i, (n, tg) in enumerate(TARGETS):
    rm = [tg - m for m in pmax]; lf = [tg - m - fund.get(j + 1, F(0)) for j, m in enumerate(pmax)]
    jm = rm.index(min(rm)); jl = lf.index(min(lf))
    print('   target %-6s: smallest room %.4e (piece %d, row %s); smallest room left after funding %.4e (piece %d, row %s); pieces without room left: %s'
          % (n, float(min(rm)), jm + 1, pieces[jm][2], float(min(lf)), jl + 1, pieces[jl][2], [j + 1 for j, x in enumerate(lf) if x <= 0] or 'none'))
out['funded_no_room'] = {n: [j + 1 for j, m in enumerate(pmax) if tg - m - fund.get(j + 1, F(0)) <= 0] for n, tg in TARGETS}

# ---------------------------------------------------------------- 2. small t: where the hypothesis-free range stops
print('\n2. SMALL t: the largest t with V < target and no sector hypothesis, per target (radius 2287/2500)')
def grid_cut(ok, digits, hi=F(1, 2)):
    """largest n/10^digits in (0, hi) with ok true, by bisection on the grid; checks ok(n) and not ok(n + 1)."""
    s = 10 ** digits; lo, up = 0, int(hi * s)
    if not ok(F(lo, s)): return None
    require(not ok(F(up, s)), 'upper end of the search fails')
    while up - lo > 1:
        m = (lo + up) // 2
        if ok(F(m, s)): lo = m
        else: up = m
    require(ok(F(lo, s)) and not ok(F(lo + 1, s)), 'pass at the cutoff, fail one grid step beyond')
    return F(lo, s)
INVPI_UP = F(318309887, 10 ** 9); require(INVPI_UP * F(314159265358979, 10 ** 14) > 1, '1/pi < 318309887/10^9')
b_dir = EPS * RHO ** 2 + ETA ** 2 / EPS * INVPI_UP
direct = [grid_cut(lambda t, tg=tg: (1 - ETA) * t * t + b_dir < tg, 6) for _, tg in TARGETS]
require(direct[0] == F(250885, 10 ** 6), '4.18a: 0.250885 at 500/701')
# 4.18c: the uniform saving 9/10000 (its proof does not involve the target); the verifier's own cutoff_slack with the target replaced
buf = load(os.path.join(CODE, 'buffer-surplus-codex-a7c4', 'verify.py'), 'buf')
def buf_ok(t, tg):
    buf.TARGET = tg
    try: buf.cutoff_slack(RHO, t, buf.SAVING); return True
    except Exception: return False
    finally: buf.TARGET = F(500, 701)
buffer_ = [grid_cut(lambda t, tg=tg: buf_ok(t, tg), 5) for _, tg in TARGETS]
require(buffer_[0] == F(25282, 10 ** 5), '4.18c: 0.25282 at 500/701')
# 4.18e: the elliptic lift; the formula of verify_elliptic_cutoffs.largest_strict_cutoff with the target as a parameter
MASS_E, MASS_C = F(25, 31), F(1, 2) + 2 * F(47, 1953)
MASS_S = F(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
def ell_cut(weight, offset, tg):
    carrier = F(431, 500); intercept = offset + weight * RHO ** 2; slope = 1 - ETA - weight * carrier ** 2
    require(weight > 0 and slope > 0 and tg > intercept, 'signs of the payoff majorant')
    sq = (tg - intercept) * 10 ** 16 / slope; n = isqrt((sq.numerator - 1) // sq.denominator)
    require(intercept + slope * F(n, 10 ** 8) ** 2 < tg < intercept + slope * F(n + 1, 10 ** 8) ** 2, 'strict bracket')
    return F(n, 10 ** 8)
pars = [ell_cut(EPS - ETA, ETA, tg) for _, tg in TARGETS]
mass = [ell_cut(EPS - ETA * MASS_E / MASS_C, ETA * (1 + MASS_S / MASS_C), tg) for _, tg in TARGETS]
require(pars[0] == F(34554022, 10 ** 8) and mass[0] == F(35859076, 10 ** 8), '4.18e: 0.34554022 and 0.35859076 at 500/701')
# 4.18f: the verifier's own box proof with LIMIT replaced; start of the boxes = the 4.18e mass cutoff rounded down to 3 decimals
js = load(os.path.join(CODE, 'joint-spectral-cubic-lift-codex-a7c4', 'verify.py'), 'js')
pool = js.witnesses(open(os.path.join(CODE, '..', '..', '..', 'Grothe', 'Lower', 'MassWitnessData.lean')).read())
def js_ok(t_end, tg, t0, y):
    js.LIMIT = tg
    try: js.prove(pool, RHO, t0, t_end, y); return True
    except (ArithmeticError, RecursionError): return False
    finally: js.LIMIT = F(500, 701)
spectral = []
for (n, tg), mcut in zip(TARGETS, mass):
    t0 = F((mcut * 1000).__floor__(), 1000); s = 10 ** 5; lo, up = int(t0 * s) + 1, int(F(1, 2) * s)
    require(js_ok(F(lo, s), tg, t0, F(13, 2)) and not js_ok(F(up, s), tg, t0, F(13, 2)), '4.18f bracket')
    while up - lo > 1:
        m = (lo + up) // 2
        if js_ok(F(m, s), tg, t0, F(13, 2)): lo = m
        else: up = m
    require(js_ok(F(lo, s), tg, t0, F(13, 2)) and not js_ok(F(lo + 1, s), tg, t0, F(13, 2)), '4.18f: pass at the cutoff, fail one step beyond')
    spectral.append((F(lo, s), t0))
require(spectral[0][0] >= F(36495, 10 ** 5), '4.18f: at least 0.36495 at 500/701')
print('   target   4.18a direct   4.18c buffer   4.18e Parseval   4.18e mass     4.18f spectral (boxes from)   width of H2 = (4.18f end, 0.649)')
out['small_t'] = []
for i, (n, tg) in enumerate(TARGETS):
    print('   %-6s   %s       %s        %s       %s     %s (%s)             %s' % (n, fl(direct[i], 6), fl(buffer_[i], 5), fl(pars[i], 8), fl(mass[i], 8), fl(spectral[i][0], 5), fl(spectral[i][1], 3), fl(F(649, 1000) - spectral[i][0], 5)))
    out['small_t'].append(dict(target=n, direct=str(direct[i]), buffer=str(buffer_[i]), parseval=str(pars[i]), mass=str(mass[i]), spectral=str(spectral[i][0]), spectral_from=str(spectral[i][1]), H2_width=str(F(649, 1000) - spectral[i][0])))
print('   (each cutoff passes its inequality and the next grid point fails it; the 4.18f search is a bisection on the 10^-5 grid of an')
print('    adaptive box proof, so its cutoff is "the largest found with a failing neighbour", not a proved maximum of that method;')
print('    at 500/701 the same search gives %s, the verifier certifies 0.36495)' % fl(spectral[0][0], 5))

# ---------------------------------------------------------------- 3. large t: the sector-free upper endpoint (4.18d)
print('\n3. LARGE t: the sector-free range [t_d, sqrt(pi)/2] of ledger 4.18d, rows not retuned')
qt = runpy.run_path(os.path.join(CODE, 'quintic-tangent-codex-a7c4', 'verify.py'), run_name='qt')
mu_lo, mu_hi = qt['mu_bounds'](); payoff = qt['payoff']
def big_cut(ell, beta, tg):
    """smallest 8-decimal t with payoff(t, mu_hi) < target (the payoff decreases in t for t < ell); None if it fails at sqrt(pi)/2."""
    require(ell > mu_hi and ell > beta / 2, 'monotonicity')
    if not payoff(mu_lo, ell, beta, mu_hi) < tg: return None
    s = 10 ** 8; lo, up = int(F(1, 2) * s), int(mu_lo * s)
    require(not payoff(F(lo, s), ell, beta, mu_hi) < tg, 'fails at 1/2')
    while up - lo > 1:
        m = (lo + up) // 2
        if payoff(F(m, s), ell, beta, mu_hi) < tg: up = m
        else: lo = m
    require(payoff(F(up, s), ell, beta, mu_hi) < tg and payoff(F(up - 1, s), ell, beta, mu_lo) > tg, 'pass at the cutoff, fail one step below (with the lower bound of mu)')
    return F(up, s)
ROWS_D = [('coupled tangent (PR #661)', F('1.28353'), F('.171585')), ('split tangent', F('1.42852'), F('.172')), ('plain tangent', F('1.7'), F('.17'))]
exp = [F('.88425210'), F('.88477644'), F('.88527103')]; out['large_t'] = []
for (nm, ell, beta), e in zip(ROWS_D, exp):
    cuts = [big_cut(ell, beta, tg) for _, tg in TARGETS]; require(cuts[0] == e, '4.18d: %s at 500/701' % e)
    print('   %-26s ' % nm + '   '.join('%s: %s' % (n, fl(c, 8) if c else 'no range') for (n, _), c in zip(TARGETS, cuts)))
    out['large_t'].append(dict(row=nm, cuts=[str(c) if c else None for c in cuts]))
cuts_c = [big_cut(ROWS_D[0][1], ROWS_D[0][2], tg) for _, tg in TARGETS]
print('   the absorption conditions of these rows do not involve the target; the last piece of D* (row 0.886) ends at 0.886227 >= sqrt(pi)/2,')
print('   so H-free coverage at the top is [t_d, sqrt(pi)/2] and the pieces of D* reaching above t_d are covered twice')
# the small-energy statement (u <= 3/5000 on [0.81, sqrt(pi)/2]) with the verifier's two rows and intervals
sch = runpy.run_path(os.path.join(CODE, 'quintic-tangent-codex-a7c4', 'verify_schur.py'), run_name='sch')
rws = json.loads(open(os.path.join(CODE, 'degree5-attack', 'rows2b.json')).read(), parse_float=F)['rows']; elo, ehi = sch['exp_grid']()
print('   small remote cubic energy u (verifier of 4.18d, rows 0.845 on [0.81, 0.86] and 0.860 on [0.86, 0.886227]): margin at u = 0 and the largest u allowed')
out['small_energy'] = []
for tag, ends in (('0.845', (F('.81'), F('.86'))), ('0.860', (F('.86'), sch['MU_HI']))):
    row = next(r for r in rws if F(r['t']) == F(tag)); ell, beta, ba, bb = map(F, row['row'].split(','))
    q = sch['residuals'](ell, beta, ba, bb, elo, ehi)[0]
    base = sch['intercept'](sch['MU_HI'], ell, beta) + max(t * t - 2 * ell * t for t in ends)
    ms = [tg - base for _, tg in TARGETS]; us = [m / q[1] for m in ms]
    require(ms[0] - q[1] * F(6, 10000) > 0, 'the published statement u <= 3/5000 at 500/701')
    print('   row %s: ' % tag + '   '.join('%s: margin %.3e, u <= %s' % (n, float(m), ('%.3e' % float(u)) if u > 0 else 'none (margin <= 0)') for (n, _), m, u in zip(TARGETS, ms, us)))
    out['small_energy'].append(dict(row=tag, margins=[float(m) for m in ms], umax=[float(u) for u in us]))

# ---------------------------------------------------------------- 4. the necessary t = 0 test and other targets
print('\n4. THE t = 0 TEST lambda_1 rho0^2 <= 1/K (necessary for every row certificate of this type; ledger 4.12), rho0 = 2287/2500')
for n, K in (('1.402', F(1402, 1000)), ('1.4027', F(14027, 10000)), ('1.403', F(1403, 1000)), ('1.4035', F(14035, 10000)), ('1.4036', F(14036, 10000)), ('1.404', F(1404, 1000))):
    cap = (1 / K) / RHO ** 2
    print('   K = %-6s: lambda_1 <= %s = %s' % (n, cap, fl(cap, 7)))
json.dump(out, open(sys.argv[1], 'w'), indent=1) if len(sys.argv) > 1 else None
