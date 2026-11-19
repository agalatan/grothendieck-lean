# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N (floating point).
#
# Independent numerical evaluation of   ratio = ||c[h]||^2 / (delta * Omhat[h])   on the package's structured classes,
# for the two tilted profiles of the six degree-5 rows, to be compared with the proved constants
#   P1:  q = sqrt(u) X P_m                               theta = 77/(9(m+3))
#   P2:  q = sqrt(u)(sqrt(rho) X P_m + sqrt(1-rho) W)    theta = 253/(18(m+3)) + 2/(9m)   (55/16 at m = 1)
# Definitions (CONTENT_LEMMA_D5.md sections 1, 11):  h(v) = G(sqrt v)/sqrt v with G = Gamma_A + 0.4 Gamma_0 (sector A) or
# Gamma_B + 0.3 Gamma_0 (sector B);  k(v) = E h(v + u tau), tau ~ Exp(1);  k' = (k - h)/u;
#   Omhat = (3/2) E[V k'(V)^2] - (3/4) (E[V k'(V)])^2 / u,   V = |q|^2,   delta = E|q|^4 - 2u^2.
# Classes:  given the factor P and the bulk variance D, q is a centred complex Gaussian of variance u*a, a = rho P^2 + (1-rho) D,
# so V = u a T with T ~ Exp(1) independent, and the only non-zero content coordinate is
#   c_X = E[conj(X) q h(V)] = sqrt(rho u) E[P T h(u a T)]                                              (direct form).
# Second, independent route (the package's (13)/(25), i.e. ledger 6.3.23 after Gaussian regression):
#   c_X = u^{3/2} { rho^{3/2} E[P (2b K2 + (3-4b) K1) + (2R/sqrt m)(b K2 + 2(1-b) K1)] + sqrt(rho)(1-rho) E[P (D-1) K1] },
#   b = rho R / a,  R = P^2,  K1(a) = E_T[T k'(u a T)],  K2(a) = E_T[T^2 k'(u a T)].
# All T-integrals are tabulated as functions of y = sqrt(a) (smooth), then integrated against the Gamma(m) law of
# sqrt(m) P_m + m (and, for the finite bulk W_1 = U^2 conj(Z)/sqrt 2, against D = |U|^4/2).
# Profiles: data/prof_hp_<k>.npz (own recomputation, accurate to 1e-15) or the stored tables of the degree-5 study.
#
# usage: content_ratio.py <profile dir> <prefix: prof_hp_ | prof_> <out json> [fine]
import sys, json, math, time
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.interpolate import CubicSpline
from scipy.special import gammaln
from scipy.optimize import minimize_scalar

ROWK = {'0.80': 5, '0.82': 7, '0.84': 9, '0.845': 10, '0.85': 11, '0.855': 12}
TILT = {'A': ('GA', 0.4), 'B': ('GB', 0.3)}
E1, ETA = 0.78, 0.0779
FINE = len(sys.argv) > 4 and sys.argv[4] == 'fine'
NQ = 10 if FINE else 8
MUL = 1.5 if FINE else 1.0

def gl(edges, nq=None):
    x, w = leggauss(nq or NQ); ed = np.asarray(edges, float)
    t = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)])
    wt = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)])
    return t, wt

def exp_geo(tmax=60.0, npan=None):
    """Exp(1) law on [0, tmax]: geometric panels (ratio sqrt 2 or finer), which resolve every scale of T."""
    npan = npan or int(64 * MUL)
    ed = np.concatenate([[0.0], tmax * 2.0 ** (-32.0 * np.arange(npan, -1, -1) / npan)])
    t, w = gl(ed); return t, w * np.exp(-t)

def exp_lin(tmax=46.0):
    """Exp(1) law, panels of fixed width (for tau and for the bulk variable)."""
    n = lambda k: int(k * MUL)
    ed = np.concatenate([np.linspace(0, 2, n(16) + 1), np.linspace(2, 10, n(32) + 1)[1:], np.linspace(10, tmax, n(24) + 1)[1:]])
    t, w = gl(ed); return t, w * np.exp(-t)

