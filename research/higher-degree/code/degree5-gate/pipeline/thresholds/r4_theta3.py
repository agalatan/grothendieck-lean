#!/usr/bin/env python3
"""The allowance theta_room(u) of a band row on a fine grid of chi, with the binding chi (N).  claude-b9ee worker d5newcap, 16 Nov 2026.

DEFINITION (the reviewer's): theta_room(u) = the largest theta for which (F) plus the hypothesis ||c_X||^2 <= theta delta
Omhat_X in both sectors keeps the row inside its room at the energy u, within the law-layer relaxation (moments, Stein
family, response cap, Rice family (R1) at t_lo; kappa_AB, tilt and pointwise mu as given): sufficient for the row, not
necessary.  theta_0(u): the same with room 0.
Changes against r4_theta2.py (= the content worker's r4_theta.py): (i) chi runs over 15 values from 1 to 42 (the coarse grid
2, 8, 16, 30, 42 missed binding values, reviewer's note); (ii) every cell (u, chi) is first tested for a possible law
(rice.feasible_margin >= 0), cells without one are left out and counted; (iii) the binding chi is reported; (iv) the level
crossing is bracketed on a coarse subset of chi and refined by regula falsi on an ACTIVE set (the chi whose own crossing
comes first); then EVERY possible chi is evaluated at the result and the active set is enlarged until none exceeds the
level: the same number as a full scan at a fraction of the cost (the excess is nondecreasing in theta for each chi).
Gamma' is the exact derivative (tables of prof2.py); combo.prof_derivs refuses anything else.
usage (cwd = a game/variant folder with out/prof_<k>.npz and band_rows.json, or BAND_ROWS=file):
    D5_E1=.. D5_ETA=.. r4_theta3.py k energies [chis] [tag]      energies: u/u*, or cX = X times the response cap
    env: KAPPA_AB (default: the row's 'kappa' or 0.82), R4_ZERO=1 (also theta_0), R4_TOL (relative tolerance, default 0.01)"""
import sys, os, json, time, warnings; warnings.filterwarnings('ignore')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, rowlib as R, lawstein as LS, combo as C, combo3 as C3, rice as RI, t4lib as T4
CHI15 = [1.0, 2.0, 3.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 20.0, 24.0, 30.0, 36.0, 42.0]

class Cell:
    """excess(theta, chi) at one energy, cached."""
    def __init__(self, row, U, u, mu, kappa, profs, tlo):
        self.a = (row, U, u); self.mu, self.kappa, self.profs, self.tlo = mu, kappa, profs, tlo
        self.kprofs = (T4.Profile(profs[0], u), T4.Profile(profs[2], u)); self.cache = {}; self.nsolve = 0
    def __call__(self, th, chi):
        key = (round(th, 12), chi)
        if key not in self.cache:
            row, U, u = self.a
            best, aux = C3.solve_point_t4(row, U, u, chi, th, self.mu, self.kappa, self.profs, self.kprofs, self.tlo); self.nsolve += 1
            self.cache[key] = None if (best is None or best == 'fail') else best[0] / (4 * self.mu)
        return self.cache[key]
    def worst(self, th, chis):
        vals = [(self(th, c), c) for c in chis]; vals = [v for v in vals if v[0] is not None]
        return max(vals) if vals else (None, None)

def crossing(cell, chis, level, th0, tol, step=1.5):
    """largest theta with max_chi excess(theta, chi) <= level (chis: the cells with a possible law).
    Returns (theta, binding chi, (lo, hi)).  All chi are evaluated at both ends of the first bracket and again at the result."""
    sub = [c for c in chis if c in (1.0, 4.0, 8.0, 16.0, 30.0, 36.0, 42.0)] or list(chis)      # bracketing: a coarse subset; every chi is evaluated at the result
    if max(chis) not in sub: sub.append(max(chis))
    def allv(th):
        v = [(cell(th, c), c) for c in sub]; v = [a for a in v if a[0] is not None]
        return (max(v)[0] if v else None)
    th = th0; v = allv(th); lo = hi = None
    for _ in range(24):                                   # bracket with every chi
        if v is None: return None, None, None
        if v <= level: lo = th
        else: hi = th
        if lo is not None and hi is not None: break
        th = th * step if hi is None else th / step; v = allv(th)
    if lo is None or hi is None: return (lo if hi is None else None), None, (lo, hi)      # no crossing within step^24
    lo0 = lo
    # the chi whose own crossing (chord between the bracket ends) comes first are the candidates for the binding one
    def chord(c):
        a_, b_ = cell(lo, c), cell(hi, c)
        if a_ is None or b_ is None or b_ <= level: return float('inf')
        return lo + (hi - lo) * (level - a_) / (b_ - a_)
    active = sorted(sub, key=chord)[:3]
    while True:
        f = lambda th_: max(v_ for v_ in (cell(th_, c) for c in active) if v_ is not None)
        a_, b_ = lo, hi
        for _ in range(10):                               # regula falsi on the active set, safeguarded
            if b_ - a_ <= tol * a_: break
            fa, fb = f(a_), f(b_)
            x = a_ + (b_ - a_) * (level - fa) / (fb - fa) if fb > fa else (a_ + b_) / 2
            x = min(max(x, a_ + 0.1 * (b_ - a_)), b_ - 0.1 * (b_ - a_))
            if f(x) <= level: a_ = x
            else: b_ = x
        bad = [(cell(a_, c), c) for c in chis if c not in active]; bad = [z for z in bad if z[0] is not None and z[0] > level + 1e-9]
        if not bad:
            vh = [(cell(b_, c), c) for c in active]; vh = [z for z in vh if z[0] is not None]
            return a_, max(vh)[1], (a_, b_)
        active.append(max(bad)[1]); lo, hi = lo0, a_          # the crossing lies below a_: all chi are within the level at lo0

