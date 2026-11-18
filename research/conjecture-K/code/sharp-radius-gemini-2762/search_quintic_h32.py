#!/usr/bin/env python3
"""Deterministic numerical survey of the radius sup E|q|/||q||_2 on complex quintic chaos H_{3,2}(C^d).

Usage:  python3 search_quintic_h32.py

Label N (numerical diagnostics / gradient search).  Computes:
  1. Exact 1D quadrature and Hankel-Bessel integrals for N-copy i.i.d. Laguerre quintic sums
     Q_N(z) = N^{-1/2} sum_{j=1}^N q_1(z_j)  (q_1(z) = z(|z|^4 - 6|z|^2 + 6)/sqrt(12))
     for N in {1, 2, 3, 5, 10, 20, 50, 100}, confirming strict monotone approach from below
     toward the circular-Gaussian limit sqrt(pi)/2 = 0.8862269255.
  2. Multi-start L-BFGS-B optimization with analytic gradients over general symmetric tensors
     T in Sym^3(C^d) otimes Sym^2(Cbar^d) for d = 1, 2, 3, 4, 5, 6, evaluated on an independent
     out-of-sample validation batch of 400,000 complex Gaussian draws (reporting mean and SE).
"""
import itertools
import math
import numpy as np
from scipy.integrate import quad
from scipy.optimize import minimize
from scipy.special import j0

SQRT_PI_2 = 0.5 * math.sqrt(math.pi)


def exact_q1_quadrature():
    """Direct 1D radial quadrature of E|q_1| splitting at roots 3 - sqrt(3) and 3 + sqrt(3)."""
    r1 = 3.0 - math.sqrt(3.0)
    r2 = 3.0 + math.sqrt(3.0)
    f = lambda r: math.sqrt(r) * abs(r * r - 6.0 * r + 6.0) / math.sqrt(12.0) * math.exp(-r)
    v1, _ = quad(f, 0.0, r1, epsabs=1e-13, epsrel=1e-13)
    v2, _ = quad(f, r1, r2, epsabs=1e-13, epsrel=1e-13)
    v3, _ = quad(f, r2, np.inf, epsabs=1e-13, epsrel=1e-13)
    return v1 + v2 + v3


_LG_X, _LG_W = np.polynomial.legendre.leggauss(120)


def _gl_quad(vec_fn, a, b):
    mid = 0.5 * (a + b)
    half = 0.5 * (b - a)
    return float(half * np.sum(_LG_W * vec_fn(mid + half * _LG_X)))


def psi_1(t):
    """Characteristic function E[J_0(t |q_1(z)|)] for z ~ CN(0, 1), substituting r = u^2 and
    integrating smoothly with 120-node Gauss-Legendre on [0, u_1], [u_1, u_2], [u_2, 2.5], [2.5, 3.6], [3.6, 5.5]."""
    if t == 0.0:
        return 1.0
    u1 = math.sqrt(3.0 - math.sqrt(3.0))
    u2 = math.sqrt(3.0 + math.sqrt(3.0))
    c12 = math.sqrt(12.0)
    f1 = lambda u: 2.0 * u * np.exp(-u * u) * j0(t * u * (u**4 - 6.0 * u * u + 6.0) / c12)
    f2 = lambda u: 2.0 * u * np.exp(-u * u) * j0(t * u * (6.0 * u * u - u**4 - 6.0) / c12)
    return (_gl_quad(f1, 0.0, u1) + _gl_quad(f2, u1, u2)
            + _gl_quad(f1, u2, 2.5) + _gl_quad(f1, 2.5, 3.6) + _gl_quad(f1, 3.6, 5.5))


