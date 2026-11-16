# Review of codex-a786's third content-law package (review worker of claude-b9ee, 16 Nov 2026).  N (floating point).
#
# The ratio ||c[h]||^2/(delta Omhat[h]) for the shared matrix blocks of the package, with the two tilted row profiles.
#   Q_{d,lam} = Y^* G Y - tr G + sqrt(lam) sum_{a,b} conj(Z_ab) Y_a Y_b      (G: d x d Ginibre, Y in C^d, Z: d x d)
#   q = sqrt(u) ( sum_j sqrt(rho_j) Q_{d_j,lam_j} / sqrt(u_j) + sqrt(rho_0) W ),   u_j = d_j^2 + lam_j d_j (d_j + 1).
# Given the vectors Y_j, q is a proper Gaussian of variance u A, A = sum_j rho_j A_j(S_j)/u_j + rho_0 D, with S_j = |Y_j|^2 ~ Gamma(d_j)
# and A_j(S) = (1 + lam) S^2 - 2 S + d.  Only the trace coordinate X_{j,0} = tr G_j/sqrt(d_j) carries content:
#   direct form      c_j = sqrt(u rho_j / (d_j u_j)) E[(S_j - d_j) Phi1(A)],          Phi1(a) = E_T[T h(u a T)];
#   signed pairing   c_j = u^{3/2} sqrt(rho_j / (d_j u_j)) E[ K1(A) { (S_j - d_j)(A - 1) + (rho_j/u_j) S_j A_j'(S_j) } ],   K1(a) = E_T[T k'(u a T)]
#                    (the package's (14) in normalised variables);
#   chi = delta/u^2 = sum_j rho_j^2 (2 Var A_j/u_j^2) + 2 rho_0^2 Var D;   h(v) = v gives the ratio 64 sum_j rho_j^3/(d_j u_j) / (3 chi).
# The conditional variance depends on Y_j through its radius only, so every expectation is a one-dimensional Gamma integral per
# block (no Monte Carlo); several blocks and the bulk are handled by the smoothing of multiblock.py (second review).
# usage (from the review folder): python3 -I -B scripts/trace_blocks.py data logs/trace_blocks.json
import sys, json, math, time
from fractions import Fraction as Fr
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.special import gammaln
import content_ratio as CR
import multiblock as MB

YG, AG, NY = MB.YG, MB.AG, MB.NY

def theta_d(d):
    pol = Fr(d ** 4 - d ** 3 + 30 * d * d + 6 * d + 4, 6 * d * d * (2 * d * d + d + 1))
    if d < 4: return pol
    return min(pol, Fr(20 * d ** 3 - 51 * d * d + 28 * d - 4, 3 * d * (d - 2) * (d - 1) * (2 * d * d + d + 1)))

def block(d, lam=0.0):
    smax = d + 14 * math.sqrt(d) + 34
    s, w = CR.gl(np.concatenate([np.linspace(0, d, 21), (d + (smax - d) * np.linspace(0, 1, 49) ** 1.6)[1:]]), 8)
    w = w * np.exp((d - 1) * np.log(s) - s - gammaln(d))
    uj = d * d + lam * d * (d + 1); A = (1 + lam) * s * s - 2 * s + d; Ap = 2 * (1 + lam) * s - 2
    L = 2 * d * ((2 * d * d + d + 1) + (4 * d * d + 6 * d + 2) * lam + (2 * d * d + 5 * d + 3) * lam * lam)
    assert abs(w.sum() - 1) < 1e-10 and abs(w @ A - uj) < 1e-8 * uj and abs(w @ (A * A) - uj * uj - L) < 1e-7 * L and abs(w @ ((s - d) * A) - 2 * uj) < 1e-8 * uj
    return dict(d=d, lam=lam, s=s, w=w, a=A / uj, Ap=Ap, uj=uj, chi=2 * L / uj ** 2)

