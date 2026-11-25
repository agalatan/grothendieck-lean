#!/usr/bin/env python3
"""theta_room(u) on the 15-point chi grid, fast version, and its minimum over the energy band (N).
claude-b9ee worker d5newcap, 16 Nov 2026.   Same test and same definition as r4_theta3.py (reviewer's definition: the largest
theta for which (F) plus the hypothesis ||c_X||^2 <= theta delta Omhat_X in both sectors keeps the row inside its room at the
energy u, within the law-layer relaxation; sufficient for the row, not necessary), same law class (moments, Stein family,
(R1) at t_lo, cap), exact Gamma'.  What is different is only the cost:
  * one conic program per cell (u, chi), built once with PARAMETERS for theta, the weights of (F) against the hypothesis and
    kappa_AB (cvxpy DPP), instead of a new program for each of the 9 weight pairs of combo3.solve_point_t4 at every theta;
  * the minimum over the 9 weight pairs stops as soon as it is below the level tested (then only "within the level" is used);
  * the level crossing: bracket on a subset of chi, regula falsi on an active set, then EVERY possible chi at the result.
Checked against r4_theta3.py / combo3.py on the published row 0.80 and on (0.81, 0.165) (see PROGRESS.md).
kappa_AB: constant (KAPPA_AB or the row's 'kappa' or 0.82), or a function of chi: KAPPA_CHI="chi:kappa,chi:kappa,..."
(piecewise linear in log chi, constant outside): the split kappa_AB(chi) + kappa_h(chi) <= 1 that depends on the concentration.
usage (cwd = a game folder): D5_E1=.. D5_ETA=.. r4_theta4.py k energies [chis] [tag]
   energies: u/u*, or cX = X times the response cap, or "band" = scan 0.80 ... cap and refine at the minimum
   env: BAND_ROWS, KAPPA_AB, KAPPA_CHI, R4_ZERO=1, R4_TOL (0.01), THETA_START, LAW_RADIUS (see rice.py)"""
import sys, os, json, time, math, warnings; warnings.filterwarnings('ignore')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, cvxpy as cp, rowlib as R, lawstein as LS, combo as C, rice as RI, t4lib as T4
CHI15 = [1.0, 2.0, 3.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 20.0, 24.0, 30.0, 36.0, 42.0]
WPAIRS = [(0.0, 0.0), (0.5, 0.5), (0.0, 0.5), (0.5, 0.0), (1.0, 1.0), (0.0, 1.0), (1.0, 0.0), (0.5, 1.0), (1.0, 0.5)]

def kappa_fun():
    spec = os.environ.get('KAPPA_CHI')
    if not spec: return None
    pts = sorted((float(a), float(b)) for a, b in (x.split(':') for x in spec.split(',')))
    xs = np.log([p[0] for p in pts]); ys = [p[1] for p in pts]
    return lambda chi: float(np.interp(math.log(chi), xs, ys))

class Energy:
    """all cells of one energy: programs built lazily, values cached."""
    def __init__(self, row, U, u, mu, kappa, profs, tlo):
        self.row, self.U, self.u, self.mu, self.kappa, self.tlo = row, U, u, mu, kappa, tlo
        GA, GAp, GB, GBp = profs; S = np.sqrt(u * U); self.V = u * U
        self.aA, self.bA = C.ab_vec(GA, GAp, S); self.aB, self.bB = C.ab_vec(GB, GBp, S)
        self.psi = row.ps(S); self.B5 = row.B5(u); self.Vsl = row.Vsl(u)
        kpA, kpB = T4.Profile(GA, u), T4.Profile(GB, u)
        self.kA = kpA.kp_R(np.minimum(S, 6.0)); self.kB = kpB.kp_R(np.minimum(S, 6.0))
        self.Ar, self.br = RI.rice_rows(U, u, tlo); self.prob = {}; self.cache = {}; self.nsolve = 0
    def build(self, chi):
        U, u = self.U, self.u; p, cons = RI.law_constraints(U, chi, True); cons = cons + [self.Ar @ p >= self.br]
        par = dict(fA=cp.Parameter(nonneg=True), tA=cp.Parameter(nonneg=True), fB=cp.Parameter(nonneg=True), tB=cp.Parameter(nonneg=True), x=cp.Parameter(nonneg=True))
        FA = u * ((self.aA ** 2) @ p - cp.square(self.aA @ p)) + (u / 2) * ((self.bA ** 2) @ p)
        FB = u * ((self.aB ** 2) @ p - cp.square(self.aB @ p)) + (u / 2) * ((self.bB ** 2) @ p)
        TA = 1.5 * ((self.V * self.kA ** 2) @ p) - 0.75 * cp.square((self.V * self.kA) @ p) / u
        TB = 1.5 * ((self.V * self.kB ** 2) @ p) - 0.75 * cp.square((self.V * self.kB) @ p) / u
        X = self.B5 - self.psi @ p + self.Vsl
        pr = cp.Problem(cp.Maximize(par['fA'] * FA + par['tA'] * TA + par['fB'] * FB + par['tB'] * TB - par['x'] * X), cons)
        return pr, par
    def value(self, th, chi, level=None):
        """excess in gain units at (theta, chi): min over the weight pairs of the max over laws; if level is given the minimum
        stops once it is <= level (the value returned is then an upper bound of the excess that is within the level)."""
        key = (round(th, 12), chi); c = self.cache.get(key)
        if c is not None and (c[1] or (level is not None and c[0] is not None and c[0] <= level)): return c[0]
        if chi not in self.prob: self.prob[chi] = self.build(chi)
        pr, par = self.prob[chi]; delta = chi * self.u * self.u; kap = self.kappa(chi) if callable(self.kappa) else self.kappa
        par['x'].value = 4 * self.mu * kap; best = None; exact = True
        for wA, wB in WPAIRS:
            par['fA'].value, par['tA'].value, par['fB'].value, par['tB'].value = wA, (1 - wA) * delta * th, wB, (1 - wB) * delta * th
            try: pr.solve(solver='CLARABEL', max_threads=1); self.nsolve += 1
            except Exception: self.cache[key] = (None, True); return None
            if pr.status in ('infeasible', 'infeasible_inaccurate'): self.cache[key] = (None, True); return None
            v = pr.value / (4 * self.mu)
            if best is None or v < best: best = v
            if level is not None and best <= level: exact = (wA, wB) == WPAIRS[-1]; break
        self.cache[key] = (best, exact); return best

