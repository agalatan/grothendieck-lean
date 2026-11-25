#!/usr/bin/env python3
"""r4_theta6.py = thresholds/r4_theta5.py of the NEWCAP folder (claude-b9ee worker d5newcap, 17 Nov 2026) with the A/B MARGIN MODEL
made explicit (design worker of claude-b9ee, 25 Nov 2026).  Everything else is unchanged.  N (floating point).
  MARGIN_MODEL unset or "const:MU": the secant m >= MU |rho|^2 (MU defaults to the band file's pointwise mu): gain <= ||c||^2/(4 MU);
  MARGIN_MODEL = "lin:MU0:B:MUG": m >= max(MU0 - B |rho|, MUG) |rho|^2.  For Gaussian linear forms r = (r_A, r_B) with V = E|r|^2,
     E|r|^3 <= sqrt2 V^(3/2), so E m >= M(x) := max(MU0 - sqrt2 B x, MUG) x^2 with x = sqrt V, and
     gain <= G(c) := sup_x [c x - M(x)],  c = ||c|| (both sectors together).  The row needs G(c) <= kappa (D + V_sl) + room =: g,
     i.e. c^2 <= Phi(g) := (G^-1(g))^2.  Phi(g)/g decreases from 4 MU0 to 4 MUG; Phi is not concave near the change of branch, so
     the laws are SLICED by g: on the slice g_j <= kappa (D + V_sl) + room <= g_j+1 (two affine constraints on the law),
     Phi(g) >= a_j g + b_j (the chord of Phi on the slice, lowered by its largest excess over Phi on a dense grid of the slice; the
     last slice is [g_K, oo) with the line 4 MUG g).  The test is, for every slice j,
         max over laws of the slice of [ min(F_A, T_A) + min(F_B, T_B) - a_j kappa (D + V_sl) ] <= a_j room + b_j   (one conic program per j).
  The value returned by Energy.value is room + max_j(excess_j)/(4 MU0), so "value <= room" is the test (crossing() is unchanged).
ORIGINAL HEADER:
theta_room(u) on the 15-point chi grid, minimised over ALL sector weights, and its minimum over the energy band (N).
claude-b9ee worker d5newcap, 17 Nov 2026.   DEFINITION (the reviewer's): theta_room(u) = the largest theta for which (F) plus
the hypothesis ||c_X||^2 <= theta delta Omhat_X in both sectors keeps the row inside its room at the energy u, within the
law-layer relaxation (moments, Stein family, (R1) at t_lo, cap); sufficient for the row, not necessary.  Exact Gamma'.
THE WEIGHTS (reviewer's correction of 17 Nov, 00:01): the test is  min over (w_A, w_B) in [0,1]^2  of  max over laws of
    w_A F_A + (1 - w_A) T_A + w_B F_B + (1 - w_B) T_B - 4 mu kappa (D + V_sl),      T_X = theta delta Omhat_X,
and the study's code (combo3.py, hence r4_theta3.py / r4_theta4.py) took the minimum over {0, 1/2, 1}^2 only.  Here it is taken
over the whole square, EXACTLY and in one conic program per cell: the expression is affine in the weights and concave in the
law (F_X and Omhat_X are concave functionals of the law), both sets are convex and compact, so by Sion's minimax theorem
    min_w max_law = max_law min_w = max over laws of [ min(F_A, T_A) + min(F_B, T_B) - 4 mu kappa (D + V_sl) ],
which is the statement the row needs (each content is below both bounds).  Program: maximise s_A + s_B - 4 mu kappa (D + V_sl)
subject to s_X <= F_X(law), s_X <= theta delta Omhat_X(law).  The multipliers of the two constraints of a sector are the
optimal weights (w_X, 1 - w_X); they are reported at the binding cell.   WEIGHTS=grid9 gives the 3 x 3 minimum (regressions).
kappa_AB: constant (KAPPA_AB, or the row's 'kappa', or 0.82) or KAPPA_CHI="chi:kappa,..." (piecewise linear in log chi).
usage (cwd = a game folder): D5_E1=.. D5_ETA=.. r4_theta5.py k energies [chis] [tag]
   energies: u/u*, or cX = X times the response cap, or "band" = scan from BAND_FMIN (0.80) u* to the cap, refined at the minimum
   env: BAND_ROWS, KAPPA_AB, KAPPA_CHI, R4_ZERO=1, R4_TOL (0.01), THETA_START, LAW_RADIUS (see rice.py), WEIGHTS=grid9"""
