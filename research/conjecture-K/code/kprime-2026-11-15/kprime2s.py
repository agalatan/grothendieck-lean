# claude-b9ee, 15 Nov 2026.  Sector gain over a remote cubic, with and without the retained first-chaos penalty,
# for ALL tensors q in H_{2,1}(C^2) of fixed energy u (deterministic quadrature, no sampling).
#
#   J(c, alpha, gamma) = |gamma|^2 + 2 E_y E_Z |L + q - ups + (T-1) rho| - p (|c|^2 + |alpha|^2),
#       q = sum c_m E_m(y),  rho = <alpha, y> (A-sector),  ups = <gamma, y> (retained first-chaos element),  T = |Z|^2.
#   Lambda(q)      = J(c, 0, 0)                           D(q) = Lambda_Gauss(u) - Lambda(q)
#   K  gain  gK(q) = max_alpha J(c, alpha, 0) - J(c,0,0)
#   K' gain  gP(q) = max_alpha min_gamma J(c, alpha, gamma) - J(c,0,0)
# The statement to prove is gain <= D + eta.  This script maximises gP/D (mode kp) or gK/D (mode k) over c, |c|^2 = u.
#
# FIXED TILT variant (kprime2s.py): the retained element is tied to the sector, ups = -s rho, so the sector is (T - 1 + s) rho with
# penalty p - s^2.  Maximises  [max_alpha J(c, alpha, -s alpha) - J(c,0,0)] / D(q)  over c.
# usage: python kprime2s.py <s> <u> <restarts> <seed> <outfile>
import numpy as np, sys, json, time
from scipy import special, optimize

a, b, p = 699/1250, 179/1250, 2500/1891
tilt, u, restarts, seed, out = float(sys.argv[1]), float(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), sys.argv[5]
FINE = False

def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return x, w
def radial(n, pan, rmax):                         # nodes r, weights of the law of |y| for a standard complex Gaussian
    r, w = gl_panels(np.linspace(0, 1, pan + 1)**1.5*rmax, n)
    return r, w*2*r*np.exp(-r*r)

sT, wT = radial(8, 9 if FINE else 6, 5.6); T = sT**2; rT = sT*(a + b*T)          # visible variable: T and |L|
r1, w1 = radial(8, 8 if FINE else 5, 4.8); nth = 48 if FINE else 32; th = 2*np.pi*np.arange(nth)/nth
R1, R2, TH = np.meshgrid(r1, r1, th, indexing='ij')
WY = (w1[:, None, None]*w1[None, :, None]*np.ones(nth)[None, None, :]/nth).ravel()
Y = np.stack([R1.ravel().astype(complex), (R2*np.exp(1j*TH)).ravel()], axis=1)   # y1 = r1, y2 = r2 e^{i theta}
n = 2; idx = [(i, j, k) for i in range(n) for j in range(i, n) for k in range(n)]; d = len(idx)
E = np.empty((len(Y), d), dtype=complex)
for m, (i, j, k) in enumerate(idx):               # orthonormal basis of H_{2,1}(C^2), as in kscan.py
    col = Y[:, i]*Y[:, j]*np.conj(Y[:, k])
    if i == k: col = col - Y[:, j]
    if j == k: col = col - Y[:, i]
    E[:, m] = col/np.sqrt(2 if i == j else 1)

def A1parts(r, y):                                # E_theta |r e^{i theta} + y|  and  (d/dy of it)/y
    s = r + y; k2 = np.clip(4*r*y/(s*s), 0, 1 - 1e-15)
    A = (2/np.pi)*s*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/s
    ok = y > 1e-9; ys = np.where(ok, y, 1.0)
    return A, np.where(ok, (A + (y*y - r*r)*Kinv)/(2*ys*ys), 1/(2*r))

