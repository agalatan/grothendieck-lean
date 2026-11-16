"""Tasks 1-2 (N): radial relaxations over laws of V = |q|^2 (u = 1) with spline test functions.

Outer relaxation: the Stein identities are imposed only for test functions G with
G' = phi continuous piecewise linear in v on the knots uk (the Lean cutG test class, plus a
constant tail), G(0) = 0, Y = phi - G/v:

  (I)   E[G(V)] = E[c2 phi(V)] + E[rho Y(V)]            rho = Re(conj(q)^2 a)/V
  (II)  E[G(V)] = (1/2) E[c1 phi(V)] + (1/2) E[rho Y(V)]
  ((I)+2(II))/3 is the real radial Stein identity of the Lean development (SteinInputs).

The law of V lives on atoms v_i (much finer than the knots).  Per atom: p_i, and the masses
m2_i = kappa2 p, m1_i = kappa1 p, At_i = E[rho | V] p.  All scaled by w_i = 1/(1 + v_i^3).

Contraction scalars (n, h, b, y, z) (Lean GramTensor/GramSpectral; the last two rows are proved
in the docstring of check_budgets_exact.py):
  s = 32n + 8h + 32b + 96y,  ||c2-1||^2 = 16n + 4h,  ||a||^2 = 32b + 24y,  E[conj(q)^2 a] = 32b + 48y,
  ||c1+c2-3||^2 = 80n + 20h + 16b + 96y + 32z,
  ||c1-c2-1||^2 = 16n + 20h + 16b,   ||c1-2||^2 = 32n + 16h + 16b + 48y + 16z,
  0 <= b <= n <= 1/4, 0 <= h <= 1/4, 0 <= y <= z, z^2 <= n h, (3y-z)^2 <= h (n + b + 3y - z).
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # needed under python -I
import numpy as np
import cvxpy as cp
from grid import r_edges, atoms, scalar_kernels, C6


def rot(x, y, t):
    """elementwise x^2 <= y t (y, t >= 0)."""
    return cp.SOC(y + t, cp.vstack([2 * x, y - t]), axis=0)


def rot1(x, y, t):
    return rot(cp.reshape(x, (1,), order='C'), cp.reshape(y, (1,), order='C'), cp.reshape(t, (1,), order='C'))


def test_matrices(uk, v):
    """phi_k, G_k = int_0^v phi_k, Y_k = phi_k - G_k/v at the points v, for hats phi_k on knots
    uk[0] = 0 < ... < uk[K-1]; the last basis function equals 1 beyond uk[K-1]."""
    K = len(uk)
    F = np.zeros((K, len(v)))
    G = np.zeros((K, len(v)))
    for k in range(K):
        # hat k: rises on [uk[k-1], uk[k]], falls on [uk[k], uk[k+1]] (or stays 1 for k = K-1)
        if k > 0:
            a_, b_ = uk[k - 1], uk[k]
            x = np.clip(v, a_, b_)
            F[k] += np.where((v > a_) & (v <= b_), (v - a_) / (b_ - a_), 0.0)
            G[k] += (x - a_) ** 2 / (2 * (b_ - a_))
        if k < K - 1:
            a_, b_ = uk[k], uk[k + 1]
            x = np.clip(v, a_, b_)
            F[k] += np.where((v > a_) & (v <= b_), (b_ - v) / (b_ - a_), 0.0)
            G[k] += (x - a_) - (x - a_) ** 2 / (2 * (b_ - a_))
            if k == 0:
                F[k] += np.where(v <= a_, 1.0, 0.0)
        else:
            F[k] += np.where(v > uk[k], 1.0, 0.0)
            G[k] += np.maximum(v - uk[k], 0.0)
    Y = F - G / np.maximum(v, 1e-300)[None, :]
    return F, G, Y


MODES = {
    'M': dict(),
    'R0': dict(mix=True, total=True),
    'L': dict(mix=True, sep=True),
    'G': dict(mix=True, gram=True, plus=True, joint=True, intA=True),
    'N': dict(I=True, II=True, gram=True, plus=True, joint=True, intA=True, pos=True, cone=True, c2=True,
              haz=True, c1=True),
}


def build(s, mode, ek, e, opts=None):
    o = dict(I=False, II=False, mix=False, pos=False, cone=False, c2=False, haz=False, c1=False, gram=False,
             joint=False, sep=False, total=False, intA=False, plus=False, sixth=True, fixpar=None)
    o.update(MODES[mode])
    if opts:
        o.update(opts)
    r, v = atoms(e)
    N = len(r)
    uk = ek ** 2
    K = len(uk)
    w = 1.0 / (1.0 + v ** 3)
    F, G, Y = test_matrices(uk, v)
    Fw, Gw, Yw = F * w[None, :], G * w[None, :], Y * w[None, :]
    pi_ = cp.Variable(N, nonneg=True)
    at = cp.Variable(N)
    m2 = cp.Variable(N, nonneg=True) if o['pos'] else cp.Variable(N)
    m1 = cp.Variable(N, nonneg=True) if o['pos'] else cp.Variable(N)
    cons = []
    named = {}
    if o['I']:
        cI = Gw @ pi_ - Fw @ m2 - Yw @ at == 0
        cons.append(cI); named['I'] = cI
    if o['II']:
        cII = Gw @ pi_ - 0.5 * (Fw @ m1) - 0.5 * (Yw @ at) == 0
        cons.append(cII); named['II'] = cII
    if o['mix']:
        cM = Gw @ pi_ - (Fw @ (m1 + m2)) / 3 - (2.0 / 3) * (Yw @ at) == 0
        cons.append(cM); named['mix'] = cM
    M3 = 6 + 9 * s + C6 * s ** 1.5
    c0 = w @ pi_ == 1
    c1_ = (w * v) @ pi_ == 1
    c2_ = (w * v ** 2) @ pi_ == 2 + s
    cons += [c0, c1_, c2_]
    named.update(m0=c0, m1=c1_, m2=c2_)
    EV3 = (w * v ** 3) @ pi_
    if o['sixth']:
        c3 = EV3 <= M3
        cons.append(c3); named['m3'] = c3
    info = {}
    if o['gram']:
        if o['fixpar'] is not None:
            n_, h_, b_, y_, z_ = o['fixpar']
        else:
            n_, h_, b_, y_, z_ = (cp.Variable(nonneg=True) for _ in range(5))
            cons += [32 * n_ + 8 * h_ + 32 * b_ + 96 * y_ == s, n_ <= 0.25, h_ <= 0.25, b_ <= n_, y_ <= z_,
                     rot1(z_, n_, h_), n_ + b_ + 3 * y_ - z_ >= 0, rot1(3 * y_ - z_, h_, n_ + b_ + 3 * y_ - z_)]
        par = (n_, h_, b_, y_, z_)
        X2 = 16 * n_ + 4 * h_
        A2 = 32 * b_ + 24 * y_
        EA = 32 * b_ + 48 * y_
        Splus = 80 * n_ + 20 * h_ + 16 * b_ + 96 * y_ + 32 * z_
        Sminus = 16 * n_ + 20 * h_ + 16 * b_
        C1n = 32 * n_ + 16 * h_ + 16 * b_ + 48 * y_ + 16 * z_
        info['par'] = par
    ta = cp.Variable(N, nonneg=True)
    cons.append(rot(at, pi_, ta))                      # E[alpha~^2]
    tp = cp.Variable(N, nonneg=True)
    cons.append(rot(m1 + m2 - 3 * pi_, pi_, tp))       # E (kappa1 + kappa2 - 3)^2
    if o['total']:
        cT = w @ tp / 36 + w @ ta / 18 <= s / 12
        cons.append(cT); named['total'] = cT
    if o['sep']:
        Pq = ((w * v) @ (m1 + m2 - 3 * pi_)) / 3
        Qq = (2.0 / 3.0) * ((w * v) @ at)
        cons += [w @ tp / 9 <= (2.0 / 3.0) * Pq, (4.0 / 9.0) * (w @ ta) <= (2.0 / 3.0) * Qq, Qq <= s / 3]
    if o['gram']:
        cA = w @ ta <= A2
        cons.append(cA); named['a2'] = cA
        if o['plus']:
            cP = w @ tp <= Splus
            cons.append(cP); named['plus'] = cP
        if o['intA']:
            cE = (w * v) @ at == EA
            cons.append(cE); named['EA'] = cE
        if o['joint']:
            s0 = 8 * n_ + 2 * h_ + 8 * b_ + 8 * z_
            h0 = (8.0 / 3) * n_ + (2.0 / 3) * h_ + (8.0 / 3) * b_ + 24 * y_ - (16.0 / 3) * z_
            g_ = cp.Variable(nonneg=True)
            cJ2 = EV3 <= 6 + 9 * s + np.sqrt(s) * (300 * g_ + 198 * h0)
            cJ3 = EV3 <= 6 + 9 * s + np.sqrt(s) * (135 * g_ + (11781.0 / 32) * h0)
            cons += [h0 >= 0, rot1(g_, s0, h0), cJ2, cJ3]
            named.update(J2=cJ2, J3=cJ3)
    if o['cone']:
        cons.append(rot(at, m2, m1))                   # alpha~^2 <= kappa1 kappa2
    if o['c2']:
        t2 = cp.Variable(N, nonneg=True)
        cC2 = w @ t2 <= X2
        cons += [rot(m2 - pi_, pi_, t2), cC2]; named['c2'] = cC2
    if o['haz']:
        td = cp.Variable(N, nonneg=True)
        cH = w @ td <= Sminus
        cons += [rot(m1 - m2 - pi_, pi_, td), cH]; named['haz'] = cH
    if o['c1']:
        t1 = cp.Variable(N, nonneg=True)
        cC1 = w @ t1 <= C1n
        cons += [rot(m1 - 2 * pi_, pi_, t1), cC1]; named['c1'] = cC1
    prob = cp.Problem(cp.Maximize((w * r) @ pi_), cons)
    info.update(r=r, v=v, w=w, uk=uk, pi=pi_, at=at, m2=m2, m1=m1, opts=o, named=named, F=F, G=G, Y=Y)
    return prob, info


def grids(drk=0.1, gk=1.08, sub=6, r_max=60.0, r_fine=6.0):
    """knots ek in r and atom-cell edges e: every knot interval is cut into sub atom cells."""
    ek = r_edges(drk, r_fine, r_max, gk)
    e = np.concatenate([np.linspace(a_, b_, sub, endpoint=False) for a_, b_ in zip(ek[:-1], ek[1:])] + [ek[-1:]])
    # atoms beyond the last knot (the tests are constant there)
    ext = np.geomspace(ek[-1], 4 * ek[-1], 40)[1:]
    e = np.concatenate([e, ext])
    return ek, e


def solve(s, mode, drk=0.1, gk=1.08, sub=6, r_max=60.0, opts=None, verbose=False, ret=False):
    ek, e = grids(drk, gk, sub, r_max)
    prob, info = build(s, mode, ek, e, opts)
    t0 = time.time()
    try:
        prob.solve(solver=cp.CLARABEL, verbose=verbose)
        val, st = prob.value, prob.status
    except Exception as ex:  # noqa
        val, st = None, 'error: %s' % type(ex).__name__
    out = dict(s=s, mode=mode, K=len(ek), N=len(info['r']), drk=drk, sub=sub, value=val, status=st,
               secs=round(time.time() - t0, 2))
    if 'par' in info and val is not None and not isinstance(info['par'][0], (int, float)):
        out['par'] = [round(float(x.value), 6) for x in info['par']]
    if opts:
        out['opts'] = {k: (v if not isinstance(v, (tuple, list)) else list(v)) for k, v in opts.items()}
    if ret:
        return out, info, prob
    return out


if __name__ == "__main__":
    svals = [float(x) for x in sys.argv[1].split(',')] if len(sys.argv) > 1 else [5.0]
    modes = sys.argv[2].split(',') if len(sys.argv) > 2 else ['R0', 'L', 'G', 'N']
    drk = float(sys.argv[3]) if len(sys.argv) > 3 else 0.1
    gk = float(sys.argv[4]) if len(sys.argv) > 4 else 1.08
    sub = int(sys.argv[5]) if len(sys.argv) > 5 else 6
    for s in svals:
        for m in modes:
            print(json.dumps(solve(s, m, drk=drk, gk=gk, sub=sub)), flush=True)
