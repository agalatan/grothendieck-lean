"""Verify the peak shared-bath perturbation bound. Agent-ID: codex-a7c4.

Run with python3 -IB. When the package is staged outside the repository, pass
the --repo option pointing to a checkout containing the strong-content proof.
"""

import argparse
import copy
import hashlib
import importlib.util
import json
from fractions import Fraction as Q
from math import comb, factorial
from pathlib import Path

HERE = Path(__file__).resolve().parent
BETA = Q(6, 25)
MAX_U = Q(".0463")
MAX_CHI = Q(3, 2)
LOCAL_DIVISORS = {"share41": 3700, "excess28": 12000, "moderate": 1150, "one": 900}
SMALL_U = Q(".00798")
SMALL_CHI = Q(".077")
COMMON_DIVISOR = 16000


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def check_occupancy_weights():
    """Integrate |z| times the squared normalized one-coordinate Wick functions."""
    def weight(p, q):
        terms = [(-1)**k * factorial(k) * comb(p, k) * comb(q, k)
                 for k in range(min(p, q) + 1)]
        total = Q(0)
        for k, left in enumerate(terms):
            for j, right in enumerate(terms):
                n = 1 + p + q - k - j
                # E |z|^(2n-1) / sqrt(pi) = Gamma(n+1/2) / sqrt(pi).
                total += left * right * Q(factorial(2*n), 4**n * factorial(n))
        return total / (factorial(p) * factorial(q))

    found = [weight(p, q) for p, q in [(0,0), (1,0), (0,1), (2,0), (1,1), (2,1)]]
    require(found == [Q(1,2), Q(3,4), Q(3,4), Q(15,16), Q(7,8), Q(33,32)],
            "incorrect Gaussian occupancy weights")
    require(max(found) * Q(4,3) / 2 == Q(11,16), "incorrect projected Taylor fee")


def check_constants(strong, derivatives):
    require(len(derivatives) > 2 and Q(0) < -derivatives[2].hi
            and -derivatives[2].lo < Q(1673, 1000), "radial curvature bound")
    require(set(strong.BLOCKS) == set(LOCAL_DIVISORS), "block families changed")
    for _, chi_hi, multiplier, power in strong.BLOCKS.values():
        require(chi_hi <= MAX_CHI, "core shape cap")
        require(multiplier**2 * (chi_hi if power else 1) <= Q(".232")**2,
                "block excess cap")
    require(Q(".3")**2 > Q("7.98") * Q(".232") * MAX_U, "core-content cap")
    require(Q("2.2") > Q(11,16) / Q(699,1250)**2, "projected Taylor fee")
    require(Q("1.225")**2 >= MAX_CHI, "shape square-root cap")
    check_occupancy_weights()
    for distance in (Q(".0403448") - Q(".03875"), Q(".04194") - Q(".0403449")):
        require(distance > 0 and Q(27,25) * distance**2 > Q(3241,1186575200),
                "Gaussian joint-shell price buffer")

    t = MAX_CHI / COMMON_DIVISOR
    require(t < Q(1,10000) and SMALL_U*(1+t) < Q(".008"), "small-energy edge")
    require(36*44*(2+MAX_CHI) < 75**2, "fourth moment quadratic term")
    require(4**4*(2+MAX_CHI)*44**3 < 100**4, "fourth moment cubic term")
    require(100*Q(1,100) + 44*t < 2, "fourth moment remainder")
    require(SMALL_CHI * (1+Q(77,COMMON_DIVISOR)) < Q(".0784"),
            "small-excess edge")
    require(MAX_CHI * (1+Q(77,COMMON_DIVISOR)) < 2, "staircase shape edge")


def perturbation_fee(k):
    return k * (Q("3.346") * (1+MAX_CHI*k) + 2*Q(".3")*Q("2.2")*Q("1.225")/BETA
                + Q("2.2")**2 * MAX_CHI*k/BETA)


def verify_rectangles(strong, inputs, data, global_case, common_divisor=COMMON_DIVISOR):
    raw, caps, tail, _, rice = inputs
    majorants = [list(map(Q, coefficients)) for coefficients in data["cubics"]]
    strong.check_majorants(raw, caps, tail, majorants)
    target = {}
    for family, (chi_lo, chi_hi, _, _) in strong.BLOCKS.items():
        target[family] = [strong.Rectangle(
            SMALL_U if global_case else Q(".008"), MAX_U,
            SMALL_CHI if global_case and chi_lo == Q(".0784") else chi_lo, chi_hi)]
    checked = []
    margins = []
    for u_lo, u_hi, chi_lo, chi_hi, index, family in data["cells"]:
        require(family in target and type(index) is int and 0 <= index < len(majorants),
                "invalid cell assignment")
        u_lo, u_hi, chi_lo, chi_hi = map(Q, (u_lo, u_hi, chi_lo, chi_hi))
        if global_case and u_lo == Q(".008"):
            u_lo = SMALL_U
        if global_case and chi_lo == Q(".0784"):
            chi_lo = SMALL_CHI
        checked.append(strong.Cell(strong.Rectangle(u_lo,u_hi,chi_lo,chi_hi),index,family))
        k = Q(1, common_divisor if global_case else LOCAL_DIVISORS[family])
        for chi in (chi_lo, chi_hi):
            price = strong.cubic_price(raw, family, majorants[index], u_lo, chi)
            price[2] += perturbation_fee(k) * chi
            gap = [rice[j] - price[j] for j in range(4)] + rice[4:]
            margins.extend(raw.bernstein_1d(gap, u_lo, u_hi))
    strong.check_partition(checked, target)
    require(min(margins) > 0, "insufficient shared-bath margin")
    return len(checked), min(margins)


def reject(action, error):
    try:
        action()
    except ArithmeticError as exc:
        if error in str(exc):
            return
        raise
    raise ArithmeticError("failed to reject " + error)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=HERE.parents[3])
    repo = parser.parse_args().repo.resolve()
    for line in (HERE / "PUBLIC_INPUTS.sha256").read_text().splitlines():
        digest, path = line.split(maxsplit=1)
        require(hashlib.sha256((repo / path).read_bytes()).hexdigest() == digest,
                "upstream dependency changed: " + path)
    upstream = repo / "research/conjecture-K/code/strong-content-blocks-codex-a7c4"
    spec = importlib.util.spec_from_file_location("strong_content", upstream / "verify.py")
    strong = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(strong)
    inputs = strong.read_inputs()
    check_constants(strong, inputs[3])
    data = json.loads((upstream / "blocks.json").read_text())
    for label, global_case in [("Original rectangles", False), ("Full-band extension", True)]:
        count, margin = verify_rectangles(strong, inputs, data, global_case)
        print(f"{label}: {count} closed rectangles; signed margin >= {int(margin*10**12)}/10^12.")
    missing = copy.deepcopy(data)
    missing["cells"].pop()
    reject(lambda: verify_rectangles(strong, inputs, missing, True), "gap or overlap")
    wrong_index = copy.deepcopy(data)
    wrong_index["cells"][0][4] = -1
    reject(lambda: verify_rectangles(strong, inputs, wrong_index, True), "invalid cell assignment")
    reject(lambda: verify_rectangles(strong, inputs, data, True, common_divisor=500),
           "insufficient shared-bath margin")
    print("Gaussian weights, low-energy and low-excess edges, and three corruption controls passed.")


if __name__ == "__main__":
    main()
