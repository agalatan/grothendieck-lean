# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Item 2 of the gate: coupled second-order sector expansion of the one-spike family, all sectors and couplings.  N.
# q = sigma (c H21(y) + sqrt(1-c^2) W): y one remote coordinate, W the diffuse bulk (arg W = 0 by the joint rotation).
# Sectors: the 15 non-residual sectors along their one-variable spike polynomials h_j(y) = e_{p_j q_j}(y), plus nu3 and a
# nu5 shift (constants).  Model:  value = F5(q) - cost(sigma) + max_a [ Re<a, gam> + a^T(...)a - sum cost_j |a_j|^2 ],
#   gam_j = E[Gamma_j(s) e^{i c_j phi} conj(h_j)],  second order = 1/2 Re sum a_j conj(a_k) PP_jk - 1/2 Re sum a_j a_k QQ_jk,
#   PP_jk = E[h_j conj(h_k) e^{-i(c_j-c_k)phi} P_jk(s)],  QQ_jk = E[h_j h_k e^{-i(c_j+c_k)phi} Q_jk(s)],
#   P_jk(s) = sum_pm sj sk E_z[e_j conj(e_k)/(2|A|)],  Q_jk(s) = sum_pm sj sk E_z[e_j e_k conj(ph A)^2/(2|A|)].
# Deficit (same variance):  D = B5(sigma^2) - F5(q),  B5(u) = E_W Psi5(sqrt(u)|W|).  Excess over the row's S5:
#   gains - D - Vsl,  Vsl = S5 - (B5(sigma^2) - cost(sigma)) >= 0.
import sys, os, json, math, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from numpy.polynomial.legendre import leggauss
from numpy.polynomial.laguerre import laggauss
from scipy.interpolate import CubicSpline

# (name, side, a, b) visible bidegree; remote (p,q) = (2-a,1-b) for k, (3-a,2-b) for h; constants: remote (0,0)
SECT = [('rz', 'k', 1, 0), ('rzb', 'k', 0, 1), ('rA', 'k', 1, 1), ('rB', 'k', 2, 0), ('nu3', 'k', 2, 1)] + \
       [('p%d%d' % (a, b), 'h', a, b) for a in range(4) for b in range(3)]          # includes p32 = nu5 shift
GROUPS = {'H10/H01': ['rA', 'rB', 'p22', 'p31'], 'H11': ['rz', 'p21'], 'H20/H02': ['rzb', 'p12', 'p30'],
          'H21/H12': ['p11', 'p20'], 'H22': ['p10'], 'H31': ['p01'], 'H30': ['p02'], 'H32': ['p00'], 'const': ['nu3', 'p32']}
def remote(side, a, b): return (2 - a, 1 - b) if side == 'k' else (3 - a, 2 - b)

def gl_radial(npan, nq, R):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    return r, wr / wr.sum()

