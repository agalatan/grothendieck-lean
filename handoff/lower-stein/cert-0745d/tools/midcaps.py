"""Mid-range node caps by localisation in the odd fibre direction (MIDCAPS.md).  PROPOSAL in float (psi_float, scipy) + EXACT certification.
For a row t and nodes s: direction v (block-3 eigenvector of the ideal anchored form, rounded to a rational vector), partition of the line
tau = v.m into  [-rho0, rho0] (symmetric prices), [e_k, e_{k+1}] (asymmetric prices anchored at the constrained maximiser, k = 0..K-1),
[T, inf) (symmetric prices with odd-sector variance, concave majorant);  the mirrored pieces follow from the conjugation symmetry (MIDCAPS.md, Lemma 2).
Each piece: prices (float recipe) -> fullint.integrate (outward) -> Loewner upper -> exact S-lemma quadratic (piece_quadratic, exact LDL).
cap(s) = max over pieces of q_k(s), rounded UP to 1e-12 after adding 1e-12.
usage: midcaps.py t out.json s1 s2 ...   (env NQ = angular cells, default 256)"""
import json, sys, os, time, numpy as np
from fractions import Fraction as F
from math import ceil
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fullint import Setup, upper, piece_quadratic
SP = os.environ.get('PSIDIR', os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, SP)
from psi_float import Psi, load_row
from majf import Maj
from scipy.optimize import minimize, minimize_scalar
CERT = os.environ.get('CERTC', '/Users/alingalatan/workspaces/grothe/handoff/lower-stein/cert-0745c')
NQ = int(os.environ.get('NQ', '256')); TOOLS = os.path.dirname(os.path.abspath(__file__))
RHO0 = F(3, 1000); EDGES = [F(3, 1000) * 2 ** k for k in range(8)]          # 0.003 .. 0.384
FOUT = 0.08
def rat(x, d=10 ** 6): return F(round(x * d), d)
class Row:
    def __init__(s, t):
        s.t = t; s.row = json.load(open(f'{CERT}/row_{t}.json')); mom = json.load(open(f'{TOOLS}/moments_1600_{NQ}.json'))
        s.S = Setup(s.row, mom); _, th, eps = load_row(t); s.P = Psi(th, eps, nr=300, nt=128); s.M = Maj(s.P)
    def mats(s, pa, pb):
        C, h, H = s.S.integrate(pa, pb); Cu, hu, Hu, rho = upper(C, h, H)
        return (Cu, hu, Hu), (float(Cu), np.array([float(x) for x in hu]), np.array([[float(x) for x in r] for r in Hu]))
    def fbound(s, sv, Cf, hf, Hf, v, lo, hi):
        Q = s.S.Qf; a = s.S.af; Qm = Q - Hf; lin = hf + Hf @ (sv * a); c0 = Cf + 2 * sv * hf @ a + sv * sv * a @ Hf @ a
        if hi is None:
            if np.linalg.eigvalsh(Qm)[0] <= 1e-9: return np.inf, 0.0, 0.0
            f = lambda mu: c0 + (lin + mu * v / 2) @ np.linalg.solve(Qm, lin + mu * v / 2) - mu * lo
            r = minimize_scalar(f, bounds=(0, 50), method='bounded', options={'xatol': 1e-12}); return r.fun, 0.0, r.x
        def val(lam):
            Dl = Qm + lam * np.outer(v, v)
            if np.linalg.eigvalsh(Dl)[0] <= 1e-7: return 1e9
            l2 = lin + lam * (lo + hi) / 2 * v; return c0 - lam * lo * hi + l2 @ np.linalg.solve(Dl, l2)
        r = minimize_scalar(val, bounds=(0, 20), method='bounded', options={'xatol': 1e-12}); return r.fun, r.x, 0.0
    def conmax(s, sv, v, tau, m0):
        P = s.P
        g = lambda x: (lambda val, gr: (-val, -(gr - (v @ gr) * v / (v @ v))))(*P.J(x - (v @ x) * v / (v @ v) + tau * v / (v @ v), sv, True))
        r = minimize(g, m0, jac=True, method='L-BFGS-B', options={'ftol': 1e-15, 'gtol': 1e-10, 'maxiter': 2000})
        x = r.x - (v @ r.x) * v / (v @ v) + tau * v / (v @ v); return -r.fun, x
    def certify(s, sv, mats_exact, vq, lo, hi, lam, mu):
        Cu, hu, Hu = mats_exact; Q = s.S.Q; a = s.S.a
        lamq = F(0) if lam == 0 else rat(lam * (1 + 1e-7) + 1e-9, 10 ** 9); muq = F(0) if mu == 0 else rat(mu, 10 ** 9)
        for _ in range(20):
            out = piece_quadratic(Q, a, Cu, hu, Hu, vq, lo, hi, lamq, muq)
            if out is not None: return out, lamq, muq
            lamq = lamq * F(11, 10) + F(1, 10 ** 6)
        raise RuntimeError('no positive definite multiplier found')
    def node(s, sv, log=print):
        P = s.P; psi, m = P.psi(sv); m = m.copy(); m[3:] = 0.0
        C, h, H = s.M.build((m + sv * P.a) @ P.B); D = P.Q - H
        e3, V3 = np.linalg.eigh(D[np.ix_([8, 9, 11], [8, 9, 11])]); e2, V2 = np.linalg.eigh(D[np.ix_([6, 7, 10], [6, 7, 10])])
        v3 = V3[:, 0] * (1 if V3[0, 0] > 0 else -1); vq = [F(0)] * 12
        for j, c in zip((8, 9, 11), v3): vq[j] = rat(c)
        v = np.array([float(x) for x in vq]); sq = F(sv).limit_denominator(10 ** 6); assert float(sq) == sv
        # block-2 variance when the ideal block-2 form is (nearly) indefinite
        fl = [0.0] if e2[0] > 0.01 else [0.01, 0.015, 0.02, 0.03, 0.04, 0.05, 0.07, 0.1]
        best = None
        for f in fl:
            var = [] if f == 0 else [np.concatenate([np.zeros(6), np.array([V2[0, 0], V2[1, 0], 0, 0, V2[2, 0], 0]) * f])]
            pa, pb = s.S.prices(m + sv * P.a, var); mx, (Cf, hf, Hf) = s.mats(pa, pb)
            b, lam, mu = s.fbound(sv, Cf, hf, Hf, v, -float(RHO0), float(RHO0))
            if best is None or b < best[0]: best = (b, f, var, mx, lam)
        b, f2, var, mx, lam = best
        if not b < 1e8: log(f'  s={sv}: no admissible center piece'); return None
        pieces = []
        out, lamq, muq = s.certify(sq, mx, vq, -RHO0, RHO0, lam, 0)
        pieces.append(dict(kind='center', lo=str(-RHO0), hi=str(RHO0), anchor=[repr(float(x)) for x in (m + sv * P.a)], var=[[repr(float(x)) for x in f] for f in var], scale='1', lam=str(lamq), mu='0', q=[str(x) for x in out[:3]], minpivot=str(out[3]), float_bound=b))
        mc = m.copy()
        for lo, hi in zip(EDGES[:-1], EDGES[1:]):
            tc = float(lo + hi) / 2; Jc, mc = s.conmax(sv, v, tc, mc); pa, pb = s.S.prices(mc + sv * P.a, var); mx, (Cf, hf, Hf) = s.mats(pa, pb)
            b, lam, mu = s.fbound(sv, Cf, hf, Hf, v, float(lo), float(hi)); out, lamq, muq = s.certify(sq, mx, vq, lo, hi, lam, 0)
            pieces.append(dict(kind='slab', lo=str(lo), hi=str(hi), anchor=[repr(float(x)) for x in (mc + sv * P.a)], var=[[repr(float(x)) for x in f] for f in var], scale='1', lam=str(lamq), mu='0', q=[str(x) for x in out[:3]], minpivot=str(out[3]), float_bound=b))
        T = EDGES[-1]; hb = None
        for fout in (0.06, 0.08, 0.1, 0.12, 0.16):
            fo = np.zeros(12); fo[[6, 7, 10]] = v3 * fout; vo = [fo] + var
            pa, pb = s.S.prices(m + sv * P.a, vo); mx0, (Cf, hf, Hf) = s.mats(pa, pb); b0, lam0, mu0 = s.fbound(sv, Cf, hf, Hf, v, float(T), None)
            if hb is None or b0 < hb[0]: hb = (b0, mu0, mx0, vo)
        b, mu, mx, vout = hb
        out, lamq, muq = s.certify(sq, mx, vq, T, None, 0, mu)
        pieces.append(dict(kind='halfspace', lo=str(T), hi=None, anchor=[repr(float(x)) for x in (m + sv * P.a)], var=[[repr(float(x)) for x in f] for f in vout], scale='1', lam='0', mu=str(muq), q=[str(x) for x in out[:3]], minpivot=str(out[3]), float_bound=b))
        vals = [F(p['q'][0]) + F(p['q'][1]) * sq + F(p['q'][2]) * sq * sq for p in pieces]; mxv = max(vals)
        cap = F(ceil((mxv + F(1, 10 ** 12)) * 10 ** 12), 10 ** 12)
        log(f"  s={sv}: Psi_float {psi:.9f}  cap {float(cap):.9f} (cap-Psi {float(cap)-psi:+.2e}; f2={f2}; pieces-Psi: " + ' '.join(f"{float(x)-psi:+.1e}" for x in vals) + ")")
        return dict(s=str(sq), v=[str(x) for x in vq], pieces=pieces, cap=str(cap), psi_float=psi, f2=f2)
if __name__ == "__main__":
    t, outfn = sys.argv[1], sys.argv[2]; R = Row(t); res = []
    for a in sys.argv[3:]:
        t0 = time.time(); r = R.node(float(a)); res += [r] if r else []; print(f"    [{time.time()-t0:.0f}s]", flush=True)
        json.dump(dict(t=t, NQ=NQ, NR=1600, edges=[str(e) for e in EDGES], rho0=str(RHO0), nodes=res), open(outfn, 'w'))
