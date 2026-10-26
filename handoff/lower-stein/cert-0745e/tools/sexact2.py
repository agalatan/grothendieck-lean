"""Stage-2 prototype, phi-hat version (exact rational check of Stein-cut node certificates).
Tests: phi = (u h)' continuous piecewise linear on the mesh t_k = v_k^2 (v_k rational), phi = 0 beyond t_K; Phi = int_0^u phi, h = Phi/u.
Cut (z = (c, beta, alpha)):  G(u) = (phi + beta)^2 + 2 (phi - Phi/u)^2 + 2 alpha (Phi - phi) + (alpha^2/3)(u^2 - 2),   E G(U) >= 0  (general Stein cut).
On a mesh cell phi = a + b u, Phi = e0 + a u + (b/2) u^2, so u^2 G(u) is a polynomial of degree 4 in u (degree 2 without the factor on the first cell, e0 = 0).
(M)  y0 + y4 v + y1 v^2 + y2 v^4 + y3 v^6 - Psi(sigma v) - sum_j mu_j G_j(v^2) >= 0,  v >= 0:  checked piece by piece (first mesh cell: degree 6;
     other cells: multiplied by v^4, degree 10) by exact Bernstein subdivision; tail by nonnegative Taylor coefficients.
usage: sexact2.py ex.pkl x_lo x_hi sigma_1 sigma_2 ..."""
import sys, os, pickle, time, warnings, numpy as np
warnings.filterwarnings('ignore')
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, os.path.join(HERE, 'steinlib'))
from fractions import Fraction as Fr
from math import comb, isqrt
from scipy.optimize import linprog
from wexact import poly_min_lb, C6, RHO
import sdp
def M6f(x): return 6 + 9 * x * x + float(C6) * x ** 3
def make_Q(tf, d=0.4, step=0.02):
    old = sdp.nodes; sdp.nodes = lambda d_, **kw: np.array(tf)
    try: return sdp.SDP(d, ('gen',), step=step)
    finally: sdp.nodes = old
def bank_from_sdp(Q, fun, x, J=6):
    r = Q.solve1(fun, x, rho=float(RHO))
    if r[0] is None: return [], r
    c, E2 = Q.lmi['gen']; Z = np.array(c.dual_value); Z = 0.5 * (Z + Z.T); w, V = np.linalg.eigh(Z); idx = np.argsort(-w)[:J]
    return [np.round(np.sqrt(w[i]) * V[:, i], 7) for i in idx if w[i] > 1e-12 * max(w.max(), 1e-30)], r
def Gfloat(t, z, u):
    K = len(t) - 1; B, A, D = sdp.feats(t, u); return (B @ z[:K] + z[K]) ** 2 + 2 * (D @ z[:K]) ** 2 + 2 * z[K + 1] * (A @ z[:K]) + z[K + 1] ** 2 / 3 * (u * u - 2)
def propose(t, bank, psi_u, xlo, xhi, ug):
    G = np.array([Gfloat(t, z, ug) for z in bank]).T if bank else np.zeros((len(ug), 0)); J = G.shape[1]; v = np.sqrt(ug)
    A = np.hstack([-np.ones((len(v), 1)), -ug[:, None], -(ug ** 2)[:, None], -(ug ** 3)[:, None] * 1e-2, -v[:, None], G, np.zeros((len(v), 1))]); b = -psi_u(ug) - 3e-7
    rows = [[1, 1, 2 + x * x, M6f(x) * 1e-2, float(RHO)] + [0] * J + [-1] for x in (xlo, xhi)]; cvec = np.zeros(5 + J + 1); cvec[-1] = 1
    r = linprog(cvec, A_ub=np.vstack([A, rows]), b_ub=np.concatenate([b, [0, 0]]), bounds=[(None, None)] * 3 + [(0, None)] * 2 + [(0, None)] * J + [(None, None)], method='highs')
    assert r.status == 0, r.message
    y = r.x[:5].copy(); y[3] *= 1e-2; return y, r.x[5:5 + J], r.x[-1]
def rsqrt(q):
    a, b = isqrt(q.numerator), isqrt(q.denominator); assert a * a == q.numerator and b * b == q.denominator; return Fr(a, b)
