#!/usr/bin/env python3
"""Signed grades of the reflected-cubic map of #670 (ledger 8.1), floating point (label N).

G_eps(z, w) = ph(z + eps*h(w)), h(w) = w(|w|^2 - 2), z, w independent standard complex Gaussians, preprocessors
(P, -P).  Expand G in the orthonormal complex Hermite basis e_{j,l}(z) = e^{il arg z} psi_{j,|l|}(|z|^2) (degree
2j+|l|).  Charge one forces l1 + l2 = 1; write m = l2.  With w = sqrt(v) e^{i b}, eps*h(w) = t e^{i beta},
t = eps sqrt(v)|v-2|, beta = b + pi [v<2], and rotation invariance gives
    c(j1, 1-m; j2, m) = int_0^inf (-1)^{m [v<2]} C_{j1,1-m}(t(v)) psi_{j2,|m|}(v) e^{-v} dv,
    C_{j,l}(t)        = E_z[ph(z + t) conj e_{j,l}(z)]  (real),
so the energy m(n1, n2) of bidegree (n1, n2) is a sum of c^2, and the kernel with preprocessors (P, -P) is
    sum_n mu_n (r P(r^2))^n,   mu_n = sum_{n1+n2=n} (-1)^{n2} m(n1, n2)   (n odd),
a one-dimensional grade series like that of the cell channel.  At eps = 0 it is the phase series (mu_{2k+1} = r_k).
Quadrature: Gauss-Legendre in rho = |z| (split at rho = t) and in s = sqrt(v) (split at s = sqrt 2), FFT in the
angle.  Grades up to NMAX; accuracy is checked by doubling the nodes and against the exact phase grades at eps = 0.
Agent-ID: claude-b9ee (worker).
Usage: refl_cubic.py OUT.json NMAX NODES EPS [EPS ...]"""
import json
import math
import sys

import numpy as np
from scipy.special import gammaln

RMAX = 24.0
NALPHA = 2048


def gl(a, b, n):
    x, w = np.polynomial.legendre.leggauss(n)
    return 0.5 * (b - a) * x + 0.5 * (b + a), 0.5 * (b - a) * w


def phi_table(u, jmax, lmax):
    """psi_{j,l}(u) e^{-u/2} for 0<=j<=jmax, 0<=l<=lmax; shape (len(u), jmax+1, lmax+1)."""
    u = np.asarray(u, float)
    out = np.zeros((len(u), jmax + 1, lmax + 1))
    lu = np.log(np.maximum(u, 1e-300))[:, None]
    uu = u[:, None]
    ls = np.arange(lmax + 1)[None, :].astype(float)
    p0 = np.exp(0.5 * ls * lu - 0.5 * uu - 0.5 * gammaln(ls + 1))
    p0[:, 0] = np.exp(-0.5 * u)
    out[:, 0, :] = p0
    if jmax >= 1:
        p1 = (1 + ls - uu) * p0 / np.sqrt(1 + ls)
        out[:, 1, :] = p1
        for j in range(1, jmax):
            p2 = ((2 * j + 1 + ls - uu) * p1 - np.sqrt(j * (j + ls)) * p0) / np.sqrt((j + 1) * (j + 1 + ls))
            out[:, j + 1, :] = p2
            p0, p1 = p1, p2
    return out


def C_table(t, nmax, nodes):
    """C[j, l + L] for |l| <= L = nmax, 2j+|l| <= nmax, at shift t >= 0."""
    L = nmax
    if t > 1e-14:
        r1, w1 = gl(0.0, min(t, RMAX), nodes)
        pieces = [(r1, w1)]
        if t < RMAX:
            pieces.append(gl(t, RMAX, nodes))
        rho = np.concatenate([p[0] for p in pieces]); wr = np.concatenate([p[1] for p in pieces])
    else:
        rho, wr = gl(0.0, RMAX, 2 * nodes)
    alpha = 2 * np.pi * np.arange(NALPHA) / NALPHA
    zz = rho[:, None] * np.exp(1j * alpha)[None, :] + t
    ph = zz / np.maximum(np.abs(zz), 1e-300)
    F = np.fft.fft(ph, axis=1) / NALPHA          # F[:, l] = coefficient of e^{i l alpha} (negative l at the end)
    ls = np.arange(-L, L + 1)
    A = F[:, ls % NALPHA].real                   # A_l(rho, t), real by symmetry
    jmax = nmax // 2
    P = phi_table(rho ** 2, jmax, L)             # psi e^{-u/2}
    # E_z = int 2 rho e^{-rho^2} (1/2pi) int ...; one e^{-u/2} sits in P, the other is applied here
    wgt = wr * 2 * rho * np.exp(-0.5 * rho ** 2)
    C = np.einsum("r,rl,rjl->jl", wgt, A, P[:, :, np.abs(ls)])
    return C