if __name__ == '__main__':
    k = int(sys.argv[1]); fr = sys.argv[2].split(',')
    chis = [float(x) for x in sys.argv[3].split(',')] if len(sys.argv) > 3 and sys.argv[3] not in ('', '-') else CHI15
    tag = sys.argv[4] if len(sys.argv) > 4 else ''
    cfg = json.load(open(os.environ.get('BAND_ROWS', 'band_rows.json'))); rw = cfg['rows'][str(k)]; s, t = cfg['tilt']
    tl, mu, tlo, room = rw['t'], rw['mu'], rw['tlo'], rw['room']
    kap = float(os.environ['KAPPA_AB']) if os.environ.get('KAPPA_AB') else float(rw.get('kappa', 0.82))
    tol = float(os.environ.get('R4_TOL', 0.015)); want0 = os.environ.get('R4_ZERO', '0') == '1'
    row = R.Row(rw.get('prof', 'out/prof_%d.npz' % k)); profs = C.prof_derivs(row, s, t); U = LS.ugrid()
    ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo); out = []; th_prev = float(os.environ.get('THETA_START', rw.get('theta_start', 0.5)))
    for f in fr:
        t0 = time.time()
        u = (min(float(f[1:]), 0.999) * ucap) if f.startswith('c') else min(float(f) * row.ustar, 0.999 * ucap)
        fm = {c: RI.feasible_margin(U, u, c, tlo) for c in chis}; poss = [c for c in chis if fm[c] is not None and fm[c] >= -1e-9]
        rec = dict(u=u, ufrac=u / row.ustar, ucapfrac=u / ucap, possible=poss, impossible=[c for c in chis if c not in poss], theta_room=None, chi_room=None, theta_zero=None, chi_zero=None)
        if poss:
            cell = Cell(row, U, u, mu, kap, profs, tlo)
            th, chi_b, br = crossing(cell, poss, room, th_prev, tol, float(os.environ.get('R4_STEP', 1.3))); rec.update(theta_room=th, chi_room=chi_b, bracket=br)
            if th: th_prev = th
            if want0:
                th0_, chi0, br0 = crossing(cell, poss, 0.0, (th or th_prev) * 0.85, tol, 1.25); rec.update(theta_zero=th0_, chi_zero=chi0)
            if th: rec['excess_by_chi'] = {str(c): cell(th, c) for c in poss}
            rec['nsolve'] = cell.nsolve
        out.append(rec)
        print('t=%s kappa_AB=%.3f u/u*=%.3f u/cap=%.3f: %d of %d chi have a possible law%s | theta_room %s (binding chi %s)%s  [%.0fs]' % (
            tl, kap, u / row.ustar, u / ucap, len(poss), len(chis), (' (none for chi >= %g)' % min(rec['impossible'])) if rec['impossible'] and min(rec['impossible']) > max(poss or [0]) else
            ((' (none: %s)' % ','.join('%g' % c for c in rec['impossible'])) if rec['impossible'] else ''),
            ('%.4f' % rec['theta_room']) if rec['theta_room'] else ('no possible law' if not poss else 'none'), ('%g' % rec['chi_room']) if rec['chi_room'] else '-',
            (' | theta_0 %.4f (chi %s)' % (rec['theta_zero'], '%g' % rec['chi_zero'] if rec['chi_zero'] else '-')) if rec.get('theta_zero') else '', time.time() - t0), flush=True)
    json.dump(dict(k=k, t=tl, mu=mu, tlo=tlo, room=room, kappa=kap, tilt=[s, t], ustar=row.ustar, ucap=ucap, e1=RI.E1, chis=chis, exact_deriv=True, pts=out),
              open('out/r4_theta3_%d%s.json' % (k, tag), 'w'), indent=1)