def cut_polys(t, z):
    """per mesh cell k = 0..K: (coefficients in u of G on cell 0 [degree 2]  |  of u^2 G on cells k >= 1 [degree 4])"""
    K = len(t) - 1; c = list(z[:K]) + [Fr(0)]; be = z[K]; al = z[K + 1]; out = []; Phi = Fr(0)
    for k in range(K + 1):
        if k < K: b_ = (c[k + 1] - c[k]) / (t[k + 1] - t[k]); a_ = c[k] - b_ * t[k]
        else: a_, b_ = Fr(0), Fr(0)
        e0 = Phi - a_ * t[k] - b_ / 2 * t[k] ** 2
        if k == 0:
            assert e0 == 0
            g = [(a_ + be) ** 2 + 2 * al * (e0 - a_) - 2 * al * al / 3, 2 * (a_ + be) * b_ + 2 * al * (a_ - b_), b_ * b_ + 2 * (b_ / 2) ** 2 + al * b_ + al * al / 3]
        else:
            g = [2 * e0 * e0, Fr(0), (a_ + be) ** 2 - 2 * e0 * b_ + 2 * al * (e0 - a_) - 2 * al * al / 3, 2 * (a_ + be) * b_ + 2 * al * (a_ - b_), b_ * b_ + b_ * b_ / 2 + al * b_ + al * al / 3]
        out.append(g)
        if k < K: Phi += (c[k] + c[k + 1]) / 2 * (t[k + 1] - t[k])
    return out
def certify_node(nodes, caps, smax, sigma, t, bank, mu, y, depth=7):
    K = len(t) - 1; y0, y1, y2, y3, y4 = y; assert y3 >= 0 and y4 >= 0 and all(m >= 0 for m in mu)
    tv = [rsqrt(q) for q in t]; nv = [r / sigma for r in nodes]; bps = sorted(set(tv + nv)); slack = None; CP = [cut_polys(t, z) for z in bank]
    def cell_of(v_lo):
        if v_lo >= tv[K]: return K
        k = 0
        while tv[k + 1] <= v_lo: k += 1
        return k
    def poly(k, c0, sl):
        P = [y0 - c0, y4 - sl * sigma, y1, Fr(0), y2, Fr(0), y3]                       # degree 6 in v
        if k == 0:
            for d in range(3): P[2 * d] -= sum(m * g[0][d] for m, g in zip(mu, CP))
            return P
        Q = [Fr(0)] * 4 + P                                                             # v^4 * P
        for d in range(5): Q[2 * d] -= sum(m * g[k][d] for m, g in zip(mu, CP))
        return Q
    npieces = 0
    for i in range(len(bps) - 1):
        lo, hi = bps[i], bps[i + 1]
        if lo >= nv[-1]: break
        kn = max(j for j in range(len(nv)) if nv[j] <= lo); sl = (caps[kn + 1] - caps[kn]) / (nodes[kn + 1] - nodes[kn])
        m_ = poly_min_lb(poly(cell_of(lo), caps[kn] - sl * nodes[kn], sl), lo, hi, depth); npieces += 1
        if cell_of(lo) > 0: m_ = m_ / lo ** 4 if m_ < 0 else m_                         # convert a negative slack of v^4 * (...) into a slack of (...)
        slack = m_ if slack is None else min(slack, m_)
    T = nv[-1]; assert T >= tv[K]; q = poly(K, caps[-1] - smax * nodes[-1], smax)
    c = [sum(a * comb(k_, j) * T ** (k_ - j) for k_, a in enumerate(q) if k_ >= j) for j in range(len(q))]
    return slack, all(v >= 0 for v in c), npieces
def V(y, x): return y[0] + y[1] + y[2] * (2 + x * x) + y[3] * (6 + 9 * x * x + C6 * x ** 3) + y[4] * RHO
def exact_nodes(pk):
    """cap nodes as exact rationals: pk['nodes_exact'] (strings) when present; otherwise the float nodes, accepted only if they are
    exactly representable on the 1e-4 grid (no silent rounding; cert-0745e fix of the round-2 hazard)."""
    if 'nodes_exact' in pk:
        N = [Fr(v) for v in pk['nodes_exact']]; assert len(N) == len(pk['nodes']) and all(abs(float(a) - b) < 1e-12 for a, b in zip(N, pk['nodes'])); return N
    N = [Fr(int(round(r * 10**4)), 10**4) for r in pk['nodes']]
    assert all(abs(float(a) - b) < 1e-12 for a, b in zip(N, pk['nodes'])), 'cap node not on the 1e-4 grid: store pk["nodes_exact"]'
    return N
