#!/usr/bin/env python3
"""Numerical prototype for the six open Gaussian hypotheses of the three-band upper endpoint
(issues #313, #41; design in docs/UPPER_CLOSURE.md).

For the Taylor sources hpow j = (i phi)^j F0 (j = 1, 2, 3) and the committed centers c_j it computes

  * the Hermite coefficients a_j(q,c,d) = <hvec2 (gradedMode q c d), hpow j> on the low bands
    (degree <= 51, 51, 11) and, optionally, on the whole support of c_j;
  * the inner products I_j = Re <c_j, hpow j>, which decide the whole-error hypotheses through
    ||hpow j - c_j||^2 = E phi^{2j} - 2 I_j + ||c_j||^2;

and compares them with the rational constants of the Lean statement. Everything is float64 numpy
(no mpmath on the machines); accuracy is assessed by convergence under refinement of every
quadrature parameter and by the cross-checks `moments` (the exact even phase moments of
PhaseMomentData.lean) and `check-j0` (j = 0: the coefficients of F0 itself against the quadrature
checker's conditional triangle and raw enclosures).

Reduction (docs/UPPER_CLOSURE.md section 4). With z = sqrt(s) real (rotation invariance),

  a_j(q,c,d) = int_0^inf 2 r e^{-r^2/2} hh_{q+1-c,q-d}(r) J_{c,d}(r) dr,     r = sqrt(s),
  J_{c,d}(r) = E_w[ conj(h_{c,d}(w)) (i phi(r,w))^j ph(r + b w) ],            b = kappa v(s),

where hh = h e^{-r^2/2} are Hermite functions. In polar coordinates w = tau e^{i psi},
conj(h_{c,d}(w)) = h_{c,d}(tau) e^{-i(c-d)psi} (h_{c,d}(tau) real), so

  J_{c,d} = (1/pi) int_0^inf tau hh_{c,d}(tau) PhiHat_{c-d}(tau) dtau,
  PhiHat_k(tau) = int_0^{2pi} e^{-ik psi} Phi(tau e^{i psi}) dpsi,
  Phi(w) = (i phi(r,w))^j ph(r + b w) e^{-|w|^2/2}.

ph(r + b w) jumps at w0 = -r/b (|w0| = A = r/|b|, arg w0 = pi for b > 0, 0 for b < 0). Away from
the circle tau = A the angular integral is an FFT; near it (|tau/A - 1| < zone) the tau panels are
graded geometrically toward A and the psi panels toward arg w0, with Gauss-Legendre on every panel.

Usage (see `--help`): `nodes` computes the per-node J arrays for a shard of radial nodes;
`assemble` combines the shards into coefficients, inner products and the comparison with the Lean
constants; `moments` and `check-j0` are the cross-checks; `config` prints the node list.

Inputs: Grothe/Upper/Data.lean (phase, profile, a), data/taylor-approximants/inputs/*.npz (centers),
the Lean data files for the exact constants, data/upper-closure/config.json (quadrature presets).
Outputs: research results under handoff/upper-closure/ (git-ignored).

Agent-ID: claude-b9ee. Refs #41, #313.
"""
from __future__ import annotations

import argparse
import json
import math
import os
import re
import sys
import time
from fractions import Fraction

import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# --------------------------------------------------------------------------------------------
# Inputs
# --------------------------------------------------------------------------------------------


def _read(path):
    with open(path, encoding="utf-8") as f:
        return f.read()


def load_data_lean(root=ROOT):
    """phaseStrs monomials, phaseEpsQ, profileQ, aQ from Grothe/Upper/Data.lean."""
    src = _read(os.path.join(root, "Grothe/Upper/Data.lean"))
    m = re.search(r"def phaseStrs : List String := \[(.*?)\]", src, re.S)
    terms = []
    for i, j, k, num, den in re.findall(r'"(\d+),(\d+),(\d+):(-?\d+)/(\d+)"', m.group(1)):
        terms.append(((int(i), int(j), int(k)), Fraction(int(num), int(den))))
    m = re.search(r"def profileQ : List ℚ :=\s*\[(.*?)\]", src, re.S)
    prof = [Fraction(int(a), int(b)) for a, b in re.findall(r"\((-?\d+) : ℚ\) / (\d+)", m.group(1))]
    a = re.search(r"def aQ : ℚ := \((-?\d+) : ℚ\) / (\d+)", src)
    eps = re.search(r"def phaseEpsQ : ℚ := \((-?\d+) : ℚ\) / (\d+)", src)
    return dict(terms=terms, profile=prof, a=Fraction(int(a.group(1)), int(a.group(2))),
                eps=Fraction(int(eps.group(1)), int(eps.group(2))))


def load_constants(root=ROOT):
    """Exact rational constants of the Lean statement (as Fractions)."""
    c = {}
    src = _read(os.path.join(root, "Grothe/UpperChaos/PhaseMomentData.lean"))
    for j, name in [(1, "phaseMoment2Q"), (2, "phaseMoment4Q"), (3, "phaseMoment6Q")]:
        m = re.search(name + r" : ℚ := (\d+) / (\d+)", src)
        c[("moment", j)] = Fraction(int(m.group(1)), int(m.group(2)))
    cb = _read(os.path.join(root, "Grothe/UpperChaos/TaylorCenterBandData.lean"))

    def ints(name):
        blk = re.search(r"def " + name + r" : Fin \d+ → ℤ(.*?)\n\n", cb, re.S).group(1)
        return [int(x) for x in re.findall(r"=> (\d+)", blk)]

    c[("energy", 1)] = Fraction(sum(ints("firstCenterBandIntegerEnergy")), 2 ** 412)
    c[("energy", 2)] = Fraction(sum(ints("secondCenterBandIntegerEnergy")), 2 ** 412)
    tb = _read(os.path.join(root, "Grothe/UpperChaos/TaylorBandData.lean"))
    m = re.search(r"thirdCenterEnergyQ : ℚ := \((\d+) / (\d+)\)", tb)
    c[("energy", 3)] = Fraction(int(m.group(1)), int(m.group(2)))
    cg = _read(os.path.join(root, "Grothe/Upper/ComparisonGroups.lean"))
    rs = re.findall(r"(\d+) / 1000000000000000000", cg)
    c[("radius", 1)], c[("radius", 2)], c[("radius", 3)] = [Fraction(int(x), 10 ** 18) for x in rs[1:4]]
    td = _read(os.path.join(root, "Grothe/UpperChaos/TaylorTailData.lean"))
    caps = re.findall(r"\| 0 => (\d+) / (\d+)", td)
    c[("lowcap", 1)], c[("lowcap", 2)], c[("lowcap", 3)] = [Fraction(int(a), int(b)) for a, b in caps]
    c[("factorial", 1)], c[("factorial", 2)], c[("factorial", 3)] = 1, 2, 6
    c[("grades", 1)], c[("grades", 2)], c[("grades", 3)] = 91, 46, 26
    c[("lowdeg", 1)], c[("lowdeg", 2)], c[("lowdeg", 3)] = 51, 51, 11
    return c