def grades(eps, nmax, nodes):
    L = nmax
    s1, ws1 = gl(0.0, math.sqrt(2.0), nodes)
    s2, ws2 = gl(math.sqrt(2.0), RMAX, nodes)
    s = np.concatenate([s1, s2]); ws = np.concatenate([ws1, ws2])
    v = s ** 2
    t = abs(eps) * s * np.abs(v - 2)
    inner = v < 2
    jmax = nmax // 2
    Pw = phi_table(v, jmax, L)                   # psi_{j2,|m|}(v) e^{-v/2}
    wv = ws * 2 * s * np.exp(-0.5 * v)
    # sign of eps: h -> -h adds pi to beta, i.e. the factor (-1)^m everywhere; it cancels in c^2
    Cs = np.array([C_table(tt, nmax, nodes) for tt in t])   # (nv, jmax+1, 2L+1), index l + L
    mu = np.zeros(nmax + 1)
    energy = 0.0
    for m in range(-L, L + 1):
        l1 = 1 - m
        if abs(l1) > L or abs(m) + abs(l1) > nmax:
            continue
        sign = np.where(inner, (-1.0) ** (m % 2), 1.0)
        j1max = (nmax - abs(l1)) // 2
        j2max = (nmax - abs(m)) // 2
        Cm = Cs[:, :j1max + 1, l1 + L]                        # (nv, j1)
        Pm = Pw[:, :j2max + 1, abs(m)]                       # (nv, j2)
        c = np.einsum("v,vi,vk->ik", wv * sign, Cm, Pm)
        n1 = 2 * np.arange(j1max + 1)[:, None] + abs(l1)
        n2 = 2 * np.arange(j2max + 1)[None, :] + abs(m)
        n = n1 + n2
        ok = n <= nmax
        np.add.at(mu, n[ok], ((-1.0) ** (n2 % 2) * c ** 2)[ok])
        energy += float((c ** 2)[ok].sum())
    return mu, energy


def phase_grades(nmax):
    r = math.pi / 4; out = np.zeros(nmax + 1)
    for k in range((nmax - 1) // 2 + 1):
        out[2 * k + 1] = r; r *= (2 * k + 1) ** 2 / (4 * (k + 1) * (k + 2))
    return out


if __name__ == "__main__":
    out, nmax, nodes = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
    eps_list = [float(x) for x in sys.argv[4:]]
    ph = phase_grades(nmax)
    res = dict(nmax=nmax, nodes=nodes, phase=list(ph), runs={})
    for eps in eps_list:
        mu, en = grades(eps, nmax, nodes)
        mu2, en2 = grades(eps, nmax, int(nodes * 1.5))
        res["runs"][repr(eps)] = dict(mu=list(mu), energy=en, mu_fine=list(mu2), energy_fine=en2,
                                      node_change=float(np.abs(mu - mu2).sum()))
        d = mu2 - ph
        print(f"eps={eps}: sum|mu - mu(1.5 nodes)| = {np.abs(mu - mu2).sum():.2e}; energy to degree {nmax} {en2:.10f}"
              f" (phase {ph.sum():.10f}); sum|mu - phase| = {np.abs(d).sum():.3e}; W = {sum((-1) ** ((n - 1) // 2) * mu2[n] for n in range(1, nmax + 1, 2)):.12f}"
              f"; first: " + " ".join(f"{d[n]:+.2e}" for n in range(1, 12, 2)), flush=True)
    json.dump(res, open(out, "w"))