class Model:
    def __init__(self, rec, e1=None, eta=None, smax=6.0, ns=241, zgrid=None, ny=(36, 6, 96), nw=(30, 6)):
        self.e1 = D.E1 if e1 is None else e1; self.eta = D.ETA if eta is None else eta
        self.rec = rec; z, wz = zgrid if zgrid is not None else D.zgrid(half=True)
        T = np.abs(z) ** 2; l, beta, bA, bB, nu5 = rec['l'], rec['beta'], rec['bA'], rec['bB'], rec['nu5']
        base = z * (l + beta * (T - 2)) + nu5 * D.e_ab(3, 2, z); Dz = 1 - bA * D.e_ab(1, 1, z) - bB * D.e_ab(2, 0, z)
        self.names = [s[0] for s in SECT]; n = len(SECT); self.n = n
        self.side = np.array([1.0 if s[1] == 'h' else -1.0 for s in SECT])
        self.cost = np.array([1 / self.eta if s[1] == 'h' else 1 / self.e1 for s in SECT])
        rem = [remote(s[1], s[2], s[3]) if s[0] not in ('nu3', 'p32') else (0, 0) for s in SECT]
        self.rem = rem; self.ch = np.array([p - q for (p, q) in rem])
        E = np.array([D.e_ab(s[2], s[3], z) for s in SECT])
        self.S = np.linspace(0, smax, ns)
        G = np.zeros((ns, n)); P = np.zeros((ns, n, n)); Q = np.zeros((ns, n, n)); PS = np.zeros(ns)
        sg = self.side
        for i, s in enumerate(self.S):
            Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am); pP, pM = Ap / aP, Am / aM
            PS[i] = (aP + aM) @ wz
            G[i] = np.real((np.conj(E) * (pP[None, :] + sg[:, None] * pM[None, :])) @ wz)
            WP, WM = wz / (2 * aP), wz / (2 * aM)
            P[i] = np.real((E * WP) @ np.conj(E).T + np.outer(sg, sg) * ((E * WM) @ np.conj(E).T))
            Q[i] = np.real((E * (WP * np.conj(pP) ** 2)) @ E.T + np.outer(sg, sg) * ((E * (WM * np.conj(pM) ** 2)) @ E.T))
        self.G, self.P, self.Q, self.PS = G, P, Q, PS
        self.ps = CubicSpline(self.S, PS)
        UL, WL = laggauss(70); self.UL, self.WL = UL, WL
        r, wr = gl_radial(*ny[:2], 6.0); th = (np.arange(ny[2]) + 0.5) * 2 * np.pi / ny[2]
        Rm, TH = np.meshgrid(r, th, indexing='ij'); self.y = (Rm * np.exp(1j * TH)).ravel(); self.wy = (wr[:, None] * np.ones(ny[2])[None] / ny[2]).ravel()
        self.Wr, self.wW = gl_radial(nw[0], nw[1], 6.0)
        self.h = np.array([D.e_ab(p, q, self.y) if (p, q) != (0, 0) else np.ones_like(self.y) for (p, q) in rem])
        self.Hy = D.e_ab(2, 1, self.y)
    def B5(self, u):
        return (self.WL * self.ps(np.minimum(np.sqrt(u * self.UL), self.S[-1]))).sum()
    def costq(self, sig):
        r = self.rec; return sig ** 2 / self.e1 - (r['bA'] ** 2 + r['bB'] ** 2) * sig ** 2 / self.eta + r['nu5'] ** 2 / self.eta
    def S5(self):
        best = max((self.B5(s * s) - self.costq(s), s) for s in np.linspace(0, 0.6, 121))
        from scipy.optimize import minimize_scalar
        r = minimize_scalar(lambda s: -(self.B5(s * s) - self.costq(s)), bounds=(max(best[1] - 0.01, 0), best[1] + 0.01), method='bounded', options={'xatol': 1e-7})
        return max(best[0], -r.fun), (r.x if -r.fun > best[0] else best[1])
    def family_point(self, sig, c, chunk=60000):
        n = self.n; Wr = self.Wr if c < 1 else np.array([0.0]); wW = self.wW if c < 1 else np.array([1.0])
        q = sig * (c * self.Hy[:, None] + math.sqrt(max(1 - c * c, 0)) * Wr[None, :])
        w2 = (self.wy[:, None] * wW[None, :]).ravel(); q = q.ravel()
        s = np.abs(q); ph = np.where(s > 0, q / np.maximum(s, 1e-300), 1.0)
        sc = np.minimum(s, self.S[-1])
        F5 = (w2 * self.ps(sc)).sum()
        D_sv = self.B5(sig * sig) - F5
        if not hasattr(self, 'gsp'): self.gsp = CubicSpline(self.S, self.G)       # (ns, n) -> spline per column
        yidx = np.repeat(np.arange(len(self.y)), len(Wr))
        ds = self.S[1] - self.S[0]
        gam = np.zeros(n, complex); PP = np.zeros((n, n), complex); QQ = np.zeros((n, n), complex)
        for a0 in range(0, len(s), chunk):
            sl = slice(a0, a0 + chunk); w = w2[sl]; ss = sc[sl]; pp = ph[sl]
            hj = self.h[:, yidx[sl]].T                                   # (m, n)
            eph = pp[:, None] ** self.ch[None, :]
            Gp = self.gsp(ss)                                            # (m, n)
            gam += (w[:, None] * Gp * eph * np.conj(hj)).sum(0)
            x = np.clip(ss / ds, 0, len(self.S) - 1.000001); i0 = np.floor(x).astype(int); lam = (x - i0)
            Pp = (1 - lam)[:, None, None] * self.P[i0] + lam[:, None, None] * self.P[i0 + 1]
            Qp = (1 - lam)[:, None, None] * self.Q[i0] + lam[:, None, None] * self.Q[i0 + 1]
            A1 = hj * np.conj(eph)
            PP += np.einsum('p,pj,pk,pjk->jk', w, A1, np.conj(A1), Pp, optimize=True)
            QQ += np.einsum('p,pj,pk,pjk->jk', w, A1, A1, Qp, optimize=True)
        return D_sv, F5, gam, PP, QQ
    def gain(self, gam, PP, QQ, sel=None):
        """max over a (complex, components in sel) of Re<a,gam> + 1/2 Re a^T PP conj(a) - 1/2 Re a^T QQ a - sum cost|a|^2,
           nu5-shift linear cost included.  Returns (gain, minimum eigenvalue of the concavity matrix)."""
        n = self.n; sel = list(range(n)) if sel is None else sel; m = len(sel)
        g = gam.copy(); k32 = self.names.index('p32'); g[k32] -= 2 * self.rec['nu5'] / self.eta
        # real variables x = (Re a, Im a) on sel
        Pm = PP[np.ix_(sel, sel)]; Qm = QQ[np.ix_(sel, sel)]; C = self.cost[sel]
        # quadratic form q(a) = 1/2 Re sum a_j conj(a_k) P_jk - 1/2 Re sum a_j a_k Q_jk - sum C_j |a_j|^2 = -x^T M x
        Hm = np.zeros((2 * m, 2 * m))
        def qf(a): return 0.5 * np.real(a @ Pm @ np.conj(a)) - 0.5 * np.real(a @ Qm @ a) - np.sum(C * np.abs(a) ** 2)
        basis = [np.eye(m)[j] + 0j for j in range(m)] + [1j * np.eye(m)[j] for j in range(m)]
        for i in range(2 * m):
            for j in range(i, 2 * m):
                v = (qf(basis[i] + basis[j]) - qf(basis[i]) - qf(basis[j])) / 2
                Hm[i, j] = Hm[j, i] = -v
            Hm[i, i] = -qf(basis[i])
        lin = np.concatenate([np.real(g[sel]), np.imag(g[sel])])
        ev = np.linalg.eigvalsh(Hm)
        if ev[0] <= 0: return float('inf'), float(ev[0])
        return float(0.25 * lin @ np.linalg.solve(Hm, lin)), float(ev[0])

