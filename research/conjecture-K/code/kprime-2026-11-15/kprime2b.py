# claude-b9ee, 15 Nov 2026.  As kprime2.py, with the B-sector Z^2 conj(rho_B)/sqrt2 added (rho_B = <beta, y>): evaluation at given
# tensors only.  The visible phase is integrated numerically (the B term has no closed form), in chunks over the remote grid.
#   J(c, alpha, beta, gamma) = |gamma|^2 + 2 E_y E_Z |L + q - ups + (T-1) rho_A + Z^2 conj(rho_B)/sqrt2| - p (|c|^2 + |alpha|^2 + |beta|^2)
# usage: python kprime2b.py <u> <outfile> <jsonl files of kprime2.py ...>      (the best record of each file, and the monomial)
import numpy as np, sys, json, time
from scipy import optimize
a, b, p = 699/1250, 179/1250, 2500/1891
u, out = float(sys.argv[1]), sys.argv[2]
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
def radial(n, pan, rmax):
    r, w = gl_panels(np.linspace(0, 1, pan + 1)**1.5*rmax, n); return r, w*2*r*np.exp(-r*r)
sT, wT = radial(8, 6, 5.6); T = sT**2; rT = sT*(a + b*T); nph = 32; ph = 2*np.pi*(np.arange(nph) + 0.5)/nph
e1 = np.exp(1j*ph)[None, None, :]; e2 = e1*e1
r1, w1 = radial(8, 5, 4.8); nth = 32; th = 2*np.pi*np.arange(nth)/nth
R1, R2, TH = np.meshgrid(r1, r1, th, indexing='ij')
WY = (w1[:, None, None]*w1[None, :, None]*np.ones(nth)[None, None, :]/nth).ravel()
Y = np.stack([R1.ravel().astype(complex), (R2*np.exp(1j*TH)).ravel()], axis=1)
n = 2; idx = [(i, j, k) for i in range(n) for j in range(i, n) for k in range(n)]; d = len(idx)
E = np.empty((len(Y), d), dtype=complex)
for m, (i, j, k) in enumerate(idx):
    col = Y[:, i]*Y[:, j]*np.conj(Y[:, k])
    if i == k: col = col - Y[:, j]
    if j == k: col = col - Y[:, i]
    E[:, m] = col/np.sqrt(2 if i == j else 1)
CH = 3200
def Jgrad(c, al, be, ga):
    q = E@c - Y@ga; ra = Y@al; rb = Y@be; val = 0.0; S0 = np.empty(len(Y), complex); S1 = np.empty(len(Y), complex); SB = np.empty(len(Y), complex)
    for lo in range(0, len(Y), CH):
        sl = slice(lo, lo + CH)
        WA = q[sl, None] + (T[None, :] - 1)*ra[sl, None]
        X = rT[None, :, None]*e1 + WA[:, :, None] + (T[None, :, None]/np.sqrt(2))*e2*np.conj(rb[sl])[:, None, None]
        ab = np.abs(X); P = X/np.maximum(ab, 1e-300)
        val += WY[sl]@(ab.mean(axis=2)@wT)
        G1 = P.mean(axis=2); S0[sl] = G1@wT; S1[sl] = G1@(wT*(T - 1)); SB[sl] = (np.conj(P)*e2).mean(axis=2)@(wT*T/np.sqrt(2))
    J = np.vdot(ga, ga).real + 2*val - p*(np.vdot(c, c).real + np.vdot(al, al).real + np.vdot(be, be).real)
    return J, 2*Y.conj().T@(WY*S1) - 2*p*al, 2*Y.conj().T@(WY*SB) - 2*p*be, -2*Y.conj().T@(WY*S0) + 2*ga
def solve(c, useB, retained):
    def unpack(x):
        al = x[0:2] + 1j*x[2:4]; k = 4
        be = x[k:k+2] + 1j*x[k+2:k+4] if useB else np.zeros(2, complex); k += 4 if useB else 0
        ga = x[k:k+2] + 1j*x[k+2:k+4] if retained else np.zeros(2, complex); return al, be, ga
    def F(x):
        al, be, ga = unpack(x); _, gal, gbe, gga = Jgrad(c, al, be, ga)
        return np.concatenate([gal.real, gal.imag] + ([gbe.real, gbe.imag] if useB else []) + ([gga.real, gga.imag] if retained else []))
    sol = optimize.root(F, np.zeros(4 + 4*useB + 4*retained), method='hybr', tol=1e-11); al, be, ga = unpack(sol.x)
    return Jgrad(c, al, be, ga)[0], al, be, ga
def LGauss(u):
    from scipy import special
    st, wt = radial(16, 22, 7.5); r = rT[:, None]; y = np.sqrt(u)*st[None, :]; s = r + y
    return 2*float(wT@(((2/np.pi)*s*special.ellipe(np.clip(4*r*y/(s*s), 0, 1)))@wt)) - p*u
LG = LGauss(u); z2 = np.zeros(2, complex)
def report(c, tag):
    t0 = time.time(); J0 = Jgrad(c, z2, z2, z2)[0]; D = LG - J0; res = {}
    for name, useB, ret in (('K A', 0, 0), ('K A+B', 1, 0), ("K' A", 0, 1), ("K' A+B", 1, 1)):
        V, al, be, ga = solve(c, useB, ret); res[name] = ((V - J0)/D, np.linalg.norm(al), np.linalg.norm(be), np.linalg.norm(ga))
    print('%-26s D=%.7f | K: A %.4f  A+B %.4f (|beta| %.4f) | K\': A %.4f  A+B %.4f (|alpha| %.4f |beta| %.4f |gamma| %.4f)  [%ds]' % (
        tag, D, res['K A'][0], res['K A+B'][0], res['K A+B'][2], res["K' A"][0], res["K' A+B"][0], res["K' A+B"][1], res["K' A+B"][2], res["K' A+B"][3], time.time() - t0), flush=True)
    open(out, 'a').write(json.dumps(dict(tag=tag, u=u, D=D, **{k: list(map(float, v)) for k, v in res.items()}, c_re=c.real.tolist(), c_im=c.imag.tolist())) + '\n')
mono = np.zeros(d, complex); mono[0] = np.sqrt(u); report(mono, 'monomial')
for f in sys.argv[3:]:
    recs = [json.loads(l) for l in open(f)]; recs = [r for r in recs if abs(r['u'] - u) < 1e-12]
    if not recs: continue
    key = 'RK' if recs[0]['tag'].startswith('k ') else 'RP'; r = max(recs, key=lambda r: r[key])
    report(np.array(r['c_re']) + 1j*np.array(r['c_im']), 'best of ' + f)
