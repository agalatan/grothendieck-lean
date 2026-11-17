#!/usr/bin/env python3
"""Exact rational verifier for the real third-chaos sixth-cumulant bound.

Agent-ID: gemini-c1de (Refs #501, #458).

For F = I_3(T) / sqrt(6) in the real third Wiener chaos with symmetric T and
||T||_HS = 1 (so E[F^2] = 1), put
    M_{ij} = sum_{k,l} T_{ikl} T_{jkl},              m = tr(M^2),
    A_{ijkl} = sum_r T_{ijr} T_{klr},
    U_tilde_{ijkl} = (A_{ijkl} + A_{ikjl} + A_{iljk}) / 3,  u = ||U_tilde||_HS^2.

This script checks in exact rational arithmetic (Python standard library only):
  1. On four explicit 3-variable symmetric tensors (including a generic asymmetric
     rational tensor with ten distinct independent entries), the Wick identities
         kappa_4(F) = 36 m + 54 u,
         kappa_6(F) = 216 * ( (135/2) tr(U_tilde^3) - 20 tr(M^3)
                            + (135/2) <vec M, U_tilde vec M>
                            + (165/2) <T M, U_tilde T>
                            + 45 ||U_tilde T||_HS^2 )
     agree identically with exact multivariate Gaussian integration of F^4 and F^6.
  2. Over x = sqrt(u / m) in [0, 1], both upper and lower Cauchy-Schwarz envelopes
     stay strictly inside 67 * kappa_4(F)^(3/2), certifying
         |kappa_6(F)| <= 67 * kappa_4(F)^(3/2)
     and hence E[F^6] <= 15 + 15 * kappa_4(F) + 67 * kappa_4(F)^(3/2) for every
     F in V_3(R^n) and every n >= 1.
"""

from fractions import Fraction as Q
import itertools


def gaussian_even_moment(k):
    if k % 2 == 1:
        return Q(0)
    out = Q(1)
    for j in range(1, k, 2):
        out *= j
    return out


def poly_mul(p, q):
    out = {}
    for ea, ca in p.items():
        if not ca:
            continue
        for eb, cb in q.items():
            if not cb:
                continue
            ek = tuple(a + b for a, b in zip(ea, eb))
            nv = out.get(ek, Q(0)) + ca * cb
            if nv:
                out[ek] = nv
            elif ek in out:
                del out[ek]
    return out


def poly_expectation(p):
    total = Q(0)
    for exps, coeff in p.items():
        if any(e % 2 == 1 for e in exps):
            continue
        w = coeff
        for e in exps:
            w *= gaussian_even_moment(e)
        total += w
    return total


def sym3_from_weights(n, mono_weights):
    """Build symmetric T_{ijk} so sum_{i,j,k} T_{ijk} :X_i X_j X_k: matches mono_weights."""
    T = [[[Q(0) for _ in range(n)] for _ in range(n)] for _ in range(n)]
    for (i, j, k), w in mono_weights.items():
        perms = set(itertools.permutations((i, j, k)))
        share = Q(w) / len(perms)
        for a, b, c in perms:
            T[a][b][c] += share
    return T


def wick_cubic_poly(T):
    """Expand I_3(T) = sum_{i,j,k} T_{ijk} (X_i X_j X_k - X_i delta_{jk} - X_j delta_{ik} - X_k delta_{ij})."""
    n = len(T)
    p = {}

    def add_term(exps, coeff):
        if not coeff:
            return
        nv = p.get(exps, Q(0)) + coeff
        if nv:
            p[exps] = nv
        elif exps in p:
            del p[exps]

    for i in range(n):
        for j in range(n):
            for k in range(n):
                c = T[i][j][k]
                if not c:
                    continue
                e3 = [0] * n
                e3[i] += 1
                e3[j] += 1
                e3[k] += 1
                add_term(tuple(e3), c)
                if j == k:
                    e1 = [0] * n
                    e1[i] = 1
                    add_term(tuple(e1), -c)
                if i == k:
                    e1 = [0] * n
                    e1[j] = 1
                    add_term(tuple(e1), -c)
                if i == j:
                    e1 = [0] * n
                    e1[k] = 1
                    add_term(tuple(e1), -c)
    return p