def scan(rec, cs, sigs, e1=None, eta=None):
    M = Model(rec, e1=e1, eta=eta, ny=(24, 6, 64), nw=(20, 6))
    S5, sstar = M.S5()
    out = dict(rec=rec, S5=S5, sstar=sstar, pts=[])
    for c in cs:
        for sig in sigs:
            if sig <= 0: continue
            D_sv, F5, gam, PP, QQ = M.family_point(sig, c)
            Vsl = S5 - (M.B5(sig * sig) - M.costq(sig))
            gt, ev = M.gain(gam, PP, QQ)
            gg = {}
            for gname, mem in GROUPS.items():
                gg[gname] = M.gain(gam, PP, QQ, sel=[M.names.index(x) for x in mem])[0]
            out['pts'].append(dict(c=c, sig=sig, m2=42 * c ** 4, D=D_sv, Vsl=Vsl, gain=gt, mineig=ev, groups=gg, excess=gt - D_sv - Vsl))
    return out

if __name__ == '__main__':
    rec = json.loads(sys.argv[1]); outp = sys.argv[2]
    cs = [float(x) for x in sys.argv[3].split(',')]; sigs = [float(x) for x in sys.argv[4].split(',')]
    t0 = time.time(); o = scan(rec, cs, sigs); o['secs'] = time.time() - t0
    json.dump(o, open(outp, 'w'), indent=1)
    best = max(o['pts'], key=lambda p: p['excess'])
    print('t=%.3f S5=%.9f s*=%.4f  best excess %+.3e at c=%.2f sig=%.3f (gain %.2e D %.2e Vsl %.2e)  [%.0fs]' % (rec['t'], o['S5'], o['sstar'], best['excess'], best['c'], best['sig'], best['gain'], best['D'], best['Vsl'], o['secs']))
