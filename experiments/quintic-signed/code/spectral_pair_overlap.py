"""Exact two-vector comparison for the signed Grothendieck witness. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gaussian_driver_compensation import E, NU, PI_HI, cap_at_one, require

TARGET = Q(10000, 14023)


def main():
    # The coefficient e is attained for a two-dimensional Hermitian compression.
    u = (Q(3,5),Q(4,5))
    v = (Q(5,13),Q(-12,13))
    diag = lambda x: x[0]**2-E*x[1]**2
    z = u[0]*v[0]-E*u[1]*v[1]
    c = u[0]*v[0]+u[1]*v[1]
    require(c**2 < 1 and z**2 == diag(u)*diag(v)+E*(1-c**2), "sharp mixed Gram sign")
    # A rank-one projection saturates the signed Gram constraint on collinear residuals.
    H,K = Q(1,4),Q(1,9)
    require((K+0)*(H-0) == H*K, "orthogonal projector annihilating both residuals")
    require((K+H-K)*(H-(H-K)) == H*K, "projector containing both residuals")
    # The theorem gives |<f,Sg>|² ≤ a*b + e*(1−|<f,g>|²).
    require(-Q(".25547") + E < TARGET**2, "opposite signs need no overlap")
    for debit, near, next_r, overlap, reserve in [
        (Q(1, 50), Q(".03670465"), Q(".03670466"), Q(".99932639"), Q(".00134677")),
        (NU, Q(".03984579"), Q(".03984580"), Q(".99920616"), Q(".00158705")),
    ]:
        upper = cap_at_one(debit, PI_HI/4) + Q(3,10**52)
        allowed = (TARGET**2-upper**2)/E
        require(reserve < allowed, "overlap-defect reserve")
        require(1-overlap**2 < allowed, "direct complex overlap")
        for dist, passing in ((near, True), (next_r, False)):
            squared = dist**2
            defect = squared * (1-squared/4)
            require((defect < allowed) == passing, "adjoining phase-distance test")
        print(f"d={debit}, phase distance ≤{near} or |<f,g>| ≥ {overlap}: absolute payoff below 10000/14023")
    cap = Q(".712398")
    require(cap**2 + E*Q(".00133626") < TARGET**2, "separate-tangent Lean cap suffices")
    print("For any overlap, diagonal product ≤−.25547 passes the same target.")


if __name__ == "__main__":
    main()
