# claude-b9ee: independent checks of the small-shell (P_odd) package.
import numpy as np
rng = np.random.default_rng(447)
a, b, p = 699/1250, 179/1250, 2500/1891
# (a) translated-base inequality  D(x+h,o) <= J_K(x,o) + K|h|^2/|x|  on random and adversarial data
def D(x, o): return np.abs(x+o) + np.abs(x-o) - 2*np.abs(x)
def J(K, x, o): return np.abs(o)**2/np.abs(x) - (K-1)/(2*K-1)*np.real(np.conj(x)*o)**2/np.abs(x)**3
worst = {}
for K in [1.0, 2.0, 4.0, 7.5, 50.0]:
    n = 2_000_000
    x = np.exp(2j*np.pi*rng.random(n))*10**rng.uniform(-2, 1, n)
    h = (rng.normal(size=n)+1j*rng.normal(size=n))*10**rng.uniform(-2, 1, n)
    o = (rng.normal(size=n)+1j*rng.normal(size=n))*10**rng.uniform(-2, 1, n)
    gap = D(x+h, o) - J(K, x, o) - K*np.abs(h)**2/np.abs(x)
    rel = gap/(np.abs(o)**2/np.abs(x) + K*np.abs(h)**2/np.abs(x) + 1e-300)
    worst[K] = float(rel.max())
print("max relative gap of (6) over 2e6 random triples per K (must be <= 0):", {k: f"{v:+.2e}" for k, v in worst.items()})
K = 4.0; x = 1.0; y = 1 - 1/K; o = 2 - 1/K
print("stated equality case K=4:", D(y, o), "=", J(K, x, o) + K*abs(y-x)**2/abs(x))
# (b),(c) kernels by image-plane quadrature (polar around y = -r), as in my 32/25 check
def grid(nr, na, rmax):
    s, w = np.polynomial.legendre.leggauss(nr); rho = rmax/2*(s+1); wr = rmax/2*w
    al = (np.arange(na)+0.5)*2*np.pi/na
    return rho[:, None], wr[:, None]*np.ones((1, na))*(2*np.pi/na), al[None, :]
def inv_L(absy):
    t = absy/a
    for _ in range(60): t = t - (b*t**3 + a*t - absy)/(3*b*t**2 + a)
    return t
def kernels(r, nr=500, na=512, alpha=4/7, eta=11/20):
    rho, W, al = grid(nr, na, r + 30.0)
    y = -r + rho*np.exp(1j*al); ay = np.abs(y); t = inv_L(ay)
    z = np.where(ay > 0, t*y/np.where(ay > 0, ay, 1), 0); T = t*t
    dens = np.exp(-T)/(np.pi*(a+b*T)*(a+3*b*T)); Wm = W*dens        # rho (Jacobian) * (1/|x| = 1/rho) cancel
    # shell 2x2 (real coefficient block): basis (T-eta), Z^2/sqrt2 paired with conj(B): use Re parts
    e1 = (T - eta) + 0j; e2 = z**2/np.sqrt(2)
    Es = np.array([[np.sum(Wm*np.real(e1*np.conj(e1))), np.sum(Wm*np.real(e1*np.conj(e2)))],
                   [np.sum(Wm*np.real(e2*np.conj(e1))), np.sum(Wm*np.real(e2*np.conj(e2)))]])
    ph = np.exp(-1j*al)
    basis = [z, np.conj(z), z*(T-2)/np.sqrt(2)]
    out = []
    for sgn, gam in [(1, 12/35), (1j, 3/5)]:
        u = [ph*sgn*e for e in basis]                                 # conj(x) v / |x|
        M = np.array([[np.sum(Wm*(np.real(u[i]*np.conj(u[j])) - (1-alpha)*np.real(u[i])*np.real(u[j]))) for j in range(3)] for i in range(3)])
        M[0, 2] += gam; M[2, 0] += gam
        out.append(np.linalg.eigvalsh(M).max())
    return np.linalg.eigvalsh(Es).max(), max(out)
rs = np.concatenate([np.linspace(0, 1.5, 61), np.linspace(1.6, 8, 33)])
vals = np.array([kernels(r) for r in rs])
i, j = vals[:, 0].argmax(), vals[:, 1].argmax()
print(f"shell kernel: max lambda over r in [0,8] = {vals[i,0]:.5f} at r={rs[i]:.3f} (certified bound 1.090933 < 11/10)")
print(f"translated odd kernel (alpha=4/7, gamma=12/35,3/5): max = {vals[j,1]:.5f} at r={rs[j]:.3f} (certified 1.317088 < 33/25 = 1.32)")
v2 = kernels(rs[j], nr=900, na=1024); print("  refined grid at that r:", f"{v2[1]:.5f}")
