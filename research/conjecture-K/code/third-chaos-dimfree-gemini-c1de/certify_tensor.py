#!/usr/bin/env python3
"""Outward-rounded 4D Arb certifier for eigenvector-coupled tensor & kappa_4 bounds.

Agent-ID: gemini-c1de (Refs #501, #458).

For a symmetric tensor T in Sym^3(R^n) with ||T||_HS = 1, put
    a = max_{||v||=1} |T(v,v,v)|,   M_{ij} = sum_{k,l} T_{ikl} T_{jkl},
    lambda = ||M||_op,              kappa_4 = 36 tr(M^2) + 54 ||U_tilde||_HS^2.

At a top unit eigenvector e_1 of M (M e_1 = lambda e_1), choose e_2 perp e_1 along
the component of T(e_1, e_1, .) orthogonal to e_1 (with s = T_{112} >= 0 and
T_{11j} = 0 for j >= 3), and sign T (with e_2 -> -e_2) so x = T_{111} >= 0.
Put B = T(e_1, ., .)|_{e_1^perp}, C = T(e_2, ., .)|_{e_1^perp}, b = B_{22},
d = T_{222}, P = ||B||_HS^2 = p_+ + p_- in [0, 1/3], and
    T_perp_norm2 = ||T|_{e_1^perp}||_HS^2 = d^2 + Delta_perp = 1 - x^2 - 3 s^2 - 3 P >= 0.

This script certifies in 128-bit outward-rounded Arb arithmetic:
  1. Exact rational identity controls on explicit symmetric 3-tensors in R^4 for
     the slot identity 2 lambda - 1 = x^2 + s^2 - P - T_perp_norm2 <= a^2
     (hence lambda <= (1 + a^2) / 2 in every dimension) and the fourth-cumulant
     Frobenius defect inequality
         90 tr(M^2) - kappa_4 = 54 ||A - U_tilde||_HS^2
                             >= 72 ||s^2 e_2 e_2^T + B^2 - x B - s C||_HS^2.
  2. Full 4D branch-and-bound over (x, s, b, P) with analytical slicing on d and p_+,
     combining M_{12} = 0, M_{22} <= lambda, symmetrized directional caps on B,
     Weyl + Karamata bounds on tr(M^2), and the Frobenius defect above:
       - a <= 321/500 = 0.642  ==>  lambda < 167/250 = 0.668  and  kappa_4 < 233/5 = 46.6;
       - a <= 7/10    = 0.700  ==>  lambda < 173/250 = 0.692  and  kappa_4 < 49.
"""

from fractions import Fraction as Q
import itertools
from flint import arb, ctx, fmpq


def ball(x):
    if isinstance(x, arb):
        return x
    x = Q(x)
    return arb(fmpq(x.numerator, x.denominator))