CENTER_FILES = {1: "arb_first_phase_D181.npz", 2: "arb_phase_power2_D151.npz", 3: "arb_phase_power3_D51.npz"}


def load_center(j, root=ROOT, grades=None):
    """The center c_j as a list C[q] of (q+2) x (q+1) float64 arrays, C[q][c, d]."""
    z = np.load(os.path.join(root, "data/taylor-approximants/inputs", CENTER_FILES[j]))
    flat = z["center"].astype(np.float64)
    Q = grades or {1: 91, 2: 46, 3: 26}[j]
    out, off = [], 0
    for q in range(Q):
        n = (q + 2) * (q + 1)
        out.append(flat[off:off + n].reshape(q + 2, q + 1).copy())
        off += n
    return out


# --------------------------------------------------------------------------------------------
# The rounding: profile, phase polynomial
# --------------------------------------------------------------------------------------------


class Rounding:
    def __init__(self, data):
        self.terms = [((i, j, k), float(c)) for (i, j, k), c in data["terms"]]
        self.eps = float(data["eps"])
        self.a = float(data["a"])
        self.kappa = math.sqrt(1.0 + self.a * self.a)
        self.prof = [float(x) for x in data["profile"]]
        self.degU = max(t[0][0] for t in self.terms)
        self.degV = max(t[0][1] for t in self.terms)
        self.degW = max(t[0][2] for t in self.terms)
        # coefficient tensor coef[i, jV, k]
        self.coef = np.zeros((self.degU + 1, self.degV + 1, self.degW + 1))
        for (i, jv, k), c in self.terms:
            self.coef[i, jv, k] += c
        # profile: v(s) = sum_j x_j L_j^{(-1/2)}(s) / nrmHalf(j) as a polynomial in s
        n = len(self.prof)
        poly = np.zeros(n)
        for jj in range(n):
            nrm = math.sqrt(math.sqrt(math.pi) * math.factorial(2 * jj) / (4 ** jj * math.factorial(jj) ** 2))
            for k in range(jj + 1):
                b = 1.0
                for i in range(jj - k):
                    b *= (k + 0.5 + i) / (i + 1)
                poly[k] += self.prof[jj] * ((-1) ** k) * b / math.factorial(k) / nrm
        self.vpoly = poly  # coefficients in s, low to high
        # Laguerre-angular form of D*S (data/upper-closure/phase-laguerre.json): D*S =
        # sum_t c_t L_n^{(k)}(3U) L_m^{(k)}(3V) Im((conj z w)^k); at z = r real, w = tau e^{i psi}:
        # Im((conj z w)^k) = (r tau)^k sin(k psi). Well conditioned (1e1-1e2) where the monomial
        # Horner loses 1e-11 relative; the exact identity is checked by `check-phase`.
        lagf = os.path.join(ROOT, "data/upper-closure/phase-laguerre.json")
        self.lag_terms = None
        if os.path.exists(lagf):
            with open(lagf, encoding="utf-8") as f:
                lt = json.load(f)["terms"]
            self.lag_terms = [((t["n"], t["m"], t["k"]), Fraction(t["coefficient"])) for t in lt]
            self.lag_N = max(t[0][0] for t in self.lag_terms)
            self.lag_M = max(t[0][1] for t in self.lag_terms)
            self.lag_K = max(t[0][2] for t in self.lag_terms)
            self.lag_C = np.zeros((self.lag_N + 1, self.lag_M + 1, self.lag_K + 1))
            for (n, m, k), c in self.lag_terms:
                self.lag_C[n, m, k] += float(c)

    def v(self, s):
        return np.polyval(self.vpoly[::-1], s)

    @staticmethod
    def laguerre_values(x, N, K):
        """L_n^{(k)}(x) for n <= N, k <= K on an array x: array (N+1, K+1, nx), three-term recurrence
        (n+1) L_{n+1} = (2n+k+1-x) L_n - (n+k) L_{n-1}."""
        x = np.asarray(x, dtype=np.float64)
        L = np.zeros((N + 1, K + 1, x.size))
        for k in range(K + 1):
            L[0, k] = 1.0
            if N >= 1:
                L[1, k] = k + 1 - x
            for n in range(1, N):
                L[n + 1, k] = ((2 * n + k + 1 - x) * L[n, k] - (n + k) * L[n - 1, k]) / (n + 1)
        return L

    def DS_eval(self, s, tau, psi):
        """D*S(s, |w|^2, Re(conj z w)) at z = sqrt(s), w = tau e^{i psi}, grid (ntau, npsi), Laguerre form."""
        r = math.sqrt(s)
        Ls = self.laguerre_values(np.array([3.0 * s]), self.lag_N, self.lag_K)[:, :, 0]   # (N+1, K+1)
        Lt = self.laguerre_values(3.0 * tau * tau, self.lag_M, self.lag_K)               # (M+1, K+1, ntau)
        # B[k, tau] = sum_{n,m} C[n,m,k] Ls[n,k] Lt[m,k,tau]
        B = np.einsum("nmk,nk,mkt->kt", self.lag_C, Ls, Lt)
        ks = np.arange(self.lag_K + 1)
        rt = (r * tau)[None, :] ** ks[:, None]                                            # (K+1, ntau)
        ang = np.sin(np.outer(ks, psi))                                                   # (K+1, npsi)
        return (B * rt).T @ ang                                                           # (ntau, npsi)

    def S_table(self, s):
        """P[jV, k] = sum_i coef[i, jV, k] s^i for the node s."""
        pw = s ** np.arange(self.degU + 1)
        return np.tensordot(pw, self.coef, axes=(0, 0))

    def S_eval(self, P, tau, W):
        """S(s, tau^2, W) on a grid: tau (ntau,), W (ntau, npsi). P from S_table."""
        V = tau * tau
        # Q[k](tau) = sum_jV P[jV, k] V^jV (Horner in V)
        Q = np.zeros((P.shape[1], tau.size))
        for k in range(P.shape[1]):
            acc = np.zeros_like(tau)
            for jv in range(P.shape[0] - 1, -1, -1):
                acc = acc * V + P[jv, k]
            Q[k] = acc
        # S = sum_k Q[k] W^k (Horner in W)
        acc = np.zeros_like(W)
        for k in range(P.shape[1] - 1, -1, -1):
            acc = acc * W + Q[k][:, None]
        return acc


