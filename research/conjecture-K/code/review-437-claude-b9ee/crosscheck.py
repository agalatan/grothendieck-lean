"""Independent floating-point cross-check of PR #437. Agent-ID: claude-b9ee. Label N (numerical only).

(1) H0(w) = E[h^T K(L+w) h] and V(w) = E[|h|^2/|L+w|] computed DIRECTLY in the Gaussian
    coordinate z1 (adaptive quadrature in (T, phi) with breakpoints at the singular point),
    with no change of variables;
(2) the same matrices from the author's polar formulas, implemented independently here;
(3) margins of the three continuum claims over a fine grid of shifts w.
(4) finite-difference values of F0'' and beta'' on the critical box (noisy: Re ph is
    discontinuous at L+w=0; the certified bounds are in curvature_bounds.py).
Needs numpy and scipy; about 25 minutes.  Output of the review run: README.md.
"""
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.integrate import quad_vec
from scipy.optimize import brentq

a, b = 699/1250, 179/1250
rho, s = 5053/10000, 3/5
v = s*rho
p = 2500/1891
pc = p - 463/5000
Qmat = np.array([[pc - .67 - .08*rho**2, -.59*rho], [-.59*rho, pc - .67*rho**2 - .08]])
SQ2 = np.sqrt(2.0)


def basis_h(T, Z):
    """h for the four real coefficient directions: (Re A, Re B) and (Im A, Im B)."""
    z = T - .4
    zeta = Z**2/SQ2
    hAr = z + 0*Z            # A = 1
    hBr = v + zeta           # B = 1: v*B + Z^2 conj(B)/sqrt2
    hAi = 1j*z + 0*Z         # A = i
    hBi = 1j*v - 1j*zeta     # B = i: conj(B) = -i
    return hAr, hBr, hAi, hBi


def direct(w, kind):
    """kind 'V': E|h|^2/|x|; kind 'H': E (Im h conj x)^2/|x|^3. Blocks (real, imag), each 2x2."""
    Tstar = brentq(lambda t: np.sqrt(t)*(a + b*t) - w, 0, 50) if w > 0 else 0.0

    def inner(T):
        def f(phi):
            Z = np.sqrt(T)*np.exp(1j*phi)
            x = Z*(a + b*T) + w
            hs = basis_h(T, Z)
            out = []
            for (h1, h2) in [(hs[0], hs[1]), (hs[2], hs[3])]:
                if kind == 'V':
                    m = 1/abs(x)
                    out += [abs(h1)**2*m, (h1*np.conj(h2)).real*m, abs(h2)**2*m]
                else:
                    g1 = (h1*np.conj(x)).imag; g2 = (h2*np.conj(x)).imag; m = 1/abs(x)**3
                    out += [g1*g1*m, g1*g2*m, g2*g2*m]
            return np.array(out)
        val, _ = quad_vec(f, 0, np.pi, points=[np.pi*(1 - 1e-9)], epsabs=1e-9, epsrel=1e-8, limit=200)
        return val/np.pi * np.exp(-T)          # (1/2pi) * 2 (fold phi -> -phi) ; density e^-T dT

    pts = [Tstar] if 0 < Tstar < 60 else None
    val, _ = quad_vec(inner, 0, 60, points=pts, epsabs=1e-9, epsrel=1e-8, limit=200)
    return val


def tsolve(vv):
    t = np.minimum(vv/a**2, np.cbrt(vv/b**2))
    for _ in range(80):
        f = t*(a + b*t)**2 - vv
        t = np.maximum(t - f/((a + b*t)*(a + 3*b*t)), 0)
    return t


def polar(w, kind, nr=48, nu=96):
    rb = [0, .0625, .125, .25, .5, .75, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 12, 16, 24, 32, 40]
    if w > 0:
        rb = sorted(set(rb + [w]))
    xr, wr = leggauss(nr); xu, wu = leggauss(nu)
    R, WR = [], []
    for lo, hi in zip(rb[:-1], rb[1:]):
        R.append((hi - lo)/2*xr + (hi + lo)/2); WR.append((hi - lo)/2*wr)
    R = np.concatenate(R); WR = np.concatenate(WR)
    ub = np.linspace(0, 1, 9)
    U, WU = [], []
    for lo, hi in zip(ub[:-1], ub[1:]):
        U.append((hi - lo)/2*xu + (hi + lo)/2); WU.append((hi - lo)/2*wu)
    U = np.concatenate(U); WU = np.concatenate(WU)
    r = R[:, None]; th = np.pi*U[None, :]
    y = r*np.exp(1j*th) - w
    T = tsolve(np.abs(y)**2)
    aa = a + b*T; D = aa*(a + 3*b*T)
    Z = y/aa
    wt = 2*np.exp(-T)/D * (WR[:, None]*WU[None, :])
    z = T - .4
    if kind == 'H':
        si, co = np.sin(th), np.cos(th)
        v0 = -z*si; v2 = ((r**2 - w**2)/(SQ2*aa**2) - v)*si
        v1 = z*co;  v3 = v*co - ((r**2 + w**2)*co - 2*r*w)/(SQ2*aa**2)
        ent = [v0*v0, v0*v2, v2*v2, v1*v1, v1*v3, v3*v3]
    else:
        zeta = Z**2/SQ2; zr, zi = zeta.real, zeta.imag
        ent = [z*z, z*(v + zr), (v + zr)**2 + zi**2, z*z, z*(v - zr), (v - zr)**2 + zi**2]
    return np.array([np.sum(wt*e) for e in ent]), np.sum(wt*r)   # second: E[1] check