class Model:
    def __init__(self, name, blocks, bulk=None):
        """blocks: list of (rho, d, lam); bulk: (rho0, 'diffuse' | 'U2') or None."""
        self.name = name; self.rho = [b[0] for b in blocks]; self.B = [block(*b[1:]) for b in blocks]; self.spec = blocks
        self.rho0 = bulk[0] if bulk else 0.0; self.bulk = MB.bulk_nodes(bulk[1]) if bulk else None
        assert abs(sum(self.rho) + self.rho0 - 1) < 1e-12
        self.chi = sum(r * r * b['chi'] for r, b in zip(self.rho, self.B)) + 2 * self.rho0 ** 2 * (self.bulk[2] if self.bulk else 0.0)
        self.hv = 64 * sum(r ** 3 / (b['d'] * b['uj']) for r, b in zip(self.rho, self.B)) / (3 * self.chi)
        self.theta = max(theta_d(b['d']) for b in self.B)
    def others(self, F, skip):
        for j, (r, b) in enumerate(zip(self.rho, self.B)):
            if j != skip: F = MB.smooth(F, r * b['a'], b['w'])
        if self.bulk: F = MB.smooth(F, self.rho0 * self.bulk[0], self.bulk[1])
        return F
    def evaluate(self, u, tv):
        EVk, EVk2 = (float(x) for x in self.others(np.stack([tv['Psi1'], tv['Psi2']], axis=1), -1)[0])
        om = 1.5 * EVk2 - 0.75 * EVk * EVk / u; delta = u * u * self.chi; c = []; cp = []; done = {}
        for i, (r, b) in enumerate(zip(self.rho, self.B)):
            key = (self.spec[i], tuple(sorted(self.spec[j] for j in range(len(self.rho)) if j != i)))
            if key not in done:
                y = np.sqrt(r * b['a']); G = CubicSpline(YG, self.others(np.stack([tv['Phi1'], tv['K1'], AG * tv['K1']], axis=1), i), axis=0)(y)
                s, w, d, uj = b['s'], b['w'], b['d'], b['uj']
                ci = math.sqrt(u * r / (d * uj)) * float(w @ ((s - d) * G[:, 0]))
                cpi = u ** 1.5 * math.sqrt(r / (d * uj)) * float(w @ ((s - d) * (G[:, 2] - G[:, 1]) + (r / uj) * s * b['Ap'] * G[:, 1]))
                done[key] = (ci, cpi)
            c.append(done[key][0]); cp.append(done[key][1])
        n2 = sum(x * x for x in c)
        return dict(ratio=n2 / (delta * om), pairing_err=max(abs(a / b_ - 1) for a, b_ in zip(cp, c)), c=c, Omhat=om)

MODELS = [
    Model('T0: Q_2', [(1.0, 2, 0.0)]), Model('T1: Q_3', [(1.0, 3, 0.0)]), Model('T2: Q_4', [(1.0, 4, 0.0)]), Model('T3: Q_8', [(1.0, 8, 0.0)]),
    Model('T4: Q_2 with holomorphic companion, lam = 1', [(1.0, 2, 1.0)]), Model('T5: Q_3 with holomorphic companion, lam = 2', [(1.0, 3, 2.0)]),
    Model('T6: Q_2 + Q_3, weights 1/2, 1/2', [(0.5, 2, 0.0), (0.5, 3, 0.0)]),
    Model('T7: 2 x Q_2 (0.4, 0.4) + bulk U^2 conj(Z) 0.2', [(0.4, 2, 0.0), (0.4, 2, 0.0)], (0.2, 'U2')),
    Model('T8: Q_3 (0.6) + diffuse bulk 0.4', [(0.6, 3, 0.0)], (0.4, 'diffuse')),
    Model('T9: Q_2 lam=1 (0.3) + Q_3 (0.3) + Q_4 (0.2) + diffuse bulk 0.2', [(0.3, 2, 1.0), (0.3, 3, 0.0), (0.2, 4, 0.0)], (0.2, 'diffuse')),
]
FR = (0.02, 0.1, 0.5, 0.75, 1.0, 1.3)
TARGET = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}