# --------------------------------------------------------------------------------------------
# Quadrature building blocks
# --------------------------------------------------------------------------------------------

_GL = {}


def gl(n):
    if n not in _GL:
        _GL[n] = np.polynomial.legendre.leggauss(n)
    return _GL[n]


def panel_points(lo, hi, n):
    x, w = gl(n)
    return lo + (hi - lo) / 2 * (1 + x), (hi - lo) / 2 * w


def panels_points(bounds, n):
    pts, wts = [], []
    for lo, hi in zip(bounds[:-1], bounds[1:]):
        if hi > lo:
            p, w = panel_points(lo, hi, n)
            pts.append(p)
            wts.append(w)
    return np.concatenate(pts), np.concatenate(wts)


def uniform_bounds(lo, hi, maxlen):
    n = max(1, int(math.ceil((hi - lo) / maxlen - 1e-12)))
    return list(np.linspace(lo, hi, n + 1))


def laguerre_charges(x, Dmax):
    """Generator over the charge k = 0..Dmax of the orthonormal Laguerre functions
    ell_m^{(k)}(x) = sqrt(m!/(m+k)!) x^{k/2} e^{-x/2} L_m^{(k)}(x), m = 0..(Dmax-k)//2, as an array
    (M+1, nx), by the three-term recurrence in m (stable; checked against exact evaluation to
    4e-15 through degree 181). The Hermite functions are hh_{c,d}(tau) = (-1)^{min(c,d)}
    ell_{min(c,d)}^{(|c-d|)}(tau^2)  (H_{c,d}(z) = (-1)^d d! z^{c-d} L_d^{(c-d)}(|z|^2) for c >= d;
    `RadialLaguerre.radialFactor` on master). The unstable row recurrence in c is not used."""
    x = np.asarray(x, dtype=np.float64)
    l0 = np.exp(-0.5 * x)
    for k in range(Dmax + 1):
        M = (Dmax - k) // 2
        L = np.zeros((M + 1, x.size))
        L[0] = l0
        if M >= 1:
            L[1] = (k + 1 - x) * l0 / math.sqrt(k + 1)
        for m in range(1, M):
            L[m + 1] = ((2 * m + k + 1 - x) * L[m] - math.sqrt(m * (m + k)) * L[m - 1]) / \
                math.sqrt((m + 1) * (m + k + 1))
        yield k, L
        l0 = l0 * np.sqrt(x / (k + 1))


def hermite_table_scalar(r, P, Q):
    """hh_{p,p'}(r) for p <= P, p' <= Q at a real scalar r (array (P+1, Q+1)), via the Laguerre form."""
    H = np.zeros((P + 1, Q + 1))
    for k, L in laguerre_charges(np.array([r * r]), P + Q):
        for m in range(L.shape[0]):
            v = ((-1) ** m) * L[m, 0]
            if m + k <= P and m <= Q:
                H[m + k, m] = v
            if m <= P and m + k <= Q:
                H[m, m + k] = v
    return H


# --------------------------------------------------------------------------------------------
# One radial node
# --------------------------------------------------------------------------------------------

DEFAULT_CFG = dict(
    r_max=9.0, r_len=0.2, r_gl=16,              # radial nodes in r = sqrt(s)
    tau_max=14.0, tau_len=0.25, tau_gl=16,      # regular |w| panels
    zone=0.25, near_levels=26, near_gl=12,      # graded |w| panels toward the singular circle
    nfft=1024,                                  # angular FFT away from the circle
    psi_near_gl=16, psi_far_len=0.19635, psi_far_gl=32, psi_far_start=0.3927,  # graded angle
    skip_circle_factor=1.5,                     # no grading if A > factor * tau_max
)


def tau_grid(A, cfg):
    """Regular and near-circle tau points. Returns (tau_reg, w_reg, levels) where levels is a list
    of (tau_pts, w_pts, d_scale) for the graded panels (d_scale: relative distance scale)."""
    tmax, zone, L = cfg["tau_max"], cfg["zone"], cfg["near_levels"]
    if not (A < cfg["skip_circle_factor"] * tmax) or A <= 0:
        b = uniform_bounds(0.0, tmax, cfg["tau_len"])
        p, w = panels_points(b, cfg["tau_gl"])
        return p, w, []
    lo_z, hi_z = A * (1 - zone), A * (1 + zone)
    # Away from the near zone the integrand still varies on the scale A (it depends on tau/A), so
    # the panels grow geometrically from the zone's width until they reach the regular length.
    reg_b = []
    if lo_z > 0:
        b, step = [lo_z], zone * A
        while b[-1] > 0:
            nxt = b[-1] - min(step, cfg["tau_len"])
            b.append(max(nxt, 0.0))
            step *= 2
        reg_b.append(b[::-1])
    if hi_z < tmax:
        b, step = [hi_z], zone * A
        while b[-1] < tmax:
            nxt = b[-1] + min(step, cfg["tau_len"])
            b.append(min(nxt, tmax))
            step *= 2
        reg_b.append(b)
    pts, wts = [], []
    for b in reg_b:
        p, w = panels_points(b, cfg["tau_gl"])
        pts.append(p)
        wts.append(w)
    tau_reg = np.concatenate(pts) if pts else np.zeros(0)
    w_reg = np.concatenate(wts) if wts else np.zeros(0)
    levels = []
    for lv in range(L + 1):
        dz = zone * 2.0 ** (-lv)
        dz_in = zone * 2.0 ** (-lv - 1) if lv < L else 0.0
        for sign in (-1, 1):
            lo, hi = A * (1 + sign * dz), A * (1 + sign * dz_in)
            lo, hi = min(lo, hi), max(lo, hi)
            lo, hi = max(lo, 0.0), min(hi, tmax)
            if hi <= lo:
                continue
            p, w = panel_points(lo, hi, cfg["near_gl"])
            d_min = float(np.min(np.abs(p / A - 1.0)))
            levels.append((p, w, d_min))
    return tau_reg, w_reg, levels