def load(pkfn):
    pk = pickle.load(open(pkfn, 'rb')); q9 = lambda v, d=10**9: Fr(int(np.ceil(v * d)), d)
    nodes = exact_nodes(pk); caps = [Fr(c) for c in pk['caps_exact']] if pk.get('certified') else [q9(c + 2e-6) for c in pk['caps']]; smax = q9(pk['smax'], 1000); kappa = Fr(int(np.floor(pk['kappa'] * 10**9)), 10**9)
    nf = np.array([float(v) for v in nodes]); cf = np.array([float(v) for v in caps]); psi = lambda s: np.where(np.asarray(s) <= nf[-1], np.interp(s, nf, cf), cf[-1] + float(smax) * (np.asarray(s) - nf[-1]))
    return pk, nodes, caps, smax, kappa, nf, psi
TV = np.concatenate([np.arange(0, 2.5 - 1e-9, 0.1), [2.5, 2.6, 2.8, 3.0, 3.3, 3.6, 4.0, 4.5, 5.0, 5.6, 6.3, 7.0, 7.8]]); TQ = [Fr(int(round(a * 100)), 100) ** 2 for a in TV]; TF = np.array([float(a) for a in TQ])
def node_cert(Q, nodes, caps, smax, nf, psi, sg, xlo, xhi):
    sq = Fr(int(round(sg * 10**4)), 10**4); fun = lambda uu: psi(sg * np.sqrt(uu)); bank, r = bank_from_sdp(Q, fun, 0.5 * (xlo + xhi))
    ug = np.unique(np.concatenate([np.linspace(0, 8, 8001), np.geomspace(8, (nf[-1] / sg) ** 2, 4000), TF, (nf / sg) ** 2])); y, mu, tau = propose(TF, bank, fun, xlo, xhi, ug)
    yq = [Fr(int(round(v * 10**12)), 10**12) for v in y]; yq[3] = max(yq[3], Fr(0)); yq[4] = max(yq[4], Fr(0)); muq = [max(Fr(int(round(v * 10**10)), 10**10), Fr(0)) for v in mu]
    bq = [[Fr(int(round(float(v) * 10**7)), 10**7) for v in z] for z in bank]; keep = [j for j, m in enumerate(muq) if m > 0]; bq = [bq[j] for j in keep]; muq = [muq[j] for j in keep]
    slack, tail_ok, npieces = certify_node(nodes, caps, smax, sq, TQ, bq, muq, yq); bump = 0.0
    if slack < 0: bump = float(-slack); yq[0] += -slack + Fr(1, 10**10); slack, tail_ok, npieces = certify_node(nodes, caps, smax, sq, TQ, bq, muq, yq)
    assert slack >= 0 and tail_ok
    Vx = max(V(yq, Fr(str(xlo))), V(yq, Fr(str(xhi)))); return sq, Vx, dict(conic=r, ncut=len(bq), tau=tau, bump=bump, npieces=npieces, y=yq, mu=muq, bank=bq)
def interval_bound(s0, V0, s1, V1, kappa):
    slope = (V1 - V0) / (s1 - s0); sv = min(max(slope / (2 * kappa), s0), s1); return V0 + slope * (sv - s0) - kappa * sv * sv
if __name__ == "__main__":
    pk, nodes, caps, smax, kappa, nf, psi = load(sys.argv[1]); const = pk['const']; xlo, xhi = float(sys.argv[2]), float(sys.argv[3]); sigs = [float(a) for a in sys.argv[4:]]
    Q = make_Q(TF); Vs = []
    for sg in sigs:
        t0 = time.time(); sq, Vx, info = node_cert(Q, nodes, caps, smax, nf, psi, sg, xlo, xhi); Vs.append((sq, Vx)); r = info['conic']; kf = float(kappa)
        print(f"sigma={sg}: conic primal/verified dual at x_mid {None if r[0] is None else round(const + r[0] - kf*sg*sg, 6)}/{None if r[0] is None else round(const + r[1] - kf*sg*sg, 6)} | {info['ncut']} cuts | float LP on [x_lo,x_hi] {const + info['tau'] - kf*sg*sg:.6f} | EXACT node bound {const + float(Vx) - kf*sg*sg:.6f} (slack bump {info['bump']:.1e}, {info['npieces']} pieces) [{time.time()-t0:.0f}s]", flush=True)
    for (s0, V0), (s1, V1) in zip(Vs[:-1], Vs[1:]): print(f"sigma in [{float(s0)},{float(s1)}] x in [{xlo},{xhi}]: EXACT row residual bound {const + float(interval_bound(s0, V0, s1, V1, kappa)):.6f}")