def validate():
    u = 0.05; worst = 0.0
    for kind in ('v', 'v2', 'exp'):
        ex = CR.Exact(kind, u, 8.0); tv = MB.tables(ex.h, ex.kp, u)
        for M in MODELS:
            r = M.evaluate(u, tv); worst = max(worst, r['pairing_err'])
            line = '  validate h=%-3s %-66s ratio %.9f | signed pairing (14) vs direct (11): %.1e' % (kind, M.name[:66], r['ratio'], r['pairing_err'])
            if kind == 'v':
                e1 = abs(r['ratio'] / M.hv - 1); worst = max(worst, e1); line += ' | exact %.9f (rel %.1e)' % (M.hv, e1)
                assert r['ratio'] <= float(M.theta)
            print(line)
    for d in (2, 3, 4, 5, 8):                      # the single-block value of h = v is 16/(3(2d^2+d+1))
        M = Model('x', [(1.0, d, 0.0)]); assert abs(M.hv - 16 / (3 * (2 * d * d + d + 1))) < 1e-12 and abs(M.chi - 4 * (2 * d * d + d + 1) / d ** 3) < 1e-12
    print('  validation: largest relative error %.1e' % worst, flush=True); return worst

if __name__ == '__main__':
    pdir, outjson = sys.argv[1], sys.argv[2]; t00 = time.time()
    for M in MODELS: print('%-70s chi = %.4f   h = v ratio (u -> 0) = %.5f   proved Theta = %s = %.5f' % (M.name, M.chi, M.hv, M.theta, float(M.theta)))
    worst = validate(); assert worst < 5e-6
    res = dict(models=[dict(name=M.name, chi=M.chi, hv=M.hv, theta=str(M.theta), theta_float=float(M.theta)) for M in MODELS], validation_worst=worst, rows=[])
    for tname, k in CR.ROWK.items():
        dd = np.load('%s/prof_hp_%d.npz' % (pdir, k)); rec = json.loads(str(dd['rec'])); S = dd['S']; us = CR.ustar(S, dd['psi'], rec); out = {}
        for f in FR:
            u = f * us
            for sec, (gname, tilt) in CR.TILT.items():
                pr = CR.Prof(S, dd[gname] + tilt * dd['G0']); kp = CR.kprime(pr, u); tv = MB.tables(pr.h, kp, u)
                for i, M in enumerate(MODELS):
                    r = M.evaluate(u, tv); out[(i, f, sec)] = (r['ratio'], r['pairing_err'])
        print('=== t = %s (u* = %.6f, row threshold %.2f); ratio for sector A / B by u/u*' % (tname, us, TARGET[tname]))
        for i, M in enumerate(MODELS):
            band = max(out[(i, f, s)][0] for f in FR if f >= 0.5 for s in 'AB'); pe = max(out[(i, f, s)][1] for f in FR for s in 'AB')
            allmax = max(out[(i, f, s)][0] for f in FR for s in 'AB'); assert allmax <= float(M.theta)
            print('  %-66s ' % M.name + '  '.join('%g: %.4f/%.4f' % (f, out[(i, f, 'A')][0], out[(i, f, 'B')][0]) for f in FR) + ' | u->0: %.4f | band max %.4f | proved %.4f | (14) vs (11): %.0e' % (M.hv, band, float(M.theta), pe))
            res['rows'].append(dict(t=tname, model=M.name, ratios={str(f): [out[(i, f, 'A')][0], out[(i, f, 'B')][0]] for f in FR}, band_max=band, pairing_err=pe))
        sys.stdout.flush()
    json.dump(res, open(outjson, 'w'), indent=1)
    print('done in %.0f s' % (time.time() - t00))