import sys, os, json, time, math, warnings; warnings.filterwarnings('ignore')
sys.path.insert(0, os.environ.get('THRESH_DIR', os.path.dirname(os.path.abspath(__file__))))
import numpy as np, cvxpy as cp, rowlib as R, lawstein as LS, combo as C, rice as RI, t4lib as T4
CHI15 = [1.0, 2.0, 3.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 20.0, 24.0, 30.0, 36.0, 42.0]
WPAIRS = [(0.0, 0.0), (0.5, 0.5), (0.0, 0.5), (0.5, 0.0), (1.0, 1.0), (0.0, 1.0), (1.0, 0.0), (0.5, 1.0), (1.0, 0.5)]
ALLW = os.environ.get('WEIGHTS', 'all') != 'grid9'

def margin_model(mu_file):
    spec = os.environ.get('MARGIN_MODEL', '')
    if not spec: return dict(kind='const', mu=mu_file)
    f = spec.split(':')
    if f[0] == 'const': return dict(kind='const', mu=float(f[1]))
    mu0, b, mug = float(f[1]), float(f[2]), float(f[3]); beta = float(os.environ.get('MARGIN_C3', math.sqrt(2.0))) * b      # E|r|^3 <= C3 V^(3/2): sqrt 2 by Cauchy-Schwarz, Gamma(5/2) = 1.32934 by Schur convexity
    x1 = (mu0 - mug) / beta; Mf = lambda x: np.maximum(mu0 - beta * x, mug) * x * x                          # M(x); the branches meet at x1
    cs = np.geomspace(1e-5, 4.0, 4000); cand = [np.full_like(cs, x1), np.maximum(cs / (2 * mug), x1)]             # exact sup over x: stationary points and the corner
    disc = 4 * mu0 * mu0 - 12 * beta * cs
    for sg in (-1.0, 1.0):
        xs = np.where(disc >= 0, (2 * mu0 + sg * np.sqrt(np.maximum(disc, 0))) / (6 * beta), x1); cand.append(np.clip(xs, 0.0, x1))
    G = np.max([cs * x - Mf(x) for x in cand], axis=0); Phi = cs ** 2                                             # Phi(G(c)) = c^2, G increasing
    gc = float(np.interp(2.0 * mug * (mu0 - mug) / beta * 1.6, cs, G))                                        # beyond: Phi = 4 mug g exactly
    def knots_for(room):
        r_ = float(os.environ.get('CHORD_RATIO', 1.5)); ks = [room]
        while ks[-1] < gc and float(np.interp(ks[-1], G, Phi)) / (4 * ks[-1]) > mug * 1.0005: ks.append(ks[-1] * r_)
        return ks
    def slices(room):
        ks = knots_for(room); pk = [float(np.interp(g, G, Phi)) for g in ks]; out = [(-1e9, ks[0], pk[0] / ks[0], 0.0)]      # g <= room: line through the origin
        for i_ in range(len(ks) - 1):
            a = (pk[i_ + 1] - pk[i_]) / (ks[i_ + 1] - ks[i_]); b_ = pk[i_] - a * ks[i_]
            gg = np.linspace(ks[i_], ks[i_ + 1], 400); ex = float(np.max(a * gg + b_ - np.interp(gg, G, Phi)))
            out.append((ks[i_], ks[i_ + 1], a, b_ - max(ex, 0.0) - 1e-12))
        out.append((ks[-1], 1e9, 4 * mug, 0.0)); return out
    q_ = Phi / G; assert np.all(np.diff(q_) <= 1e-9 * q_[1:]) and np.all(np.diff(G) > 0), 'Phi(g)/g is not decreasing'
    return dict(kind='lin', mu=mu0, mu0=mu0, b=b, mug=mug, slices=slices, gc=gc, mu_eff=lambda g: float(np.interp(g, G, Phi)) / (4 * g))

