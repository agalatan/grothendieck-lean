# Review of codex-a786's second content-law package (review worker of claude-b9ee, 16 Nov 2026).  N (floating point).
#
# The ratio ||c[h]||^2/(delta Omhat[h]) for multi-block cubics of the package's class, with the two tilted row profiles:
#   q = sqrt(u) ( sum_i sqrt(rho_i) X_i P_i + sqrt(rho_0) W ),   independent blocks,   V = |q|^2 = u A T,  A = sum_i rho_i P_i^2 + rho_0 D.
# Direct form (the package's (9)):     c_i = sqrt(u rho_i) E[P_i Phi1(A)],  Phi1(a) = E_T[T h(u a T)];
# law functional:                      E[V k'] = E Psi1(A),  E[V k'^2] = E Psi2(A)   (Psi_j(a) = E_T[u a T k'(u a T)^j]).
# Balanced form (the package's (14)):  c_i = u^{3/2} sqrt(rho_i) E[ P_i { (4 rho_i B_i - 1 - rho_i R_i) K1(A) + A K1(A) + 2 rho_i^2 B_i R_i L(A) } ],
#                                      K1(a) = E_T[T k'(u a T)],  K2(a) = E_T[T^2 k'(u a T)],  L = (K2 - 2 K1)/a
#                                      (from H_i = 2 + (T-2) b_i, b_i = rho_i R_i / A, C_i - E C_i = A - rho_i R_i - 1 + rho_i).
# Method: the functions of a are tabulated in y = sqrt(a) (content_ratio.a_tables, first review); the expectation over the
# OTHER blocks and the bulk is taken by successive one-dimensional smoothings  F(a) -> E F(a + rho_j P_j^2)  on the grid;
# the last block is integrated against its own law.  Cost linear in the number of blocks, no Monte Carlo.
# Blocks: ('gamma', m): P = (Gamma(m) - m)/sqrt m (m equal positive eigenvalues);
#         ('pos', l1, l2) / ('mix', l1, l2): two eigenvalues (l1, l2) resp. (l1, -l2), l1^2 + l2^2 = 1 (closed-form densities).
# Bulk:   ('diffuse',): D = 1 (limit of W_N);  ('U2',): W = U^2 conj(Z)/sqrt 2, D = |U|^4/2, Var D = 5.
#
# usage (from the review folder): python3 -I -B scripts/multiblock.py data logs/multiblock.json
import sys, json, math, time
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.special import gammaln
import content_ratio as CR

YMAX, NY = 50.0, 2501
YG = np.linspace(0.0, YMAX, NY); AG = YG * YG