def verify_tensor_identities():
    """Check slot identities and the 72 ||...||_HS^2 kappa_4 defect bound on R^4 tensors."""
    test_tensors = [
        {(0, 0, 0): Q(1)},
        {(0, 0, 0): Q(3, 5), (0, 1, 1): Q(-2, 5), (0, 2, 2): Q(1, 3), (1, 2, 3): Q(1, 2)},
        {
            (0, 0, 0): Q(2, 3), (0, 0, 1): Q(1, 4), (0, 1, 1): Q(-1, 5),
            (0, 2, 2): Q(3, 7), (0, 2, 3): Q(-1, 6), (0, 3, 3): Q(1, 8),
            (1, 1, 1): Q(-2, 9), (1, 2, 2): Q(1, 5), (1, 2, 3): Q(3, 10),
            (2, 2, 3): Q(-2, 7), (3, 3, 3): Q(1, 4),
        },
    ]
    n = 4
    for mono in test_tensors:
        T = [[[Q(0) for _ in range(n)] for _ in range(n)] for _ in range(n)]
        for (i, j, k), w in mono.items():
            perms = set(itertools.permutations((i, j, k)))
            sh = w / len(perms)
            for a, b, c in perms:
                T[a][b][c] += sh
        # Enforce T_{002} = T_{003} = 0 (aligned e_2 in e_1^perp; already 0 in mono above).
        assert T[0][0][2] == 0 and T[0][0][3] == 0
        norm2 = sum(T[i][j][k] ** 2 for i in range(n) for j in range(n) for k in range(n))
        M = [[sum(T[i][k][l] * T[j][k][l] for k in range(n) for l in range(n)) for j in range(n)] for i in range(n)]
        A = [[[[sum(T[i][j][r] * T[k][l][r] for r in range(n))
                for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]
        Ut = [[[[(A[i][j][k][l] + A[i][k][j][l] + A[i][l][j][k]) / 3
                 for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]

        x = T[0][0][0]
        s = T[0][0][1]
        B = [[T[0][p][q] for q in range(1, n)] for p in range(1, n)]
        C = [[T[1][p][q] for q in range(1, n)] for p in range(1, n)]
        P = sum(B[p][q] ** 2 for p in range(n - 1) for q in range(n - 1))
        tp_norm2 = sum(T[i][j][k] ** 2 for i in range(1, n) for j in range(1, n) for k in range(1, n))

        # Slot identity: norm2 = x^2 + 3 s^2 + 3 P + tp_norm2 and M_{00} = x^2 + 2 s^2 + P.
        assert norm2 == x * x + 3 * s * s + 3 * P + tp_norm2
        assert M[0][0] == x * x + 2 * s * s + P
        assert 2 * M[0][0] - norm2 == x * x + s * s - P - tp_norm2

        # Defect identity: 90 tr(M^2) - (36 tr(M^2) + 54 ||Ut||^2) = 54 ||A - Ut||^2 >= 72 ||D||^2.
        lhs_def = 54 * sum(
            (A[i][j][k][l] - Ut[i][j][k][l]) ** 2
            for i in range(n) for j in range(n) for k in range(n) for l in range(n)
        )
        B2 = [[sum(B[p][r] * B[r][q] for r in range(n - 1)) for q in range(n - 1)] for p in range(n - 1)]
        D_mat = [
            [
                (s * s if (p == 0 and q == 0) else Q(0)) + B2[p][q] - x * B[p][q] - s * C[p][q]
                for q in range(n - 1)
            ]
            for p in range(n - 1)
        ]
        rhs_def = 72 * sum(D_mat[p][q] ** 2 for p in range(n - 1) for q in range(n - 1))
        assert lhs_def >= rhs_def
    return len(test_tensors)


def build_test_grids():
    pyth_pairs = []
    for m in range(2, 14):
        for n in range(1, m):
            c_r = Q(m * m - n * n, m * m + n * n)
            s_r = Q(2 * m * n, m * m + n * n)
            pyth_pairs.extend([(c_r, s_r), (c_r, -s_r), (s_r, c_r), (s_r, -c_r)])
    pyth_pairs = sorted(set(pyth_pairs), key=lambda z: float(z[0]))
    pyth_arb = [(ball(c), ball(s)) for c, s in pyth_pairs]

    c_rats = [Q(k, 40) for k in range(1, 40)] + [Q(79, 80), Q(159, 160)]
    c_arb_data = [(ball(Q(1) / c), ball(c * c), ball(Q(1) / (3 * (1 - c * c)))) for c in c_rats]
    pq_arb = [(ball(Q(k, 16)), ball(Q(16 - k, 16))) for k in range(1, 16)]
    return pyth_arb, c_arb_data, pq_arb


def certify_tensor_4d(a0_str, lam_target_str, k4_target_str, grids):
    pyth_arb, c_arb_data, pq_arb = grids
    a0_q = Q(a0_str)
    a0 = ball(a0_q)
    a0_sq = a0 * a0
    lam_tar = ball(Q(lam_target_str))
    k4_tar = ball(Q(k4_target_str))

    todo = [(Q(0), a0_q, Q(0), a0_q, -a0_q, a0_q, Q(0), Q(1, 3), 0)]
    leaves = 0
    pruned = 0

    while todo:
        x0, x1, s0, s1, b0, b1, p0, p1, depth = todo.pop()
        X = ball(x0).union(ball(x1))
        S = ball(s0).union(ball(s1))
        B = ball(b0).union(ball(b1))
        P = ball(p0).union(ball(p1))
        X2, S2, B2 = X * X, S * S, B * B

        if (X2 + S2 > a0_sq) or (B2 > a0_sq) or (B2 > P):
            pruned += 1
            continue

        tp_raw = arb(1) - (X2 + arb(3) * S2 + arb(3) * P)
        if tp_raw < 0:
            pruned += 1
            continue
        tp_hi = arb(tp_raw.upper())
        TP = arb(0).union(tp_hi) if tp_raw.contains(0) else tp_raw

        x_lo_b, x_hi_b = ball(x0), ball(x1)
        mp_b = arb(min(((a0 * inv_c - x_lo_b * c2) * fac).upper() for inv_c, c2, fac in c_arb_data))
        mm_b = arb(min(((a0 * inv_c + x_hi_b * c2) * fac).upper() for inv_c, c2, fac in c_arb_data))
        if mp_b < 0 or mm_b < 0:
            pruned += 1
            continue

        if ball(b0) > mp_b or -ball(b1) > mm_b:
            pruned += 1
            continue
        pp_lo_b = (ball(b0) * ball(b0)) if b0 > 0 else arb(0)
        pm_lo_b = (ball(b1) * ball(b1)) if b1 < 0 else arb(0)
        if pp_lo_b + pm_lo_b > ball(p1):
            pruned += 1
            continue

        u2_cap_raw = X2 + S2 + P - arb(2) * B2
        if u2_cap_raw < 0:
            pruned += 1
            continue
        d2_cap1 = arb((a0_sq - B2).upper())
        d2_cap2 = tp_hi
        d2_cap3 = arb(u2_cap_raw.upper())
        d2_max_b = arb(min(d2_cap1.upper(), d2_cap2.upper(), d2_cap3.upper()))
        if d2_max_b < 0:
            pruned += 1
            continue
        d_lim = d2_max_b.sqrt() if d2_max_b > 0 else arb(0)
        d_lo, d_hi = -d_lim, d_lim

        wB_tot_raw = P - B2
        wB_tot_hi = arb(wB_tot_raw.upper()) if wB_tot_raw.upper() > 0 else arb(0)

        n_d_slices = 6
        d_step = (d_hi - d_lo) / arb(n_d_slices)
        surv_D = []
        for kd in range(n_d_slices):
            dl_k = arb((d_lo + arb(kd) * d_step).lower())
            dh_k = arb((d_lo + arb(kd + 1) * d_step).upper())
            Dk = dl_k.union(dh_k)
            if dl_k <= 0 and dh_k >= 0:
                Dk2 = arb(0).union(arb(max((dl_k * dl_k).upper(), (dh_k * dh_k).upper())))
            else:
                Dk2 = (dl_k * dl_k).union(dh_k * dh_k)
            if B2 + Dk2 > a0_sq or Dk2 > TP or Dk2 > u2_cap_raw:
                continue
            dPk_raw = TP - Dk2
            dPk_hi = arb(dPk_raw.upper()) if dPk_raw.upper() > 0 else arb(0)
            if ((S * (X + arb(2) * B) + B * Dk) ** 2) > (arb(2) / arb(3)) * wB_tot_hi * dPk_hi:
                continue
            ok_d = True
            for p_v, q_v in pq_arb:
                if (p_v * X + q_v * B) ** 2 + arb(4) * p_v * q_v * S2 + (p_v * S + q_v * Dk) ** 2 + arb(4) * p_v * q_v * B2 > a0_sq:
                    ok_d = False
                    break
            if not ok_d:
                continue
            for c_v, s_v in pyth_arb:
                if abs(X * (c_v ** 3) + arb(3) * S * (c_v ** 2) * s_v + arb(3) * B * c_v * (s_v ** 2) + Dk * (s_v ** 3)) > a0:
                    ok_d = False
                    break
            if ok_d:
                surv_D.append((Dk, Dk2))

        if not surv_D:
            pruned += 1
            continue

        lam_box = X2 + arb(2) * S2 + P
        lam_lo_b = arb(lam_box.lower())
        lam_hi_b = arb(lam_box.upper())
        if lam_hi_b >= lam_tar:
            assert depth < 52
            widths = [(float(x1 - x0), 0), (float(s1 - s0), 1), (float(b1 - b0) * 0.8, 2), (float(p1 - p0) * 1.5, 3)]
            _, idx_s = max(widths)
            cs = [(x0, x1), (s0, s1), (b0, b1), (p0, p1)]
            lc, hc = cs[idx_s]
            mc = (lc + hc) / 2
            l1 = list(cs)
            l1[idx_s] = (lc, mc)
            l2 = list(cs)
            l2[idx_s] = (mc, hc)
            todo.append((*sum(l1, ()), depth + 1))
            todo.append((*sum(l2, ()), depth + 1))
            continue

        pp_min_v = arb(pp_lo_b.lower())
        pp_max_v = arb((ball(p1) - pm_lo_b).upper())
        if pp_max_v < pp_min_v:
            pruned += 1
            continue

        n_p_slices = 4
        p_step = (pp_max_v - pp_min_v) / arb(n_p_slices)
        gap_xp = x_lo_b - mp_b
        xp_sq = (gap_xp * gap_xp) if gap_xp > 0 else arb(0)
        mp2_hi = arb((mp_b * mp_b).upper())
        mm2_hi = arb((mm_b * mm_b).upper())

        worst_k4 = arb(-100)
        for Dk, Dk2 in surv_D:
            u2_up1 = wB_tot_hi / arb(2)
            u2_up2 = arb((u2_cap_raw - Dk2).upper()) / arb(2)
            if u2_up2 < 0:
                continue
            u2_hi_b = u2_up1 if u2_up1 < u2_up2 else u2_up2
            U2 = arb(0).union(u2_hi_b)

            expr_22 = S2 + B2 + U2 - X * B - S * Dk
            def_22_b = arb(0) if expr_22.contains(0) else arb(abs(expr_22).lower())

            c2_hi = ((arb(1) / arb(3)) * Dk2 + (arb(2) / arb(3)) * TP).upper()
            norm_C_hi = arb(c2_hi).sqrt() if arb(c2_hi) > 0 else arb(0)

            for kp in range(n_p_slices):
                ppl = arb((pp_min_v + arb(kp) * p_step).lower())
                pph = arb((pp_min_v + arb(kp + 1) * p_step).upper())
                pml_raw = ball(p0) - pph
                pml = arb(pml_raw.lower()) if pml_raw > 0 else arb(0)
                pmh_raw = ball(p1) - ppl
                if pmh_raw < pm_lo_b:
                    continue
                pmh = arb(pmh_raw.upper())

                b2_op_hi = arb(max(min(pph.upper(), mp2_hi.upper()), min(pmh.upper(), mm2_hi.upper())))
                L2_cand = arb((S2 + arb(2) * b2_op_hi + TP).upper())
                L_max = arb(min(lam_hi_b.upper(), L2_cand.upper()))

                cand_lams = [lam_lo_b, lam_hi_b]
                if L_max >= ball(Q(1, 20)):
                    m_idx = 1
                    while True:
                        brk = arb(1) - arb(m_idx) * L_max
                        if brk < lam_lo_b:
                            break
                        if brk <= lam_hi_b:
                            cand_lams.append(brk)
                        m_idx += 1

                trM2_hi = arb(0)
                for lp in cand_lams:
                    r_pt = arb(1) - lp
                    if r_pt <= 0 or L_max <= 0:
                        val_tr = lp * lp
                    else:
                        r_u = arb(r_pt.upper())
                        if L_max < ball(Q(1, 20)):
                            val_tr = lp * lp + r_u * L_max
                        else:
                            q_f = 0
                            while arb(q_f + 1) * L_max <= r_u:
                                q_f += 1
                            rem = r_u - arb(q_f) * L_max
                            val_tr = lp * lp + arb(q_f) * (L_max * L_max) + rem * rem
                    if arb(val_tr.upper()) > trM2_hi:
                        trM2_hi = arb(val_tr.upper())

                lb_B = pml * (x_lo_b * x_lo_b) + ppl * xp_sq
                inner_Bs = lb_B + arb(2) * S2 * (B2 + U2 - X * B) + (S2 * S2)
                norm_Bs_lo = arb(inner_Bs.lower()).sqrt() if inner_Bs > 0 else arb(0)
                diff_frob = norm_Bs_lo - ball(s1) * norm_C_hi
                def_frob_b = arb(diff_frob.lower()) if diff_frob > 0 else arb(0)
                def_best = def_22_b if def_22_b >= def_frob_b else def_frob_b
                k4_cand = arb(90) * trM2_hi - arb(72) * (def_best * def_best)
                if arb(k4_cand.upper()) > worst_k4:
                    worst_k4 = arb(k4_cand.upper())

        if worst_k4 < k4_tar:
            leaves += 1
            continue

        assert depth < 52
        widths = [(float(x1 - x0), 0), (float(s1 - s0), 1), (float(b1 - b0) * 0.8, 2), (float(p1 - p0) * 1.5, 3)]
        _, idx_s = max(widths)
        cs = [(x0, x1), (s0, s1), (b0, b1), (p0, p1)]
        lc, hc = cs[idx_s]
        mc = (lc + hc) / 2
        l1 = list(cs)
        l1[idx_s] = (lc, mc)
        l2 = list(cs)
        l2[idx_s] = (mc, hc)
        todo.append((*sum(l1, ()), depth + 1))
        todo.append((*sum(l2, ()), depth + 1))

    print(
        f"PASS certify_tensor a <= {a0_str}: lam < {lam_target_str}, k4 < {k4_target_str} | "
        f"leaves={leaves}, pruned={pruned}"
    )


def main():
    if not __debug__:
        raise RuntimeError("Run without -O so assert checks remain active")
    ctx.prec = 128
    n_id = verify_tensor_identities()
    print(f"PASS certify_tensor exact slot & Frobenius-defect controls ({n_id} R^4 tensors)")
    grids = build_test_grids()
    certify_tensor_4d("0.642", "0.668", "46.6", grids)
    certify_tensor_4d("0.700", "0.692", "49.0", grids)


if __name__ == "__main__":
    main()
