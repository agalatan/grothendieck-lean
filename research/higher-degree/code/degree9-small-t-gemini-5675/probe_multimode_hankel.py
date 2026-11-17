#!/usr/bin/env python3
"""
Numerical probe (N) for Task 1b & Task 3:
Evaluates multi-coordinate Hankel-transform responses on C^ell and C^ell x C_{W_3}
against the degree-9 game T_9 (HD 1.6), the two-chaos functional (c = c_9), and
the degree-7 game T_7 (HD 1.4).

Reproduces:
  1. Pure finite-dimensional parameter-free cubic sum on C^ell:
       f_ell(z) = ph(sum_{j=1}^ell H_{2,1}(z_j)),  g_ell = -f_ell  (t = 0)
     confirming 1/ell and 1/ell^2 asymptotics up to ell = 50,000 and
       V_9(f_{4000}, -f_{4000}) = 0.7121212796 > 0.71211 = N_9 + 10^{-5}.
  2. Pure C^ell two-mode profile with H_{3,2} leakage cancellation:
       f(z) = ph(sum_{j=1}^{1200} [H_{2,1}(z_j) + (3/250) H_{3,2}(z_j)]), g = -f
     giving V_9 = 0.71214717 (+5.41e-5 above W_3/|W_3|).
  3. Pure C^ell four-mode charge-1 profile (ell = 1500, 2000, 2500):
       f(z) = ph(sum_{j=1}^ell sum_{m=1}^4 alpha_m H_{m+1,m}(z_j)), g = -f
     giving V_9 = 0.71215411 at ell = 1500 (+6.11e-5 above W_3/|W_3|) and 0.71212842 at ell = 2000.
  4. Bath + 1600-spike two-mode profile:
       f(z, W_3) = ph(W_3 + (2/25) sum_{j=1}^{1600} [H_{2,1}(z_j) + (3/250) H_{3,2}(z_j)]), g = -f
     giving V_9 = 0.71215418 (+6.12e-5 above W_3/|W_3|, 1/V_9 = 1.404190).
  5. Degree-7 stability check across all families: V_7 <= V_7(W_3/|W_3|) = 0.7120388333.

Status label: N (floating-point Gauss-Legendre + SciPy Bessel quadrature).
For rigorous outward-interval certification (C) of V_9 > 0.71211, run:
  `python3 -I verify_t0_refutation_exact.py`
"""

import math
from collections import Counter
import numpy as np
from scipy.special import jv

LAM9 = np.array([1.0, -0.93600, 0.72057, -0.59202, 0.23468])
LAM7 = np.array([1.0, -0.906596, 0.541570, -0.242531])
C_D9 = 0.23468 / 0.93600
BASE_D9 = 0.93600 * math.pi / 4.0 - 0.23468 * math.pi / 32.0
BASE_TC = math.pi / 4.0 - C_D9 * math.pi / 32.0
BASE_D7 = 0.906596 * math.pi / 4.0


def gen_partitions_bideg(P: int, Q: int):
    if P == 0 and Q == 0:
        return [()]
    cand = [(p, q) for p in range(P + 1) for q in range(Q + 1) if (p, q) != (0, 0)]
    out = []

    def rec(idx, rp, rq, cur):
        if rp == 0 and rq == 0:
            out.append(tuple(cur))
            return
        for i in range(idx, len(cand)):
            p, q = cand[i]
            if p <= rp and q <= rq:
                cur.append((p, q))
                rec(i, rp - p, rq - q, cur)
                cur.pop()

    rec(0, P, Q, [])
    return out


def herm_c_rad(p: int, q: int, r: np.ndarray) -> np.ndarray:
    out = np.zeros_like(r, dtype=float)
    for m in range(min(p, q) + 1):
        out += ((-1) ** m) * math.factorial(m) * math.comb(p, m) * math.comb(q, m) * (r ** (p + q - 2 * m))
    return out / math.sqrt(math.factorial(p) * math.factorial(q))