def diffuse_sum_profile():
    print('=== 1a. Diffuse N-copy Laguerre quintic sums Q_N in H_{3,2}(C^N) (chi = 1840/N) ===')
    q1_dir = exact_q1_quadrature()
    # For isotropic complex Z with E|Z|^2 = 1, int_0^oo (1 - J_0(u))/u^2 du = 1 gives
    #   E|Z| - sqrt(pi)/2 = int_0^oo (exp(-t^2/4) - E[J_0(t|Z|)]) / t^2 dt.
    ts_1, ws_1 = np.polynomial.legendre.leggauss(80)
    t_a, w_a = 2.0 * (ts_1 + 1.0), 2.0 * ws_1
    t_b, w_b = 10.0 * (ts_1 + 1.0) + 4.0, 10.0 * ws_1
    t_c, w_c = 28.0 * (ts_1 + 1.0) + 24.0, 28.0 * ws_1
    t_grid = np.concatenate([t_a, t_b, t_c])
    w_grid = np.concatenate([w_a, w_b, w_c])
    p1_grid = np.array([psi_1(float(t)) for t in t_grid])

    vals = {}
    for N in (1, 2, 3, 5, 10, 20, 50, 100):
        t_scaled = t_grid / math.sqrt(N)
        if N == 1:
            psi_N = p1_grid
        else:
            p_sub = np.array([psi_1(float(ts)) for ts in t_scaled])
            psi_N = p_sub ** N
        diff_int = float(np.sum(w_grid * (np.exp(-0.25 * (t_grid ** 2)) - psi_N) / (t_grid ** 2)))
        est = SQRT_PI_2 + diff_int
        vals[N] = est
        extra = ('  [direct 1D quadrature = %.10f, diff = %.2e]' % (q1_dir, abs(est - q1_dir))) if N == 1 else ''
        print('  N = %3d:  E|Q_N| = %.8f  (deficit below sqrt(pi)/2 = %.8f)%s' % (
            N, est, SQRT_PI_2 - est, extra), flush=True)

    print('\n=== 1b. Diffuse K-copy multilinear sums M_K in H_{3,2}(C^{5K}) (chi = 30/K, 500k MC draws) ===')
    mc_rng = np.random.default_rng(314159265)
    n_draws = 500000
    for K in (1, 2, 5, 10, 20, 50, 100):
        acc = np.zeros(n_draws, dtype=np.complex128)
        for _ in range(K):
            z5 = (mc_rng.standard_normal((n_draws, 5)) + 1j * mc_rng.standard_normal((n_draws, 5))) / math.sqrt(2.0)
            acc += z5[:, 0] * z5[:, 1] * z5[:, 2] * np.conj(z5[:, 3]) * np.conj(z5[:, 4])
        mk_abs = np.abs(acc) / math.sqrt(K)
        mean_mk = float(np.mean(mk_abs))
        se_mk = float(np.std(mk_abs, ddof=1)) / math.sqrt(n_draws)
        asymp = SQRT_PI_2 * (1.0 - (30.0 / K) / 32.0)
        print('  K = %3d (d=%3d, chi=%5.2f):  E|M_K| = %.6f +/- %.6f  (1st-order Edgeworth = %.6f)' % (
            K, 5 * K, 30.0 / K, mean_mk, se_mk, asymp), flush=True)
    return vals


def build_wick_basis_32(z, d):
    """Evaluate orthonormal basis of H_{3,2}(C^d) on complex sample matrix z of shape (M, d).
    Returns complex matrix B of shape (M, D) with E[B^* B / M] -> I_D."""
    zb = np.conj(z)
    h_tuples = list(itertools.combinations_with_replacement(range(d), 3))
    a_tuples = list(itertools.combinations_with_replacement(range(d), 2))
    cols = []
    for hol in h_tuples:
        i, j, k = hol
        h_perms = len(set(itertools.permutations(hol)))
        for anti in a_tuples:
            a, b = anti
            a_perms = len(set(itertools.permutations(anti)))
            # Exact Wick polynomial : z_i z_j z_k zbar_a zbar_b :
            w = z[:, i] * z[:, j] * z[:, k] * zb[:, a] * zb[:, b]
            for hi in range(3):
                for ai in range(2):
                    if hol[hi] == anti[ai]:
                        rh = [hol[x] for x in range(3) if x != hi]
                        ra = [anti[y] for y in range(2) if y != ai]
                        w = w - z[:, rh[0]] * z[:, rh[1]] * zb[:, ra[0]]
            for h0 in range(3):
                for h1 in range(3):
                    if h0 != h1 and hol[h0] == anti[0] and hol[h1] == anti[1]:
                        rh = [hol[x] for x in range(3) if x != h0 and x != h1][0]
                        w = w + z[:, rh]
            # Exact L^2 norm squared of :z^alpha zbar^beta: is prod_m (alpha_m! * beta_m!)??
            # Wait: for q = sum T_{ijk;ab} :z_i z_j z_k zbar_a zbar_b:, E|q|^2 = 12 sum |T_{ijk;ab}|^2!
            # Summing over the h_perms * a_perms equal entries gives coefficient (h_perms * a_perms) * T_rep,
            # with norm squared 12 * (h_perms * a_perms) * |T_rep|^2.
            # Hence w * sqrt((h_perms * a_perms) / 12)? Wait: w is ONE monomial, appearing (h_perms * a_perms) times,
            # so sum_{perms} w = (h_perms * a_perms) * w has norm^2 = 12 * (h_perms * a_perms),
            # so w / sqrt(12 / (h_perms * a_perms)) has unit L^2 norm!
            norm_w = math.sqrt(12.0 / (h_perms * a_perms))
            cols.append(w / norm_w)
    return np.column_stack(cols)


