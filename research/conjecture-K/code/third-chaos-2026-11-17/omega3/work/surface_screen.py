# surface_screen.py -- the t -> 1 end of the scale-wise covariance, S(P) - 1 with
#     S(P) = (Gaussian-surface average of Gamma over {P = 0}) = E[Gamma^{3/2} | P = 0] / E[Gamma^{1/2} | P = 0],
# estimated with a Gaussian kernel in P (bias O(h^2), Richardson over h, 2h), plus kappa_4, E|P| and the near-Gaussian
# coefficient K_P = 432 alpha ||T x_2 T||^2 + 648 beta ||T x~_1 T||^2 for random and structured third-chaos P.
# (claude-b9ee research worker, 17 Nov 2026)
import numpy as np, sys, os, itertools
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from omega3lib import TensorCubic

ALPHA = 11/8 - 0.75*np.log(3) - np.sqrt(3)*np.pi/12
BETA = 11/20 - 0.75*np.log(3) + np.sqrt(3)*np.pi/12

def sym4(A):
    return sum(A.transpose(p) for p in itertools.permutations(range(4)))/24.0

def chaos_data(T):
    """T normalised (6||T||^2 = 1). Returns kappa_4, K_P, E2 = E[J2(P^2)J2(Gamma)], E4 = E[J4 J4]."""
    C2 = np.einsum('acd,bcd->ab', T, T)
    C1 = sym4(np.einsum('abe,cde->abcd', T, T))
    E2 = 432*np.sum(C2*C2); E4 = 648*np.sum(C1*C1)
    return 3*(E2+E4), ALPHA*E2 + BETA*E4, E2, E4

def S_estimate(P, nsamp, rng, hs=(0.02, 0.01), batch=500000):
    num = {h: 0.0 for h in hs}; den = {h: 0.0 for h in hs}
    num2 = {h: 0.0 for h in hs}; den2 = {h: 0.0 for h in hs}; cr = {h: 0.0 for h in hs}
    absP = 0.0; nb = 0
    for s0 in range(0, nsamp, batch):
        x = rng.standard_normal((min(batch, nsamp-s0), P.n))
        Pv = P.val(x); g = P.grad(x); Gam = np.sum(g*g, 1)/3.0
        absP += np.sum(np.abs(Pv)); nb += len(Pv)
        for h in hs:
            k = np.exp(-0.5*(Pv/h)**2)
            a = k*Gam**1.5; b = k*Gam**0.5
            num[h] += a.sum(); den[h] += b.sum(); num2[h] += (a*a).sum(); den2[h] += (b*b).sum(); cr[h] += (a*b).sum()
    out = {}
    for h in hs:
        S = num[h]/den[h]
        # delta-method SE of a ratio of sums
        va = num2[h]/nb - (num[h]/nb)**2; vb = den2[h]/nb - (den[h]/nb)**2; cab = cr[h]/nb - num[h]*den[h]/nb**2
        ma, mb = num[h]/nb, den[h]/nb
        se = np.sqrt(max(va/mb**2 - 2*ma*cab/mb**3 + ma**2*vb/mb**4, 0)/nb)
        out[h] = (S, se)
    h1, h2 = hs
    S0 = out[h2][0] + (out[h2][0]-out[h1][0])/((h1/h2)**2-1)
    return S0, out, absP/nb

def multilinear(n, rng, kind='gauss'):
    T = np.zeros((n, n, n))
    for i, j, k in itertools.combinations(range(n), 3):
        c = rng.standard_normal() if kind == 'gauss' else rng.choice([-1.0, 1.0])
        for p in itertools.permutations((i, j, k)):
            T[p] = c
    return T

def e3(n):
    T = np.zeros((n, n, n))
    for i, j, k in itertools.combinations(range(n), 3):
        for p in itertools.permutations((i, j, k)):
            T[p] = 1.0
    return T

FANO = [(0, 1, 2), (0, 3, 4), (0, 5, 6), (1, 3, 5), (1, 4, 6), (2, 3, 6), (2, 4, 5)]
def fano(signs=None):
    T = np.zeros((7, 7, 7))
    for idx, (i, j, k) in enumerate(FANO):
        c = 1.0 if signs is None else signs[idx]
        for p in itertools.permutations((i, j, k)):
            T[p] = c
    return T

def h3sum(lam):
    n = len(lam); T = np.zeros((n, n, n))
    for i, l in enumerate(lam):
        T[i, i, i] = l
    return T

if __name__ == '__main__':
    nsamp = int(sys.argv[1]) if len(sys.argv) > 1 else 2000000
    rng = np.random.default_rng(12345)
    cases = [('h3', h3sum([1.0])), ('F2', h3sum([1, 1])), ('F4', h3sum([1]*4)), ('F10', h3sum([1]*10)),
             ('X1X2X3', e3(3)), ('Re(z^3)', None), ('Fano', fano()), ('Fano-signed', fano([1, 1, 1, 1, 1, 1, -1]))]
    T = np.zeros((2, 2, 2)); T[0, 0, 0] = 1; T[0, 1, 1] = T[1, 0, 1] = T[1, 1, 0] = -1   # x1^3 - 3 x1 x2^2
    cases[5] = ('Re(z^3)', T)
    for n in range(4, 11):
        cases.append(('e3(%d)' % n, e3(n)))
    for n in [3, 4, 5, 6, 7, 8, 10]:
        for r in range(3):
            cases.append(('mlG n=%d #%d' % (n, r), multilinear(n, rng, 'gauss')))
            cases.append(('mlS n=%d #%d' % (n, r), multilinear(n, rng, 'sign')))
    for n in [2, 3, 4]:
        for r in range(4):
            A = rng.standard_normal((n, n, n))
            cases.append(('genT n=%d #%d' % (n, r), A))
    print('%-18s %3s %9s %9s %9s %9s  %s' % ('P', 'n', 'kappa4', 'K_P', 'E|P|', 'S-1', 'S_h-1 (h=0.02, 0.01) +- se'))
    for name, T in cases:
        P = TensorCubic(T)
        k4, KP, E2, E4 = chaos_data(P.T)
        S0, out, EP = S_estimate(P, nsamp, np.random.default_rng(777))
        print('%-18s %3d %9.4f %9.4f %9.5f %+9.4f  %s' % (name, P.n, k4, KP, EP, S0-1,
              '  '.join('%+.4f+-%.4f' % (out[h][0]-1, out[h][1]) for h in out)), flush=True)
        np.save('T_%s.npy' % name.replace(' ', '_').replace('#', '').replace('=', '').replace('(', '').replace(')', '').replace('^', ''), P.T)
