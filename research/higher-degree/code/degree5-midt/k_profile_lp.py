"""N.  The K-profile of the cubic energy from the proved law class (NOTE.md section 6.4).

A_hat(K) = sup{ ||P21 k||^2 : |k| <= 1, ||k||_2^2 <= K }.  With q = P21 k, a = ||q||, R = |q|/a, U = R^2:
a^2 = Re<q, k> <= a E[R |k|], so for every lam > 0

    sqrt(A_hat(K)) <= sup_law E g_lam(sqrt U) + lam K/2,    g_lam(r) = r^2/(2 lam) (r <= lam),  r - lam/2 (r > lam),

the supremum over the laws of U >= 0 with  E U = 1,  E U^2 = 2 + s (0 <= s <= 42),
E U^3 <= 6 + 9 s + (4045313/100000) s^{3/2}  (Lean),  E sqrt U <= min(2287/2500, (sqrt(pi)/2)(1 + (26449/5000000) s))
(conjecture-K ledger 3.7).  The supremum over laws is a linear program on a grid of u (float; a grid
restricts the laws, so the LP value is a LOWER estimate of the supremum over the class: the table is N
and shows what a certified dual could give, not a bound).
Output: a table of K, the estimate of A_hat(K), and the mass-fact line (S + cK)/epsh of Lean for comparison.
"""
import numpy as np
from scipy.optimize import linprog

MU = np.sqrt(np.pi) / 2
u = np.unique(np.concatenate([np.linspace(0, 6, 601), np.linspace(6, 60, 541), np.linspace(60, 900, 421)]))
ru = np.sqrt(u)
SG = [0, 0.05, 0.1, 0.2, 0.35, 0.5, 0.75, 1, 1.5, 2, 3, 4, 6, 9, 14, 20, 30, 42]
LAMS = [0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.35, 1.5, 1.7, 2.0, 2.5]


def psi(lam):
    g = np.where(ru <= lam, u / (2 * lam), ru - lam / 2)
    best = -1
    for s in SG:
        r1 = min(2287 / 2500, MU * (1 + 26449 / 5000000 * s))
        res = linprog(-g, A_ub=np.array([u ** 3, ru]), b_ub=[6 + 9 * s + 40.45313 * s ** 1.5, r1],
                      A_eq=np.array([np.ones_like(u), u, u * u]), b_eq=[1, 1, 2 + s], bounds=(0, None), method="highs")
        if res.status == 0:
            best = max(best, -res.fun)
    return best


P = {lam: psi(lam) for lam in LAMS}
print("lam, sup_law E g_lam:", " ".join("%.2f:%.5f" % kv for kv in P.items()))
EPSH, C, S = 25 / 31, 2 * 47 / 1953 + 0.5, 3798855002922010337121170986221578569 / 22939068096000000000000000000000000000
print("K     A_hat estimate (LP)   at lam   Lean mass line   K itself")
for K in [0.3, 0.4, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0]:
    v, lam = min((P[lam] + lam * K / 2, lam) for lam in LAMS)
    print("%.2f  %.5f   %.2f   %.5f   %.2f" % (K, v * v, lam, (S + C * K) / EPSH, K))