def psi_grid_graded(psi0, d, cfg):
    """Graded Gauss-Legendre angle grid around psi0 for a relative distance scale d."""
    half = d / 2.0
    bounds_pos = [0.0, half]
    x = half
    while x * 2 < cfg["psi_far_start"]:
        x *= 2
        bounds_pos.append(x)
    # graded panels: 16 points while short (the integrand's own scale), 32 once a panel is long
    # enough that e^{-ik psi}, |k| <= K ~ 181, oscillates inside it (length >= 0.06)
    pts, wts = [], []
    for lo, hi in zip(bounds_pos[:-1], bounds_pos[1:]):
        n = cfg["psi_near_gl"] if (hi - lo) < 0.06 else cfg["psi_far_gl"]
        p, w = panel_points(lo, hi, n)
        pts.append(p)
        wts.append(w)
    far_b = uniform_bounds(bounds_pos[-1], math.pi, cfg["psi_far_len"])
    pf, wf = panels_points(far_b, cfg["psi_far_gl"])
    off = np.concatenate(pts + [pf])
    w = np.concatenate(wts + [wf])
    psi = np.concatenate([psi0 + off, psi0 - off])
    return psi, np.concatenate([w, w])


class Node:
    """All per-node quantities for one r and one power j."""

    def __init__(self, R: Rounding, j, r, cfg, K):
        self.R, self.j, self.r, self.cfg, self.K = R, j, float(r), cfg, K
        self.s = self.r * self.r
        self.v = float(R.v(self.s))
        self.b = R.kappa * self.v
        self.A = self.r / abs(self.b) if self.b != 0 else float("inf")
        self.psi0 = math.pi if self.b > 0 else 0.0
        self.P = R.S_table(self.s)

    def phi_pow_times(self, tau, psi, with_ph=True, power=None):
        """(i phi)^power * ph(r + b w) * e^{-tau^2/2} on the grid tau (n,) x psi (m,).
        with_ph=False drops the phase factor; power defaults to j."""
        j = self.j if power is None else power
        tau = np.asarray(tau)[:, None]
        cpsi, spsi = np.cos(psi)[None, :], np.sin(psi)[None, :]
        if self.R.lag_terms is not None and not self.cfg.get("monomial_phase", False):
            DS = self.R.DS_eval(self.s, np.asarray(tau).ravel(), psi)
        else:
            W = self.r * tau * cpsi
            D = self.r * tau * spsi
            DS = D * self.R.S_eval(self.P, np.asarray(tau).ravel(), W)
        phi = np.exp(-self.R.eps * (self.s + tau * tau)) * DS
        out = np.exp(-0.5 * tau * tau) * (1j * phi) ** j if j > 0 else np.exp(-0.5 * tau * tau) + 0j * phi
        if with_ph:
            y = self.r + self.b * tau * (cpsi + 1j * spsi)
            ay = np.abs(y)
            ph = np.where(ay > 0, y / np.where(ay > 0, ay, 1.0), 0.0)
            out = out * ph
        return out

    def phihat(self):
        """PhiHat_k(tau) for |k| <= K on all tau points. Returns tau (n,), wtau (n,), PH (2K+1, n)."""
        K, cfg = self.K, self.cfg
        tau_reg, w_reg, levels = tau_grid(self.A, cfg)
        taus, wts, blocks = [], [], []
        if tau_reg.size:
            N = cfg["nfft"]
            psi = 2 * math.pi * np.arange(N) / N
            F = np.fft.fft(self.phi_pow_times(tau_reg, psi), axis=1) * (2 * math.pi / N)
            ks = np.arange(-K, K + 1) % N
            blocks.append(F[:, ks].T)
            taus.append(tau_reg)
            wts.append(w_reg)
        for p, w, dmin in levels:
            psi, wpsi = psi_grid_graded(self.psi0, max(dmin, 1e-300), cfg)
            E = np.exp(-1j * np.outer(np.arange(-K, K + 1), psi)) * wpsi[None, :]
            vals = self.phi_pow_times(p, psi)
            blocks.append(E @ vals.T)
            taus.append(p)
            wts.append(w)
        return np.concatenate(taus), np.concatenate(wts), np.concatenate(blocks, axis=1)

    def J(self, Dw):
        """J[c,d] (real) for c+d <= Dw as a dense (Dw+1, Dw+1) array; also the max imaginary part
        and the node's angular energy sum E_w[phi^{2j}] on the same grid."""
        K = self.K
        assert K >= Dw
        tau, wtau, PH = self.phihat()
        fac = wtau * tau / math.pi
        J = np.zeros((Dw + 1, Dw + 1))
        imax = 0.0
        # J[m+k, m] = (1/pi) sum_tau w tau hh_{m+k,m} PhiHat_{+k};  J[m, m+k]: PhiHat_{-k};
        # hh_{m+k,m} = hh_{m,m+k} = (-1)^m ell_m^{(k)}(tau^2)
        for k, L in laguerre_charges(tau * tau, Dw):
            signs = ((-1.0) ** np.arange(L.shape[0]))[:, None]
            Ls = L * signs
            plus = Ls @ (PH[K + k] * fac)
            ms = np.arange(L.shape[0])
            J[ms + k, ms] = plus.real
            imax = max(imax, float(np.max(np.abs(plus.imag))))
            if k > 0:
                minus = Ls @ (PH[K - k] * fac)
                J[ms, ms + k] = minus.real
                imax = max(imax, float(np.max(np.abs(minus.imag))))
        return J, imax, tau, wtau

    def moment(self, power):
        """E_w[phi(r,w)^power] on the node's grid (no phase factor)."""
        tau, wtau, levels = tau_grid(self.A, self.cfg)
        total = 0.0
        if tau.size:
            N = self.cfg["nfft"]
            psi = 2 * math.pi * np.arange(N) / N
            vals = self.phi_pow_times(tau, psi, with_ph=False, power=power)
            vals = (vals * np.exp(-0.5 * tau * tau)[:, None]).real  # e^{-tau^2} phi^power (i^power dropped below)
            total += float(np.sum(vals.sum(axis=1) * (2 * math.pi / N) * wtau * tau)) / math.pi
        for p, w, dmin in levels:
            psi, wpsi = psi_grid_graded(self.psi0, max(dmin, 1e-300), self.cfg)
            vals = self.phi_pow_times(p, psi, with_ph=False, power=power)
            vals = (vals * np.exp(-0.5 * p * p)[:, None]).real
            total += float(np.sum((vals * wpsi[None, :]).sum(axis=1) * w * p)) / math.pi
        sgn = (1j ** power).real  # i^power for even power is +-1
        return total * sgn


