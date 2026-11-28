"""Clean-room exact dual-number check of KDS Proposition 6.2 (PATH).

Verifies without floating-point arithmetic or finite differences (and safely
under `python3 -IB -O`) that along the interpolating path

    q_theta(y, w) = <cos(theta) y + sin(theta) w, F(y)> - cos(theta) div F(y)

on C^n x C^n, for random exact Gaussian-rational cubics q in H_{2,1}(C^n):
1. The full 2n-variable contraction a(q_theta) = sum_{j=1}^{2n} d_j q_theta dbar_j q_theta
   satisfies a(q_theta) = cos(theta) * atilde_theta identically;
2. The exact directional derivative (-sin(theta) d/dc + cos(theta) d/ds) E[|q_{c,s}|^{2m}]
   at Pythagorean triples (c, s) on c^2 + s^2 = 1 equals both
   -2 sin(theta) m(m - 1) Re E[V_theta^{m-2} conj(q_theta)^2 atilde_theta]
   and 2 tan(theta) E[(-m(m - 1) V_theta^{m-2}) Re(conj(q_theta)^2 a(q_theta))].

Run:
    python3 -IB -O research/conjecture-K/code/deficit-sign-2026-11-16/review_gemini_21d5_exact_path.py
"""

from fractions import Fraction as Fr
from pathlib import Path
import random
import sys

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from wick_exact import E, G, conj, d, db, lin, mul, random_f  # noqa: E402
from x01_exact_identities import fields, power  # noqa: E402


def must(cond: bool, msg: str) -> None:
    if not cond:
        raise RuntimeError(msg)


PYTHAGOREAN_POINTS = (
    (Fr(3, 5), Fr(4, 5)),
    (Fr(5, 13), Fr(12, 13)),
    (Fr(8, 17), Fr(15, 17)),
    (Fr(7, 25), Fr(24, 25)),
)


def main() -> None:
    rng = random.Random(20261128)
    for n, m in ((1, 2), (1, 3), (2, 2), (2, 3)):
        f = random_f(n, rng, den=3, size=3)
        total_vars = 2 * n
        q, _qb, _a, _c1, _c2 = fields(n, f)

        def lift(poly, dim=n):
            return {(al + (0,) * dim, be + (0,) * dim): val for (al, be), val in poly.items()}

        hol_field = [lift(db(q, k)) for k in range(n)]
        zero = (0,) * total_vars

        def var_bar(idx: int, total: int = total_vars, z: tuple[int, ...] = zero):
            return {(z, tuple(1 if i == idx else 0 for i in range(total))): G(1)}

        div_f = lin(*[(1, d(hol_field[k], k)) for k in range(n)])
        f_grad_f = [
            lin(*[(1, mul(hol_field[j], d(hol_field[k], j))) for j in range(n)])
            for k in range(n)
        ]
        f_grad_div = lin(*[(1, mul(hol_field[j], d(div_f, j))) for j in range(n)])

        for c0, s0 in PYTHAGOREAN_POINTS:
            must(c0 * c0 + s0 * s0 == 1, "not on unit circle")
            qt0 = lin(
                *[(c0, mul(var_bar(k), hol_field[k])) for k in range(n)],
                *[(s0, mul(var_bar(n + k), hol_field[k])) for k in range(n)],
                (-c0, div_f),
            )
            dqt = lin(
                *[(-s0, mul(var_bar(k), hol_field[k])) for k in range(n)],
                *[(c0, mul(var_bar(n + k), hol_field[k])) for k in range(n)],
                (s0, div_f),
            )
            vt0 = mul(qt0, conj(qt0))
            dvt = lin((1, mul(dqt, conj(qt0))), (1, mul(qt0, conj(dqt))))
            lhs_deriv = m * E(mul(power(vt0, m - 1, total_vars), dvt)).r

            a_full = lin(*[(1, mul(d(qt0, j), db(qt0, j))) for j in range(total_vars)])
            atilde = lin(
                *[(c0, mul(var_bar(k), f_grad_f[k])) for k in range(n)],
                *[(s0, mul(var_bar(n + k), f_grad_f[k])) for k in range(n)],
                (-c0, f_grad_div),
            )
            must(
                a_full == lin((c0, atilde)),
                f"a(q_theta) != cos(theta) * atilde_theta at (n={n}, m={m}, c={c0})",
            )

            qb2 = mul(conj(qt0), conj(qt0))
            vm2 = power(vt0, m - 2, total_vars)
            rhs_report = (-2 * s0 * m * (m - 1)) * E(mul(mul(qb2, atilde), vm2)).r
            rhs_ledger = (2 * (s0 / c0) * (-m * (m - 1))) * E(mul(mul(qb2, a_full), vm2)).r
            must(
                lhs_deriv == rhs_report == rhs_ledger,
                f"PATH mismatch at (n={n}, m={m}, c={c0}): {lhs_deriv} vs {rhs_report} vs {rhs_ledger}",
            )
        print(f"PASS exact dual-number (PATH) n={n}, phi=v^{m} across 4 Pythagorean angles (zero floats)")
    print("ALL EXACT DUAL-NUMBER PATH CHECKS PASSED")


if __name__ == "__main__":
    main()