def kappa_fun():
    spec = os.environ.get('KAPPA_CHI')
    if not spec: return None
    pts = sorted((float(a), float(b)) for a, b in (x.split(':') for x in spec.split(',')))
    xs = np.log([p[0] for p in pts]); ys = [p[1] for p in pts]
    return lambda chi: float(np.interp(math.log(chi), xs, ys))

class Energy:
    """all cells of one energy: programs built lazily, values cached."""
    def __init__(self, row, U, u, mu, kappa, profs, tlo, room=None, mm=None):
        self.row, self.U, self.u, self.mu, self.kappa, self.tlo = row, U, u, mu, kappa, tlo; self.room = room; self.mm = mm; self.gbind = {}
        GA, GAp, GB, GBp = profs; S = np.sqrt(u * U); self.V = u * U
        self.aA, self.bA = C.ab_vec(GA, GAp, S); self.aB, self.bB = C.ab_vec(GB, GBp, S)
        self.psi = row.ps(S); self.B5 = row.B5(u); self.Vsl = row.Vsl(u)
        kpA, kpB = T4.Profile(GA, u), T4.Profile(GB, u)
        self.kA = kpA.kp_R(np.minimum(S, 6.0)); self.kB = kpB.kp_R(np.minimum(S, 6.0))
        self.Ar, self.br = RI.rice_rows(U, u, tlo); self.prob = {}; self.cache = {}; self.nsolve = 0; self.wts = {}
    def build(self, chi):
        U, u = self.U, self.u; p, cons = RI.law_constraints(U, chi, True); cons = cons + [self.Ar @ p >= self.br]
        par = dict(fA=cp.Parameter(nonneg=True), tA=cp.Parameter(nonneg=True), fB=cp.Parameter(nonneg=True), tB=cp.Parameter(nonneg=True), x=cp.Parameter(nonneg=True))
        FA = u * ((self.aA ** 2) @ p - cp.square(self.aA @ p)) + (u / 2) * ((self.bA ** 2) @ p)
        FB = u * ((self.aB ** 2) @ p - cp.square(self.aB @ p)) + (u / 2) * ((self.bB ** 2) @ p)
        TA = 1.5 * ((self.V * self.kA ** 2) @ p) - 0.75 * cp.square((self.V * self.kA) @ p) / u
        TB = 1.5 * ((self.V * self.kB ** 2) @ p) - 0.75 * cp.square((self.V * self.kB) @ p) / u
        X = self.B5 - self.psi @ p + self.Vsl
        if ALLW:                                              # exact minimum over all weights (minimax): min(F, T) per sector
            par = dict(t=cp.Parameter(nonneg=True), x=cp.Parameter(nonneg=True), xlo=cp.Parameter(), xhi=cp.Parameter()); sA = cp.Variable(); sB = cp.Variable()
            cF = [sA <= FA, sB <= FB]; cT = [sA <= par['t'] * TA, sB <= par['t'] * TB]
            pr = cp.Problem(cp.Maximize(sA + sB - par['x'] * X), cons + cF + cT + ([X >= par['xlo'], X <= par['xhi']] if (self.mm is not None and self.mm['kind'] == 'lin') else [])); par['cF'] = cF; par['X'] = X
            return pr, par
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
        if ALLW and self.mm is not None and self.mm['kind'] == 'lin':
            par['t'].value = delta * th; worst = None
            if not hasattr(self, 'sl'): self.sl = self.mm['slices'](self.room)
            for lo_, hi_, a_, b_ in self.sl:
                par['x'].value = a_ * kap; par['xlo'].value = (lo_ - self.room) / kap; par['xhi'].value = (hi_ - self.room) / kap
                try: pr.solve(solver='CLARABEL', max_threads=1); self.nsolve += 1
                except Exception: continue
                if pr.status in ('infeasible', 'infeasible_inaccurate') or pr.value is None: continue       # no law in this slice
                ex = pr.value - a_ * self.room - b_
                if worst is None or ex > worst:
                    worst = ex
                    try: self.gbind[key] = float(kap * par['X'].value + self.room)
                    except Exception: pass
                    try: self.wts[key] = tuple(float(c.dual_value) for c in par['cF'])
                    except Exception: pass
                if level is not None and worst > 1e-12 and level == self.room: break          # already violated: th is too large
            if worst is None: self.cache[key] = (None, True); return None
            self.cache[key] = (self.room + worst / (4 * self.mm['mu0']), True); return self.cache[key][0]
        if ALLW:
            par['t'].value = delta * th
            try: pr.solve(solver='CLARABEL', max_threads=1); self.nsolve += 1
            except Exception: self.cache[key] = (None, True); return None
            if pr.status in ('infeasible', 'infeasible_inaccurate') or pr.value is None: self.cache[key] = (None, True); return None
            try: self.wts[key] = tuple(float(c.dual_value) for c in par['cF'])
            except Exception: pass
            self.cache[key] = (pr.value / (4 * self.mu), True); return self.cache[key][0]
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
        E = Energy(row, U, u, mu, kap, profs, tlo, room, MM)
        if os.environ.get('PERCHI') == '1':                    # design worker, 25 Nov: the allowance of each chi separately (theta_room(u, chi)); the band value is their minimum
            tc = {}; gb = {}; th_c = th_start
            for c_ in sorted(poss, reverse=True):
                th1, _, br1 = crossing(E, [c_], room, (th_c if th_c < 20 else th_start), tol)
                if th1 is None: th1, _, br1 = crossing(E, [c_], room, 0.02, tol, 1.6)          # the bracket search from above ran out of steps: restart from below
                if th1 is not None and th1 > 50: th1 = 50.0                                    # cells at the edge of the possible laws: no effective bound
                tc['%g' % c_] = th1
                if th1: th_c = th1
                if th1 and br1 and br1[0] is not None and br1[1] is not None: gb['%g' % c_] = E.gbind.get((round(br1[1], 12), c_)) or E.gbind.get((round(br1[0], 12), c_))
            rec['theta_chi'] = tc; rec['g_bind_chi'] = gb; ok_ = [(v, float(k_)) for k_, v in tc.items() if v]
            th, chi_b, br = (min(ok_)[0], min(ok_)[1], None) if ok_ else (None, None, None)
            rec.update(theta_room=th, chi_room=chi_b, bracket=br, nsolve=E.nsolve, secs=time.time() - t0); return rec
        th, chi_b, br = crossing(E, poss, room, th_start, tol); rec.update(theta_room=th, chi_room=chi_b, bracket=br)
        if th and chi_b and br:
            w_ = E.wts.get((round(br[1], 12), chi_b)) or E.wts.get((round(br[0], 12), chi_b))
            if w_: rec['weights_F'] = [min(max(w_[0], 0.0), 1.0), min(max(w_[1], 0.0), 1.0)]
            g_ = E.gbind.get((round(br[1], 12), chi_b)) or E.gbind.get((round(br[0], 12), chi_b))
            if g_: rec['g_bind'] = g_; rec['mu_eff_bind'] = MM['mu_eff'](g_) if g_ > 0 else None
        if want0 and th:
            th0_, chi0, _ = crossing(E, poss, 0.0, th * 0.85, tol, 1.2); rec.update(theta_zero=th0_, chi_zero=chi0)
        rec['nsolve'] = E.nsolve
    rec['secs'] = time.time() - t0; return rec