def block_nodes(kind, *par):
    """nodes x_k of P, probability weights w_k, the conditional mean E[B | P = x_k], and (kappa, s3)."""
    if kind == 'gamma':
        m = par[0]; rt = math.sqrt(m); gmax = m + 14 * rt + 34
        g, w = CR.gl(np.concatenate([np.linspace(0, m, 17), (m + (gmax - m) * np.linspace(0, 1, 41) ** 1.6)[1:]]), 8)
        w = w * np.exp((m - 1) * np.log(g) - g - gammaln(m)); P = (g - m) / rt
        return P, w, 1 + P / rt, 1.0 / m, 1.0 / rt
    l1, l2 = par
    assert abs(l1 * l1 + l2 * l2 - 1) < 1e-12 and l1 > 0 and l2 > 0 and l1 != l2
    if kind == 'pos':        # P = l1 (T1-1) + l2 (T2-1): s = P + l1 + l2 > 0, density (e^{-s/l1} - e^{-s/l2})/(l1 - l2)
        lm = max(l1, l2); s, w = CR.gl(np.concatenate([np.linspace(0, 2 * lm, 25), (2 * lm + 44 * lm * np.linspace(0, 1, 41) ** 1.5)[1:]]), 8)
        f = (np.exp(-s / l1) - np.exp(-s / l2)) / (l1 - l2)
        # E[B; s] = int_0^{s/l1} (l1^2 t + l2 (s - l1 t)) e^{-t - (s - l1 t)/l2} dt / l2, in closed form through T1 | s
        r = 1.0 / l1 - 1.0 / l2                                   # density of x1 = l1 T1 given s is proportional to e^{-r x1} on [0, s]
        ex1 = np.where(np.abs(r * s) > 1e-8, 1 / r - s * np.exp(-r * s) / (1 - np.exp(-r * s) + 1e-300), s / 2)        # E[x1 | s]
        EB = l1 * ex1 + l2 * (s - ex1)
        return s - l1 - l2, w * f, EB, l1 ** 4 + l2 ** 4, l1 ** 3 + l2 ** 3
    if kind == 'mix':        # P = l1 (T1-1) - l2 (T2-1): s = P + l1 - l2 on the whole line, density e^{-s/l1}/(l1+l2) (s>0), e^{s/l2}/(l1+l2) (s<0)
        sp_, wp = CR.gl(np.concatenate([np.linspace(0, 2 * l1, 25), (2 * l1 + 44 * l1 * np.linspace(0, 1, 41) ** 1.5)[1:]]), 8)
        sn_, wn = CR.gl(np.concatenate([np.linspace(0, 2 * l2, 25), (2 * l2 + 44 * l2 * np.linspace(0, 1, 41) ** 1.5)[1:]]), 8)
        s = np.concatenate([sp_, -sn_]); w = np.concatenate([wp * np.exp(-sp_ / l1), wn * np.exp(-sn_ / l2)]) / (l1 + l2)
        # given s: x2 = l2 T2 >= max(0, -s) has density proportional to e^{-x2 (1/l1 + 1/l2)}; x1 = s + x2;  B = l1 x1 + l2 x2
        m2 = np.maximum(0.0, -s) + 1.0 / (1.0 / l1 + 1.0 / l2)
        EB = l1 * (s + m2) + l2 * m2
        return s - l1 + l2, w, EB, l1 ** 4 + l2 ** 4, l1 ** 3 - l2 ** 3
    raise ValueError(kind)

def bulk_nodes(kind):
    if kind == 'diffuse': return np.ones(1), np.ones(1), 0.0
    if kind == 'U2':
        t, w = CR.gl(np.concatenate([np.linspace(0, 2, 13), np.linspace(2, 10, 21)[1:], np.linspace(10, 46, 13)[1:]]), 8); w = w * np.exp(-t)
        return t * t / 2, w / w.sum(), 5.0
    raise ValueError(kind)

def smooth(F, add, w):
    """values on the grid of G(a) = sum_k w_k F(a + add_k), for several functions at once: F has shape (NY, nf)
    (F given by its values on the grid; constant beyond YMAX: negligible mass)."""
    sp = CubicSpline(YG, F, axis=0); out = np.empty_like(F)
    for i in range(0, NY, 128):
        vals = sp(np.minimum(np.sqrt(AG[i:i + 128][:, None] + add[None, :]), YMAX))            # (rows, nodes, nf)
        out[i:i + 128] = np.einsum('rkf,k->rf', vals, w)
    return out

