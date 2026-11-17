# claude-b9ee research worker, 17 Nov 2026. NUMERICS ONLY (N): design of the proof of the diagonal-sum theorem.
# psi(u) = E cos(u h(X)), h(x) = (x^3 - 3x)/sqrt 6, X ~ N(0,1).
# Method 1: composite Gauss-Legendre on the real line, [0, 8.5], panels of width 1/400, 24 nodes.
# Method 2: contour shift x -> t + i*delta (Cauchy; the integrand is entire and decays in the strip).
import numpy as np, sys
s6 = np.sqrt(6.0)
h = lambda x: (x**3 - 3*x) / s6
phi = lambda x: np.exp(-x*x/2) / np.sqrt(2*np.pi)
gx, gw = np.polynomial.legendre.leggauss(24)
def nodes(a, b, width):
    k = int(np.ceil((b - a) / width)); edges = np.linspace(a, b, k + 1)
    m = (edges[:-1] + edges[1:]) / 2; r = (edges[1:] - edges[:-1]) / 2
    return (m[:, None] + r[:, None] * gx[None, :]).ravel(), (r[:, None] * gw[None, :]).ravel()
X1, W1 = nodes(0.0, 8.5, 1/400)
H1 = h(X1); P1 = 2 * phi(X1) * W1
def psi1(us):
    out = np.empty(len(us))
    for j in range(0, len(us), 64):
        u = us[j:j+64]
        out[j:j+64] = np.cos(np.outer(u, H1)) @ P1
    return out
X2, W2 = nodes(-7.0, 7.0, 1/200)
def psi2(us, delta=0.25):
    z = X2 + 1j * delta
    hz = (z**3 - 3*z) / s6; pz = np.exp(-z*z/2) / np.sqrt(2*np.pi) * W2
    out = np.empty(len(us), dtype=complex)
    for j in range(0, len(us), 64):
        u = us[j:j+64]
        out[j:j+64] = np.exp(1j * np.outer(u, hz)) @ pz
    return out
if __name__ == '__main__':
    us = np.linspace(0, 40, 40001)
    p1 = psi1(us)
    test = np.array([0.5, 1, 2, 2.9, 3.0, 4.726, 6.785, 10, 20, 40])
    p2 = psi2(test)
    for u, a, b in zip(test, psi1(test), p2):
        print('u = %6.3f  GL %.12f  contour %.12f%+.1e i  diff %.1e' % (u, a, b.real, b.imag, abs(a - b.real)))
    d = p1 - np.exp(-us**2/2)
    i = np.where((us > 0.01) & (d <= 0))[0][0]
    print('first u > 0 with psi <= e^{-u^2/2}: %.4f' % us[i])
    z = np.where(np.sign(p1[1:]) != np.sign(p1[:-1]))[0]
    print('zeros of psi in [0, 40]:', ', '.join('%.4f' % us[k] for k in z[:12]))
    k = np.argmin(p1); print('min psi on [0,40] = %.6f at u = %.4f' % (p1[k], us[k]))
    for a, b in [(2.4, 40), (3, 40), (7, 40), (10, 40)]:
        m = (us >= a) & (us <= b); print('max |psi| on [%g, %g] = %.6f' % (a, b, np.abs(p1[m]).max()))
    A0 = (8/3)**0.25 * np.exp(-0.5)
    for u in [10, 20, 30, 40]:
        k = int(round(u * 1000)); print('u = %d: sqrt(u)|psi| max over [u-3, u] = %.4f (A0 = %.4f)' % (u, (np.sqrt(us) * np.abs(p1))[k-3000:k+1].max(), A0))
    np.save('psi_grid_N.npy', np.vstack([us, p1]))