# --------------------------------------------------------------------------------------------
# Radial nodes and shards
# --------------------------------------------------------------------------------------------


def radial_nodes(cfg):
    b = uniform_bounds(0.0, cfg["r_max"], cfg["r_len"])
    return panels_points(b, cfg["r_gl"])


def load_cfg(name, root=ROOT):
    path = os.path.join(root, "data/upper-closure/config.json")
    cfg = dict(DEFAULT_CFG)
    if os.path.exists(path):
        with open(path, encoding="utf-8") as f:
            presets = json.load(f)["presets"]
        if name not in presets:
            raise SystemExit(f"unknown preset {name}; have {sorted(presets)}")
        cfg.update(presets[name])
    elif name != "default":
        raise SystemExit("no config file; only preset 'default'")
    return cfg


def tri_pack(J, Dw):
    """Pack the triangle c+d <= Dw of a (Dw+1, Dw+1) array into a flat vector."""
    idx = np.array([(c, d) for c in range(Dw + 1) for d in range(Dw + 1 - c)])
    return J[idx[:, 0], idx[:, 1]], idx


def cmd_nodes(args):
    R = Rounding(load_data_lean(args.root))
    cfg = load_cfg(args.config, args.root)
    r_all, w_all = radial_nodes(cfg)
    shard, nshards = args.shard
    ids = np.arange(r_all.size)[shard::nshards]
    j, Dw = args.power, args.Dw
    if Dw is None:
        Dw = {0: 60, 1: 181, 2: 91, 3: 51}[j]
    K = Dw
    center = load_center(j, args.root) if j > 0 else None
    Qc = len(center) if center else 0
    os.makedirs(args.out, exist_ok=True)
    recs = []
    t0 = time.time()
    for n, i in enumerate(ids):
        r = float(r_all[i])
        node = Node(R, j, r, cfg, K)
        t1 = time.time()
        J, imax, tau, wtau = node.J(Dw)
        mom = node.moment(2 * j) if j > 0 else 1.0
        G = 0.0
        if center:
            Hz = hermite_table_scalar(r, Qc, Qc - 1)  # hh_{p,p'}(r), p <= Qc, p' <= Qc-1
            Vh = np.zeros((Qc + 1, Qc))
            for q in range(Qc):
                C = center[q]  # (q+2, q+1): C[c, d]
                cs = np.arange(q + 2)[:, None]
                ds = np.arange(q + 1)[None, :]
                Vh[:q + 2, :q + 1] += C * Hz[q + 1 - cs, q - ds]
            G = float(np.sum(Vh * J[:Qc + 1, :Qc]))
        packed, _ = tri_pack(J, Dw)
        recs.append(dict(i=int(i), r=r, w=float(w_all[i]), s=node.s, v=node.v, b=node.b, A=node.A,
                         ntau=int(tau.size), imax=imax, moment=mom, G=G, sumsq=float(np.sum(J * J)),
                         seconds=time.time() - t1))
        if n == 0:
            data = np.zeros((ids.size, packed.size))
        data[n] = packed
        if args.verbose:
            print(f"node {i:5d} r={r:.4f} s={node.s:.3f} A={node.A:.3e} ntau={tau.size} imax={imax:.1e} "
                  f"sumJ2={recs[-1]['sumsq']:.3e} mom={mom:.3e} G={G:.6e} {recs[-1]['seconds']:.1f}s", flush=True)
    out = os.path.join(args.out, f"nodes-j{j}-{args.config}-{shard}of{nshards}.npz")
    np.savez_compressed(out, J=data, ids=ids, Dw=Dw, meta=json.dumps(dict(cfg=cfg, recs=recs, power=j)))
    print(f"wrote {out}: {ids.size} nodes, {time.time() - t0:.0f}s", flush=True)


def load_shards(out, j, config):
    pat = re.compile(rf"nodes-j{j}-{re.escape(config)}-(\d+)of(\d+)\.npz$")
    files = sorted(f for f in os.listdir(out) if pat.match(f))
    if not files:
        raise SystemExit(f"no shard files for j={j} config={config} in {out}")
    ns = {int(pat.match(f).group(2)) for f in files}
    assert len(ns) == 1, ns
    nsh = ns.pop()
    have = {int(pat.match(f).group(1)) for f in files}
    missing = set(range(nsh)) - have
    if missing:
        print(f"WARNING: missing shards {sorted(missing)}", file=sys.stderr)
    Js, ids, recs, Dw, cfg = [], [], [], None, None
    for f in files:
        z = np.load(os.path.join(out, f))
        Js.append(z["J"])
        ids.append(z["ids"])
        meta = json.loads(str(z["meta"]))
        recs += meta["recs"]
        Dw, cfg = int(z["Dw"]), meta["cfg"]
    J = np.concatenate(Js)
    ids = np.concatenate(ids)
    order = np.argsort(ids)
    recs = sorted(recs, key=lambda d: d["i"])
    return J[order], ids[order], recs, Dw, cfg


