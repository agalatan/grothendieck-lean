"""Numerical test of the structural inputs of the peak remote Stein certificate (REMOTE.md, section 3).

Agent-ID: claude-b9ee, 15 November 2026, written for the review of PR #397. N only: deterministic
quadrature, no interval arithmetic. It is evidence that the inputs are stated correctly, not a proof.

For a normalised cubic Q in H_{2,1}(C^2) (E|Q|^2 = 1), with the real OU carre du champ Gamma:
    U = |Q|^2,  X = Gamma(Q, conj Q)/3 - 1,  c = Gamma(Q, Q)/3,  r = Re(c conj(Q)^2)/U,
    P = E[X U],  R = E[r U],  chi = E U^2 - 2.
Tested:  E X = 0,  2P + R = chi,  E X^2 <= 2P/3,  E r^2 <= 2R/3,  P >= R,
         E U^3 <= 6 + 9 chi + (4045313/100000) chi^(3/2).
Tensors: the Wick monomial y1(|y1|^2 - 2)/sqrt 2 (exact values chi = 42, P = 43/3, R = 40/3),
one structured tensor, and 40 random ones (seed 397).

Run:  python3 -I review_claude-b9ee_stein_inputs_check.py     (needs numpy; about ten seconds)
"""
import numpy as np


def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return x, w


# y = (y1, y2) standard complex Gaussian; by rotation invariance take y1 >= 0 and integrate the phase of y2.
r1, w1 = gl_panels(np.linspace(0, 1, 9)**1.5*5.6, 10)
w1 = w1*2*r1*np.exp(-r1*r1)
nth = 24
th = 2*np.pi*np.arange(nth)/nth
R1, R2, TH = np.meshgrid(r1, r1, th, indexing='ij')
WY = (w1[:, None, None]*w1[None, :, None]*np.ones(nth)/nth).ravel()
y = np.stack([R1.ravel().astype(complex), (R2*np.exp(1j*TH)).ravel()], axis=1)
yb = y.conj()
n = 2
idx = [(i, j, k) for i in range(n) for j in range(i, n) for k in range(n)]   # Wick monomials :y_i y_j conj(y_k):


def fields(c):
    """Q and its Wirtinger derivatives d/dy_a, d/d conj(y_a)."""
    Q = 0
    Qy = [0, 0]
    Qyb = [0, 0]
    for cm, (i, j, k) in zip(c, idx):
        cm = cm/np.sqrt(2 if i == j else 1)
        Q = Q + cm*(y[:, i]*y[:, j]*yb[:, k] - (y[:, j] if i == k else 0) - (y[:, i] if j == k else 0))
        for a in range(n):
            Qy[a] = Qy[a] + cm*((y[:, j]*yb[:, k] if a == i else 0) + (y[:, i]*yb[:, k] if a == j else 0)
                                - (1 if (i == k and a == j) else 0) - (1 if (j == k and a == i) else 0))
            Qyb[a] = Qyb[a] + cm*(y[:, i]*y[:, j] if a == k else 0)
    return Q, Qy, Qyb


def E(f):
    return float(np.real(WY@f))


rng = np.random.default_rng(397)
C6 = 4045313/100000
tests = [('Wick monomial', np.array([1, 0, 0, 0, 0, 0], complex)),
         ('structured', np.array([np.sqrt(2), 0, 0, 1.2, 0, 0], complex))]
tests += [('random %d' % k, rng.standard_normal(6) + 1j*rng.standard_normal(6)) for k in range(40)]
worst = dict(PR=1e9, X=1e9, r=1e9, m6=1e9, EX=0.0, ident=0.0)
for name, c in tests:
    c = c/np.linalg.norm(c)
    Q, Qy, Qyb = fields(c)
    U = np.abs(Q)**2
    G1 = sum(np.abs(Qy[a])**2 + np.abs(Qyb[a])**2 for a in range(n))    # Gamma(Q, conj Q)
    G2 = 2*sum(Qy[a]*Qyb[a] for a in range(n))                          # Gamma(Q, Q)
    X = G1/3 - 1
    cc = G2/3
    r = np.real(cc*np.conj(Q)**2)/np.where(U > 1e-300, U, 1)
    P, R, chi = E(X*U), E(r*U), E(U*U) - 2
    worst['EX'] = max(worst['EX'], abs(E(X)), abs(E(U) - 1))
    worst['ident'] = max(worst['ident'], abs(2*P + R - chi))
    worst['PR'] = min(worst['PR'], P - R)
    worst['X'] = min(worst['X'], 2*P/3 - E(X*X))
    worst['r'] = min(worst['r'], 2*R/3 - E(r*r))
    worst['m6'] = min(worst['m6'], 6 + 9*chi + C6*chi**1.5 - E(U**3))
    if not name.startswith('random'):
        print('%-14s chi = %.4f  P = %.4f  R = %.4f  P - R = %.4f  E U^3 = %.2f <= %.2f'
              % (name, chi, P, R, P - R, E(U**3), 6 + 9*chi + C6*chi**1.5))
print('over %d tensors: max |E X|, |E U - 1| = %.1e;  max |2P + R - chi| = %.1e' % (len(tests), worst['EX'], worst['ident']))
print('min (P - R) = %.4f   min (2P/3 - E X^2) = %.4f   min (2R/3 - E r^2) = %.4f   min slack of the sixth-moment bound = %.3f'
      % (worst['PR'], worst['X'], worst['r'], worst['m6']))
print('all four minima must be >= 0:', 'PASS (N)' if min(worst['PR'], worst['X'], worst['r'], worst['m6']) >= 0 else 'FAIL')
