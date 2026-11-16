"""Local-variance content representation (REPORT section 6.6), label N.

For h in C^1 and k(v,c) = E_tau h(v + c tau):    E[conj(y_e) q h(V)] = E[conj(y_e) (k_v(V,c2) conj(q) a + k_c(V,c2) b)],   b = sum_k conj(F_k) W_k.
So the first-chaos content of q h(|q|^2) is linear in (a, W) alone (W_k = (F.grad)F_k), with budget
||a||^2 + sum||W_k||^2 = ||P20 q^2||^2 + ||P31 q^2||^2/2  (the part delta - 2||c2-u||^2 of the fourth cumulant, up to ||P31||^2/2).
Prints, at the peak row u = 0.0463 for the raw profile h = g and the tilt h = (g-g0) - 0.6 (j0 - j):
  C^2/D (true), the identity error, and Cauchy-Schwarz bounds: unprojected, and projected on H20, H31 (for a) and H30 (for W_k).
"""
import sys, os, math, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.special import eval_genlaguerre
from dslib import *

S2 = math.sqrt(2)
def from_twovar(c):
    """coefficients in the package's basis H(X), X(|Y|^2-1), conj(X)Y^2/sqrt2, (|X|^2-1)Y, H(Y), X^2 conj(Y)/sqrt2."""
    c = np.asarray(c, dtype=complex); t = np.zeros((2, 2, 2), complex)
    t[0, 0, 0] = c[0] / S2; t[0, 1, 1] = t[1, 0, 1] = c[1] / 2; t[1, 1, 0] = c[2] / S2
    t[0, 1, 0] = t[1, 0, 0] = c[3] / 2; t[1, 1, 1] = c[4] / S2; t[0, 0, 1] = c[5] / S2
    return t

def wick1(m, n, z):
    r = np.abs(z) ** 2
    if m >= n: return (-1) ** n * math.factorial(n) * z ** (m - n) * eval_genlaguerre(n, m - n, r)
    return (-1) ** m * math.factorial(m) * np.conj(z) ** (n - m) * eval_genlaguerre(m, n - m, r)

def basis(Y, W, p, q):
    L = []
    for a1 in range(p + 1):
        for b1 in range(q + 1):
            a2, b2 = p - a1, q - b1
            L.append(np.conj(wick1(a1, b1, Y[:, 0]) * wick1(a2, b2, Y[:, 1])) * W / math.sqrt(math.factorial(a1) * math.factorial(b1) * math.factorial(a2) * math.factorial(b2)))
    return np.array(L)