def cmd_assemble(args):
    j = args.power
    consts = load_constants(args.root)
    Jp, ids, recs, Dw, cfg = load_shards(args.out, j, args.config)
    _, idx = tri_pack(np.zeros((Dw + 1, Dw + 1)), Dw)
    n = Jp.shape[0]
    r = np.array([d["r"] for d in recs])
    w = np.array([d["w"] for d in recs])
    G = np.array([d["G"] for d in recs])
    mom = np.array([d["moment"] for d in recs])
    radial_w = w * 2 * r * np.exp(-0.5 * r * r)       # int 2 r e^{-r^2} (.) dr with hh carrying e^{-r^2/2}
    # inner product and moment
    I = float(np.sum(radial_w * G))
    Emom = float(np.sum(w * 2 * r * np.exp(-r * r) * mom))
    E_exact = float(consts[("moment", j)])
    C_exact = float(consts[("energy", j)])
    fact = consts[("factorial", j)]
    Rj = float(consts[("radius", j)])
    whole_sq = E_exact - 2 * I + C_exact
    bound_sq = (fact * Rj) ** 2
    Imin = (E_exact + C_exact - bound_sq) / 2
    # coefficients on the center support (grades q < Qc) or on the low band only
    Qc = consts[("grades", j)]
    Dlow = consts[("lowdeg", j)]
    Qlow = (Dlow - 1) // 2 + 1
    Qa = Qc if args.all else Qlow
    center = load_center(j, args.root)
    # dense J per node for lookups
    Jd = np.zeros((n, Dw + 1, Dw + 1))
    Jd[:, idx[:, 0], idx[:, 1]] = Jp
    a = [np.zeros((q + 2, q + 1)) for q in range(Qa)]
    Hz_all = np.array([hermite_table_scalar(float(rr), Qa, max(Qa - 1, 0)) for rr in r])  # (n, Qa+1, Qa)
    for q in range(Qa):
        cs = np.arange(q + 2)[:, None]
        ds = np.arange(q + 1)[None, :]
        # a[q][c,d] = sum_n radial_w[n] hh_{q+1-c,q-d}(r_n) J_n[c,d]
        Hq = Hz_all[:, q + 1 - cs, q - ds]              # (n, q+2, q+1)
        Jq = Jd[:, :q + 2, :q + 1]
        a[q] = np.einsum("n,ncd,ncd->cd", radial_w, Hq, Jq)
    # low band comparison
    diff_sq = 0.0
    cen_sq = 0.0
    a_sq = 0.0
    maxdiff = 0.0
    for q in range(Qlow):
        d = a[q] - center[q]
        diff_sq += float(np.sum(d * d))
        cen_sq += float(np.sum(center[q] ** 2))
        a_sq += float(np.sum(a[q] ** 2))
        maxdiff = max(maxdiff, float(np.max(np.abs(d))))
    low_cap = float(consts[("lowcap", j)])
    res = dict(power=j, config=args.config, nodes=n, Dw=Dw,
               I=I, I_min=Imin, I_margin=I - Imin, I_minus_C=I - C_exact,
               E_exact=E_exact, E_quadrature=Emom, E_rel_err=(Emom - E_exact) / E_exact,
               C_exact=C_exact, whole_error_sq=whole_sq,
               whole_error=math.sqrt(max(whole_sq, 0.0)), bound=fact * Rj, bound_sq=bound_sq,
               whole_margin_sq=bound_sq - whole_sq,
               low_band_deg=Dlow, low_band_coeffs=sum((q + 2) * (q + 1) for q in range(Qlow)),
               low_band_norm_diff=math.sqrt(diff_sq), low_band_cap=low_cap,
               low_band_max_coeff_diff=maxdiff, low_band_center_norm=math.sqrt(cen_sq),
               low_band_computed_norm=math.sqrt(a_sq),
               max_imag_residual=max(d["imax"] for d in recs),
               node_seconds=sum(d["seconds"] for d in recs))
    if args.all:
        # I_j by the coefficient route and the full-support comparison with the center
        I2 = 0.0
        dsq = 0.0
        for q in range(Qc):
            I2 += float(np.sum(center[q] * a[q]))
            dsq += float(np.sum((a[q] - center[q]) ** 2))
        res.update(I_coefficient_route=I2, I_route_difference=I2 - I,
                   center_support_norm_diff=math.sqrt(dsq),
                   center_support_norm_diff_sq=dsq,
                   whole_error_sq_from_coeffs=E_exact - 2 * I2 + C_exact)
    tag = f"assemble-j{j}-{args.config}" + ("-all" if args.all else "")
    with open(os.path.join(args.out, tag + ".json"), "w", encoding="utf-8") as f:
        json.dump(res, f, indent=1)
    np.savez_compressed(os.path.join(args.out, tag + "-coeffs.npz"),
                        **{f"a{q}": a[q] for q in range(Qa)})
    for k, v in res.items():
        print(f"{k:28s} {v}")
    verdict = "HOLDS" if whole_sq <= bound_sq else "FAILS"
    print(f"\nwhole-error hypothesis j={j}: {verdict}  (whole^2 = {whole_sq:.6e} vs bound^2 = {bound_sq:.6e}, "
          f"margin {bound_sq - whole_sq:.3e} = {100 * (bound_sq - whole_sq) / bound_sq:.1f} % of bound^2)")
    verdict = "HOLDS" if math.sqrt(diff_sq) <= low_cap else "FAILS"
    print(f"low-band hypothesis j={j}: {verdict}  (||a - c||_band = {math.sqrt(diff_sq):.6e} vs cap {low_cap:.6e})")


def cmd_moments(args):
    """E phi^{2j} by the node quadrature (no phase, no Hermite) against the exact rationals."""
    R = Rounding(load_data_lean(args.root))
    cfg = load_cfg(args.config, args.root)
    consts = load_constants(args.root)
    r_all, w_all = radial_nodes(cfg)
    for j in (1, 2, 3):
        tot = 0.0
        for r, w in zip(r_all, w_all):
            node = Node(R, j, r, cfg, 1)
            tot += w * 2 * r * math.exp(-r * r) * node.moment(2 * j)
        ex = float(consts[("moment", j)])
        print(f"j={j}: E phi^{2*j} quadrature {tot:.15e} exact {ex:.15e} rel.err {(tot - ex) / ex:.3e}")


