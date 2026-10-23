"""Mid-range node caps, TWO odd directions (tau2 = v2.m in the real odd block (6,7,10), tau3 = v3.m in the imaginary odd block (8,9,11)).
Partition of the (tau2, tau3) plane, modulo the symmetries (tau2,tau3) -> (-tau2,-tau3) [z -> -z] and (tau2,tau3) -> (tau2,-tau3) [z -> conj z]
(MIDCAPS.md Lemma 2): boxes I_i x I_j over the intervals I_0 = [-rho0, rho0], I_k = [e_k, e_{k+1}] (k = 1..K-1), covering [0, T)^2, and the
two halfspaces tau2 >= T, tau3 >= T (symmetric prices with odd-sector variance).  Box prices: anchored at the constrained maximiser of J
(tau fixed at the box centre), optionally plus even-sector variance (blocks 0/1) when the ideal form is indefinite there.  PROPOSAL in float;
each piece is certified exactly by fullint (outward integration) + piece_quadratic_multi (exact LDL).
usage: midcaps2.py t out.json s1 s2 ..."""
import json, sys, os, time, numpy as np
from fractions import Fraction as F
from math import ceil
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fullint import Setup, upper, piece_quadratic_multi
SP = os.environ.get('PSIDIR', os.path.dirname(os.path.abspath(__file__))); sys.path.insert(0, SP)
from psi_float import Psi, load_row
from majf import Maj
from scipy.optimize import minimize, minimize_scalar
CERT = os.environ.get('CERTC', '/Users/alingalatan/workspaces/grothe/handoff/lower-stein/cert-0745c'); TOOLS = os.path.dirname(os.path.abspath(__file__))
RHO0 = F(3, 1000); EDGES = [F(3, 1000) * 2 ** k for k in range(6)]; T = EDGES[-1]; FAR = [T, 2 * T, 4 * T]      # boxes up to T = 0.096; far slabs/halfspace in one direction
NQ_IN, NQ_OUT = int(os.environ.get('NQ_IN', '1024')), int(os.environ.get('NQ_OUT', '256'))
def rat(x, d=10 ** 6): return F(round(x * d), d)
class Row:
    def __init__(s, t):
        s.t = t; s.row = json.load(open(f'{CERT}/row_{t}.json')); s.S = {}
        for nq in {NQ_IN, NQ_OUT}: s.S[nq] = Setup(s.row, json.load(open(f'{TOOLS}/moments_1600_{nq}.json')))
        _, th, eps = load_row(t); s.P = Psi(th, eps, nr=300, nt=128); s.M = Maj(s.P); s.S0 = s.S[NQ_IN]
    def mats(s, nq, y, var):
        S = s.S[nq]; pa, pb = S.prices(y, var); C, h, H = S.integrate(pa, pb); Cu, hu, Hu, rho = upper(C, h, H)
        return (Cu, hu, Hu), (float(Cu), np.array([float(x) for x in hu]), np.array([[float(x) for x in r] for r in Hu]))
    def fbound(s, sv, Cf, hf, Hf, cons):
        """cons: list of (v, lo, hi); returns min over multipliers of the float bound and the multipliers (lam for slabs, mu for halfspaces)."""
        Q = s.S0.Qf; a = s.S0.af; Qm = Q - Hf; lin0 = hf + Hf @ (sv * a); c0 = Cf + 2 * sv * hf @ a + sv * sv * a @ Hf @ a
        def val(x):
            x = np.abs(x); K = Qm.copy(); lin = lin0.copy(); c = c0
            for (v, lo, hi), l in zip(cons, x):
                if hi is None: lin = lin + l * v / 2; c -= l * lo
                else: K = K + l * np.outer(v, v); lin = lin + l * (lo + hi) / 2 * v; c -= l * lo * hi
            if np.linalg.eigvalsh(K)[0] <= 1e-7: return 1e9
            return c + lin @ np.linalg.solve(K, lin)
        best = None
        for x0 in ([0.3] * len(cons), [1.5] * len(cons), [0.1] * len(cons), [2.0, 0.3][:len(cons)], [0.3, 1.5][:len(cons)]):
            r = minimize(val, x0, method='Nelder-Mead', options={'xatol': 1e-10, 'fatol': 1e-14, 'maxiter': 4000})
            if best is None or r.fun < best.fun: best = r
        return best.fun, np.abs(best.x)
    def conmax(s, sv, Vm, tau, m0):
        P = s.P; G = np.linalg.inv(Vm @ Vm.T); Pr = lambda x: x - Vm.T @ (G @ (Vm @ x)) + Vm.T @ (G @ tau)
        g = lambda x: (lambda val, gr: (-val, -(gr - Vm.T @ (G @ (Vm @ gr)))))(*P.J(Pr(x), sv, True))
        r = minimize(g, m0, jac=True, method='L-BFGS-B', options={'ftol': 1e-15, 'gtol': 1e-10, 'maxiter': 3000}); return -r.fun, Pr(r.x)
    def certify(s, mx, cons, mults):
        Cu, hu, Hu = mx; ml = []
        for (v, lo, hi), l in zip(cons, mults):
            ml.append([v, lo, hi, (F(0) if hi is None else rat(l * (1 + 1e-7) + 1e-9, 10 ** 9)), (rat(l, 10 ** 9) if hi is None else F(0))])
        for _ in range(25):
            out = piece_quadratic_multi(s.S0.Q, s.S0.a, Cu, hu, Hu, [tuple(c) for c in ml])
            if out is not None: return out, ml
            for c in ml:
                if c[2] is not None: c[3] = c[3] * F(11, 10) + F(1, 10 ** 6)
        raise RuntimeError('no positive definite multipliers')
    def node(s, sv, log=print):
        P = s.P; psi, m = P.psi(sv); m = m.copy(); m[3:] = 0.0; y = m + sv * P.a
        C, h, H = s.M.build(y @ P.B); D = P.Q - H; blk = {0: [0, 1, 2], 1: [3, 4, 5], 2: [6, 7, 10], 3: [8, 9, 11]}; ev = {}; vec = {}
        for b, ix in blk.items():
            e, V = np.linalg.eigh(D[np.ix_(ix, ix)]); ev[b] = e[0]; vec[b] = V[:, 0] * (1 if V[0, 0] > 0 else -1)
        vq = {}
        for b in (2, 3):
            q = [F(0)] * 12
            for j, c in zip(blk[b], vec[b]): q[j] = rat(c)
            vq[b] = q
        v2 = np.array([float(x) for x in vq[2]]); v3 = np.array([float(x) for x in vq[3]]); Vm = np.stack([v2, v3]); sq = F(sv).limit_denominator(10 ** 6)
        def evar(fe):                                                   # even-sector variance factors (blocks 0, 1 along their negative directions)
            out = []
            for b in (0, 1):
                if fe[b]:
                    f = np.zeros(12); f[blk[b]] = vec[b] * fe[b]; out.append(f)
            return out
        flist = [(0.0, 0.0)]
        if ev[0] < 0.01 or ev[1] < 0.01:
            flist = [(f0 if ev[0] < 0.01 else 0.0, f1 if ev[1] < 0.01 else 0.0) for f0 in (0.01, 0.02, 0.03, 0.05, 0.08) for f1 in (0.01, 0.02, 0.03, 0.05, 0.08)]
        I = [(-RHO0, RHO0)] + list(zip(EDGES[:-1], EDGES[1:]))
        best = None
        for fe in flist:
            var = evar(fe); mx, fl = s.mats(NQ_IN, y, var); b, mul = s.fbound(sv, *fl, [(v2, -float(RHO0), float(RHO0)), (v3, -float(RHO0), float(RHO0))])
            if best is None or b < best[0]: best = (b, fe, var, mx, mul)
        b, fe, var, mx, mul = best
        if not b < 1e8: log(f'  s={sv}: no admissible centre box (even-sector eigenvalues {ev[0]:.3f}, {ev[1]:.3f})'); return None
        pieces = []; mc = m.copy()
        for i, I2 in enumerate(I):
            for j, I3 in enumerate(I):
                cons_f = [(v2, float(I2[0]), float(I2[1])), (v3, float(I3[0]), float(I3[1]))]
                if i == 0 and j == 0: yy = y; nq = NQ_IN
                else:
                    tc = np.array([float(I2[0] + I2[1]) / 2, float(I3[0] + I3[1]) / 2]); Jc, mc2 = s.conmax(sv, Vm, tc, mc); yy = mc2 + sv * P.a
                    nq = NQ_IN if max(i, j) <= 3 else NQ_OUT
                    if j == 0: mc = mc2
                mx, fl = s.mats(nq, yy, var); b, mul = s.fbound(sv, *fl, cons_f); bvar = var
                if not b < 1e8:                                         # fallback: extra even-sector variance (blocks 0, 1) for this box
                    for fx in (0.03, 0.06, 0.1, 0.15, 0.25):
                        ex = []
                        for bb in (0, 1):
                            f = np.zeros(12); f[blk[bb]] = vec[bb] * fx; ex.append(f)
                        mx2, fl2 = s.mats(nq, yy, var + ex); b2, mul2 = s.fbound(sv, *fl2, cons_f)
                        if b2 < 1e8: mx, b, mul, bvar = mx2, b2, mul2, var + ex; break
                if not b < 1e8: log(f'  s={sv}: box {I2}x{I3} infeasible'); return None
                out, ml = s.certify(mx, [(vq[2], I2[0], I2[1]), (vq[3], I3[0], I3[1])], mul)
                pieces.append(dict(kind='box', box=[[str(I2[0]), str(I2[1])], [str(I3[0]), str(I3[1])]], nq=nq, anchor=[repr(float(x)) for x in yy], var=[[repr(float(x)) for x in f] for f in bvar],
                                   mult=[[str(c[3]), str(c[4])] for c in ml], q=[str(x) for x in out[:3]], minpivot=str(out[3]), float_bound=b))
        for d, vd, od in ((2, v2, 3), (3, v3, 2)):                      # far region tau_d >= T: slabs [T,2T], [2T,4T] (any tau_od), halfspace tau_d >= 4T
            mcf = m.copy()
            for k, (lo, hi) in enumerate(list(zip(FAR[:-1], FAR[1:])) + [(FAR[-1], None)]):
                hb = None
                if hi is not None:
                    tc = float(lo + hi) / 2; Jc, mcf = s.conmax(sv, vd[None, :], np.array([tc]), mcf); yy = mcf + sv * P.a
                else: yy = y
                for fo in ((0.02, 0.05, 0.1, 0.15, 0.2, 0.3) if hi is not None else (0.06, 0.1, 0.16, 0.25, 0.35)):
                    f1 = np.zeros(12); f1[blk[2]] = vec[od] * fo; vo = [f1] + var
                    if hi is None: f2_ = np.zeros(12); f2_[blk[2]] = vec[d] * fo; vo = [f1, f2_] + var
                    mx0, fl = s.mats(NQ_OUT, yy, vo); b0, mul0 = s.fbound(sv, *fl, [(vd, float(lo), None if hi is None else float(hi))])
                    if hb is None or b0 < hb[0]: hb = (b0, mul0, mx0, vo)
                b, mul, mx, vo = hb
                if not b < 1e8: log(f'  s={sv}: far piece {d} {lo} infeasible'); return None
                out, ml = s.certify(mx, [(vq[d], lo, hi)], mul)
                pieces.append(dict(kind='far', dir=d, lo=str(lo), hi=None if hi is None else str(hi), nq=NQ_OUT, anchor=[repr(float(x)) for x in yy], var=[[repr(float(x)) for x in f] for f in vo],
                                   mult=[[str(ml[0][3]), str(ml[0][4])]], q=[str(x) for x in out[:3]], minpivot=str(out[3]), float_bound=b))
        vals = [F(p['q'][0]) + F(p['q'][1]) * sq + F(p['q'][2]) * sq * sq for p in pieces]; mxv = max(vals)
        cap = F(ceil((mxv + F(1, 10 ** 12)) * 10 ** 12), 10 ** 12); worst = sorted(range(len(vals)), key=lambda k: -vals[k])[:3]
        log(f"  s={sv}: Psi_float {psi:.9f}  cap {float(cap):.9f} (cap-Psi {float(cap)-psi:+.2e}; even var {fe}; eig {ev[0]:.3f} {ev[1]:.3f} {ev[2]:.3f} {ev[3]:.3f}; worst pieces "
            + ', '.join(f"{pieces[k].get('box', (pieces[k].get('dir'), pieces[k].get('lo')))}:{float(vals[k])-psi:+.1e}" for k in worst) + ")")
        return dict(s=str(sq), v2=[str(x) for x in vq[2]], v3=[str(x) for x in vq[3]], pieces=pieces, cap=str(cap), psi_float=psi, even_var=list(fe))
if __name__ == "__main__":
    t, outfn = sys.argv[1], sys.argv[2]; R = Row(t); res = []
    for a in sys.argv[3:]:
        t0 = time.time(); r = R.node(float(a)); res += [r] if r else []; print(f"    [{time.time()-t0:.0f}s]", flush=True)
        json.dump(dict(t=t, NR=1600, nq_in=NQ_IN, nq_out=NQ_OUT, edges=[str(e) for e in EDGES], rho0=str(RHO0), T=str(T), far=[str(x) for x in FAR], nodes=res), open(outfn, 'w'))
