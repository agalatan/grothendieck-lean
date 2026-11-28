"""P7 C3 coefficients for a physical sector vector. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q


def coefficients(row, beta, verifier, side):
    """The five pre-Young coefficients in the public C3 formula."""
    p = 1 - beta * beta
    lam = Q(row["lam"][2])
    l3 = sum(map(Q, row["l3"]))
    a = Q(row["mu_a"])
    rho = Q(row["mu_rho"])
    cd = lam + a + rho + Q(row["vr"][0]) + Q(row["mu_F4"]) / 8
    dd = max(Q(0), lam + 2 * Q(row["m_del"]))
    young = tuple(map(Q, row["sec_dual"][side]["a_hol"]))
    th = Q(row["sec_dual"][side]["theta_12"])
    vec = tuple(
        cd * p * e + dd * p * d + Q(row["mu_w1"]) * p * j + 15 * l3 * p * p * z
        for e, d, j, z in zip(
            (4, 0, 0, 4, 4),
            (4 * (1 + th), 8 * (1 + 1 / th), 8, 0, 16),
            (1, 2, 1, 0, 2),
            (12, 10, 4, 4, 22),
        )
    )
    lo, hi = Q(row["s_lo"]), Q(row["s_hi"])
    mid = (lo + hi) / 2
    chi = lo if side == "lo" else hi
    H = 30 * l3 * p * beta**3 * (8 + mid + 3 * chi) / (4 * verifier.root4_lo(2 + mid))
    b = sum((H * k) ** 2 / (4 * y) for k, y in zip(verifier.KAPPA_HI, young))
    return vec, H, b + beta**2 * sum(max(Q(0), x + y) for x, y in zip(vec, young))
