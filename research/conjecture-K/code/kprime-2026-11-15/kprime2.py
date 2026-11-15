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
# usage: python kprime2.py <mode: k|kp|eval> <u> <restarts> <seed> <outfile> [fine]
import numpy as np, sys, json, time
from scipy import special, optimize

a, b, p = 699/1250, 179/1250, 2500/1891
mode, u, restarts, seed, out = sys.argv[1], float(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), sys.argv[5]
FINE = len(sys.argv) > 6

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

def inner(c, x0, retained):                       # stationary point in (alpha, gamma): max in alpha, min in gamma
    def F(x):
        al = x[0:2] + 1j*x[2:4]; ga = x[4:6] + 1j*x[6:8] if retained else np.zeros(2, complex)
        _, _, gal, gga = Jgrad(c, al, ga)
        return np.concatenate([gal.real, gal.imag, gga.real, gga.imag] if retained else [gal.real, gal.imag])
    sol = optimize.root(F, x0[:8 if retained else 4], method='hybr', tol=1e-12)
    x = sol.x; al = x[0:2] + 1j*x[2:4]; ga = x[4:6] + 1j*x[6:8] if retained else np.zeros(2, complex)
    return al, ga, x, float(np.max(np.abs(sol.fun)))

def measures(c, x0k=None, x0p=None):
    J0, g0, _, _ = Jgrad(c, np.zeros(2, complex), np.zeros(2, complex)); D = LG - J0
    alk, _, xk, rk = inner(c, np.zeros(4) if x0k is None else x0k, False)
    Jk, gk, _, _ = Jgrad(c, alk, np.zeros(2, complex))
    alp, gap, xp, rp = inner(c, np.zeros(8) if x0p is None else x0p, True)
    Jp, gp, _, _ = Jgrad(c, alp, gap)
    return dict(J0=J0, D=D, gK=Jk - J0, gP=Jp - J0, base=LG, alk=alk, alp=alp, gap=gap, xk=xk, xp=xp, res=max(rk, rp), g0=g0, gk=gk, gp=gp)

def content(c):                                   # the content ratio C^2/D of the 13 November search, on this grid
    q = E@c; A, qq = A1parts(rT[None, :], np.abs(q)[:, None]); S1 = (q[:, None]*qq)@(wT*(T - 1))
    C = Y.conj().T@(WY*S1); mu = Y.conj().T@(WY*((q[:, None]*qq)@wT))
    return float(np.sum(np.abs(C)**2)), float(np.sum(np.abs(mu)**2)), float(WY@np.abs(q)**4)/u**2 - 2

warm = {}
def objective(x):
    c0 = x[:d] + 1j*x[d:]; nr = np.linalg.norm(c0); c = np.sqrt(u)*c0/nr
    J0, g0, _, _ = Jgrad(c, np.zeros(2, complex), np.zeros(2, complex)); D = LG - J0
    al, ga, xs, res = inner(c, warm.get('x', np.zeros(8)), mode == 'kp'); warm['x'] = np.concatenate([xs, np.zeros(8 - len(xs))])
    V, gV, _, _ = Jgrad(c, al, ga)
    R = (V - J0)/D; g = ((gV - g0)*D + (V - J0)*g0)/D**2
    g = (g - c*np.real(np.vdot(c, g))/u)*np.sqrt(u)/nr
    return -R, -np.concatenate([g.real, g.imag])

def report(c, tag, extra={}):
    m = measures(c); C2, mu2, d4 = content(c)
    rec = dict(tag=tag, u=u, fine=FINE, D=m['D'], gK=m['gK'], gP=m['gP'], RK=m['gK']/m['D'], RP=m['gP']/m['D'], C2D=C2/m['D'], mu2=mu2, d4=d4,
               alk=np.abs(m['alk']).tolist(), alp=np.abs(m['alp']).tolist(), gap=np.abs(m['gap']).tolist(), res=m['res'],
               c_re=c.real.tolist(), c_im=c.imag.tolist(), **extra)
    open(out, 'a').write(json.dumps(rec) + '\n')
    print('%-18s D=%.7f  K: %.7f (%.4f)   K\': %.7f (%.4f)   C2/D=%.5f  d4=%.2f  |alpha| K %.4f K\' %.4f |gamma| %.4f  res %.1e' % (
        tag, m['D'], m['gK'], m['gK']/m['D'], m['gP'], m['gP']/m['D'], C2/m['D'], d4, np.linalg.norm(m['alk']), np.linalg.norm(m['alp']),
        np.linalg.norm(m['gap']), m['res']), flush=True)
    return rec

