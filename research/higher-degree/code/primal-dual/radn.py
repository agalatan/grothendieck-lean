# Exact "radial Z_n" family [N; the reduction is P]: charge-one responses on C^n invariant under U(1) x U(n-1),
#   f(z) = (z1/|z1|) F(|z1|^2, R^2),  R^2 = |z2|^2 + ... + |zn|^2  (R^2 ~ Gamma(n-1)).
# The chaos projections commute with unitaries, so they preserve this subspace; its orthonormal basis in P_{k+1,k} is
#   phi_{a,b} = z1 L_a^(1)(|z1|^2)/sqrt(a+1) * L_b^(n-2)(R^2)/sqrt(C(b+n-2,b)),  a + b = k.
# Best response f = ph(T g) stays in the subspace, so the alternation is exact for finite n (no limit), on a 2-D
# quadrature in (s1, s2) = (|z1|^2, R^2).  n = 1 is the plain phase; n -> infinity is the diffuse limit.
import numpy as np, sys, json
from math import comb, lgamma
from scipy.special import eval_genlaguerre
from numpy.polynomial.legendre import leggauss

def panels(L, npan, q):
    x, w = leggauss(q); ed = np.linspace(0, L, npan + 1)
    return (np.concatenate([(a + b) / 2 + (b - a) / 2 * x for a, b in zip(ed[:-1], ed[1:])]),
            np.concatenate([(b - a) / 2 * w for a, b in zip(ed[:-1], ed[1:])]))

class RadN:
    def __init__(self, n, K, npan=24, q=8):
        self.n, self.K = n, K; al = n - 2
        s1, w1 = panels(48.0, npan, q); w1 = w1 * np.exp(-s1)
        self.basis = [(a, k - a) for k in range(K + 1) for a in range(k + 1)] if n >= 2 else [(k, 0) for k in range(K + 1)]
        self.kof = np.array([a + b for a, b in self.basis])
        if n >= 2:
            s2, w2 = panels(48.0 + 6 * n, npan, q)
            w2 = w2 * np.exp(al * np.log(np.maximum(s2, 1e-300)) - s2 - lgamma(al + 1)) if al > 0 else w2 * np.exp(-s2)
            S1, S2 = np.meshgrid(s1, s2, indexing='ij'); W = w1[:, None] * w2[None, :]
        else:
            S1, S2, W = s1, np.zeros_like(s1), w1
        self.W = (W / W.sum()).ravel(); S1 = S1.ravel(); S2 = S2.ravel()
        rows = []
        for a, b in self.basis:
            v = np.sqrt(S1) * eval_genlaguerre(a, 1, S1) / np.sqrt(a + 1)
            if n >= 2: v = v * eval_genlaguerre(b, al, S2) / np.sqrt(comb(b + al, b))
            rows.append(v)
        self.Phi = np.array(rows); self.PhiW = self.Phi * self.W[None, :]
        self.gram = float(np.abs(self.PhiW @ self.Phi.T - np.eye(len(self.basis))).max())
    def proj(self, c):
        G = c @ self.Phi; f = G / np.maximum(np.abs(G), 1e-300); return self.PhiW @ f
    def alternate(self, lam, c0, iters=3000, tol=1e-13):
        lv = np.array([lam[k] for k in self.kof]); c = np.asarray(c0, complex); hist = []; vold = -9
        for it in range(iters):
            fh = self.proj(c); hist.append(fh); hist = hist[-2:]
            if len(hist) == 2:
                v = float(np.real(np.sum(lv * np.conj(hist[1]) * hist[0])))
                if it > 4 and abs(v - vold) < tol: break
                vold = v
            c = lv * fh
        f, g = hist[1], hist[0]; cc = np.zeros(self.K + 1); np.add.at(cc, self.kof, np.real(np.conj(f) * g))
        return v, cc, f, g

def best(n, lam, starts=24, seed=0, npan=24):
    R = RadN(n, len(lam) - 1, npan=npan); rng = np.random.default_rng(seed); out = None
    for s in range(starts):
        sc = [0.3, 1.0, 3.0][s % 3]
        c0 = sc * (rng.normal(size=len(R.basis)) + 1j * rng.normal(size=len(R.basis))); c0[0] += 2
        v, cc, f, g = R.alternate(lam, c0)
        if out is None or v > out[0]: out = (v, cc)
    return out[0], out[1], R.gram

if __name__ == '__main__':
    lam = json.loads(sys.argv[1]); ns = [int(x) for x in sys.argv[2].split(',')]
    for n in ns:
        v, cc, ge = best(n, lam)
        print(json.dumps(dict(n=n, value=v, c=[round(x, 6) for x in cc], gram_err=ge)), flush=True)
