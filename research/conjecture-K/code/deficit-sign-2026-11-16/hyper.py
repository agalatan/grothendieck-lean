"""One-coordinate bounds (REPORT section 5; label N for the numbers, the inequalities are proved there).

For a unit vector e, X = <e,y>, r = |X|^2:  Vbar_e(r) = E[|q|^2 | X] = r[A(r-2)^2 + B r + C] + L2 (r-1)^2 + R2, where
  A = |coefficient of :X^2 conj(X):|^2,   2B = ||X^2 conj(l(Y))||^2,   L2 = ||(|X|^2-1) L(Y)||^2,
  C = ||X Q(Y)||^2 + ||conj(X) F(Y)||^2,  R2 = ||R(Y)||^2,   u = 2A + 2B + C + L2 + R2.
Jensen:   E phi(|q|^2) <= E_r phi(Vbar_e(r))                       (phi concave)
tangent:  D_phi(q) >= A a_phi + B b_phi + L2 c_phi + R2 d_phi,     the four coefficients as below.
"""
import math
import numpy as np
from scipy import special

SQPI = math.sqrt(math.pi)

def s_rule(smax=7.5, npan=60, k=8):
    """nodes/weights for int_0^inf f(r) e^{-r} dr with r = s^2 (handles sqrt(r) behaviour at 0)."""
    x, w = np.polynomial.legendre.leggauss(k)
    edges = np.linspace(0, smax, npan + 1)
    a = edges[:-1][:, None]; b = edges[1:][:, None]
    s = (0.5 * (b - a) * x[None, :] + 0.5 * (a + b)).ravel()
    ws = (0.5 * (b - a) * w[None, :]).ravel()
    r = s * s
    return r, ws * 2 * s * np.exp(-r)

R_NODES, R_W = s_rule()

def unitary_with_first_column(e):
    e = np.asarray(e, dtype=complex); e = e / np.linalg.norm(e)
    n = len(e)
    M = np.eye(n, dtype=complex); M[:, 0] = e
    if abs(e[0]) < 1e-8:      # make the matrix nonsingular
        M = np.roll(np.eye(n, dtype=complex), 1, axis=1); M[:, 0] = e
    Q, Rm = np.linalg.qr(M)
    Q = Q * (Rm[0, 0] / abs(Rm[0, 0]))       # first column = e exactly (up to rounding)
    return Q

def profile_coeffs(t, e):
    U = unitary_with_first_column(e)
    tp = np.einsum('ijk,ia,jb,kc->abc', t, U, U, np.conj(U), optimize=True)
    A = abs(tp[0, 0, 0]) ** 2
    B = np.sum(abs(tp[0, 0, 1:]) ** 2)
    L2 = 4 * np.sum(abs(tp[0, 1:, 0]) ** 2)
    nd = 4 * np.sum(abs(tp[0, 1:, 1:]) ** 2)
    ne = 2 * np.sum(abs(tp[1:, 1:, 0]) ** 2)
    R2 = 2 * np.sum(abs(tp[1:, 1:, 1:]) ** 2)
    return A, B, nd + ne, L2, R2

def vbar(coef, r):
    A, B, C, L2, R2 = coef
    return r * (A * (r - 2) ** 2 + B * r + C) + L2 * (r - 1) ** 2 + R2

def jensen_value(coef, phi):
    """E_r phi(Vbar(r))."""
    return float(np.sum(R_W * phi(vbar(coef, R_NODES))))

def tangent_coeffs(phip, u):
    """a, b, c, d with D >= A a + B b + L2 c + R2 d;  phip = phi'."""
    r = R_NODES; w = R_W * phip(u * r)
    a = -np.sum(w * r * (r * r - 4 * r + 2)); b = -np.sum(w * r * (r - 2))
    c = -np.sum(w * (r * r - 3 * r + 1)); d = -np.sum(w * (1 - r))
    return float(a), float(b), float(c), float(d)