class Model:
    def __init__(self, name, blocks, bulk=None):
        """blocks: list of (rho, kind, *par); bulk: (rho0, kind) or None."""
        self.name = name; self.rho = [b[0] for b in blocks]; self.nodes = [block_nodes(*b[1:]) for b in blocks]; self.spec = blocks
        self.rho0 = bulk[0] if bulk else 0.0; self.bulk = bulk_nodes(bulk[1]) if bulk else None; self.bulkspec = bulk
        assert abs(sum(self.rho) + self.rho0 - 1) < 1e-12
        for (P, w, EB, kap, s3) in self.nodes:
            assert abs(w.sum() - 1) < 1e-9 and abs(w @ P) < 1e-9 and abs(w @ (P * P) - 1) < 1e-8 and abs(w @ P ** 4 - 3 - 6 * kap) < 1e-6 and abs(w @ (P * EB) - s3) < 1e-8, (name, w.sum(), w @ P, w @ (P * P), w @ (P * EB), s3)
        self.chi = sum(r * r * (4 + 12 * n[3]) for r, n in zip(self.rho, self.nodes)) + 2 * self.rho0 ** 2 * (self.bulk[2] if self.bulk else 0.0)
        self.hv = 64 * sum(r ** 3 * n[4] ** 2 for r, n in zip(self.rho, self.nodes)) / (3 * self.chi)          # the ratio of h(v) = v
    def others(self, F, skip):
        for j, (r, n) in enumerate(zip(self.rho, self.nodes)):
            if j != skip: F = smooth(F, r * n[0] ** 2, n[1])
        if self.bulk: F = smooth(F, self.rho0 * self.bulk[0], self.bulk[1])
        return F
    def evaluate(self, u, tabv, balanced=True):
        EVk, EVk2 = (float(x) for x in self.others(np.stack([tabv['Psi1'], tabv['Psi2']], axis=1), -1)[0])
        om = 1.5 * EVk2 - 0.75 * EVk * EVk / u; delta = u * u * self.chi
        c = []; cb = []; done = {}
        for i, (r, n) in enumerate(zip(self.rho, self.nodes)):
            key = (r,) + tuple(self.spec[i][1:]) + tuple(sorted((self.rho[j],) + tuple(self.spec[j][1:]) for j in range(len(self.rho)) if j != i))
            if key in done: c.append(done[key][0]); cb.append(done[key][1]); continue           # identical blocks in identical surroundings
            P, w, EB, kap, s3 = n; y = np.sqrt(r) * np.abs(P); R = P * P
            if balanced:
                G = CubicSpline(YG, self.others(np.stack([tabv['Phi1'], tabv['K1'], AG * tabv['K1'], tabv['L']], axis=1), i), axis=0)(y)
                ci = math.sqrt(u * r) * float(w @ (P * G[:, 0]))
                cbi = u ** 1.5 * math.sqrt(r) * float(w @ (P * ((4 * r * EB - 1 - r * R) * G[:, 1] + G[:, 2] + 2 * r * r * EB * R * G[:, 3])))
            else:
                ci = math.sqrt(u * r) * float(w @ (P * CubicSpline(YG, self.others(tabv['Phi1'][:, None], i), axis=0)(y)[:, 0])); cbi = float('nan')
            done[key] = (ci, cbi); c.append(ci); cb.append(cbi)
        n2 = sum(x * x for x in c)
        return dict(c=c, c_balanced=cb, Omhat=om, delta=delta, ratio=n2 / (delta * om), EVk=EVk, EVk2=EVk2)

def tables(pr_h, kp, u):
    tab = CR.a_tables(pr_h, kp, u, ymax=YMAX, ny=NY)
    v = {k: tab[k](YG) for k in ('Phi1', 'Psi1', 'Psi2', 'K1', 'K2')}
    L = np.empty(NY); L[1:] = (v['K2'][1:] - 2 * v['K1'][1:]) / AG[1:]; L[0] = (4 * L[1] - L[2]) / 3          # even in y: quadratic extrapolation to a = 0
    v['L'] = L
    return v

MODELS = [
    Model('M0: one block m=1 (control)', [(1.0, 'gamma', 1)]),
    Model('M1: 2 x m=1, weights 1/2, 1/2', [(0.5, 'gamma', 1), (0.5, 'gamma', 1)]),
    Model('M2: 2 x m=1, weights 0.8, 0.2', [(0.8, 'gamma', 1), (0.2, 'gamma', 1)]),
    Model('M3: m=1 (0.4), m=4 (0.3), diffuse bulk 0.3', [(0.4, 'gamma', 1), (0.3, 'gamma', 4)], (0.3, 'diffuse')),
    Model('M4: 4 x m=1, weights 1/4', [(0.25, 'gamma', 1)] * 4),
    Model('M5: m=1,1,2,4 (0.4,0.2,0.2,0.1), bulk U^2 conj(Z) 0.1', [(0.4, 'gamma', 1), (0.2, 'gamma', 1), (0.2, 'gamma', 2), (0.1, 'gamma', 4)], (0.1, 'U2')),
    Model('M6: spectra (3/5,4/5) and (4/5,-3/5), weights 1/2, 1/2', [(0.5, 'pos', 0.6, 0.8), (0.5, 'mix', 0.8, 0.6)]),
    Model('M7: 2 x m=4, weights 0.4, 0.4, bulk U^2 conj(Z) 0.2', [(0.4, 'gamma', 4), (0.4, 'gamma', 4)], (0.2, 'U2')),
]
THETA = {0: 39 / 16, 1: 39 / 16, 2: 39 / 16, 3: 39 / 16, 4: 39 / 16, 5: 39 / 16, 6: None, 7: 8153 / 6300}
FR = (0.02, 0.1, 0.5, 0.75, 1.0, 1.3)
TARGET = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}

