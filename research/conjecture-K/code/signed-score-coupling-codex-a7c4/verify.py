"""Exact replay of the signed angular-score coupling at the peak. Agent-ID: codex-a7c4."""
import hashlib
import importlib.util
import json
from fractions import Fraction as Q
from math import factorial
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
KRAW = HERE.parent / "raw-content-2026-11-17-gemini-5331" / "verify_raw_content.py"


def require(ok, reason):
    if not ok:
        raise ArithmeticError(reason)


def check_atom(raw, lipschitz):
    # For either sign, L * exp(y) +/- P(y) is bounded below by this polynomial.
    p = [-1, -6, 12, Q(-8, 3)]
    for sign in (-1, 1):
        diff = [
            lipschitz / factorial(i) + (sign * p[i] if i < len(p) else 0)
            for i in range(9)
        ]
        finite = all(raw.positive_on(diff, Q(i, 8), Q(i+1, 8)) for i in range(32))
        if not finite or not raw.tail_positive(diff, Q(4)):
            return False
    return True


def load_kraw():
    require(__debug__, "the upstream KRAW interval library requires assertions")
    for line in (HERE / "PUBLIC_INPUTS.sha256").read_text().splitlines():
        digest, path = line.split(maxsplit=1)
        require(hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == digest, path)
    spec = importlib.util.spec_from_file_location("kraw", KRAW)
    raw = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(raw)
    return raw


def endpoint_moments(raw, a, b):
    ia = raw.single_pole_integrals(a, b, n=12)
    ib = raw.single_pole_integrals(a, 3*b, n=12)
    ta = raw.expand_recurrence({(2, 0): Q(1)}, b)
    wa = raw.weighted_integral(ta, a, ia, ib)
    wb = raw.weighted_integral({(3, 1): Q(1)}, a, ia, ib)
    return wb / wa, 12 * wa / raw.PI


def six_sector(raw):
    rho = Q(5053, 10000)
    d = 1 + rho**2
    joint_energy_price = 2 * (Q(".080051") - Q(".0463"))
    aligned = Q(31, 100) - joint_energy_price / d
    transverse = Q(2, 25) - joint_energy_price / d

    # Upward replacements for sqrt(13/15), pi and (3/8)^(3/2).
    assert Q(932, 1000) ** 2 > Q(13, 15)
    assert Q(23, 100) ** 2 > Q(3, 8) ** 3
    ou = Q(932, 1000) * Q(22, 7) ** 2 / 128 * Q(23, 100)
    c, e = Q(14, 5), Q(3, 100)
    assert ou * 13**2 < c
    assert ou * Q(1344, 1000) ** 2 < e
    assert aligned > 0 and transverse > 0 and rho > 0
    assert Q(29, 100) ** 2 > c * e
    mixed = rho / d
    cost = (c + 2 * mixed * Q(29, 100) + mixed**2 * e) / aligned
    cost += e / (d**2 * transverse)
    assert cost < Q(63, 5)

    previous = HERE.parent / "strong-content-blocks-codex-a7c4"
    tiles = json.loads((previous / "cover.json").read_text())["cells"]
    block_tiles = json.loads((previous / "blocks.json").read_text())["cells"]
    require(len(tiles) == 13 and len(block_tiles) == 14, "staircase input")
    require(all(raw.ka_piecewise(Q(tile[0])) >= 5 for tile in tiles), "general tile prices")
    require(raw.ka_piecewise(Q(".0463")) == Q(9, 2), "last tabulated price")
    base = Q(25, 6) * Q(9, 2)
    general = Q(25, 6) * Q(14, 15) * 5
    blocks = Q(25, 6) * Q(399, 50)
    assert general > base and blocks > base
    assert 1 - Q(63, 5) / base == Q(41, 125)
    assert 1 - Q(63, 5) / blocks > Q(31, 50)
    assert Q(2, 25) * d - joint_energy_price > Q(329, 10000)
    print("Shell cost < 63/5, uniform deficit reserve 41/125, block tiles > 31/50.")


def main():
    raw = load_kraw()
    require(check_atom(raw, Q(2)), "radial Lipschitz bound")
    require(not check_atom(raw, Q(1)), "undersized Lipschitz control")
    a, b = Q(699, 1250), Q(179, 1250)
    ratio, norm_a = endpoint_moments(raw, a, b)
    require(Q(".6760686") < ratio.lo <= ratio.hi < Q(".6760687"), "ratio normalization")
    scale = 1 + 2*b/a
    require(scale * ratio.lo > 1, "coupled reciprocal moment difference")

    def price(r):
        coefficient = 1/raw.SQRT_2 - r*scale
        rel = max(abs(coefficient.lo), abs(coefficient.hi))*ratio.hi
        rel += 2*r*(scale*ratio.hi - 1)
        # Raw A squared OU cap 5353/625, directional factor sqrt(13/15) <14/15.
        return rel*norm_a.hi, rel**2 * Q(5353,625) * Q(14,15)

    rho = Q(5053, 10000)
    for r, limit, projected in (
        (Q(59,125), Q(".563"), Q(".00523")),
        (rho, Q("1.344"), Q(".03")),
    ):
        derivative, content = price(r)
        require(derivative < limit and content < projected, "signed-score estimate")
    require(price(rho)[0] > 1, "over-tight upper functional control")

    # Work at the lowest permitted price. Increasing it penalizes the shell energy.
    kmin = Q(14,15)*Q(9,2)
    for drop, budget in ((Q(0), Q(963,1000)), (Q(17,2000), Q(999,1000))):
        a_cost, b_cost = Q(1,4)-drop, Q(27,100)-drop
        cross = Q(59,500)
        complement = b_cost - cross**2/a_cost
        _, k_signed = price(cross/a_cost)
        require(complement > 0 and kmin <= Q(399,50), "Schur hypotheses")
        ratio_spent = Q(6,25)*(1/a_cost + k_signed/(kmin*complement))
        require(ratio_spent < budget, "raw same-variance reserve")
    six_sector(raw)
    print("Raw A+B: retained deficit >= 37/1000 at peak, >= 1/1000 down to p0-17/2000.")
    print("Signed B-r*A score: third derivative < .563 (r=.472), <1.344 (r=.5053).")
    print("At the retained alignment its squared projection is < .03 times the excess coefficient.")


if __name__ == "__main__":
    main()