def search_general_tensors():
    print('\n=== 2. Multi-start L-BFGS-B search on general H_{3,2}(C^d) (d = 1..6) ===')
    rng = opt_rng = np.random.default_rng(20261117)
    val_rng = np.random.default_rng(987654321)
    M_opt = 30000
    M_val = 400000

    for d in range(1, 7):
        z_opt = (opt_rng.standard_normal((M_opt, d)) + 1j * opt_rng.standard_normal((M_opt, d))) / math.sqrt(2.0)
        B_opt = build_wick_basis_32(z_opt, d)
        D = B_opt.shape[1]

        def obj_and_grad(x):
            c = x[:D] + 1j * x[D:]
            nrm = float(np.linalg.norm(c))
            if nrm < 1e-15:
                return 0.0, np.zeros_like(x)
            u_c = c / nrm
            q = B_opt @ u_c
            abs_q = np.sqrt(np.abs(q) ** 2 + 1e-14)
            f_val = float(np.mean(abs_q))
            # Gradient of mean(|B u_c|) w.r.t. c:
            w_ph = q / abs_q
            g_u = (B_opt.conj().T @ w_ph) / M_opt
            # Project onto tangent space of unit sphere ||c|| = 1:
            proj = float(np.real(np.vdot(u_c, g_u)))
            g_c = (g_u - proj * u_c) / nrm
            grad_x = -np.concatenate([g_c.real, g_c.imag])
            return -f_val, grad_x

        n_starts = 1 if d == 1 else (12 if d <= 4 else (8 if d == 5 else 6))
        best_opt = -1.0
        best_u = None
        for s_idx in range(n_starts):
            if s_idx == 0:
                # Start 0: equal-weight diagonal Laguerre sum + small perturbation
                x0 = opt_rng.standard_normal(2 * D) * 0.05
                x0[0] += 1.0
            else:
                x0 = opt_rng.standard_normal(2 * D)
            res = minimize(obj_and_grad, x0, jac=True, method='L-BFGS-B', options={'maxiter': 150, 'ftol': 1e-11})
            if -res.fun > best_opt:
                best_opt = -res.fun
                c_best = res.x[:D] + 1j * res.x[D:]
                best_u = c_best / np.linalg.norm(c_best)

        # Evaluate best_u on independent 400,000-draw validation sample (in 4 chunks of 100k to keep RAM tiny!)
        val_abs = []
        val_sq = []
        for _ in range(4):
            zv = (val_rng.standard_normal((M_val // 4, d)) + 1j * val_rng.standard_normal((M_val // 4, d))) / math.sqrt(2.0)
            Bv = build_wick_basis_32(zv, d)
            qv = Bv @ best_u
            val_abs.append(np.abs(qv))
            val_sq.append(np.abs(qv) ** 2)
        all_abs = np.concatenate(val_abs)
        all_sq = np.concatenate(val_sq)
        # Note ||best_u||_2 == 1 IS the EXACT population L^2 norm ||q||_2 == 1 because B is exact orthonormal Wick basis!
        emp_l2 = math.sqrt(float(np.mean(all_sq)))
        mean_abs = float(np.mean(all_abs))
        se_abs = float(np.std(all_abs, ddof=1)) / math.sqrt(M_val)
        chi_est = float(np.mean(all_sq ** 2)) - 2.0
        print('  d = %d (dim H_{3,2} = %3d, %2d starts):  max E|q|/||q||_2 = %.6f +/- %.6f  (emp ||q||_2=%.5f, chi~%.2f, < sqrt(pi)/2=%.6f: %s)' % (
            d, D, n_starts, mean_abs, se_abs, emp_l2, chi_est, SQRT_PI_2, mean_abs < SQRT_PI_2), flush=True)


if __name__ == '__main__':
    diffuse_sum_profile()
    search_general_tensors()
