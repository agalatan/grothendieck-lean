"""Grids and kernels shared by the relaxation scripts (label N: floating point).

Normalisation: u = E|q|^2 = 1, V = |q|^2, R = sqrt(V), s = E V^2 - 2.
Cells in r: edges e_0 = 0 < e_1 < ... < e_N; t_k = e_k^2 are the cell edges in v;
one atom per cell at r_k = (e_{k-1}+e_k)/2, v_k = r_k^2.
"""
import numpy as np

C6 = 4045313 / 100000


def r_edges(dr=0.02, r_fine=6.0, r_max=60.0, growth=1.03):
    """Uniform spacing dr on [0, r_fine], then geometric growth of the spacing up to r_max."""
    e = list(np.arange(0.0, r_fine + 0.5 * dr, dr))
    h = dr
    while e[-1] < r_max:
        h *= growth
        e.append(e[-1] + h)
    return np.array(e)


def atoms(e):
    r = 0.5 * (e[:-1] + e[1:])
    return r, r * r


def scalar_kernels(r, xe):
    """Kernels of the scalar (real-part) Stein family for an atom at radius r.

    X = r cos(Theta).  For an x-cell J = [xa, xb] in [0, inf):
      P[J, i]  = P(X in J)            = (asin(xb/r) - asin(xa/r)) / pi   (clipped at r)
      Mb[J, i] = int_J tau(x) p_X(x)  = int_J sqrt(r^2 - x^2)/pi dx
    """
    xa = xe[:-1][:, None]
    xb = xe[1:][:, None]
    rr = r[None, :]
    rs = np.maximum(rr, 1e-300)          # r = 0: X = 0, all mass in the cell containing 0
    za = np.minimum(xa / rs, 1.0)
    zb = np.minimum(xb / rs, 1.0)
    P = (np.arcsin(zb) - np.arcsin(za)) / np.pi

    def F(z):  # primitive of sqrt(r^2-x^2) at x = r z, divided by r^2
        return 0.5 * (z * np.sqrt(np.maximum(1.0 - z * z, 0.0)) + np.arcsin(z))

    Mb = rr * rr * (F(zb) - F(za)) / np.pi
    return P, Mb