def show(tl, kapname, rec, n):
    imp = rec['impossible']; poss = rec['possible']
    note = '' if not imp else ((' (none for chi >= %g)' % min(imp)) if (not poss or min(imp) > max(poss)) else (' (none: %s)' % ','.join('%g' % c for c in imp)))
    return 't=%s kappa_AB=%s u/u*=%.3f u/cap=%.3f: %d of %d chi have a possible law%s | theta_room %s (binding chi %s)%s  [%.0fs, %d solves]' % (
        tl, kapname, rec['ufrac'], rec['ucapfrac'], len(poss), n, note, (('%.4f' % rec['theta_room']) if rec['theta_room'] else ('no possible law' if not poss else 'none')) + ((' | per chi: ' + ' '.join('%s:%s' % (k_, ('%.3f' % v_) if v_ else '-') for k_, v_ in sorted(rec['theta_chi'].items(), key=lambda kv: float(kv[0])))) if rec.get('theta_chi') else ''),
        (('%g' % rec['chi_room']) if rec['chi_room'] else '-') + ((', weights of (F): A %.2f B %.2f' % tuple(rec['weights_F'])) if rec.get('weights_F') else ''), (' | theta_0 %.4f (chi %s)' % (rec['theta_zero'], '%g' % rec['chi_zero'] if rec['chi_zero'] else '-')) if rec.get('theta_zero') else '',
        rec['secs'], rec.get('nsolve', 0))