def reference_triangle(A, D, digits=60):
    """The quadrature checker's conditional triangle I_{c,d}(A) (c <= d+1, c+d <= D) in `decimal`
    (tools/quad_checker_reference.py of #303): J0 series, backward ratios, zero row, charge recurrence.
    Valid for moderate x = A^2 (series), used here only as a cross-check at a chosen node."""
    from decimal import Decimal, getcontext
    getcontext().prec = digits
    A = Decimal(repr(A))
    x = A * A
    # pi by Machin
    def arctan_inv(nn):
        xx = Decimal(1) / nn
        x2 = xx * xx
        term, total, k = xx, Decimal(0), 0
        eps = Decimal(10) ** -(digits + 5)
        while abs(term) > eps:
            total += term / (2 * k + 1)
            term = -term * x2
            k += 1
        return total
    pi = 16 * arctan_inv(5) - 4 * arctan_inv(239)
    t, j0 = Decimal(1), Decimal(1)
    for nn in range(2000):
        t = t * (-x) * (2 * nn + 1) / (2 * (nn + 1) * (nn + 2))
        j0 += t
        if abs(t) < Decimal(10) ** -(digits + 5) and nn > 10:
            break
    S = pi.sqrt() / 2 * A * j0
    depth = 2000
    rr = Decimal(1) / 2
    rs = [None] * (D + 1)
    for h in range(depth - 1, -1, -1):
        rr = (Decimal(h) + Decimal(1) / 2) / (h + 2 + x - x * rr)
        if h <= D:
            rs[h] = rr
    U = {(0, 0): Decimal(1)}
    for d in range(D):
        U[(0, d + 1)] = -A * rs[d] * U[(0, d)] / Decimal(d + 1).sqrt()
    for c in range((D + 1) // 2):
        den = A * Decimal(c + 1).sqrt()
        for d in range(c, D - c):
            U[(c + 1, d)] = (A * Decimal(d + 1).sqrt() * U[(c, d + 1)] + (d + 1 - c) * U[(c, d)]) / den
    return {p: float(S * u) for p, u in U.items() if p[0] + p[1] <= D}


def cmd_check_j0(args):
    """j = 0 cross-checks: (a) at the node r the w-quadrature against the reference triangle at the
    same shift; (b) with --raw FILE, the assembled F0 coefficients of grades q < Q against the quad
    checker's raw enclosures (lines 'lo hi' at scale 2^128, committed block layout)."""
    R = Rounding(load_data_lean(args.root))
    cfg = load_cfg(args.config, args.root)
    Dw = args.Dw or 40
    if args.r is not None:
        node = Node(R, 0, args.r, cfg, Dw)
        J, imax, tau, wtau = node.J(Dw)
        print(f"r={args.r} s={node.s:.6f} v={node.v:.6e} b={node.b:.6e} A={node.A:.6f} ntau={tau.size} imag {imax:.2e}")
        if node.A < 40:
            ref = reference_triangle(node.A, Dw)
            sign = -1.0 if node.b < 0 else 1.0
            worst, wloc = 0.0, None
            band = {}
            for (c, d), val in ref.items():
                mine = J[c, d]
                exp = (sign ** (c + d)) * val
                e = abs(mine - exp)
                m = (c + d) // 10
                band[m] = max(band.get(m, 0.0), e)
                if e > worst:
                    worst, wloc = e, (c, d, mine, exp)
            print(f"max |J - sign^(c+d) I_ref| over the canonical triangle c+d<={Dw}: {worst:.3e} at (c,d)="
                  f"{wloc[:2]} J={wloc[2]:.6e} ref={wloc[3]:.6e}; by band of c+d: "
                  + ", ".join(f"[{10*m},{10*m+9}]:{band[m]:.1e}" for m in sorted(band)))
            for (c, d) in [(0, 0), (0, 1), (1, 0), (1, 1), (0, 5), (3, 4), (10, 12)]:
                if (c, d) in ref:
                    print(f"  ({c},{d}): J={J[c, d]: .16e}  ref={(sign ** (c + d)) * ref[(c, d)]: .16e}")
        print(f"sum J^2 over c+d<={Dw}: {np.sum(J * J):.12f} (Bessel: <= 1)")
    if args.raw:
        Jp, ids, recs, Dw, cfg = load_shards(args.out, 0, args.config)
        _, idx = tri_pack(np.zeros((Dw + 1, Dw + 1)), Dw)
        n = Jp.shape[0]
        r = np.array([d["r"] for d in recs])
        w = np.array([d["w"] for d in recs])
        radial_w = w * 2 * r * np.exp(-0.5 * r * r)
        Jd = np.zeros((n, Dw + 1, Dw + 1))
        Jd[:, idx[:, 0], idx[:, 1]] = Jp
        Q = args.Q
        Hz_all = np.array([hermite_table_scalar(float(rr), Q, max(Q - 1, 0)) for rr in r])
        # block layout
        def side(k):
            return 251 if k == 0 else 252 - k
        offs = [0]
        for k in range(252):
            offs.append(offs[-1] + side(k) ** 2)
        need = {}
        for q in range(Q):
            for c in range(q + 2):
                for d in range(q + 1):
                    if c <= d + 1:
                        k = d + 1 - c
                        jj = q - d
                        col = c - 1 if k == 0 else c
                        need[offs[k] + jj * side(k) + col] = (q, c, d)
        raw = {}
        with open(args.raw, encoding="utf-8") as f:
            for ln, line in enumerate(f):
                if ln in need:
                    lo, hi = line.split()
                    raw[need[ln]] = (int(lo) / 2.0 ** 128, int(hi) / 2.0 ** 128)
                if ln > max(need):
                    break
        worst = 0.0
        rows = []
        for q in range(Q):
            cs = np.arange(q + 2)[:, None]
            ds = np.arange(q + 1)[None, :]
            Hq = Hz_all[:, q + 1 - cs, q - ds]
            aq = np.einsum("n,ncd,ncd->cd", radial_w, Hq, Jd[:, :q + 2, :q + 1])
            for c in range(q + 2):
                for d in range(q + 1):
                    if (q, c, d) in raw:
                        lo, hi = raw[(q, c, d)]
                        mid = (lo + hi) / 2
                        worst = max(worst, abs(aq[c, d] - mid))
                        rows.append((q, c, d, aq[c, d], mid))
        print(f"F0 coefficients of grades q<{Q} (canonical pairs) vs raw enclosure midpoints: "
              f"{len(rows)} compared, max |a - mid| = {worst:.3e}")
        for row in rows[:12]:
            print("  q=%d c=%d d=%d  a=% .15e  raw=% .15e  diff=% .2e" % (row[0], row[1], row[2], row[3], row[4], row[3] - row[4]))


def cmd_check_phase(args):
    """Exact check that the Laguerre-angular data equal D*S of Data.lean: expand both into monomials
    in (U, V, W, D^2) with D^2 = UV - W^2 eliminated, in Fraction arithmetic; also report the float64
    conditioning of both evaluators at a few bulk points."""
    data = load_data_lean(args.root)
    R = Rounding(data)
    assert R.lag_terms is not None, "data/upper-closure/phase-laguerre.json missing"
    # monomial side: D * sum c U^i V^j W^k  -> dictionary over (i, j, k, dpow) with dpow = 1
    mono = {}
    for (i, j, k), c in data["terms"]:
        mono[(i, j, k, 1)] = mono.get((i, j, k, 1), Fraction(0)) + c

    def lag_poly(n, k):  # L_n^{(k)}(3x) as dict power -> coefficient
        return {jj: Fraction((-1) ** jj * math.comb(n + k, n - jj) * 3 ** jj, math.factorial(jj)) for jj in range(n + 1)}

    def im_pow(k):  # Im((W + iD)^k) as dict (wpow, dpow) -> coefficient, dpow odd
        out = {}
        for t in range(k + 1):
            if t % 2 == 1:
                out[(k - t, t)] = out.get((k - t, t), 0) + math.comb(k, t) * ((-1) ** ((t - 1) // 2))
        return out

    lag = {}
    for (n, m, k), c in R.lag_terms:
        Pn, Pm, A = lag_poly(n, k), lag_poly(m, k), im_pow(k)
        for i, ci in Pn.items():
            for j, cj in Pm.items():
                for (wp, dp), ca in A.items():
                    key = (i, j, wp, dp)
                    lag[key] = lag.get(key, Fraction(0)) + c * ci * cj * ca

    # reduce D^{2a+1} = D (UV - W^2)^a on the Laguerre side
    red = {}
    for (i, j, wp, dp), c in lag.items():
        a = (dp - 1) // 2
        for t in range(a + 1):
            # (UV - W^2)^a = sum_t C(a,t) (UV)^{a-t} (-W^2)^t
            key = (i + a - t, j + a - t, wp + 2 * t, 1)
            red[key] = red.get(key, Fraction(0)) + c * math.comb(a, t) * ((-1) ** t)
    red = {k: v for k, v in red.items() if v != 0}
    mono = {k: v for k, v in mono.items() if v != 0}
    same = red == mono
    print(f"Laguerre-angular form == D * S(phaseStrs) as polynomials: {same} "
          f"({len(red)} vs {len(mono)} monomials)")
    if not same:
        diff = {k: red.get(k, 0) - mono.get(k, 0) for k in set(red) | set(mono)}
        bad = [(k, v) for k, v in diff.items() if v != 0]
        print("  differing monomials:", len(bad), bad[:5])
        return 1
    # conditioning
    for (s, tau, psi) in [(1.44, 1.0, 0.3), (1.44, 3.0, 2.0), (6.25, 2.0, 1.0), (0.09, 1.0, 1.0), (10.0, 6.0, 0.2)]:
        r = math.sqrt(s)
        exact = Fraction(0)
        Uq, Vq, Wq, Dq = Fraction(s), Fraction(tau * tau), Fraction(r * tau * math.cos(psi)), Fraction(r * tau * math.sin(psi))
        for (i, j, k), c in data["terms"]:
            exact += c * Uq ** i * Vq ** j * Wq ** k
        exact = float(Dq * exact)
        lagv = float(R.DS_eval(s, np.array([tau]), np.array([psi]))[0, 0])
        P = R.S_table(s)
        monov = float(r * tau * math.sin(psi) * R.S_eval(P, np.array([tau]), np.array([[r * tau * math.cos(psi)]]))[0, 0])
        print(f"  s={s} tau={tau} psi={psi}: exact {exact: .12e}  laguerre rel.err {abs(lagv - exact) / abs(exact):.1e}"
              f"  monomial rel.err {abs(monov - exact) / abs(exact):.1e}")
    return 0


def cmd_config(args):
    cfg = load_cfg(args.config, args.root)
    r, w = radial_nodes(cfg)
    R = Rounding(load_data_lean(args.root))
    print(json.dumps(cfg, indent=1))
    print(f"radial nodes: {r.size}; r in [{r.min():.4f}, {r.max():.4f}]")
    A = r / np.abs(R.kappa * R.v(r * r))
    print(f"A: min {A.min():.3e} max {A.max():.3e}; nodes with A<12: {int(np.sum(A < 12))}")
    node = Node(R, 1, float(r[r.size // 3]), cfg, 181)
    tau, wtau, levels = tau_grid(node.A, cfg)
    print(f"example node r={node.r:.4f} A={node.A:.3f}: regular tau points {tau.size}, "
          f"graded levels {len(levels)} with {sum(p.size for p, _, _ in levels)} points")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--root", default=ROOT)
    ap.add_argument("--out", default=os.path.join(ROOT, "handoff", "upper-closure"))
    ap.add_argument("--config", default="default")
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("nodes")
    p.add_argument("--power", type=int, required=True)
    p.add_argument("--shard", type=lambda s: tuple(int(x) for x in s.split("/")), default=(0, 1))
    p.add_argument("--Dw", type=int, default=None)
    p.add_argument("--verbose", action="store_true")
    p.set_defaults(func=cmd_nodes)
    p = sub.add_parser("assemble")
    p.add_argument("--power", type=int, required=True)
    p.add_argument("--all", action="store_true", help="coefficients on the whole center support")
    p.set_defaults(func=cmd_assemble)
    p = sub.add_parser("moments")
    p.set_defaults(func=cmd_moments)
    p = sub.add_parser("check-j0")
    p.add_argument("--r", type=float, default=None)
    p.add_argument("--Dw", type=int, default=None)
    p.add_argument("--raw", default=None)
    p.add_argument("--Q", type=int, default=6)
    p.set_defaults(func=cmd_check_j0)
    p = sub.add_parser("config")
    p.set_defaults(func=cmd_config)
    p = sub.add_parser("check-phase")
    p.set_defaults(func=cmd_check_phase)
    args = ap.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