def mats(e):
    return [np.array([[e[0], e[1]], [e[1], e[2]]]), np.array([[e[3], e[4]], [e[4], e[5]]])]


def margin(e, w, shift):
    return min(np.linalg.eigvalsh(Qmat + shift*np.eye(2) - M).min() for M in mats(e))


if __name__ == '__main__':
    import sys
    pr = lambda *x: (print(*x), sys.stdout.flush())
    pr('E[1] via polar change of variables (should be 1):', polar(.7, 'H')[1])
    from scipy.integrate import quad
    J = [quad(lambda t, j=j: t**(j - .5)*np.exp(-t)/(a + b*t), 0, np.inf, epsabs=1e-14)[0] for j in range(3)]
    K0 = np.array([[(J[2] - .8*J[1] + .16*J[0])/2, (v*(J[1] - .4*J[0]) - (J[2] - .4*J[1])/SQ2)/2],
                   [0, (v*v*J[0] - SQ2*v*J[1] + J[2]/2)/2]]); K0[1, 0] = K0[0, 1]
    h0 = polar(0.0, 'H')[0]
    pr('K0 closed form', np.round(K0, 8).tolist(), ' vs polar H0(0) blocks', np.round(mats(h0)[0], 8).tolist(), np.round(mats(h0)[1], 8).tolist())
    pr('origin: min eig (Q0 - K0) =', np.linalg.eigvalsh(Qmat - K0).min(), ' claimed > 7/400 =', 7/400)
    ws = np.linspace(0, 2, 161)
    mh = [margin(polar(w, 'H')[0], w, .5*w*w - .01) for w in ws]
    i = int(np.argmin(mh)); pr(f'(H)  Q0+(w^2/2-.01)S - H0 : min eig {mh[i]:.6f} at w={ws[i]:.4f}')
    mv = [margin(polar(w, 'V')[0], w, .5*w*w + .75) for w in ws]
    j = int(np.argmin(mv)); pr(f'(E1) Q0+(w^2/2+3/4)S - V  : min eig {mv[j]:.6f} at w={ws[j]:.4f}')
    ws2 = np.linspace(11/8, 2, 51)
    ms = [margin(polar(w, 'V')[0], w, .5*w*w) for w in ws2]
    k = int(np.argmin(ms)); pr(f'(E2) Q0+(w^2/2)S - V, w>=11/8: min eig {ms[k]:.6f} at w={ws2[k]:.4f}')
    for w in [1.1, 1.2, 1.25, 1.3, 1.35]:
        pr(f'   shift-exterior margin at w={w}: {margin(polar(w, "V")[0], w, .5*w*w):+.5f}')
    for S0 in [.5, .6, .7]:
        mm = min(margin(polar(w, 'V')[0], w, .5*w*w + S0) for w in np.linspace(0, 2, 41))
        pr(f'   amplitude-exterior margin with S0={S0}: {mm:+.5f}')
    T = np.linspace(0, 60, 600001); M = 503/1000 + 613/500*T
    pr('max e^-T M^3/D =', np.max(np.exp(-T)*M**3/((a + b*T)*(a + 3*b*T))), ' claimed <= 16/5')
    # inherited curvature inputs of the critical box: F0(w)=E|L+w|, beta(w)=E[(T-.4) Re ph(L+w)]
    xr, wr = leggauss(400); xp, wp = leggauss(400)
    Tn = 30*(xr + 1)/2; Wt = 30/2*wr*np.exp(-Tn); ph = np.pi*(xp + 1)/2; Wp = np.pi/2*wp/np.pi
    def F0(w):
        L = np.sqrt(Tn)[:, None]*(a + b*Tn)[:, None]*np.exp(1j*ph)[None, :]
        return np.sum(Wt[:, None]*Wp[None, :]*np.abs(L + w))
    def beta(w):
        L = np.sqrt(Tn)[:, None]*(a + b*Tn)[:, None]*np.exp(1j*ph)[None, :]
        x = L + w
        return np.sum(Wt[:, None]*Wp[None, :]*(Tn[:, None] - .4)*(x.real/np.abs(x)))
    hstep = 1e-2
    for w in [75/128, 77/128, 79/128]:
        f2 = (F0(w + hstep) - 2*F0(w) + F0(w - hstep))/hstep**2
        b2 = (beta(w + hstep) - 2*beta(w) + beta(w - hstep))/hstep**2
        pr(f'   w={w:.4f}: F0\'\' ~ {f2:.4f} (claimed <= 179/125 = 1.432)   beta\'\' ~ {b2:+.4f} (claimed |.| <= 1)   beta = {beta(w):.5f}')
    for w in [0.0, 0.6, 1.5]:
        for kind in ['H', 'V']:
            d = direct(w, kind); pl = polar(w, kind)[0]
            pr(f'w={w:4} {kind}: max|direct-polar| = {np.max(np.abs(d - pl)):.2e}   direct = {np.round(d, 6)}')