if __name__ == '__main__':
    k = int(sys.argv[1]); fr = sys.argv[2].split(',')
    chis = [float(x) for x in sys.argv[3].split(',')] if len(sys.argv) > 3 and sys.argv[3] not in ('', '-') else CHI15
    tag = sys.argv[4] if len(sys.argv) > 4 else ''
    cfg = json.load(open(os.environ.get('BAND_ROWS', 'band_rows.json'))); rw = cfg['rows'][str(k)]; s, t = cfg['tilt']
    tl, mu, tlo, room = rw['t'], rw['mu'], rw['tlo'], rw['room']
    MM = margin_model(mu); mu = MM['mu']
    print('margin model: %s' % ({k_: v_ for k_, v_ in MM.items() if k_ not in ('mu_eff', 'slices')}), ('%d slices' % len(MM['slices'](room))) if MM['kind'] == 'lin' else '', flush=True)
    kf = kappa_fun(); kap = kf if kf else (float(os.environ['KAPPA_AB']) if os.environ.get('KAPPA_AB') else float(rw.get('kappa', 0.82)))
    kapname = ('f(chi)' if kf else '%.3f' % kap)
    tol = float(os.environ.get('R4_TOL', 0.01)); want0 = os.environ.get('R4_ZERO', '0') == '1'
    row = R.Row(rw.get('prof', 'out/prof_%d.npz' % k)); profs = C.prof_derivs(row, s, t); U = LS.ugrid()
    ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo); out = []; th_prev = float(os.environ.get('THETA_START', rw.get('theta_start', 0.5)))
    def run(u, th0):
        rec = one_energy(row, U, u, mu, kap, profs, tlo, room, chis, th0, tol, want0); out.append(rec); print(show(tl, kapname, rec, len(chis)), flush=True); return rec
    if fr == ['band']:
        fmin = float(os.environ.get('BAND_FMIN', 0.80))
        if os.environ.get('BAND_CAPMIN'): fmin = max(fmin, float(os.environ['BAND_CAPMIN']) * ucap / row.ustar - 1e-9)      # only energies above this fraction of the cap
        fs = sorted(set([f for f in (0.75, 0.80, 0.85, 0.90, 0.95, 1.0, 1.05, 1.10, 1.15, 1.20, 1.30, 1.40, 1.50, 1.65, 1.80, 2.0, 2.25, 2.5) if f >= fmin - 1e-9 and f * row.ustar < 0.985 * ucap] + ([c_ * ucap / row.ustar for c_ in (0.70, 0.76, 0.80, 0.84, 0.88, 0.92)] if os.environ.get('BAND_CAPMIN') else []) + [0.985 * ucap / row.ustar]))
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
    json.dump(dict(k=k, t=tl, mu=mu, margin_model=os.environ.get('MARGIN_MODEL', 'const:file'), tlo=tlo, room=room, kappa=(os.environ.get('KAPPA_CHI') if kf else kap), tilt=[s, t], ustar=row.ustar, ucap=ucap, e1=RI.E1, chis=chis, exact_deriv=True,
                   law_radius=bool(os.environ.get('LAW_RADIUS')), weights=('all (minimax, exact)' if ALLW else '3x3 grid'), band_min=(min(good, key=lambda r: r['theta_room']) if good else None), pts=sorted(out, key=lambda r: r['u'])),
              open('out/r4_theta6_%d%s.json' % (k, tag), 'w'), indent=1)