def Jgrad(c, al, ga):
    W = (E@c - Y@ga)[:, None] + (T[None, :] - 1)*(Y@al)[:, None]
    A, q = A1parts(rT[None, :], np.abs(W)); G = W*q
    S0 = G@wT; S1 = G@(wT*(T - 1))
    J = np.vdot(ga, ga).real + 2*WY@(A@wT) - p*(np.vdot(c, c).real + np.vdot(al, al).real)
    return J, 2*E.conj().T@(WY*S0) - 2*p*c, 2*Y.conj().T@(WY*S1) - 2*p*al, -2*Y.conj().T@(WY*S0) + 2*ga

# Gaussian remote value of the same energy: 2 E_T E_t A1(|L|, sqrt(u t)) - p u
st, wt = radial(16, 22, 7.5)
LG = 2*float(wT@(A1parts(rT[:, None], np.sqrt(u)*st[None, :])[0]@wt)) - p*u

def inner(c, x0):                                 # maximiser in alpha of J(c, alpha, -tilt*alpha)
    def F(x):
        al = x[0:2] + 1j*x[2:4]; _, _, gal, gga = Jgrad(c, al, -tilt*al); g = gal - tilt*gga
        return np.concatenate([g.real, g.imag])
    sol = optimize.root(F, x0, method='hybr', tol=1e-12); x = sol.x
    return x[0:2] + 1j*x[2:4], x, float(np.max(np.abs(sol.fun)))
warm = {}
def objective(x):
    c0 = x[:d] + 1j*x[d:]; nr = np.linalg.norm(c0); c = np.sqrt(u)*c0/nr
    J0, g0, _, _ = Jgrad(c, np.zeros(2, complex), np.zeros(2, complex)); D = LG - J0
    al, xs, res = inner(c, warm.get('x', np.zeros(4))); warm['x'] = xs
    V, gV, _, _ = Jgrad(c, al, -tilt*al)
    R = (V - J0)/D; g = ((gV - g0)*D + (V - J0)*g0)/D**2
    g = (g - c*np.real(np.vdot(c, g))/u)*np.sqrt(u)/nr
    return -R, -np.concatenate([g.real, g.imag])
def report(c, tag, extra={}):
    J0 = Jgrad(c, np.zeros(2, complex), np.zeros(2, complex))[0]; D = LG - J0; al, _, res = inner(c, np.zeros(4)); V = Jgrad(c, al, -tilt*al)[0]
    rec = dict(tag=tag, tilt=tilt, u=u, D=D, gain=V - J0, R=(V - J0)/D, alpha=float(np.linalg.norm(al)), res=res, c_re=c.real.tolist(), c_im=c.imag.tolist(), **extra)
    open(out, 'a').write(json.dumps(rec) + '\n')
    print('%-22s tilt %.4f  u %.4f  D=%.7f  gain %.7f  ratio %.4f  |alpha| %.4f  res %.1e' % (tag, tilt, u, D, V - J0, (V - J0)/D, np.linalg.norm(al), res), flush=True)
rng = np.random.default_rng(seed)
mono = np.zeros(d, complex); mono[0] = np.sqrt(u); report(mono, 'monomial')
for rs in range(restarts):
    t0 = time.time(); warm.clear()
    if rs == 0: c0 = mono/np.sqrt(u) + 0.05*(rng.standard_normal(d) + 1j*rng.standard_normal(d))
    elif rs == 1:
        c0 = np.zeros(d, complex); c0[0] = np.sqrt(2); c0[idx.index((0, 1, 1))] = 1.0; c0 = c0/np.linalg.norm(c0) + 0.05*(rng.standard_normal(d) + 1j*rng.standard_normal(d))
    else: c0 = rng.standard_normal(d) + 1j*rng.standard_normal(d)
    res = optimize.minimize(objective, np.concatenate([c0.real, c0.imag]), jac=True, method='L-BFGS-B', options=dict(maxiter=150, maxfun=220))
    c = res.x[:d] + 1j*res.x[d:]; c = np.sqrt(u)*c/np.linalg.norm(c)
    report(c, 'tilt search rs %d' % rs, dict(opt=-float(res.fun), iters=int(res.nit), secs=time.time() - t0))
