# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# Second, more accurate recomputation of Gamma_A, Gamma_B, Gamma_0 for the six rows.
# Facts used (P, elementary):  L' is odd and D is even in z, so A-(z) = -A+(-z) and, for the even factors 1, e11, e20,
#   Gamma_X(s) = 2 Re E_z[conj(e_X) ph A+(z; s)],  A+ = L' + s D.
# All coefficients are real, so A+(conj z) = conj A+(z), and A+ has a zero x(s) <= 0 on the real axis.  Polar coordinates
# centred at that zero, z = x(s) + rho e^{i phi}, make ph A+ smooth in rho >= 0 and in phi (ph A+ -> ph(a e^{i phi} + b e^{-i phi})
# as rho -> 0), so Gauss-Legendre panels in rho and the midpoint rule in phi converge fast (no phase vortex inside a cell).
# The plain rule of profiles_own.py and the stored tables of the degree-5 study have such a vortex and are accurate to 1e-4.
# usage: profiles_hp.py <rows.json> <dir with prof_<k>.npz> <dir with prof_own_<k>.npz> <outdir>
import sys, json, math, time
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import brentq

ROWK = {'0.80': 5, '0.82': 7, '0.84': 9, '0.845': 10, '0.85': 11, '0.855': 12}

def polys(rec, z):
    T = (z * np.conj(z)).real
    e11 = T - 1.0; e20 = z * z / math.sqrt(2.0); e32 = z * (T * T - 6.0 * T + 6.0) / math.sqrt(12.0)
    Lp = z * (rec['l'] + rec['beta'] * (T - 2.0)) + rec['nu5'] * e32
    D = 1.0 - rec['bA'] * e11 - rec['bB'] * e20
    return Lp, D, e11, e20, T

def Areal(rec, x, s):
    T = x * x
    return x * (rec['l'] + rec['beta'] * (T - 2.0)) + rec['nu5'] * x * (T * T - 6 * T + 6) / math.sqrt(12.0) + s * (1.0 - rec['bA'] * (T - 1.0) - rec['bB'] * T / math.sqrt(2.0))

def real_roots(rec, s, lo=-9.0, hi=9.0, n=3601):
    xs = np.linspace(lo, hi, n); f = Areal(rec, xs, s); out = []
    for i in range(n - 1):
        if f[i] == 0.0: out.append(xs[i])
        elif f[i] * f[i + 1] < 0: out.append(brentq(lambda x: Areal(rec, x, s), xs[i], xs[i + 1], xtol=1e-15, rtol=1e-15))
    return out

def rule(npan, nq, nphi, rmax):
    x, w = leggauss(nq)
    ed = np.concatenate([np.linspace(0, 1.0, npan // 4 + 1), np.linspace(1.0, rmax, npan - npan // 4 + 1)[1:]])
    rho = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)])
    phi = (np.arange(nphi) + 0.5) * np.pi / nphi
    return rho, wr, phi

def gammas(rec, s, rl):
    rho, wr, phi = rl
    rts = real_roots(rec, s) if s > 0 else [0.0]
    neg = [x for x in rts if x <= 1e-14]
    x0 = max(neg) if neg else 0.0                      # the zero continued from x(0) = 0
    z = x0 + rho[:, None] * np.exp(1j * phi)[None, :]
    Lp, D, e11, e20, T = polys(rec, z)
    A = Lp + s * D; ph = A / np.abs(A)
    W = (wr * rho)[:, None] * np.exp(-T) * (2.0 / len(phi))        # (1/pi) e^{-|z|^2} rho drho dphi over the half plane, times 2 for the conjugate half
    tot = float(W.sum())
    return (2 * float(np.real((e11 * ph * W).sum())), 2 * float(np.real((np.conj(e20) * ph * W).sum())), 2 * float(np.real((ph * W).sum())), tot, x0, len(rts),
            2 * float((np.abs(A) * W).sum()))                      # last: psi(s) = E|A+| + E|A-| = 2 E|A+|

if __name__ == '__main__':
    rows = json.load(open(sys.argv[1])); refdir, owndir, outdir = sys.argv[2], sys.argv[3], sys.argv[4]
    r1 = rule(48, 8, 240, 11.5); r2 = rule(72, 10, 384, 12.5)
    for row in rows:
        k = ROWK[row['t']]; t0 = time.time()
        rec = {a: float(row[a]) for a in ('l', 'beta', 'bA', 'bB', 'nu5')}
        ref = np.load('%s/prof_%d.npz' % (refdir, k)); own = np.load('%s/prof_own_%d.npz' % (owndir, k)); S = ref['S']
        G = np.array([gammas(rec, s, r1) for s in S])
        idx = np.unique(np.concatenate([np.arange(0, len(S), 24), [1, 2, 3, len(S) - 1]]))
        G2 = np.array([gammas(rec, S[i], r2) for i in idx])
        GA, GB, G0 = G[:, 0], G[:, 1], G[:, 2]
        print('t=%-5s: weights sum %.12f..%.12f; real zeros of A+ on [-9, 9]: at most %d (max over s), zero used x(s) in [%.4f, %.4f]' % (row['t'], G[:, 3].min(), G[:, 3].max(), int(G[:, 5].max()), G[:, 4].min(), G[:, 4].max()))
        print('         rule (%d nodes) vs finer rule (%d nodes) on %d values of s: max diff GA %.1e GB %.1e G0 %.1e' % (
            len(r1[0]) * len(r1[2]), len(r2[0]) * len(r2[2]), len(idx), np.abs(GA[idx] - G2[:, 0]).max(), np.abs(GB[idx] - G2[:, 1]).max(), np.abs(G0[idx] - G2[:, 2]).max()))
        print('         max|this - stored table| GA %.1e GB %.1e G0 %.1e ; max|this - plain own rule| GA %.1e GB %.1e G0 %.1e ; %.0f s' % (
            np.abs(GA - ref['GA']).max(), np.abs(GB - ref['GB']).max(), np.abs(G0 - ref['G0']).max(),
            np.abs(GA - own['GA']).max(), np.abs(GB - own['GB']).max(), np.abs(G0 - own['G0']).max(), time.time() - t0), flush=True)
        print('         psi: max|this - stored| %.1e ; finer rule %.1e' % (np.abs(G[:, 6] - ref['psi']).max(), np.abs(G[idx, 6] - G2[:, 6]).max()), flush=True)
        np.savez('%s/prof_hp_%d.npz' % (outdir, k), S=S, GA=GA, GB=GB, G0=G0, psi=G[:, 6], x0=G[:, 4], rec=json.dumps(rec), t=row['t'], sigma=float(row['sigma']))