def crossing(E, chis, level, th0, tol, step=1.3):
    """largest theta with max_chi excess <= level.  Returns (theta, binding chi, (lo, hi))."""
    sub = [c for c in chis if c in (1.0, 4.0, 8.0, 16.0, 30.0, 36.0, 42.0)] or list(chis)
    if max(chis) not in sub: sub.append(max(chis))
    def over(th, cs):
        """(worst value, chi) over cs, exact where it exceeds the level"""
        v = [(E.value(th, c, level), c) for c in cs]; v = [a for a in v if a[0] is not None]
        return max(v) if v else (None, None)
    th = th0; v = over(th, sub)[0]; lo = hi = None
    for _ in range(30):
        if v is None: return None, None, None
        if v <= level: lo = th
        else: hi = th
        if lo is not None and hi is not None: break
        th = th * step if hi is None else th / step; v = over(th, sub)[0]
    if lo is None or hi is None: return (lo if hi is None else None), None, (lo, hi)
    lo0 = lo
    def chord(c):
        a_, b_ = E.value(lo, c, level), E.value(hi, c, level)
        if a_ is None or b_ is None or b_ <= level: return float('inf')
        return lo + (hi - lo) * (level - min(a_, level)) / (b_ - min(a_, level)) if b_ > a_ else lo
    active = sorted(sub, key=chord)[:3]
    while True:
        a_, b_ = lo, hi
        for _ in range(12):
            if b_ - a_ <= tol * a_: break
            fb = over(b_, active)[0]; fa = min(over(a_, active)[0], level)
            x = a_ + (b_ - a_) * (level - fa) / (fb - fa) if fb > fa else (a_ + b_) / 2
            x = min(max(x, a_ + 0.15 * (b_ - a_)), b_ - 0.15 * (b_ - a_))
            if over(x, active)[0] <= level: a_ = x
            else: b_ = x
        bad = [(E.value(a_, c, level), c) for c in chis if c not in active]; bad = [z for z in bad if z[0] is not None and z[0] > level + 1e-9]
        if not bad: return a_, over(b_, active)[1], (a_, b_)
        active.append(max(bad)[1]); lo, hi = lo0, a_

def one_energy(row, U, u, mu, kap, profs, tlo, room, chis, th_start, tol, want0=False):
    t0 = time.time(); ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo)
    def fm_safe(c):
        try: return RI.feasible_margin(U, u, c, tlo)
        except Exception: return 0.0          # the pre-test failed numerically (solver error): the cell is kept, the main program decides
    fm = {c: fm_safe(c) for c in chis}; poss = [c for c in chis if fm[c] is not None and fm[c] >= -1e-9]
    rec = dict(u=u, ufrac=u / row.ustar, ucapfrac=u / ucap, possible=poss, impossible=[c for c in chis if c not in poss], theta_room=None, chi_room=None, theta_zero=None, chi_zero=None)
    if poss:
        E = Energy(row, U, u, mu, kap, profs, tlo)
        th, chi_b, br = crossing(E, poss, room, th_start, tol); rec.update(theta_room=th, chi_room=chi_b, bracket=br)
        if want0 and th:
            th0_, chi0, _ = crossing(E, poss, 0.0, th * 0.85, tol, 1.2); rec.update(theta_zero=th0_, chi_zero=chi0)
        rec['nsolve'] = E.nsolve
    rec['secs'] = time.time() - t0; return rec

