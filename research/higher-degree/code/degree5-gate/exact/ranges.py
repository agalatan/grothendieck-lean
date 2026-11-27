#!/usr/bin/env python3
"""Hypothesis-free ranges of t for degree-5 games (1, -eps, eta) other than the capped one: which bounds of ledger 4.18 apply, and
where they end (exact rational arithmetic; standard library).  Radius rho0 = 2287/2500 (conjecture-K 3.7).
  (a)  4.18 (a), the direct bound, stated for every game:      V <= (1 - eta) t^2 + eps rho0^2 + eta^2/(pi eps).
  (e)  4.18e, the elliptic lift ||P21 k||^2 + (431/500)^2 t^2 <= rho*^2, a statement about pairs, with
         Parseval:  V <= (1 - eta) t^2 + eta + (eps - eta) ||P21 k||^2                                   (needs eps >= eta >= 0)
         the Lean mass inequality (25/31)||P21 k||^2 - (2141/3906)||k||^2 <= massS:
                    V <= (1 - eta) t^2 + eta (1 + massS/c) + (eps - eta e/c) ||P21 k||^2                 (needs eps > eta e/c)
       both derivations use only V <= t^2 + eps ||P21 k||^2 + eta ||P32 h||^2 and ||P32 h||^2 <= 1 - ||k||^2 - t^2, so they hold
       for every game; the formulas are those of verify_elliptic_cutoffs.py with (eps, eta) as parameters.
  (f)  4.18f: the verifier's box proof is RUN with E, H, LIMIT replaced.  Its proof was written for the capped game; that its
       steps (the monotonicity checks it asserts itself) carry over is NOT re-derived here: the endpoint is reported as "the
       verifier accepts", label R, not as a theorem.
  (t)  the endpoint tangent of 4.18d with b_A = b_B = xi = 0 (quintic-tangent-codex-a7c4/PROOF.md, equations (1)-(3), whose
       derivation uses only e, eta > 0): with g*(T) = l + beta (T - 2) + eta mu gamma B(T) >= m > 0 on [0, oo),
       sqrt(pi)/m <= 1/e (the cubic form absorbed) and sqrt(pi)/m < 1/eta (the quintic square absorbed),
           V <= P(t) = t^2 - 2 l t + 2 beta^2/e + 2 mu (l - beta/2) + 3 eta mu^2/64      for every pair of visible mass t.
       With beta >= 3 eta mu/8 the floor is m = g*(0) = l - 2 beta + 3 eta mu/8.  P increases with mu and decreases on [0, mu]
       (l > mu), so P(t0) < target at the upper bound of mu proves V < target on [t0, mu]; mu from mu_bounds() of
       quintic-tangent-codex-a7c4/verify.py (Machin).  The endpoint t0 is the smallest 8-decimal grid point that passes; the
       negative control: t0 - 10^-8 fails even at the lower bound of mu.  Control: the capped game with (l, beta) = (17/10,
       17/100) at 500/701 gives 0.88527103 (PROOF.md, after (3)).
  (c)  4.18c (buffer surplus) and (d) 4.18d (large t) use constants and rows fitted to the capped game: (d) is tested by running
       verify.py / verify_coupled.py with EPS, ETA, TARGET replaced; the first failing requirement is printed.
Control: the capped game at 500/701 must give 0.250885, 0.34554022, 0.35859076, 0.36495 and pass (d).
usage: python3 -I ranges.py"""
import os, sys, io, re, contextlib, importlib.util
from fractions import Fraction as F
from math import isqrt
HERE = os.path.dirname(os.path.abspath(__file__)); CODE = os.path.join(HERE, '..', '..'); RHO = F(2287, 2500); INVPI_UP = F(318309887, 10 ** 9)
ME, MC = F(25, 31), F(1, 2) + 2 * F(47, 1953); MS = F(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
GAMES = [('capped (39/50, 779/10000)', F(39, 50), F(779, 10000), [('1.402', F(500, 701)), ('1.4025', F(10000, 14025))]),
         ('ridge B (41/50, 97/500)', F(41, 50), F(97, 500), [('1.4025', F(10000, 14025)), ('1.403', F(1000, 1403))]),
         ('A2 (106/125, 559/2000) = (0.848, 0.2795)', F(106, 125), F(559, 2000), [('1.4025', F(10000, 14025)), ('1.403', F(1000, 1403))]),
         ('A1 (0.84896, 0.2818)', F('0.84896'), F('0.2818'), [('1.4025', F(10000, 14025)), ('1.403', F(1000, 1403))]),
         ('A (8493/10000, 2827/10000)', F(8493, 10000), F(2827, 10000), [('1.4025', F(10000, 14025)), ('1.403', F(1000, 1403))])]
class Fail(ArithmeticError):
    """a failed requirement; the message names the requirement (checked by the negative controls)."""
def require(cond, msg):
    if not cond: raise Fail(msg)
def cut(intercept, slope, tg, digits):
    """largest n/10^digits with intercept + slope t^2 < tg (slope > 0); None if intercept >= tg."""
    if intercept >= tg: return None
    s = 10 ** digits; sq = (tg - intercept) * s * s / slope; n = isqrt((sq.numerator - 1) // sq.denominator)
    require(intercept + slope * F(n, s) ** 2 < tg <= intercept + slope * F(n + 1, s) ** 2, 'cut bracket')
    return F(n, s)
def load(path, name):
    sp = importlib.util.spec_from_file_location(name, path); m = importlib.util.module_from_spec(sp); sp.loader.exec_module(m); return m
js = load(os.path.join(CODE, 'joint-spectral-cubic-lift-codex-a7c4', 'verify.py'), 'js')
pool = js.witnesses(open(os.path.join(CODE, '..', '..', '..', 'Grothe', 'Lower', 'MassWitnessData.lean')).read())
def spectral(eps, eta, tg, t0):
    js.E, js.H, js.LIMIT = eps, eta, tg
    def ok(t):
        try: js.prove(pool, RHO, t0, t, F(13, 2)); return True
        except (ArithmeticError, RecursionError): return False
    s = 10 ** 5; lo, up = int(t0 * s), int(F(6, 10) * s)
    try:
        if not ok(F(lo + 1, s)): return None
        while up - lo > 1:
            m = (lo + up) // 2
            if ok(F(m, s)): lo = m
            else: up = m
        return F(lo, s) if ok(F(lo, s)) and not ok(F(lo + 1, s)) else None
    finally: js.E, js.H, js.LIMIT = F(39, 50), F(779, 10000), F(500, 701)
def large_t(eps, eta, tg):
    """run verify.py and verify_coupled.py of 4.18d with EPS, ETA, TARGET replaced (text substitution in a copy held in memory)."""
    d = os.path.join(CODE, 'quintic-tangent-codex-a7c4'); res = []
    for fn in ('verify.py', 'verify_coupled.py'):
        src = open(os.path.join(d, fn)).read()
        if fn == 'verify.py':
            src = src.replace('EPS = Q(39, 50)', 'EPS = Q(%d, %d)' % (eps.numerator, eps.denominator)).replace('ETA = Q(779, 10000)', 'ETA = Q(%d, %d)' % (eta.numerator, eta.denominator)).replace('TARGET = Q(500, 701)', 'TARGET = Q(%d, %d)' % (tg.numerator, tg.denominator))
            base_src = src
        else:
            src = src.replace("base = runpy.run_path(str(Path(__file__).with_name('verify.py')))", 'base = BASE')
        env = {'__name__': '__main__', '__file__': os.path.join(d, fn)}
        if fn == 'verify_coupled.py':
            b = {'__name__': 'base', '__file__': os.path.join(d, 'verify.py')}; exec(compile(base_src, 'verify.py', 'exec'), b); env['BASE'] = b
        try:
            with contextlib.redirect_stdout(io.StringIO()): exec(compile(src, fn, 'exec'), env)
            res.append('%s: all requirements pass' % fn)
        except ArithmeticError as e: res.append('%s: fails at "%s"' % (fn, e))
    return res
tq = load(os.path.join(CODE, 'quintic-tangent-codex-a7c4', 'verify.py'), 'tq'); MU_LO, MU_HI = tq.mu_bounds()
TANGENT = {'capped': (F(17, 10), F(17, 100)), 'ridge B': (F(9, 5), F(182, 1000)), 'A2': (F(9, 5), F(188, 1000)), 'A1': (F(9, 5), F(188, 1000)), 'A (': (F(9, 5), F(188, 1000))}
def tangent(eps, eta, l, beta, tg):
    """smallest 8-decimal t0 with P(t) < tg on [t0, mu], or None; checks the premises with directed bounds for mu."""
    require(beta >= 3 * eta * MU_HI / 8, 'floor of g* not at T = 0')
    m = l - 2 * beta + 3 * eta * MU_LO / 8                     # smallest value of the floor over the mu interval
    require(m > 0, 'floor of g* not positive')
    require(2 * MU_HI <= m / eps, 'cubic form not absorbed')
    require(2 * MU_HI < m / eta, 'quintic square not absorbed')
    require(l > MU_HI, 'parabola not decreasing on [0, mu]')
    P = lambda t, mu: t * t - 2 * l * t + 2 * beta * beta / eps + 2 * mu * (l - beta / 2) + 3 * eta * mu * mu / 64
    if P(MU_LO, MU_HI) >= tg: return None
    lo, hi = 0, int(MU_LO * 10 ** 8)                             # P(hi/1e8, MU_HI) < tg; bisect the first passing grid point
    if P(F(lo), MU_HI) < tg: return F(0)
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if P(F(mid, 10 ** 8), MU_HI) < tg: hi = mid
        else: lo = mid
    t0 = F(hi, 10 ** 8); require(P(t0, MU_HI) < tg, 'endpoint passes'); require(P(t0 - F(1, 10 ** 8), MU_LO) >= tg, 'negative control: t0 - 1e-8 fails')
    return t0
for name, eps, eta, tgs in GAMES:
    print(name)
    for tn, tg in tgs:
        a = cut(eps * RHO ** 2 + eta ** 2 / eps * INVPI_UP, 1 - eta, tg, 6)
        wp, wm = eps - eta, eps - eta * ME / MC; require(wp > 0 and wm > 0, '4.18e weights')
        sp = 1 - eta - wp * F(431, 500) ** 2; sm = 1 - eta - wm * F(431, 500) ** 2; require(sp > 0 and sm > 0, '4.18e slopes')
        p = cut(eta + wp * RHO ** 2, sp, tg, 8); m = cut(eta * (1 + MS / MC) + wm * RHO ** 2, sm, tg, 8)
        f = spectral(eps, eta, tg, F((m * 1000).__floor__(), 1000)) if m is not None else None
        fmt = lambda x, d: ('%.*f' % (d, float(x))) if x is not None else 'none (above the target at t = 0)'
        print('  target %-6s (a) direct: t <= %s | (e) Parseval: t <= %s | (e) mass: t <= %s | (f) verifier accepts: t <= %s' % (tn, fmt(a, 6), fmt(p, 8), fmt(m, 8), fmt(f, 5) if f is not None else ('not accepted beyond the mass cutoff' if m is not None else 'not run (no start)')))
        print('    values at t = 0: direct %.6f, Parseval %.6f, mass %.6f; target value %.6f' % (float(eps * RHO ** 2 + eta ** 2 / eps * INVPI_UP), float(eta + wp * RHO ** 2), float(eta * (1 + MS / MC) + wm * RHO ** 2), float(tg)))
        print('    (d) large t: ' + '; '.join(large_t(eps, eta, tg)))
        l, beta = [v for k, v in TANGENT.items() if name.startswith(k)][0]; t0 = tangent(eps, eta, l, beta, tg)
        print('    (t) endpoint tangent (l, beta) = (%s, %s): V < target for every pair with t >= %s' % (l, beta, ('%.8f' % t0) if t0 is not None else 'none'))
    if name.startswith('capped'):
        print('  control: 0.250885, 0.34554022, 0.35859076, 0.36495 at 1.402 are the certified endpoints of ledger 4.18a, e, f')
        c = tangent(eps, eta, F(17, 10), F(17, 100), F(500, 701)); require(c == F(88527103, 10 ** 8), 'control (t): %s' % c)
        print('  control (t): the capped game with (17/10, 17/100) at 500/701 gives %.8f, as PROOF.md after (3)' % c)
        for args, why, label in (((eps, eta, F(17, 10), F(1, 100)), 'floor of g* not at T = 0', 'beta = 1/100'),
                                 ((F(1, 2), F(9, 10), F(9, 5), F(32, 100)), 'quintic square not absorbed', '(e, eta, l, beta) = (1/2, 9/10, 9/5, 8/25)'),
                                 ((F(9, 10), F(1, 10), F(9, 5), F(66, 100)), 'cubic form not absorbed', '(e, eta, l, beta) = (9/10, 1/10, 9/5, 33/50)')):
            try:
                tangent(*args, F(1000, 1403)); raise Fail('negative control accepted: ' + label)
            except Fail as e:
                if str(e) != why: raise SystemExit('negative control %s failed for the wrong reason: %s' % (label, e))
            print('  negative control (t): %s is rejected (%s)' % (label, why))
