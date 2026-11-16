"""Sums of N independent Wick monomials q_N = N^{-1/2} sum_k y_k(|y_k|^2-2)/sqrt2, profile sqrt (label N).

Exact one-dimensional Fourier (Hankel) formulas, with chi(t) = E J0(t|q_1|) and kappa(t) = E[(c2^(1) - 1) J0(t|q_1|)]:
  E|q_N| = N^{-1/2} int_0^inf (1 - chi(t)^N) t^{-2} dt,                      D_N = sqrt(pi)/2 - E|q_N|,
  T1_N   = -(sqrt N / 2) int_0^inf m(t sqrt N) kappa(t) chi(t)^{N-1} dt,     m(s) = E exp(-s sqrt(tau)) = 1 - (s sqrt(pi)/2) erfcx(s/2),
  T2_N   = D_N - T1_N   (Theorem 5).
Derivation: K'(v) = E[(1/2)(v+tau)^{-1/2}] and (|z|^2+c^2)^{-1/2} = int_0^inf exp(-ct) J0(t|z|) dt; the summands are circular and independent.
"""
import math, sys
import numpy as np
from scipy import special

def base_tables(tmax=300.0, nt=6001):
    # r-grid: composite Gauss-Legendre, fine enough for t*|q|'(r) oscillation
    edges = np.concatenate([np.linspace(0, 6, 1201), np.linspace(6, 44, 7601)[1:]])
    x, w = np.polynomial.legendre.leggauss(6)
    a = edges[:-1][:, None]; b = edges[1:][:, None]
    r = (0.5 * (b - a) * x[None, :] + 0.5 * (a + b)).ravel()
    wr = (0.5 * (b - a) * w[None, :]).ravel() * np.exp(-r)
    mod = np.sqrt(r / 2) * np.abs(r - 2)
    c2 = r * r / 2 - 1
    t = np.linspace(0, tmax, nt)
    chi = np.empty(nt); kap = np.empty(nt)
    for i, ti in enumerate(t):
        j0 = special.j0(ti * mod)
        chi[i] = np.sum(wr * j0); kap[i] = np.sum(wr * c2 * j0)
    return t, chi, kap

def simpson(y, h):
    return h / 3 * (y[0] + y[-1] + 4 * np.sum(y[1:-1:2]) + 2 * np.sum(y[2:-1:2]))

if __name__ == '__main__':
    t, chi, kap = base_tables()
    h = t[1] - t[0]
    print('chi(0), kappa(0) =', chi[0], kap[0], ' chi(tmax)*tmax =', chi[-1] * t[-1])
    print(' N |    E|q_N|      D_N        T1_N       T2_N     T1/D    T2/D    chi_N=42/N   D/(sqrt(pi)/2 * chi/16)')
    for N in [1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 64]:
        f = np.empty_like(t)
        f[1:] = (1 - chi[1:] ** N) / t[1:] ** 2
        # limit t->0: chi = 1 - t^2/4 + ..., so (1-chi^N)/t^2 -> N/4
        f[0] = N / 4
        Eabs = (simpson(f, h) + 1 / t[-1]) / math.sqrt(N)
        m = 1 - (t * math.sqrt(N) * math.sqrt(math.pi) / 2) * special.erfcx(t * math.sqrt(N) / 2)
        T1 = -(math.sqrt(N) / 2) * simpson(m * kap * chi ** (N - 1), h)
        D = math.sqrt(math.pi) / 2 - Eabs
        T2 = D - T1
        print(f'{N:3d} | {Eabs:.7f}  {D:.7f}  {T1:.7f}  {T2:+.7f}  {T1/D:.4f}  {T2/D:+.4f}   {42/N:7.3f}   {D/(math.sqrt(math.pi)/2*42/N/16):.4f}')