def gamma_nodes(m):
    """law of G ~ Gamma(m, 1); P = (G - m)/sqrt m.  Panels split at G = m."""
    gmax = m + 14 * math.sqrt(m) + 34
    lo = np.linspace(0, m, int(32 * MUL) + 1); hi = m + (gmax - m) * np.linspace(0, 1, int(80 * MUL) + 1) ** 1.6
    g, w = gl(np.concatenate([lo, hi[1:]]), 10 if not FINE else 12)
    w = w * np.exp((m - 1) * np.log(g) - g - gammaln(m))
    return (g - m) / math.sqrt(m), w

class Prof:
    """tilted radial profile: G on the table grid [0, 6], constant beyond (as in the degree-5 study); h(v) = G(sqrt v)/sqrt v."""
    def __init__(self, S, G):
        G = np.array(G, float); G[0] = 0.0
        self.sp = CubicSpline(S, G); self.smax = float(S[-1]); self.G6 = float(G[-1]); self.d0 = float(self.sp(0.0, 1))
    def G(self, r): return self.sp(np.minimum(r, self.smax))
    def h(self, v):
        r = np.sqrt(v); small = r < 1e-7; rr = np.where(small, 1.0, r)
        return np.where(small, self.d0, self.G(rr) / rr)
    def hp(self, v):
        """h'(v) for sqrt v in (0, smax): (G'(r) r - G(r)) / (2 r^3)."""
        r = np.sqrt(v); inside = r < self.smax
        rc = np.minimum(r, self.smax)
        return np.where(inside, (self.sp(rc, 1) * r - self.sp(rc)) / (2 * r ** 3), -self.G6 / (2 * r ** 3))

class Exact:
    """analytic test profiles (validation of the machinery): h and k' in closed form."""
    def __init__(self, kind, u, lam=1.0):
        self.kind, self.u, self.lam = kind, u, lam
    def h(self, v):
        return {'v': lambda: v, 'v2': lambda: v * v, 'exp': lambda: np.exp(-self.lam * v)}[self.kind]()
    def kp(self, v):
        u, l = self.u, self.lam
        return {'v': lambda: np.ones_like(v), 'v2': lambda: 2 * v + 2 * u, 'exp': lambda: -l * np.exp(-l * v) / (1 + l * u)}[self.kind]()

def kprime(pr, u, xmax=10.0, nx=None):
    """k'(v) = (E h(v + u tau) - h(v))/u, tabulated in x = sqrt v on [0, xmax]; beyond: -G6/(2 v^{3/2}) (negligible mass there)."""
    nx = nx or int(4000 * MUL) + 1
    x = np.linspace(0, xmax, nx); v = x * x; tau, wt = exp_lin(); wt = wt / wt.sum()
    k = np.empty(nx)
    for i in range(0, nx, 400):
        k[i:i + 400] = pr.h(v[i:i + 400][:, None] + u * tau[None, :]) @ wt
    sp = CubicSpline(x, (k - pr.h(v)) / u)
    def f(vv):
        xx = np.sqrt(vv)
        return np.where(xx <= xmax, sp(np.minimum(xx, xmax)), -pr.G6 / (2 * np.maximum(xx, xmax) ** 3))
    f.table = (x, (k - pr.h(v)) / u, tau, wt)
    return f

def a_tables(hfun, kpfun, u, ymax=50.0, ny=None):
    """Phi1(a) = E_T[T h(uaT)], K1 = E_T[T k'], K2 = E_T[T^2 k'], Psi1 = E_T[uaT k'], Psi2 = E_T[uaT k'^2]; splines in y = sqrt a."""
    ny = ny or int(5000 * MUL) + 1
    y = np.linspace(0, ymax, ny); a = y * y; T, wT = exp_geo(); wT = wT / wT.sum()
    out = {n: np.empty(ny) for n in ('Phi1', 'K1', 'K2', 'Psi1', 'Psi2')}
    for i in range(0, ny, 250):
        V = u * a[i:i + 250][:, None] * T[None, :]; kp = kpfun(V)
        out['Phi1'][i:i + 250] = (hfun(V) * T[None, :]) @ wT
        out['K1'][i:i + 250] = (kp * T[None, :]) @ wT; out['K2'][i:i + 250] = (kp * (T * T)[None, :]) @ wT
        out['Psi1'][i:i + 250] = (V * kp) @ wT; out['Psi2'][i:i + 250] = (V * kp * kp) @ wT
    return {n: CubicSpline(y, val) for n, val in out.items()}

