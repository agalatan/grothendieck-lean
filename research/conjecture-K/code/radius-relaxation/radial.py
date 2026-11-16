"""Tasks 1-2 (N): radial relaxations over laws of V = |q|^2 (u = 1), finite-volume form.

Unknowns per r-cell k (one atom v_k per cell, cell edges t_{k-1} < v_k < t_k in v):
  p_k   mass of the law of V,
  At_k  mass of A/v, where A = alpha * p, alpha(v) = E[Re(conj(q)^2 a) | V = v],
  m2_k  mass of kappa_2 * p, kappa_2 = E[c_2 | V],        (identity I)
  d_k   mass of (kappa_1 - kappa_2) * p = tail of p,      (2*II - I: rotation identity)
Discrete identities (hinge tests G = (v - t_k)_+ at every cell edge, differenced):
  m2_k = (v_k - t_{k-1}) p_k - t_{k-1} At_k / v_k + Delta_k * sum_{i>k} (p_i + At_i / v_i)
  d_k  = (v_k - t_{k-1}) p_k + Delta_k * sum_{i>k} p_i
All cell variables are scaled by w_k = 1/(1 + v_k^3).

Contraction scalars (n, h, b, y, z) of the coefficient tensor (Lean: GramTensor/GramSpectral):
  s = 32n + 8h + 32b + 96y,  ||c2-1||^2 = 16n + 4h,  ||a||^2 = 32b + 24y,  E[conj(q)^2 a] = 32b + 48y,
  ||c1+c2-3||^2 = 80n + 20h + 16b + 96y + 32z,  ||c1-c2-1||^2 = 16n + 20h + 16b,
  0 <= b <= n <= 1/4, 0 <= h <= 1/4, 0 <= y <= z, z^2 <= n h, (3y-z)^2 <= h (n + b + 3y - z).
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # needed under python -I
import numpy as np
import scipy.sparse as sp
import cvxpy as cp
from grid import r_edges, atoms, scalar_kernels, C6


def rot(x, y, t):
    """elementwise x^2 <= y t (y, t >= 0) as second-order cones."""
    return cp.SOC(y + t, cp.vstack([2 * x, y - t]), axis=0)


def build(s, mode, e, opts=None):
    """mode: 'R0' old radial budget (H1/H2), 'L' Lean separate budgets, 'G' Lean Gram scalars,
    'N' new constraints on top of G.  opts: dict of switches overriding the mode defaults."""
    o = dict(pos=False, cone=False, c2=False, haz=False, gram=False, joint=False, sep=False,
             total=False, intA=False, plus=False, scalar=False, xmerge=4, sixth=True, c1=False)
    if mode == 'R0':
        o.update(total=True)
    elif mode == 'L':
        o.update(sep=True)
    elif mode == 'G':
        o.update(gram=True, plus=True, joint=True, intA=True)
    elif mode == 'N':
        o.update(gram=True, plus=True, joint=True, intA=True, pos=True, cone=True, c2=True, haz=True, c1=True)
    elif mode == 'M':   # moments only
        pass
    if opts:
        o.update(opts)
    r, v = atoms(e)
    t = e ** 2
    N = len(r)
    tl, th = t[:-1], t[1:]
    D = th - tl
    w = 1.0 / (1.0 + v ** 3)
    rho = np.append(w[1:] / w[:-1], 0.0)      # rho_k = w_{k+1}/w_k (0-indexed), last unused
    pi_ = cp.Variable(N, nonneg=True)
    at = cp.Variable(N)
    Sp = cp.Variable(N, nonneg=True)   # Sp_k = (sum_{i>k} p_i)/w_k
    Sa = cp.Variable(N)                # Sa_k = (sum_{i>k} At_i/v_i)/w_k
    cons = [Sp[N - 1] == 0, Sa[N - 1] == 0,
            Sp[:-1] == cp.multiply(rho[:-1], Sp[1:] + pi_[1:]),
            Sa[:-1] == cp.multiply(rho[:-1], Sa[1:] + cp.multiply(1 / v[1:], at[1:]))]
    mu2 = cp.multiply(v - tl, pi_) - cp.multiply(tl / v, at) + cp.multiply(D, Sp + Sa)
    dl = cp.multiply(v - tl, pi_) + cp.multiply(D, Sp)
    M3 = 6 + 9 * s + C6 * s ** 1.5
    cons += [w @ pi_ == 1, (w * v) @ pi_ == 1, (w * v ** 2) @ pi_ == 2 + s]
    EV3 = (w * v ** 3) @ pi_
    if o['sixth']:
        cons.append(EV3 <= M3)
    info = {}
    use_par = o['gram']
    if use_par:
        n_, h_, b_, y_, z_ = (cp.Variable(nonneg=True) for _ in range(5))
        par = (n_, h_, b_, y_, z_)
        cons += [32 * n_ + 8 * h_ + 32 * b_ + 96 * y_ == s, n_ <= 0.25, h_ <= 0.25, b_ <= n_, y_ <= z_,
                 rot(cp.reshape(z_, (1,), order='C'), cp.reshape(n_, (1,), order='C'), cp.reshape(h_, (1,), order='C')),
                 n_ + b_ + 3 * y_ - z_ >= 0,
                 rot(cp.reshape(3 * y_ - z_, (1,), order='C'), cp.reshape(h_, (1,), order='C'),
                     cp.reshape(n_ + b_ + 3 * y_ - z_, (1,), order='C'))]
        X2 = 16 * n_ + 4 * h_
        A2 = 32 * b_ + 24 * y_
        EA = 32 * b_ + 48 * y_
        Splus = 80 * n_ + 20 * h_ + 16 * b_ + 96 * y_ + 32 * z_
        Sminus = 16 * n_ + 20 * h_ + 16 * b_
        C1n = 32 * n_ + 16 * h_ + 16 * b_ + 48 * y_ + 16 * z_
        info['par'] = par
    ta = cp.Variable(N, nonneg=True)
    cons.append(rot(at, pi_, ta))                       # At^2 <= p * ta  : E[alpha^2/V^2]
    tp = cp.Variable(N, nonneg=True)
    cons.append(rot(2 * mu2 + dl - 3 * pi_, pi_, tp))   # E (kappa1 + kappa2 - 3)^2
    if o['total']:
        cons.append(w @ tp / 36 + w @ ta / 18 <= s / 12)
    if o['sep']:
        # Lean SteinInputs: E v^2 <= (2/3) P, E r^2 <= (2/3) Q, Q <= s/3, P = E[vU], Q = E[rU]
        Pq = ((w * v) @ (2 * mu2 + dl - 3 * pi_)) / 3
        Qq = (2.0 / 3.0) * ((w * v) @ at)
        cons += [w @ tp / 9 <= (2.0 / 3.0) * Pq, (4.0 / 9.0) * (w @ ta) <= (2.0 / 3.0) * Qq, Qq <= s / 3]
        info['PQ'] = (Pq, Qq)
    if o['gram']:
        cons += [w @ ta <= A2]
        if o['plus']:
            cons += [w @ tp <= Splus]
        if o['intA']:
            cons += [(w * v) @ at == EA]
        if o['joint']:
            s0 = 8 * n_ + 2 * h_ + 8 * b_ + 8 * z_
            h0 = (8.0 / 3) * n_ + (2.0 / 3) * h_ + (8.0 / 3) * b_ + 24 * y_ - (16.0 / 3) * z_
            g_ = cp.Variable(nonneg=True)
            cons += [h0 >= 0, rot(cp.reshape(g_, (1,), order='C'), cp.reshape(s0, (1,), order='C'), cp.reshape(h0, (1,), order='C')),
                     EV3 <= 6 + 9 * s + np.sqrt(s) * (300 * g_ + 198 * h0),
                     EV3 <= 6 + 9 * s + np.sqrt(s) * (135 * g_ + (11781.0 / 32) * h0)]
    if o['pos']:
        cons.append(mu2 >= 0)
    if o['cone']:
        cons.append(rot(at, mu2, mu2 + dl))             # A^2 <= v^2 m1 m2
    if o['c2']:
        t2 = cp.Variable(N, nonneg=True)
        cons += [rot(mu2 - pi_, pi_, t2), w @ t2 <= X2]
    if o['haz']:
        td = cp.Variable(N, nonneg=True)
        cons += [rot(dl - pi_, pi_, td), w @ td <= Sminus]
    if o['c1']:
        t1 = cp.Variable(N, nonneg=True)
        cons += [rot(mu2 + dl - 2 * pi_, pi_, t1), w @ t1 <= C1n]
    if o['scalar']:
        xm = o['xmerge']
        xe = e[::xm]
        if xe[-1] < e[-1]:
            xe = np.append(xe, e[-1])
        P, Mb = scalar_kernels(r, xe)
        Pw, Mw = P * w[None, :], Mb * w[None, :]
        sc = 1.0 / np.maximum(Pw.max(axis=1), 1e-300)
        PJ = (Pw * sc[:, None]) @ pi_
        DJ = ((Mw - 0.5 * Pw) * sc[:, None]) @ pi_
        tau = cp.Variable(len(sc), nonneg=True)
        cons += [rot(DJ, PJ, tau), 2 * (1.0 / sc) @ tau <= s / 12]
    prob = cp.Problem(cp.Maximize((w * r) @ pi_), cons)
    info.update(r=r, v=v, w=w, t=t, pi=pi_, at=at, mu2=mu2, dl=dl, opts=o)
    return prob, info


def solve(s, mode, dr=0.02, r_fine=6.0, r_max=60.0, growth=1.03, opts=None, verbose=False, ret=False):
    e = r_edges(dr, r_fine, r_max, growth)
    prob, info = build(s, mode, e, opts)
    t0 = time.time()
    try:
        prob.solve(solver=cp.CLARABEL, verbose=verbose)
        val, st = prob.value, prob.status
    except Exception as ex:  # noqa
        val, st = None, 'error: %s' % type(ex).__name__
    out = dict(s=s, mode=mode, N=len(info['r']), dr=dr, value=val, status=st, secs=round(time.time() - t0, 2))
    if 'par' in info and val is not None and info['par'][0].value is not None:
        out['par'] = [float(x.value) for x in info['par']]
    if opts:
        out['opts'] = opts
    if ret:
        return out, info
    return out


if __name__ == "__main__":
    s = float(sys.argv[1]) if len(sys.argv) > 1 else 5.0
    modes = sys.argv[2].split(',') if len(sys.argv) > 2 else ['M', 'R0', 'L', 'G', 'N']
    dr = float(sys.argv[3]) if len(sys.argv) > 3 else 0.05
    gr = float(sys.argv[4]) if len(sys.argv) > 4 else 1.05
    for m in modes:
        print(json.dumps(solve(s, m, dr=dr, growth=gr)), flush=True)
