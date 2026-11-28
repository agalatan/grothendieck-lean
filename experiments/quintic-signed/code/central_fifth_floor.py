"""Inverse-radius and angular fifth-energy prices for unrestricted physical pairs.

Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from functools import cache
from math import comb, factorial
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from coupled_cubic_fifth import PI_LO, PI_HI, atan_bounds, half_moment, ratio, require


@cache
def radial_cross(a, b, c, d):
    """Unnormalized complex Hermite radial product in units of sqrt(pi)."""
    def terms(p, q):
        return [(-1)**i * factorial(i) * comb(p, i) * comb(q, i)
                for i in range(min(p, q) + 1)]
    require((a+b+c+d) % 2 == 0, "radial powers have opposite parities")
    return sum(u*v*half_moment((a+b+c+d)//2 - i - j)
               for i, u in enumerate(terms(a,b)) for j, v in enumerate(terms(c,d)))


def positive_semidefinite(matrix):
    if not matrix:
        return True
    pivot, *column = matrix[0]
    if pivot < 0 or (not pivot and any(column)):
        return False
    tail = [[row[j+1] - (x*y/pivot if pivot else 0) for j, y in enumerate(column)]
            for x, row in zip(column, matrix[1:])]
    return positive_semidefinite(tail)


def gram_blocks():
    # Test F+Q+P in the dual norm squared with coefficients 1, 2 and 8/3.
    kinds = [(3, 2, Q(1)), (2, 1, Q(2)), (1, 0, Q(8,3))]
    modes = [(p-a, q-b, a, b, norm)
             for p, q, norm in kinds for a in range(p+1) for b in range(q+1)]
    groups = sorted({tuple(sorted((r,s))) for r,s,_,_,_ in modes})
    for group in groups:
        sub = [v for v in modes if tuple(sorted(v[:2])) == group]
        for endpoint in [Q(-1,3), Q(1,3)]:
            matrix = []
            for i, (r,s,a,b,norm) in enumerate(sub):
                row = []
                for j, (R,S,c,d,_) in enumerate(sub):
                    entry = int(i==j)*factorial(a)*factorial(b)*norm
                    if (r,s) == (R,S):
                        entry -= radial_cross(a,b,c,d)
                    if (r,s) == (S,R):
                        entry += endpoint*radial_cross(a,b,c,d)
                    row.append(entry)
                matrix.append(row)
            require(positive_semidefinite(matrix), f"angular price {group} at {endpoint}")
    return len(groups)


def floor(t, lam, mean_upper):
    c_ratio = 1 + 1 / (1 + lam)
    j_ratio = (1 - lam) * c_ratio
    return (j_ratio / (Q(51, 64) + j_ratio) * 3 * PI_LO / 256
            - 2 * c_ratio * mean_upper * (mean_upper - t))


def main():
    print(f"{gram_blocks()} conjugate remote blocks: simultaneous full fifth/cubic/first energy budget")
    lo, hi = Q(".886226925"), Q(".886226926")
    a, b = atan_bounds(Q(1, 5))
    c, d = atan_bounds(Q(1, 239))
    require(4*lo**2 < PI_LO < 16*a-4*d <= 16*b-4*c < PI_HI < 4*hi**2,
            "standard proper-complex Gaussian mean")
    require(ratio(3, 2) == Q(51, 128), "aligned fifth radial cost")
    off = [ratio(p, q) for p in range(4) for q in range(3) if p or q]
    require(max(off) == Q(3, 4), "largest nonremote inverse-radius cost")
    contacts = [
        (Q(167530517578123, 200000000000000), Q(".692"), Q("-.122962"), Q("-.145866")),
        (Q(43091569, 50000000), Q(".473"), Q("-.053226"), Q("-.060154")),
    ]
    for t, lam, angular, simple in contacts:
        require(0 <= lam <= 1 and t < lo, "physical parameters")
        require(floor(t, lam, hi) > angular and floor(t, Q(0), hi) > simple,
                "central fifth floor")
        print(f"t={t}: unrestricted angular fifth floor > {angular}; unweighted > {simple}")


if __name__ == "__main__":
    main()