if __name__ == '__main__':
    U = 0.0463
    d = np.load('tab_peak.npz'); s = d['s']
    Gs = CubicSpline(s, d['g']); Js = CubicSpline(s, d['j']); g0 = float(d['g'][0]); j0 = float(d['j'][0]); smax = s[-1]
    def mk(fs, shift):
        def h(v):
            sv = np.minimum(np.sqrt(v), smax); return fs(sv) - shift
        def hp(v):
            sv = np.sqrt(v); out = np.full_like(sv, float(fs(0.0, 2)) / 2)
            m = (sv > 1e-5) & (sv < smax); out[m] = fs(sv[m], 1) / (2 * sv[m]); out[sv >= smax] = 0.0
            return out
        return h, hp
    hr, hrp = mk(Gs, 0.0)
    Ts = CubicSpline(s, (d['g'] - g0) - 0.6 * (j0 - d['j']))
    ht, htp = mk(Ts, 0.0)
    g = Grid(2, PANELS_FINE, 8, 32)
    bas = {pq: basis(g.Y, g.W, *pq) for pq in [(2, 0), (3, 1), (3, 0)]}
    pk = peak_profile(U)
    o1 = json.load(open('../antiholomorphic-stein-2026-11-17/package/results/survey_raw.json'))['results']['0.0463']
    cases = [('Wick monomial', t_monomial(2)), ('O1 maximiser of Theorem 4 (package)', from_twovar(np.array(o1['argmax_re']) + 1j * np.array(o1['argmax_im']))),
             ('item-5 cubic', t_item5(1j)), ('H(X)+H(Y)', t_sum_monomials(2)), ('X(|Y|^2-1)', t_item5(1e6)), ('X^2 conj(Y) + 0.3 H(X)', None)]
    t = np.zeros((2, 2, 2), complex); t[0, 0, 1] = 1; t[0, 0, 0] = 0.3; cases[-1] = (cases[-1][0], t)
    rng = np.random.default_rng(5)
    for i in range(3): cases.append((f'random #{i}', random_tensor(2, rng)))
    lx, lw = np.polynomial.laguerre.laggauss(40)
    for lab, h, hp in [('raw', hr, hrp), ('tilt 3/5', ht, htp)]:
        print(f'--- profile {lab}, u = {U}:   C^2/D | identity rel.err | unprojected CS/D | projected CS/D | budget (||a||^2+||W||^2)/delta')
        for name, t in cases:
            t = normalise(t, U)
            q, dq, F = cubic_eval(t, g.Y)
            V = np.abs(q) ** 2; c2 = np.sum(np.abs(F) ** 2, axis=1); a = np.sum(dq * F, axis=1)
            DF = 2 * np.einsum('ijk,Ni->Nkj', t, g.Y, optimize=True); Wk = np.einsum('Nkj,Nj->Nk', DF, F)
            b = np.sum(np.conj(F) * Wk, axis=1)
            kv = np.zeros_like(V); kc = np.zeros_like(V)
            for tau, wt in zip(lx, lw):
                if wt < 1e-18: continue
                val = hp(V + c2 * tau); kv += wt * val; kc += wt * tau * val
            hv = h(V)
            cv = np.array([g.E_c(np.conj(g.Y[:, j]) * q * hv) if hasattr(g, 'E_c') else np.sum(g.W * np.conj(g.Y[:, j]) * q * hv) for j in range(2)])
            cl = np.array([np.sum(g.W * np.conj(g.Y[:, j]) * (kv * np.conj(q) * a + kc * b)) for j in range(2)])
            C = np.linalg.norm(cv); e = cv / C; ye = g.Y @ e          # y_e = sum e_j y_j, so <y_e, c> = sum conj(e_j) cv_j = C
            na2 = np.sum(g.W * np.abs(a) ** 2); nW2 = np.sum(g.W * np.sum(np.abs(Wk) ** 2, axis=1))
            delta = np.sum(g.W * V * V) - 2 * U * U
            unproj = (math.sqrt(na2 * np.sum(g.W * np.abs(ye) ** 2 * V * kv ** 2)) + math.sqrt(nW2 * np.sum(g.W * np.abs(ye) ** 2 * c2 * kc ** 2))) ** 2
            G1 = ye * q * kv
            p20G = bas[(2, 0)] @ G1; p31G = bas[(3, 1)] @ G1; p20a = bas[(2, 0)] @ a; p31a = bas[(3, 1)] @ a
            pair_a = np.vdot(p20G, p20a) + np.vdot(p31G, p31a)
            p30 = [bas[(3, 0)] @ (ye * F[:, k] * kc) for k in range(2)]; p30W = [bas[(3, 0)] @ Wk[:, k] for k in range(2)]
            pair_W = sum(np.vdot(p30[k], p30W[k]) for k in range(2))
            proj = (np.linalg.norm(p20G) * np.linalg.norm(p20a) + np.linalg.norm(p31G) * np.linalg.norm(p31a)
                    + math.sqrt(sum(np.linalg.norm(x) ** 2 for x in p30)) * math.sqrt(nW2)) ** 2
            D = split(g, t, pk)['D']
            print(f"   {name:36s}: {C**2/D:.4f} | {np.linalg.norm(cl - cv)/C:.1e} | {unproj/D:.4f} | {proj/D:.4f} | {(na2+nW2)/delta:.3f}   (pairings a: {abs(pair_a)/C:.3f}, W: {abs(pair_W)/C:.3f} of C; chi = {delta/U**2:.2f})", flush=True)
