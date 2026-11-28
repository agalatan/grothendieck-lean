"""All-sector physical and H8 estimates on capped piece 11. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
import json
from pathlib import Path
import runpy
import tempfile


def need(ok, message):
    if not ok:
        raise ArithmeticError(message)


def check():
    folder = Path(__file__).resolve().parent
    code = folder.parent
    root = code.parents[2]
    reference = code / "quintic-tangent-codex-a7c4"
    tangent = runpy.run_path(str(reference / "verify.py"))
    schur = runpy.run_path(str(reference / "verify_schur.py"))
    bench = runpy.run_path(str(folder / "capped_piece11.py"))
    integrator = runpy.run_path(str(folder / "verify.py"))
    row = bench["capped_parameters"](root)
    ell, beta, ba, bb, eps, eta, nu0 = (
        Q(row[k]) for k in ("l", "beta", "bA", "bB", "e1", "eta", "nu5")
    )
    mu_lo, mu_hi = tangent["mu_bounds"]()
    root_lo, root_hi = integrator["sqrt_lo"], integrator["sqrt_hi"]
    need((eps, eta) == (schur["EPS"], schur["ETA"]), "Schur prices")
    weight = Q(15, 4)
    loss = 1 - weight / (2 * weight - 1)
    need(ell > 2 * beta and beta > 3 * eta * mu_hi / 8, "positive radial denominator")
    need(weight * 2 * mu_hi < (ell - 2 * beta) / eta, "absorb all complex quintics")

    grid = schur["exp_grid"]()
    low, high = schur["radial_moments"](ell, beta, *grid)
    isotropic = schur["residuals"](ell, beta, ba, bb, *grid)
    # 1+d=(1+J1)/(1+J0) for the isotropic least-squares correction d*r11.
    y_lo = (1 + low[1]) / (1 + high[0])
    y_hi = (1 + high[1]) / (1 + low[0])
    radial11 = low[2] - 2 * y_hi * high[1] + y_lo**2 * low[0]
    need(0 < y_lo <= y_hi and radial11 > Q("1.12"), "degree-one real-square lower")
    q, shell11, shell21, shell10, shell20 = (hi for _, hi in isotropic)
    need(isotropic[1][0] > 0, "isotropic degree-one shell must fail the sign test")
    need(
        max(
            shell11 - loss * radial11 / 4,
            shell20 + loss * high[2] / 4,
            shell21,
            shell10,
        )
        < 0,
        "absorb all nonremote cubic sectors",
    )
    intercept = 1 + ba
    slope = -ba - bb / root_hi(Q(2))
    need(ba < 0 and bb < 0 and min(intercept, slope) > 0, "remote real-axis slope")
    real_square = (
        intercept**2 * low[0] + 2 * intercept * slope * low[1] + slope**2 * low[2]
    )
    q_cap = Q(9, 10)
    need(q - loss * real_square / 2 < q_cap, "all-sector remote coefficient")
    need(isotropic[0][0] > Q("1.48"), "isotropic remote coefficient control")

    tables = root / bench["TABLES"]
    data = json.loads((tables / "fin_table.json").read_text())
    chosen = data["chosen"][10]
    (spec,) = (r for r in data["cases"] if all(r[k] == v for k, v in chosen.items()))
    lower, upper = map(Q, chosen["piece"])
    need(Q(".8248") < lower < Q(".825") < upper < Q(".835"), "piece 11 endpoints")
    base = max(tangent["payoff"](t, ell, beta, mu_hi) for t in (lower, upper))
    for target, energy in [
        ("1.4023", ".0034"),
        ("1.4025", ".0033"),
        ("1.4027", ".0032"),
    ]:
        need(base + q_cap * Q(energy) < 1 / Q(target), "physical endpoint " + target)
    need(
        base + q_cap * Q(".0035") > 1 / Q("1.4023"),
        "energy extension fails this envelope",
    )
    print(
        "Physical V < 1/K on piece 11 for (K,u_max) = (1.4023,.0034), (1.4025,.0033), (1.4027,.0032)."
    )

    nu_star_hi = eta * mu_hi * root_hi(Q(3)) / 8
    need(
        eta * mu_lo * root_lo(Q(3)) / 8 > nu0,
        "positive gain from moving the comparator",
    )
    gain = (nu_star_hi - nu0) ** 2 / eta
    kq = 1 / eps - (ba**2 + bb**2) / eta
    p0 = ell - 2 * beta + root_lo(Q(3)) * nu0
    quadratic = 2 * mu_hi * (1 + ba + 3 * ba**2 / 4 + 3 * bb**2 / 8) / p0
    need(
        beta >= root_hi(Q(3)) * nu0 and p0 > 0 and quadratic < Q("3.041"),
        "fixed comparator",
    )
    with tempfile.TemporaryDirectory() as tmp:
        exe = integrator["compile_integrator"](Path(tmp), folder / "cert.cpp")
        _, gap, _ = bench["gap_lower"](exe, row, integrator)
    # X >= gap - (quadratic - kq)*u. Larger shares lower the residual.
    need(0 < quadratic - kq and gap > (quadratic - kq) * Q(".00001"), "positive X")
    shares = {
        Q(k): 1 - Q(v) - Q(1, 50)
        for k, v in (item.split(":") for item in spec["kappa"].split(","))
    }
    need(
        shares[10] == Q(".0293") and min(shares.values()) == Q(".0149"),
        "published shares",
    )
    for share, max_u, funding, target in [
        (min(shares.values()), Q(".00001"), Q(".00025"), Q("1.4023")),
        (shares[10], Q(".000005"), Q(".0002"), Q("1.4025")),
    ]:
        need(
            gain + (q_cap + kq) * max_u - share * (gap - (quadratic - kq) * max_u)
            < funding,
            "finite-energy H8 funding",
        )
        law_cap = max(t * t - 2 * ell * t + Q(spec["C"]) for t in (lower, upper))
        need(1 / target - law_cap > funding, "positive A/B room under H4")
    print(
        "H8 with funding .00025 at u<=.00001 for all shares >=.0149; .0002 at u<=.000005 for shares >=.0293."
    )


if __name__ == "__main__":
    check()
