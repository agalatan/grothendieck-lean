# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; the true content coefficients (2/3) sup N_Psi at the ten row energies against the certified ones (needs m2.npz).
# claude reviewer (N): k_u from my m'' table; compare with the certified scalar caps / absolute envelopes;
# compute the true (2/3) sup_R N_{Psi_u}(R) and the one-switch relaxation with the envelope W (as the angular checker does).
import numpy as np, json, os
from fractions import Fraction as Q
from scipy.interpolate import CubicSpline
HERE = os.path.dirname(os.path.abspath(__file__))
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
t = np.load(os.path.join(HERE, 'm2.npz')); xs, m2 = t['x'], t['m2']
X = np.concatenate([-xs[::-1], xs[1:]]); M2 = np.concatenate([-m2[::-1], m2[1:]])
sp = CubicSpline(X, M2)
def m2f(x):
    x = np.asarray(x); return np.where(np.abs(x) <= X[-1], sp(np.clip(x, X[0], X[-1])), 0.0)
gz, gw = np.polynomial.hermite_e.hermegauss(48); gw = gw/gw.sum()
zz, zw = np.polynomial.legendre.leggauss(40)
# z in (0,1): substitute z = s^{3/5}: int z^{2/3} f(z) dz = (3/5) int_0^1 f(s^{3/5}) ds  (z^{2/3} dz = (3/5) ds)
s = (zz + 1)/2; ws = zw/2; z = s**0.6; wz = 0.6*ws
def k_u(u, x):
    x = np.atleast_1d(x)
    sig = np.sqrt(u*(1 - z*z)/2)
    args = z[None, :, None]*x[:, None, None] + sig[None, :, None]*gz[None, None, :]
    return (m2f(args)@gw)@wz
def hermite_W(fn):
    w = json.load(open(AUTH + fn)); n = w['n']; Y = np.array([float(Q(v)) for v in w['values']]); D = np.array([float(Q(v)) for v in w['derivatives']])
    h = 1/n
    def W(x):
        x = np.atleast_1d(np.asarray(x, float)); out = np.full(x.shape, float(Q(w['endcap'])))
        inside = x < 1
        i = np.minimum((x[inside]*n).astype(int), n - 1); tt = x[inside]*n - i
        c0, c1 = Y[i], h*D[i]; c2 = -3*Y[i] - 2*h*D[i] + 3*Y[i + 1] - h*D[i + 1]; c3 = 2*Y[i] + h*D[i] - 2*Y[i + 1] + h*D[i + 1]
        out[inside] = ((c3*tt + c2)*tt + c1)*tt + c0; return out
    return W, w
th, wth = np.polynomial.legendre.leggauss(400); th = (th + 1)*np.pi/4; wth = wth*np.pi/4
def supN(kfun, Rs):
    best = 0; arg = None
    for R in Rs:
        kk = kfun(R*np.cos(th)); A = wth@(np.cos(th)**3*kk); B = wth@(np.cos(th)*np.sin(th)**2*kk)
        v = max((3*A*A - 2*A*B + 3*B*B)/12, 2/3*B*B)
        if v > best: best, arg = v, R
    return best, arg
def relax(W, Rs, nth=2048):
    # one-switch relaxation: sup over switch angle of Q(A,B) with K = W(R cos th) * (+1 before switch, -1 after)
    tt = (np.arange(nth) + 0.5)*np.pi/(2*nth); dw = np.pi/(2*nth); best = 0; arg = None
    for R in Rs:
        Wv = W(R*np.cos(tt)); a_ = dw*np.cos(tt)**3*Wv; b_ = dw*np.cos(tt)*np.sin(tt)**2*Wv
        pa = np.concatenate([[0], np.cumsum(a_)]); pb = np.concatenate([[0], np.cumsum(b_)])
        A = 2*pa - pa[-1]; B = 2*pb - pb[-1]
        v = max(((3*A*A - 2*A*B + 3*B*B)/12).max(), 2/3*pb[-1]**2)
        if v > best: best, arg = v, R
    return best, arg
xg = np.linspace(0, 6, 1201); Rs = np.linspace(0.005, 4, 800)
rows = [('009', 9/1000, 251/5000), ('012', 3/250, 121/2500), ('015', 3/200, 467/10000), ('018', 9/500, 451/10000), ('020', 1/50, 441/10000)]
for tag, u, g in rows:
    w = json.load(open(AUTH + 'deficit_structure_refine_witness_%s.json' % tag)); cap = float(Q(w['cap']))
    k = k_u(u, xg); kk = lambda x: np.interp(np.abs(x), xg, k_u(u, xg))*np.sign(x)
    sn, Rn = supN(lambda x: np.interp(x, xg, k), Rs)
    print('row u>=%.4f: sup|k_u|=%.5f (cap %.6f)  true (2/3)supN=%.5f at R=%.3f  coarse (11/108)sup|k|^2=%.5f  gamma=%.5f' % (u, np.abs(k).max(), cap, sn, Rn, 11/108*np.abs(k).max()**2, g))
w = json.load(open(AUTH + 'deficit_structure_content_witness_medium25.json'))
k = k_u(1/40, xg); sn, Rn = supN(lambda x: np.interp(x, xg, k), Rs)
print('row u>=0.025: sup|k_u|=%.5f (cap %s)  true (2/3)supN=%.5f  gamma=%.5f' % (np.abs(k).max(), w['cap'], sn, 1859/43200))
for tag, u, g, cert in [('absolute30', 3/100, 3/80, 0.037211600), ('absolute35', 7/200, 71/2000, 0.035357021), ('absolute', 1/25, 17/500, 0.033650745), ('absolute44', 11/250, 13/400, 0.032383690)]:
    W, w = hermite_W('deficit_structure_content_witness_%s.json' % tag)
    for uu in (u, 0.0463):
        k = k_u(uu, xg); gap = (W(xg) - np.abs(k)).min()
        print('  %s: u=%.4f  min_x [W - |k_u|] = %.5f at x=%.3f   max W = %.4f' % (tag, uu, gap, xg[(W(xg) - np.abs(k)).argmin()], W(xg).max()))
    k = k_u(u, xg); sn, Rn = supN(lambda x: np.interp(x, xg, k), Rs)
    rv, Rr = relax(W, Rs)
    print('row u>=%.4f: true (2/3)supN=%.5f at R=%.3f;  one-switch relaxation with W: %.6f at R=%.3f (certified upper %.9f, gamma %.5f)' % (u, sn, Rn, rv, Rr, cert, g))