rng = np.random.default_rng(seed)
mono = np.zeros(d, complex); mono[0] = np.sqrt(u)
if mode == 'recheck':                             # re-evaluate the best record of each file given after the output file (use with 'fine')
    for f in sys.argv[7:]:
        recs = [json.loads(l) for l in open(f)]; recs = [r for r in recs if abs(r['u'] - u) < 1e-12]
        if not recs: continue
        key = 'RK' if recs[0]['tag'].startswith('k ') else 'RP'; r = max(recs, key=lambda r: r[key])
        report(np.array(r['c_re']) + 1j*np.array(r['c_im']), 'recheck ' + r['tag'], dict(src=f, coarse_RK=r['RK'], coarse_RP=r['RP']))
    report(mono, 'recheck monomial')
    sys.exit()
if mode == 'eval':
    print('grid: %d remote nodes x %d visible nodes; sum of weights %.10f; Lambda_Gauss(u) = %.9f' % (len(Y), len(T), WY.sum(), LG))
    report(mono, 'monomial')
    for s in range(2):                            # the monomial in rotated coordinates: every number must be unchanged
        Zr = rng.standard_normal((2, 2)) + 1j*rng.standard_normal((2, 2)); U, _ = np.linalg.qr(Zr)
        qrot = np.sqrt(u)*(Y@U[0])*(np.abs(Y@U[0])**2 - 2)/np.sqrt(2)
        crot = E.conj().T@(WY*qrot); print('   rotated monomial: |c|^2/u = %.9f' % (np.vdot(crot, crot).real/u))
        report(np.sqrt(u)*crot/np.linalg.norm(crot), 'rotated-%d' % s)
    for z in (0.2, 0.5, 1.0):                     # X[(|X|^2-2) + z(|Y|^2-1)]
        c = np.zeros(d, complex); c[0] = np.sqrt(2); c[idx.index((0, 1, 1))] = z; report(np.sqrt(u)*c/np.linalg.norm(c), 'baseline z=%.1f' % z)
    x = rng.standard_normal(2*d); f0, g0 = objective(x); h = 1e-5; e = rng.standard_normal(2*d); mode = 'kp'; warm.clear()
    f0, g0 = objective(x); fp = objective(x + h*e)[0]; fm = objective(x - h*e)[0]
    print('gradient check (K\' ratio): finite difference %.9f  analytic %.9f' % ((fp - fm)/(2*h), g0@e))
    sys.exit()
for rs in range(restarts):
    t0 = time.time(); warm.clear()
    if rs == 0 and seed == 0: c0 = mono/np.sqrt(u) + 0.05*(rng.standard_normal(d) + 1j*rng.standard_normal(d))
    elif rs == 1 and seed == 0:
        c0 = np.zeros(d, complex); c0[0] = np.sqrt(2); c0[idx.index((0, 1, 1))] = 0.5; c0 = c0 + 0.05*(rng.standard_normal(d) + 1j*rng.standard_normal(d))
    else: c0 = rng.standard_normal(d) + 1j*rng.standard_normal(d)
    res = optimize.minimize(objective, np.concatenate([c0.real, c0.imag]), jac=True, method='L-BFGS-B', options=dict(maxiter=150, maxfun=220))
    c = res.x[:d] + 1j*res.x[d:]; c = np.sqrt(u)*c/np.linalg.norm(c)
    report(c, '%s seed %d rs %d' % (mode, seed, rs), dict(opt=-float(res.fun), iters=int(res.nit), secs=time.time() - t0))