def validate():
    """closed forms: h = v (ratio 64 sum rho^3 s^2/(3 chi)) and h = v^2 against exact rational values from exact_checks2-type moments; one block against the first review."""
    u = 0.05; worst = 0.0
    for kind in ('v', 'v2', 'exp'):
        ex = CR.Exact(kind, u, 8.0); tv = tables(ex.h, ex.kp, u)
        for M in MODELS:
            r = M.evaluate(u, tv)
            eb = max(abs(a / b - 1) for a, b in zip(r['c_balanced'], r['c']))
            line = '  validate h=%-3s %-52s ratio %.9f | balanced (14) vs direct: %.1e' % (kind, M.name[:52], r['ratio'], eb); worst = max(worst, eb)
            if kind == 'v':
                e1 = abs(r['ratio'] / M.hv - 1); worst = max(worst, e1); line += ' | exact %.9f (rel %.1e)' % (M.hv, e1)
            print(line)
    # one block against the tables-free two-dimensional rule of the first review
    for kind in ('v2', 'exp'):
        ex = CR.Exact(kind, u, 8.0); tv = tables(ex.h, ex.kp, u); d = CR.direct_p1(1, u, ex.h, ex.kp); r = MODELS[0].evaluate(u, tv)
        e = abs(r['ratio'] / d['ratio'] - 1); worst = max(worst, e); print('  validate one block, h=%s: smoothing code %.10f, direct 2-D rule %.10f (rel %.1e)' % (kind, r['ratio'], d['ratio'], e))
    print('  validation: largest relative error %.1e' % worst, flush=True)
    return worst

if __name__ == '__main__':
    pdir, outjson = sys.argv[1], sys.argv[2]; t00 = time.time()
    for M in MODELS: print('%-62s chi = %.4f   h = v ratio (u -> 0 limit) = %.5f' % (M.name, M.chi, M.hv))
    worst = validate(); assert worst < 5e-6
    res = dict(models=[dict(name=M.name, chi=M.chi, hv=M.hv, theta=THETA[i]) for i, M in enumerate(MODELS)], validation_worst=worst, rows=[])
    for tname, k in CR.ROWK.items():
        d = np.load('%s/prof_hp_%d.npz' % (pdir, k)); rec = json.loads(str(d['rec'])); S = d['S']; us = CR.ustar(S, d['psi'], rec)
        out = {}
        for f in FR:
            u = f * us
            for sec, (gname, tilt) in CR.TILT.items():
                pr = CR.Prof(S, d[gname] + tilt * d['G0']); kp = CR.kprime(pr, u); tv = tables(pr.h, kp, u)
                for i, M in enumerate(MODELS):
                    r = M.evaluate(u, tv, balanced=(f in (0.5, 1.0)))            # the balanced form (14) is evaluated at two energies only
                    out[(i, f, sec)] = (r['ratio'], max(abs(a / b - 1) for a, b in zip(r['c_balanced'], r['c'])) if f in (0.5, 1.0) else None)
        print('=== t = %s (u* = %.6f, row threshold %.2f); ratio for sector A / B by u/u*' % (tname, us, TARGET[tname]))
        for i, M in enumerate(MODELS):
            band = max(out[(i, f, s)][0] for f in FR if f >= 0.5 for s in 'AB'); bal = max(out[(i, f, s)][1] for f in (0.5, 1.0) for s in 'AB')
            print('  %-58s ' % M.name + '  '.join('%g: %.4f/%.4f' % (f, out[(i, f, 'A')][0], out[(i, f, 'B')][0]) for f in FR)
                  + ' | u->0: %.4f | band max %.4f | proved %s | (14) vs (9): %.0e' % (M.hv, band, ('%.4f' % THETA[i]) if THETA[i] else 'crit.', bal))
            res['rows'].append(dict(t=tname, model=M.name, ratios={str(f): [out[(i, f, 'A')][0], out[(i, f, 'B')][0]] for f in FR}, band_max=band, balanced_err=bal))
        sys.stdout.flush()
    json.dump(res, open(outjson, 'w'), indent=1)
    print('done in %.0f s' % (time.time() - t00))