def evaluate(m, rho, bulk, u, tab):
    """bulk: None (P1, rho = 1), 'diffuse' (D = 1: the limit N -> infinity of W_N) or 'N1' (W_1 = U^2 conj(Z)/sqrt 2: D = |U|^4/2, Var D = 5)."""
    P, wP = gamma_nodes(m); R = P * P; sm = math.sqrt(m)
    if bulk is None or bulk == 'diffuse':
        D = np.ones(1); wD = np.ones(1); vD = 0.0
    else:
        t, wt = exp_lin(); wt = wt / wt.sum(); D = t * t / 2; wD = wt; vD = 5.0
    if bulk is None: rho = 1.0
    a = rho * R[:, None] + (1 - rho) * D[None, :]; y = np.sqrt(a); W = wP[:, None] * wD[None, :]; Pm = P[:, None]; Rm = R[:, None]
    assert y.max() < 50.0
    cX = math.sqrt(rho * u) * float((W * Pm * tab['Phi1'](y)).sum())
    b = rho * Rm / a; K1, K2 = tab['K1'](y), tab['K2'](y)
    c_rep = u ** 1.5 * (rho ** 1.5 * float((W * (Pm * (2 * b * K2 + (3 - 4 * b) * K1) + (2 * Rm / sm) * (b * K2 + 2 * (1 - b) * K1))).sum())
                        + math.sqrt(rho) * (1 - rho) * float((W * Pm * (D[None, :] - 1) * K1).sum()))
    EVk = float((W * tab['Psi1'](y)).sum()); EVk2 = float((W * tab['Psi2'](y)).sum())
    Om = 1.5 * EVk2 - 0.75 * EVk * EVk / u
    delta = u * u * (rho * rho * (4 + 12.0 / m) + 2 * (1 - rho) ** 2 * vD)
    chk = dict(mass=float(W.sum()), EA=float((W * a).sum()), VarA2=2 * float((W * a * a).sum()) - 2)     # E a = 1, 2 E a^2 - 2 = delta/u^2
    return dict(c=cX, c_rep=c_rep, EVk=EVk, EVk2=EVk2, Omhat=Om, delta=delta, chi=delta / u ** 2, ratio=cX * cX / (delta * Om), chk=chk)

def direct_p1(m, u, hfun, kpfun):
    """P1 by plain two-dimensional quadrature in (P, S), without the tables in a (cross-check)."""
    P, wP = gamma_nodes(m); S, wS = exp_geo(); wS = wS / wS.sum()
    V = u * (P * P)[:, None] * S[None, :]; W = wP[:, None] * wS[None, :]; kp = kpfun(V)
    c = math.sqrt(u) * float((W * P[:, None] * S[None, :] * hfun(V)).sum())
    EVk = float((W * V * kp).sum()); EVk2 = float((W * V * kp * kp).sum()); Om = 1.5 * EVk2 - 0.75 * EVk ** 2 / u
    delta = u * u * (4 + 12.0 / m)
    return dict(c=c, EVk=EVk, EVk2=EVk2, Omhat=Om, ratio=c * c / (delta * Om), tail=float((W * (V > 36.0)).sum()))

def theta_p1(m): return 77.0 / (9 * (m + 3))
def theta_p2(m): return 55.0 / 16 if m == 1 else (11009947.0 / 8553600 if m == 8 else 253.0 / (18 * (m + 3)) + 2.0 / (9 * m))

def ustar(S, psi, rec):
    """the study's reference energy u* = argmax_u [E psi(sqrt(u T)) - k_q u] (rowlib.Row._S5), recomputed."""
    sp = CubicSpline(S, psi); smax = S[-1]; T, wT = exp_geo()
    ps = lambda s: sp(np.minimum(s, smax)) + np.maximum(s - smax, 0.0) * sp(smax, 1)
    kq = 1 / E1 - (rec['bA'] ** 2 + rec['bB'] ** 2) / ETA
    f = lambda uu: -(float(wT @ ps(np.sqrt(uu * T))) - kq * uu)
    us = np.linspace(1e-4, 0.2, 400); i = int(np.argmin([f(x) for x in us]))
    r = minimize_scalar(f, bounds=(us[max(i - 1, 0)], us[min(i + 1, 399)]), method='bounded', options={'xatol': 1e-12})
    return float(r.x)

