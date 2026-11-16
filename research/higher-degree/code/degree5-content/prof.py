# Degree-5 capped game, k-side A/B shells: radial profiles of one capped row (claude-b9ee worker, 16 Nov 2026).  N.
#   A+- = L' +- s D(z),  L' = z(l + beta(|z|^2-2)) + nu5 e32(z),  D = 1 - bA e11 - bB e20   (q = s >= 0 after rotation)
#   psi(s)   = E_z |A+| + |A-|                            (q-only potential, Psi5(s; nu5))
#   GA(s)    = Re E_z[ conj(e11) (ph A+ - ph A-) ]         (A first variation, charge +1:  Gamma_A(q) = GA(|q|) ph q)
#   GB(s)    = Re E_z[ conj(e20) (ph A+ - ph A-) ]         (B first variation, charge -1:  Gamma_B(q) = GB(|q|) conj ph q)
#   M(s)     = 4x4 z-averaged second variation of |A+ + d| + |A- - d|, d = e11 xA + e20 xB, basis (e11, i e11, e20, i e20)
#              (real coordinates relative to the phase of q; ratio to the cost p1 is the gate's rho_AB)
# Game (e1, eta) = (0.78, 0.0779).  Output: npz with s-grid and all profiles.
import sys, json, math
import numpy as np
from math import factorial
from numpy.polynomial.legendre import leggauss
from scipy.special import eval_genlaguerre

E1, ETA = 0.78, 0.0779

def e_ab(a, b, z):
    T = np.abs(z) ** 2
    if a >= b:
        v = (-1) ** b * factorial(b) * z ** (a - b) * eval_genlaguerre(b, a - b, T)
    else:
        v = (-1) ** a * factorial(a) * np.conj(z) ** (b - a) * eval_genlaguerre(a, b - a, T)
    return v / math.sqrt(factorial(a) * factorial(b))

def zgrid(npan=64, nq=8, nth=512, R=6.8):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    Rm, TH = np.meshgrid(r, th, indexing='ij')
    W = (wr[:, None] * np.ones(th.size)[None, :]).ravel(); W = W / W.sum()
    return (Rm * np.exp(1j * TH)).ravel(), W

def profiles(rec, S, grid=None):
    z, wz = grid if grid is not None else zgrid()
    T = np.abs(z) ** 2
    base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * e_ab(3, 2, z)
    Dz = 1 - rec['bA'] * e_ab(1, 1, z) - rec['bB'] * e_ab(2, 0, z)
    e11, e20 = e_ab(1, 1, z), e_ab(2, 0, z)
    Bm = np.array([e11, 1j * e11, e20, 1j * e20])
    psi = np.zeros(len(S)); GA = np.zeros(len(S)); GB = np.zeros(len(S)); M = np.zeros((len(S), 4, 4))
    GAi = np.zeros(len(S)); GBi = np.zeros(len(S))
    for i, s in enumerate(S):
        Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am)
        pP, pM = Ap / np.maximum(aP, 1e-300), Am / np.maximum(aM, 1e-300)
        psi[i] = (aP + aM) @ wz
        gA = (np.conj(e11) * (pP - pM)) @ wz; gB = (np.conj(e20) * (pP - pM)) @ wz
        GA[i], GB[i], GAi[i], GBi[i] = gA.real, gB.real, gA.imag, gB.imag
        Mi = np.zeros((4, 4))
        for A, a, sg in ((Ap, aP, 1.0), (Am, aM, -1.0)):
            Im_ = np.imag(sg * Bm * np.conj(A / np.maximum(a, 1e-300))[None, :])
            Mi += (Im_ * (wz / (2 * np.maximum(a, 1e-300)))[None, :]) @ Im_.T
        M[i] = (Mi + Mi.T) / 2
    return dict(psi=psi, GA=GA, GB=GB, GAi=GAi, GBi=GBi, M=M)

if __name__ == '__main__':
    k = int(sys.argv[1]); out = sys.argv[2]
    rec = json.loads(open('rows5.lines').read().splitlines()[k - 1])
    S = np.concatenate([np.linspace(0, 0.02, 41), np.linspace(0.02, 1.2, 473)[1:], np.linspace(1.2, 6.0, 193)[1:]])
    pr = profiles(rec, S)
    np.savez(out, S=S, rec=json.dumps(rec), **pr)
    print('row', rec['t'], 'max |imag GA|', np.abs(pr['GAi']).max(), 'max |imag GB|', np.abs(pr['GBi']).max(),
          'rho(0)', np.linalg.eigvalsh(pr['M'][0])[-1] * E1)