def gl_grid(a: float, b: float, panels: int, order: int = 16):
    xs, ws = np.polynomial.legendre.leggauss(order)
    edges = np.linspace(a, b, panels + 1)
    X = [0.5 * (edges[i] + edges[i + 1]) + 0.5 * (edges[i + 1] - edges[i]) * xs for i in range(panels)]
    W = [0.5 * (edges[i + 1] - edges[i]) * ws for i in range(panels)]
    return np.concatenate(X), np.concatenate(W)


def multiset_count(ell: int, tup) -> float:
    s = len(tup)
    if s == 0:
        return 1.0
    if ell < s:
        return 0.0
    num = 1.0
    for i in range(s):
        num *= ell - i
    for v in Counter(tup).values():
        num /= math.factorial(v)
    return num


def main():
    print("=== Numerical Probe (N): Multi-Coordinate Hankel Evaluation at t = 0 ===")
    r_rad, w0 = gl_grid(0.0, 9.0, panels=36, order=12)
    wr = w0 * 2.0 * r_rad * np.exp(-r_rad * r_rad)

    pure_types = {k: gen_partitions_bideg(k + 1, k) for k in range(5)}
    pure_pq = set([(0, 0)])
    bath_types = {k: [] for k in range(5)}
    all_pq = set([(0, 0)])
    for k in range(5):
        for t in pure_types[k]:
            pure_pq.update(t)
            all_pq.update(t)
        for pW in range(6):
            for qW in range(6):
                rp, rq = (k + 1) - 2 * pW - qW, k - pW - 2 * qW
                if rp < 0 or rq < 0:
                    continue
                for tup in gen_partitions_bideg(rp, rq):
                    bath_types[k].append((pW, qW, tup))
                    all_pq.update(tup)

    Rpq = {pq: herm_c_rad(pq[0], pq[1], r_rad) for pq in all_pq}

    def eval_pure_cell(h_prof: np.ndarray, ell_list):
        u_grid, wu_grid = gl_grid(0.0, 22.0, panels=44, order=12)
        out = []
        for ell in ell_list:
            s_grid = u_grid / math.sqrt(ell)
            F = {
                pq: jv(abs(pq[0] - pq[1]), s_grid[:, None] * h_prof[None, :]) @ (wr * Rpq[pq])
                for pq in pure_pq
            }
            ek = np.zeros(5)
            for k in range(5):
                for tup in pure_types[k]:
                    sl = len(tup)
                    if ell < sl:
                        continue
                    sgn = (-1) ** ((sum(abs(p - q) for p, q in tup) - 1) // 2)
                    prod = F[(0, 0)] ** (ell - sl)
                    for pq in tup:
                        prod = prod * F[pq]
                    c_val = sgn * float(np.sum(wu_grid * (prod / u_grid)))
                    ek[k] += multiset_count(ell, tup) * (c_val ** 2)
            v9 = float(np.sum((-LAM9) * ek))
            v7 = float(np.sum((-LAM7) * ek[:4]))
            vtc = ek[1] - C_D9 * ek[4]
            out.append((ell, v9, vtc, v7))
        return out

    # 1. Parameter-free pure cubic sum on C^ell
    print("\n1. Pure parameter-free cubic sum f_ell(z) = ph(sum_{j=1}^ell H_{2,1}(z_j)), g = -f:")
    h_cubic = herm_c_rad(2, 1, r_rad)
    c1_exact = (248589 / 3200000) * math.pi
    c2_exact = -(4371711867 / 25600000) * math.pi
    for ell, v9, vtc, v7 in eval_pure_cell(h_cubic, [500, 2000, 4000, 10000, 50000]):
        asymp = BASE_D9 + c1_exact / ell + c2_exact / (ell * ell)
        print(
            f"  ell={ell:5d}: V_9={v9:.11f} (vs W/|W|: {v9-BASE_D9:+.5e}, asymp diff: {v9-asymp:+.2e}) "
            f"| 2-chaos diff={vtc-BASE_TC:+.3e} | D7 diff={v7-BASE_D7:+.3e}"
        )

    # 2. Pure C^ell two-mode profile H_{2,1} + (3/250) H_{3,2}
    print("\n2. Pure C^ell two-mode profile H_{2,1}(z_j) + (3/250) H_{3,2}(z_j), g = -f:")
    h_2mode = herm_c_rad(2, 1, r_rad) + (3.0 / 250.0) * herm_c_rad(3, 2, r_rad)
    for ell, v9, vtc, v7 in eval_pure_cell(h_2mode, [800, 1200, 1600]):
        print(
            f"  ell={ell:5d}: V_9={v9:.11f} (vs W/|W|: {v9-BASE_D9:+.5e}, 1/V_9={1/v9:.7f}) "
            f"| 2-chaos diff={vtc-BASE_TC:+.3e} | D7 diff={v7-BASE_D7:+.3e}"
        )

    # 3. Pure C^ell four-mode charge-1 profile (H_{2,1}, H_{3,2}, H_{4,3}, H_{5,4})
    # Weights [0, 1.0, 0.0135, -0.0042, 0.0009], evaluated across ell = 1500, 2000, 2500.
    print("\n3. Pure C^ell four-mode charge-1 profile (ell = 1500, 2000, 2500):")
    h_4mode = (
        herm_c_rad(2, 1, r_rad)
        + 0.0135 * herm_c_rad(3, 2, r_rad)
        - 0.0042 * herm_c_rad(4, 3, r_rad)
        + 0.0009 * herm_c_rad(5, 4, r_rad)
    )
    for ell, v9, vtc, v7 in eval_pure_cell(h_4mode, [1500, 2000, 2500]):
        print(
            f"  ell={ell:5d}: V_9={v9:.11f} (vs W/|W|: {v9-BASE_D9:+.5e}, 1/V_9={1/v9:.7f}) "
            f"| 2-chaos diff={vtc-BASE_TC:+.3e} | D7 diff={v7-BASE_D7:+.3e}"
        )

    # 4. Bath + ell-spike two-mode family f(z, W_3) = ph(W_3 + tau sum_{j=1}^ell [H_{2,1}(z_j) + (3/250) H_{3,2}(z_j)])
    print("\n4. Bath + ell-spike two-mode family f(z, W_3), g = -f:")
    kg, wkg = gl_grid(0.0, 13.5, panels=54, order=16)
    gk = np.exp(-0.25 * kg * kg)
    for tau, ell in [(0.05, 1600), (0.08, 1600)]:
        Fz = {
            pq: jv(abs(pq[0] - pq[1]), (tau * kg)[:, None] * h_2mode[None, :]) @ (wr * Rpq[pq])
            for pq in all_pq
        }
        ek = np.zeros(5)
        for k in range(5):
            for pW, qW, tup in bath_types[k]:
                sl = len(tup)
                sgn = (-1) ** ((pW + qW + sum(abs(p - q) for p, q in tup) - 1) // 2)
                W_fac = (((0.5 * kg) ** (pW + qW)) / math.sqrt(math.factorial(pW) * math.factorial(qW))) * gk
                prod = W_fac * (Fz[(0, 0)] ** (ell - sl))
                for pq in tup:
                    prod = prod * Fz[pq]
                c_val = sgn * float(np.sum(wkg * (prod / kg)))
                ek[k] += multiset_count(ell, tup) * (c_val ** 2)
        v9 = float(np.sum((-LAM9) * ek))
        v7 = float(np.sum((-LAM7) * ek[:4]))
        vtc = ek[1] - C_D9 * ek[4]
        print(
            f"  tau={tau:.2f}, ell={ell:4d}: V_9={v9:.11f} (vs W/|W|: {v9-BASE_D9:+.5e}, vs 0.71211: {v9-0.71211:+.5e}, 1/V_9={1/v9:.7f}) "
            f"| 2-chaos diff={vtc-BASE_TC:+.3e} | D7 diff={v7-BASE_D7:+.3e}"
        )


if __name__ == "__main__":
    main()