def validate():
    """machinery against closed forms: h = v (ratio 16/(3(m+3))), h = v^2 and h = exp(-lam v) (one-dimensional exact integrals)."""
    import mpmath as mp
    mp.mp.dps = 30; worst = 0.0; u = 0.05
    for m in (1, 2, 4, 8, 21):
        for kind, lam in (('v', 0), ('v2', 0), ('exp', 8.0), ('exp', 40.0)):
            ex = Exact(kind, u, lam); tab = a_tables(ex.h, ex.kp, u); r = evaluate(m, 1.0, None, u, tab); d = direct_p1(m, u, ex.h, ex.kp)
            dens = lambda g: mp.exp((m - 1) * mp.log(g) - g - mp.loggamma(m)); Pm = lambda g: (g - m) / mp.sqrt(m)
            if kind == 'v':
                c = 4 * u ** 1.5 / math.sqrt(m); Om = 0.75 * u
            elif kind == 'v2':
                mom = lambda k: mp.quad(lambda g: dens(g) * Pm(g) ** k, [0, m, m + 40, m + 200])
                c = float(math.sqrt(u) * u * u * 6 * mom(5))                                # sqrt u E[P S (u P^2 S)^2]
                EV = lambda k: math.factorial(k) * u ** k * float(mom(2 * k))               # E V^k
                EVk = 2 * EV(2) + 2 * u * EV(1); EVk2 = 4 * EV(3) + 8 * u * EV(2) + 4 * u * u * EV(1); Om = 1.5 * EVk2 - 0.75 * EVk ** 2 / u
            else:
                # E_S[S e^{-cS}] = (1+c)^-2 ; E_S[S e^{-cS}] with weight for V k', V k'^2
                l = lam; pts = [0, m, m + 10, m + 60, m + 200]
                c = float(math.sqrt(u) * mp.quad(lambda g: dens(g) * Pm(g) / (1 + l * u * Pm(g) ** 2) ** 2, pts))
                EVk = float(mp.quad(lambda g: dens(g) * (-l / (1 + l * u)) * u * Pm(g) ** 2 / (1 + l * u * Pm(g) ** 2) ** 2, pts))
                EVk2 = float(mp.quad(lambda g: dens(g) * (l / (1 + l * u)) ** 2 * u * Pm(g) ** 2 / (1 + 2 * l * u * Pm(g) ** 2) ** 2, pts))
                Om = 1.5 * EVk2 - 0.75 * EVk ** 2 / u
            exact = c * c / (u * u * (4 + 12.0 / m) * Om)
            e1 = abs(r['ratio'] / exact - 1); e2 = abs(d['ratio'] / exact - 1); e3 = abs(r['c_rep'] / r['c'] - 1); worst = max(worst, e1, e2, e3)
            print('  validate m=%2d h=%-3s lam=%4.1f: exact ratio %.10f | tables %.10f (rel %.1e) | direct 2-D %.10f (rel %.1e) | (13)-form of c vs direct: rel %.1e | bound %.6f'
                  % (m, kind, lam, exact, r['ratio'], e1, d['ratio'], e2, e3, theta_p1(m)))
    print('  validation: largest relative error %.1e' % worst, flush=True)
    return worst

