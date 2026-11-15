# claude-b9ee, 15 Nov 2026.  As kprime2.py for THREE remote variables: all tensors q in H_{2,1}(C^3) of energy u, A-sector and
# retained first-chaos element, deterministic quadrature in (|y1|, |y2|, |y3|, arg y2, arg y3) and in T (chunked).
# usage: python kprime3.py <mode: k|kp|eval> <u> <restarts> <seed> <outfile> [nrad_panels nphase]
import numpy as np, sys, json, time
from scipy import special, optimize
a, b, p = 699/1250, 179/1250, 2500/1891
mode, u, restarts, seed, out = sys.argv[1], float(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), sys.argv[5]
PAN = int(sys.argv[6]) if len(sys.argv) > 6 else 3; NPH = int(sys.argv[7]) if len(sys.argv) > 7 else 12
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
def radial(n, pan, rmax):
    r, w = gl_panels(np.linspace(0, 1, pan + 1)**1.5*rmax, n); return r, w*2*r*np.exp(-r*r)
sT, wT = radial(8, 5, 5.4); T = sT**2; rT = sT*(a + b*T)
r1, w1 = radial(6, PAN, 4.4); th = 2*np.pi*np.arange(NPH)/NPH
R1, R2, R3, T2, T3 = np.meshgrid(r1, r1, r1, th, th, indexing='ij')
WY = (w1[:, None, None, None, None]*w1[None, :, None, None, None]*w1[None, None, :, None, None]*np.ones((1, 1, 1, NPH, NPH))/NPH**2).ravel()
Y = np.stack([R1.ravel().astype(complex), (R2*np.exp(1j*T2)).ravel(), (R3*np.exp(1j*T3)).ravel()], axis=1); del R1, R2, R3, T2, T3
n = 3; idx = [(i, j, k) for i in range(n) for j in range(i, n) for k in range(n)]; d = len(idx)
E = np.empty((len(Y), d), dtype=complex)
for m, (i, j, k) in enumerate(idx):
    col = Y[:, i]*Y[:, j]*np.conj(Y[:, k])
    if i == k: col = col - Y[:, j]
    if j == k: col = col - Y[:, i]
    E[:, m] = col/np.sqrt(2 if i == j else 1)
CH = 100000; zn = np.zeros(n, complex)
def A1parts(r, y):
    s = r + y; k2 = np.clip(4*r*y/(s*s), 0, 1 - 1e-15)
    A = (2/np.pi)*s*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/s
    ok = y > 1e-9; ys = np.where(ok, y, 1.0)
    return A, np.where(ok, (A + (y*y - r*r)*Kinv)/(2*ys*ys), 1/(2*r))
def Jgrad(c, al, ga):
    q = E@c - Y@ga; ra = Y@al; val = 0.0; S0 = np.empty(len(Y), complex); S1 = np.empty(len(Y), complex)
    for lo in range(0, len(Y), CH):
        sl = slice(lo, lo + CH); W = q[sl, None] + (T[None, :] - 1)*ra[sl, None]
        A, qq = A1parts(rT[None, :], np.abs(W)); G = W*qq
        val += WY[sl]@(A@wT); S0[sl] = G@wT; S1[sl] = G@(wT*(T - 1))
    J = np.vdot(ga, ga).real + 2*val - p*(np.vdot(c, c).real + np.vdot(al, al).real)
    return J, 2*E.conj().T@(WY*S0) - 2*p*c, 2*Y.conj().T@(WY*S1) - 2*p*al, -2*Y.conj().T@(WY*S0) + 2*ga
st, wt = radial(16, 22, 7.5)
LG = 2*float(wT@(A1parts(rT[:, None], np.sqrt(u)*st[None, :])[0]@wt)) - p*u
def inner(c, x0, retained):
    def unpack(x): return x[0:n] + 1j*x[n:2*n], (x[2*n:3*n] + 1j*x[3*n:4*n] if retained else zn)
    def F(x):
        al, ga = unpack(x); _, _, gal, gga = Jgrad(c, al, ga)
        return np.concatenate([gal.real, gal.imag, gga.real, gga.imag] if retained else [gal.real, gal.imag])
    sol = optimize.root(F, x0[:4*n if retained else 2*n], method='hybr', tol=1e-11); al, ga = unpack(sol.x)
    return al, ga, sol.x, float(np.max(np.abs(sol.fun)))