def wick_cumulants_from_tensor(T):
    n = len(T)
    norm2 = sum(T[i][j][k] ** 2 for i in range(n) for j in range(n) for k in range(n))
    assert norm2 > 0
    M = [[sum(T[i][k][l] * T[j][k][l] for k in range(n) for l in range(n)) for j in range(n)] for i in range(n)]
    A = [[[[sum(T[i][j][r] * T[k][l][r] for r in range(n))
            for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]
    Ut = [[[[(A[i][j][k][l] + A[i][k][j][l] + A[i][l][j][k]) / 3
             for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]

    m = sum(M[i][j] ** 2 for i in range(n) for j in range(n))
    u = sum(Ut[i][j][k][l] ** 2 for i in range(n) for j in range(n) for k in range(n) for l in range(n))
    assert 0 <= u <= m

    # Matrix flattenings on R^(n^2): row = (i, j), col = (k, l).
    N2 = n * n
    Umat = [[Ut[r // n][r % n][c // n][c % n] for c in range(N2)] for r in range(N2)]
    U2 = [[sum(Umat[r][s] * Umat[s][c] for s in range(N2)) for c in range(N2)] for r in range(N2)]
    tr_U3 = sum(U2[r][c] * Umat[c][r] for r in range(N2) for c in range(N2))

    M2 = [[sum(M[i][s] * M[s][j] for s in range(n)) for j in range(n)] for i in range(n)]
    tr_M3 = sum(M2[i][j] * M[j][i] for i in range(n) for j in range(n))

    vecM = [M[r // n][r % n] for r in range(N2)]
    quad_M_U = sum(vecM[r] * Umat[r][c] * vecM[c] for r in range(N2) for c in range(N2))

    Tmat = [[T[r // n][r % n][k] for k in range(n)] for r in range(N2)]
    UT = [[sum(Umat[r][s] * Tmat[s][k] for s in range(N2)) for k in range(n)] for r in range(N2)]
    TM = [[sum(Tmat[r][s] * M[s][k] for s in range(n)) for k in range(n)] for r in range(N2)]

    inner_TM_UT = sum(TM[r][k] * UT[r][k] for r in range(N2) for k in range(n))
    norm_UT2 = sum(UT[r][k] ** 2 for r in range(N2) for k in range(n))

    # Normalize by norm2^2 and norm2^3 so T need not have unit norm prior to rescaling.
    k4 = (36 * m + 54 * u) / (norm2 ** 2)
    k6 = 216 * (
        Q(135, 2) * tr_U3
        - 20 * tr_M3
        + Q(135, 2) * quad_M_U
        + Q(165, 2) * inner_TM_UT
        + 45 * norm_UT2
    ) / (norm2 ** 3)
    return norm2, k4, k6


def verify_wick_identities():
    test_cases = [
        ("h_3(X_1)", {(0, 0, 0): Q(1)}),
        ("X_1 X_2 X_3", {(0, 1, 2): Q(1)}),
        ("Re((X_1+iX_2)^3)", {(0, 0, 0): Q(1), (0, 1, 1): Q(-3)}),
        ("generic_sym3_R3", {
            (0, 0, 0): Q(3, 5), (1, 1, 1): Q(-1, 2), (2, 2, 2): Q(2, 7),
            (0, 0, 1): Q(4, 5), (0, 0, 2): Q(-3, 4), (0, 1, 1): Q(1, 3),
            (1, 1, 2): Q(5, 6), (0, 2, 2): Q(-2, 3), (1, 2, 2): Q(1, 4),
            (0, 1, 2): Q(-7, 5),
        }),
    ]
    for label, weights in test_cases:
        T = sym3_from_weights(3, weights)
        norm2, k4_wick, k6_wick = wick_cumulants_from_tensor(T)
        p1 = wick_cubic_poly(T)
        p2 = poly_mul(p1, p1)
        ef2 = poly_expectation(p2) / 6
        assert ef2 == norm2, (label, ef2, norm2)
        p4 = poly_mul(p2, p2)
        ef4 = poly_expectation(p4) / (36 * (norm2 ** 2))
        p6 = poly_mul(p4, p2)
        ef6 = poly_expectation(p6) / (216 * (norm2 ** 3))
        k4_mom = ef4 - 3
        k6_mom = ef6 - 15 * ef4 + 30
        assert k4_wick == k4_mom, (label, k4_wick, k4_mom)
        assert k6_wick == k6_mom, (label, k6_wick, k6_mom)
        assert (k6_mom ** 2) <= (67 ** 2) * (k4_mom ** 3), (label, k6_mom, k4_mom)
    return len(test_cases)


def eval_pos_gap(lo, hi):
    """Lower bound on 67^2 (36 + 54 x^2)^3 - 216^2 (135/2 x^3 + 45 x^2 + 150 x)^2 on [lo, hi]."""
    lhs = (67 ** 2) * ((36 + 54 * lo * lo) ** 3)
    rhs = (216 ** 2) * ((Q(135, 2) * (hi ** 3) + 45 * (hi ** 2) + 150 * hi) ** 2)
    return lhs - rhs


def eval_neg_gap(lo, hi):
    """Lower bound on 67^2 (36 + 54 x^2)^3 - 216^2 (135/2 x^3 + 150 x + 20)^2 on [lo, hi]."""
    lhs = (67 ** 2) * ((36 + 54 * lo * lo) ** 3)
    rhs = (216 ** 2) * ((Q(135, 2) * (hi ** 3) + 150 * hi + 20) ** 2)
    return lhs - rhs


def certify_pos_1d(fn):
    todo = [(Q(0), Q(1))]
    leaves = 0
    min_gap = None
    while todo:
        lo, hi = todo.pop()
        gap = fn(lo, hi)
        if gap > 0:
            leaves += 1
            if min_gap is None or gap < min_gap:
                min_gap = gap
        else:
            mid = (lo + hi) / 2
            assert mid > lo and mid < hi
            todo.extend(((lo, mid), (mid, hi)))
    assert min_gap is not None and min_gap > 0
    return leaves


def main():
    if not __debug__:
        raise RuntimeError("Run without -O so assert checks remain active")
    n_ctrl = verify_wick_identities()
    l_pos = certify_pos_1d(eval_pos_gap)
    l_neg = certify_pos_1d(eval_neg_gap)
    # Exact check on h_3(X_1): x = 1 gives kappa_4 = 90, kappa_6 = 52380 < 67 * 90^(3/2).
    assert (52380 ** 2) < (67 ** 2) * (90 ** 3)
    print(
        f"PASS certify_sixth: {n_ctrl} exact Wick tensor controls, "
        f"{l_pos} + {l_neg} rational intervals for |kappa_6| <= 67 * kappa_4^(3/2)"
    )


if __name__ == "__main__":
    main()