if __name__ == '__main__':
    pdir, prefix, outjson = sys.argv[1], sys.argv[2], sys.argv[3]
    t00 = time.time(); print('settings: nq %d, panel multiplier %.1f, profiles %s%s*.npz' % (NQ, MUL, pdir, prefix))
    worst = validate()
    MS = (1, 2, 4, 8, 21); P2CASES = ((1, 0.36), (4, 0.5))
    res = dict(settings=dict(nq=NQ, mul=MUL, prefix=prefix), validation_worst=worst, rows=[])
    for tname, k in ROWK.items():
        d = np.load('%s/%s%d.npz' % (pdir, prefix, k)); rec = json.loads(str(d['rec'])); S = d['S']
        sig = float(d['sigma']) if 'sigma' in d else float(rec['sig'])
        us = ustar(S, d['psi'], rec)
        rowres = dict(t=tname, sigma=sig, ustar=us, ustar_over_sigma2=us / sig ** 2, cases=[])
        print('=== t = %s: sigma = %.10f, sigma^2 = %.6f; recomputed u* = %.6f = %.4f sigma^2' % (tname, sig, sig * sig, us, us / sig ** 2), flush=True)
        for label, u in [('0.5 sigma^2', 0.5 * sig ** 2), ('1.0 sigma^2', sig ** 2), ('1.3 sigma^2', 1.3 * sig ** 2), ('0.85 u*', 0.85 * us), ('1.0 u*', us)]:
            case = dict(label=label, u=u, sect={})
            for sec, (gname, tilt) in TILT.items():
                pr = Prof(S, d[gname] + tilt * d['G0']); kp = kprime(pr, u); tab = a_tables(pr.h, kp, u)
                # accuracy of k': compare with E h'(v + u tau) at a few points
                x, kpv, tau, wt = kp.table; ii = np.arange(40, len(x), 397)
                alt = np.array([float(pr.hp(x[i] ** 2 + u * tau) @ wt) for i in ii]); kerr = float(np.abs(alt - kpv[ii]).max() / np.abs(kpv).max())
                sr = dict(kprime_check=kerr, p1={}, p2={})
                for m in MS:
                    r = evaluate(m, 1.0, None, u, tab); r['theta'] = theta_p1(m); sr['p1'][m] = r
                dchk = direct_p1(1, u, pr.h, kp); sr['direct_m1'] = dchk
                if 'sigma^2' in label or label == '1.0 u*':
                    for (m, rho) in P2CASES:
                        for bulk in ('N1', 'diffuse'):
                            r = evaluate(m, rho, bulk, u, tab); r['theta'] = theta_p2(m); sr['p2']['m%d_rho%.2f_%s' % (m, rho, bulk)] = r
                case['sect'][sec] = sr
            rowres['cases'].append(case)
            a_, b_ = case['sect']['A'], case['sect']['B']
            print(' u = %-11s = %.6f | k\' check A %.0e B %.0e | m=1 direct 2-D vs tables: A %.1e B %.1e | mass of V > 36 (constant extension of G): %.1e' % (
                label, u, a_['kprime_check'], b_['kprime_check'], abs(a_['direct_m1']['ratio'] / a_['p1'][1]['ratio'] - 1), abs(b_['direct_m1']['ratio'] / b_['p1'][1]['ratio'] - 1), a_['direct_m1']['tail']))
            for m in MS:
                ra, rb = a_['p1'][m], b_['p1'][m]
                print('   P1 m=%2d chi %5.2f: A: c^2/delta %.3e Omhat %.5f ratio %.4f | B: c^2/delta %.3e Omhat %.5f ratio %.4f | theta %.4f = %5.1f x, %5.1f x the ratios | (13) vs direct: %.0e %.0e | A+B: c^2/delta %.5f Omhat %.4f ratio %.4f'
                      % (m, ra['chi'], ra['c'] ** 2 / ra['delta'], ra['Omhat'], ra['ratio'], rb['c'] ** 2 / rb['delta'], rb['Omhat'], rb['ratio'], ra['theta'], ra['theta'] / ra['ratio'], rb['theta'] / rb['ratio'],
                         abs(ra['c_rep'] / ra['c'] - 1), abs(rb['c_rep'] / rb['c'] - 1), (ra['c'] ** 2 + rb['c'] ** 2) / ra['delta'], ra['Omhat'] + rb['Omhat'], (ra['c'] ** 2 + rb['c'] ** 2) / (ra['delta'] * (ra['Omhat'] + rb['Omhat']))))
            for key in a_['p2']:
                ra, rb = a_['p2'][key], b_['p2'][key]
                print('   P2 %-22s chi %5.2f: A ratio %.4f B ratio %.4f | theta %.4f = %5.1f x, %5.1f x | (25) vs direct: %.0e %.0e | A+B: c^2/delta %.5f Omhat %.4f | E a = %.8f, delta check %.1e'
                      % (key, ra['chi'], ra['ratio'], rb['ratio'], ra['theta'], ra['theta'] / ra['ratio'], rb['theta'] / rb['ratio'], abs(ra['c_rep'] / ra['c'] - 1), abs(rb['c_rep'] / rb['c'] - 1),
                         (ra['c'] ** 2 + rb['c'] ** 2) / ra['delta'], ra['Omhat'] + rb['Omhat'], ra['chk']['EA'], abs(ra['chk']['VarA2'] / ra['chi'] - 1)))
            sys.stdout.flush()
        res['rows'].append(rowres)
    json.dump(res, open(outjson, 'w'), indent=1, default=float)
    print('done in %.0f s' % (time.time() - t00))