warm = {}
def objective(x):
    c0 = x[:d] + 1j*x[d:]; nr = np.linalg.norm(c0); c = np.sqrt(u)*c0/nr
    J0, g0, _, _ = Jgrad(c, zn, zn); D = LG - J0
    al, ga, xs, res = inner(c, warm.get('x', np.zeros(4*n)), mode == 'kp'); warm['x'] = np.concatenate([xs, np.zeros(4*n - len(xs))])
    V, gV, _, _ = Jgrad(c, al, ga)
    R = (V - J0)/D; g = ((gV - g0)*D + (V - J0)*g0)/D**2
    g = (g - c*np.real(np.vdot(c, g))/u)*np.sqrt(u)/nr
    return -R, -np.concatenate([g.real, g.imag])
def report(c, tag, extra={}):
    t0 = time.time(); J0 = Jgrad(c, zn, zn)[0]; D = LG - J0
    alk, _, _, rk = inner(c, np.zeros(2*n), False); gK = Jgrad(c, alk, zn)[0] - J0
    alp, gap, _, rp = inner(c, np.zeros(4*n), True); gP = Jgrad(c, alp, gap)[0] - J0
    d4 = float(WY@np.abs(E@c)**4)/u**2 - 2
    rec = dict(tag=tag, u=u, grid=[PAN, NPH], D=D, gK=gK, gP=gP, RK=gK/D, RP=gP/D, d4=d4, res=max(rk, rp), c_re=c.real.tolist(), c_im=c.imag.tolist(), **extra)
    open(out, 'a').write(json.dumps(rec) + '\n')
    print('%-18s D=%.7f  K: %.7f (%.4f)   K\': %.7f (%.4f)   d4=%.2f  |alpha| K %.4f K\' %.4f |gamma| %.4f  res %.1e  [%ds]' % (
        tag, D, gK, gK/D, gP, gP/D, d4, np.linalg.norm(alk), np.linalg.norm(alp), np.linalg.norm(gap), max(rk, rp), time.time() - t0), flush=True)
rng = np.random.default_rng(seed)
mono = np.zeros(d, complex); mono[0] = np.sqrt(u)
if mode == 'eval':
    print('grid: %d remote nodes x %d visible nodes; sum of weights %.9f' % (len(Y), len(T), WY.sum()), flush=True)
    report(mono, 'monomial')
    Zr = rng.standard_normal((3, 3)) + 1j*rng.standard_normal((3, 3)); U, _ = np.linalg.qr(Zr)
    x = Y@U[0]; qrot = np.sqrt(u)*x*(np.abs(x)**2 - 2)/np.sqrt(2); crot = E.conj().T@(WY*qrot)
    print('   rotated monomial: |c|^2/u = %.7f' % (np.vdot(crot, crot).real/u)); report(np.sqrt(u)*crot/np.linalg.norm(crot), 'rotated')
    c = np.zeros(d, complex); c[0] = np.sqrt(2); c[idx.index((0, 1, 1))] = 1.2; report(np.sqrt(u)*c/np.linalg.norm(c), 'X[(X2-2)+1.2(Y2-1)]')
    c[idx.index((0, 2, 2))] = 1.2; report(np.sqrt(u)*c/np.linalg.norm(c), 'two bath variables')
    sys.exit()
for rs in range(restarts):
    t0 = time.time(); warm.clear()
    if rs == 0 and seed == 0:
        c0 = np.zeros(d, complex); c0[0] = np.sqrt(2); c0[idx.index((0, 1, 1))] = 0.9; c0[idx.index((0, 2, 2))] = 0.9
        c0 = c0/np.linalg.norm(c0) + 0.05*(rng.standard_normal(d) + 1j*rng.standard_normal(d))
    else: c0 = rng.standard_normal(d) + 1j*rng.standard_normal(d)
    res = optimize.minimize(objective, np.concatenate([c0.real, c0.imag]), jac=True, method='L-BFGS-B', options=dict(maxiter=60, maxfun=90))
    c = res.x[:d] + 1j*res.x[d:]; c = np.sqrt(u)*c/np.linalg.norm(c)
    report(c, '%s seed %d rs %d' % (mode, seed, rs), dict(opt=-float(res.fun), iters=int(res.nit), secs=time.time() - t0))
