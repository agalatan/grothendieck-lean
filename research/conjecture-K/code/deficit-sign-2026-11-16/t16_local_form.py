"""Local form of Theorem 5 (REPORT section 6.4), label N:
   D = JG + T2loc + T3,   JG = B(u) - E B(c2) >= 0,
   T2loc = E[w1(V,c2) Re(conj(q)^2 a)],  T3 = E[w2(V,c2) Re(conj(q) b)],   b = sum_k conj(F_k) (F.grad)F_k,
   w1(v,c) = int_0^1 s E_tau |phi''|(s v + c tau) ds,   w2(v,c) = int_0^1 E_tau[tau |phi''|(s v + c tau)] ds   (both >= 0).
Checks Delta = E B(c2) - E phi(V) = T2loc + T3 by quadrature and prints the signs of the two terms.
"""
import sys, os, math
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *
from t12_jensen_split import BenchB, make_prof
from t13_weighted_contraction import weight

GLx, GLw = np.polynomial.legendre.leggauss(12); Sx = 0.5 * (GLx + 1); Sw = 0.5 * GLw
LGx, LGw = np.polynomial.laguerre.laggauss(28)

def fields_b(t, Y):
    q, dq, F = cubic_eval(t, Y)
    DF = 2 * np.einsum('ijk,Ni->Nkj', t, Y, optimize=True)        # DF[N,k,j] = d_j F_k
    Wk = np.einsum('Nkj,Nj->Nk', DF, F)
    b = np.sum(np.conj(F) * Wk, axis=1)
    V = np.abs(q) ** 2; c2 = np.sum(np.abs(F) ** 2, axis=1); a = np.sum(dq * F, axis=1)
    return V, c2, np.real(np.conj(q) ** 2 * a), np.real(np.conj(q) * b)

def local_terms(g, t, prof, bench, w):
    V, c2, rq2a, rqb = fields_b(t, g.Y)
    w1 = np.zeros_like(V); w2 = np.zeros_like(V)
    for s, ws in zip(Sx, Sw):
        for tau, wt in zip(LGx, LGw):
            if wt < 1e-18: continue
            val = w(s * V + c2 * tau)
            w1 += ws * wt * s * val; w2 += ws * wt * tau * val
    Ephi = g.E(prof.phi(V)); Eb = g.E(bench(c2))
    return dict(D=prof.B - Ephi, JG=prof.B - Eb, Delta=Eb - Ephi, T2loc=g.E(w1 * rq2a), T3=g.E(w2 * rqb))

if __name__ == '__main__':
    g = Grid(2, PANELS_MED, 6, 24)
    cases = [('Wick monomial', t_monomial(2)), ('H(X)+H(Y)', t_sum_monomials(2)), ('item-5 cubic', t_item5(1j)), ('X(|Y|^2-1)', t_item5(1e6)),
             ('X(|X|^2+|Y|^2-3)', t_item5(1.0)), ('cyclic n=2', t_cyclic(2))]
    rng = np.random.default_rng(5)
    for i in range(3): cases.append((f'random #{i}', random_tensor(2, rng)))
    for spec in ['buf:0.1', 'buf:0.3', 'buf:1', 'peak:0.0463', 'peak:0.2']:
        prof = make_prof(spec); bench = BenchB(prof); w, w0, u = weight(spec)
        print(f'--- {spec}: cubic: JG/D, T2loc/D, T3/D  (identity error (T2loc+T3-Delta)/D)')
        for name, t in cases:
            r = local_terms(g, normalise(t, prof.u), prof, bench, w)
            print(f"   {name:18s}: {r['JG']/r['D']:+.4f}, {r['T2loc']/r['D']:+.4f}, {r['T3']/r['D']:+.4f}   ({(r['T2loc']+r['T3']-r['Delta'])/r['D']:+.1e})", flush=True)