def show(tl, kapname, rec, n):
    imp = rec['impossible']; poss = rec['possible']
    note = '' if not imp else ((' (none for chi >= %g)' % min(imp)) if (not poss or min(imp) > max(poss)) else (' (none: %s)' % ','.join('%g' % c for c in imp)))
    return 't=%s kappa_AB=%s u/u*=%.3f u/cap=%.3f: %d of %d chi have a possible law%s | theta_room %s (binding chi %s)%s  [%.0fs, %d solves]' % (
        tl, kapname, rec['ufrac'], rec['ucapfrac'], len(poss), n, note, ('%.4f' % rec['theta_room']) if rec['theta_room'] else ('no possible law' if not poss else 'none'),
        ('%g' % rec['chi_room']) if rec['chi_room'] else '-', (' | theta_0 %.4f (chi %s)' % (rec['theta_zero'], '%g' % rec['chi_zero'] if rec['chi_zero'] else '-')) if rec.get('theta_zero') else '',
        rec['secs'], rec.get('nsolve', 0))

if __name__ == '__main__':
    k = int(sys.argv[1]); fr = sys.argv[2].split(',')
    chis = [float(x) for x in sys.argv[3].split(',')] if len(sys.argv) > 3 and sys.argv[3] not in ('', '-') else CHI15
    tag = sys.argv[4] if len(sys.argv) > 4 else ''
    cfg = json.load(open(os.environ.get('BAND_ROWS', 'band_rows.json'))); rw = cfg['rows'][str(k)]; s, t = cfg['tilt']
    tl, mu, tlo, room = rw['t'], rw['mu'], rw['tlo'], rw['room']
    kf = kappa_fun(); kap = kf if kf else (float(os.environ['KAPPA_AB']) if os.environ.get('KAPPA_AB') else float(rw.get('kappa', 0.82)))
    kapname = ('f(chi)' if kf else '%.3f' % kap)
    tol = float(os.environ.get('R4_TOL', 0.01)); want0 = os.environ.get('R4_ZERO', '0') == '1'
    row = R.Row(rw.get('prof', 'out/prof_%d.npz' % k)); profs = C.prof_derivs(row, s, t); U = LS.ugrid()
    ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo); out = []; th_prev = float(os.environ.get('THETA_START', rw.get('theta_start', 0.5)))
    def run(u, th0):
        rec = one_energy(row, U, u, mu, kap, profs, tlo, room, chis, th0, tol, want0); out.append(rec); print(show(tl, kapname, rec, len(chis)), flush=True); return rec
    if fr == ['band']:
        fmin = float(os.environ.get('BAND_FMIN', 0.80))
        fs = [f for f in (0.75, 0.80, 0.85, 0.90, 0.95, 1.0, 1.05, 1.10, 1.15, 1.20, 1.30, 1.40, 1.50, 1.65, 1.80, 2.0, 2.25, 2.5) if f >= fmin - 1e-9 and f * row.ustar < 0.985 * ucap] + [0.985 * ucap / row.ustar]
        for f in fs:
            rec = run(f * row.ustar, th_prev)
            if rec['theta_room']: th_prev = rec['theta_room']
        good = sorted([r for r in out if r['theta_room']], key=lambda r: r['u'])
        if len(good) >= 3:                                   # refine around the smallest: the midpoints to its neighbours
            i = min(range(len(good)), key=lambda j: good[j]['theta_room'])
            for j in (i - 1, i + 1):
                if 0 <= j < len(good): run((good[i]['u'] + good[j]['u']) / 2, good[i]['theta_room'])
        good = [r for r in out if r['theta_room']]
        if good:
            b = min(good, key=lambda r: r['theta_room'])
            print('t=%s kappa_AB=%s BAND MINIMUM: theta_room %.4f at u/u* = %.3f (u/cap %.3f), binding chi %s; band scanned %.2f-%.3f u*, cap %.3f u*' % (
                tl, kapname, b['theta_room'], b['ufrac'], b['ucapfrac'], '%g' % b['chi_room'] if b['chi_room'] else '-', min(r['ufrac'] for r in out), max(r['ufrac'] for r in out), ucap / row.ustar), flush=True)
    else:
        for f in fr:
            u = (min(float(f[1:]), 0.999) * ucap) if f.startswith('c') else min(float(f) * row.ustar, 0.999 * ucap)
            rec = run(u, th_prev)
            if rec['theta_room']: th_prev = rec['theta_room']
    good = [r for r in out if r['theta_room']]
    json.dump(dict(k=k, t=tl, mu=mu, tlo=tlo, room=room, kappa=(os.environ.get('KAPPA_CHI') if kf else kap), tilt=[s, t], ustar=row.ustar, ucap=ucap, e1=RI.E1, chis=chis, exact_deriv=True,
                   law_radius=bool(os.environ.get('LAW_RADIUS')), band_min=(min(good, key=lambda r: r['theta_room']) if good else None), pts=sorted(out, key=lambda r: r['u'])),
              open('out/r4_theta4_%d%s.json' % (k, tag), 'w'), indent=1)
