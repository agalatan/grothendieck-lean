#!/usr/bin/env python3
"""Exact AMMP polynomial spectral test of archived atomic radial laws.

Discovery-independent replay: all acceptance/rejection decisions are Fraction
arithmetic. No cubic realizability, norm cap, or Grothendieck endpoint is inferred
from passing finitely many tests. See the adjacent research note for the proof.
"""
from __future__ import annotations
import argparse
from fractions import Fraction as Q
import hashlib
import json
from math import comb
from pathlib import Path
import sys

if sys.flags.optimize:
    raise SystemExit("Exact spectral replay refuses Python -O/-OO: assertions are proof checks.")


def validate_degree(degree):
    if not isinstance(degree, int) or isinstance(degree, bool) or degree < 2:
        raise ValueError("maximum degree must be an integer at least 2")


def ip(A, v):
    return sum(v[i] * A[i][j] * v[j]
               for i in range(len(v)) for j in range(len(v)))


def psd_or_witness(A):
    """Exact congruence elimination, returning a rational negative direction."""
    n = len(A)
    if n == 0 or any(len(row) != n for row in A):
        raise ValueError("PSD input must be a nonempty square matrix")
    if any(A[i][j] != A[j][i] for i in range(n) for j in range(n)):
        raise ValueError("PSD input must be symmetric")
    B = [list(row) for row in A]
    V = [[Q(i == j) for j in range(n)] for i in range(n)]
    rank = 0
    for i in range(n):
        if B[i][i] < 0:
            assert ip(A, V[i]) == B[i][i]
            return False, V[i], rank
        if B[i][i] == 0:
            j = next((j for j in range(i + 1, n) if B[i][j]), None)
            if j is not None:
                t = -B[i][j] / (abs(B[j][j]) + 1)
                v = [a + t * b for a, b in zip(V[i], V[j])]
                assert ip(A, v) < 0
                return False, v, rank
            continue
        rank += 1
        for j in range(i + 1, n):
            t = B[i][j] / B[i][i]
            V[j] = [a - t * b for a, b in zip(V[j], V[i])]
        for j in range(i + 1, n):
            for l in range(j, n):
                B[j][l] -= B[i][j] * B[i][l] / B[i][i]
                B[l][j] = B[j][l]
    return True, None, rank


def spectral_matrix(moments, degree, parity):
    validate_degree(degree)
    if parity not in (0, 1) or isinstance(parity, bool):
        raise ValueError("parity must be 0 or 1")
    if len(moments) < degree + 1:
        raise ValueError("insufficient radial moments for the requested degree")
    # F=sqrt(2) Re(q); circularity fixes E F^(2r)=C(2r,r)/2^r E U^r.
    indices = list(range(parity, degree + 1, 2))
    def real_moment(k):
        return Q(0) if k % 2 else Q(comb(k, k // 2), 2 ** (k // 2)) * moments[k // 2]
    A = [[(Q(degree) - (Q(i*j, i+j-1) if i+j != 1 else 0))
          * real_moment(i+j) for j in indices] for i in indices]
    return indices, A


def probe(moments, max_degree):
    validate_degree(max_degree)
    if len(moments) < max_degree + 1:
        raise ValueError("insufficient radial moments for the requested maximum degree")
    results = []
    for degree in range(2, max_degree + 1):
        rec = {"degree": degree, "blocks": []}
        for parity in (0, 1):
            indices, A = spectral_matrix(moments, degree, parity)
            ok, v, rank = psd_or_witness(A)
            block = {"parity": parity, "indices": indices,
                     "psd_exact": ok, "congruence_rank_before_stop": rank}
            if not ok:
                value = ip(A, v)
                # Normalize to keep the largest displayed coefficient equal to one.
                scale = max(abs(c) for c in v)
                v = [c / scale for c in v]
                value = ip(A, v)
                block.update(witness_coefficients=list(map(str, v)),
                             exact_quadratic_value=str(value),
                             decimal_quadratic_value=float(value))
                small = [Q(round(float(c)*10**6), 10**6) for c in v]
                small_value = ip(A, small)
                if small_value < 0:
                    poly=[Q(0) for _ in range(degree+1)]
                    for a,i in enumerate(indices):
                        for b,j in enumerate(indices):
                            n=i+j
                            poly[n//2]+=small[a]*small[b]*(Q(degree)-Q(i*j,n-1))\
                                *Q(comb(n,n//2),2**(n//2))
                    assert sum(c*m for c,m in zip(poly,moments))==small_value
                    block.update(short_witness_coefficients=list(map(str, small)),
                        short_exact_quadratic_value=str(small_value),
                        short_decimal_quadratic_value=float(small_value),
                        short_radial_polynomial_coefficients=list(map(str,poly)))
            rec["blocks"].append(block)
        results.append(rec)
        if not all(b["psd_exact"] for b in rec["blocks"]):
            break
    return results


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("laws", nargs="*", type=Path)
    ap.add_argument("--max-degree", type=int, default=12)
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    try:
        validate_degree(args.max_degree)
    except ValueError as exc:
        ap.error(str(exc))
    out = {"format": "fresh-barrier-ammp-radial/v1",
           "scope": "Necessary polynomial spectral tests; no endpoint claimed.",
           "formula": "M_k[i,j]=(k-i*j/(i+j-1))*E[F^(i+j)]",
           "laws": []}
    # Gaussian radial law is an exact calibration; H21 is a genuine cubic calibration.
    from math import factorial
    gaussian = [Q(factorial(r)) for r in range(args.max_degree + 1)]
    wick = [sum(Q(comb(2*r, j)) * (-2)**(2*r-j) * factorial(r+j)
                for j in range(2*r+1)) / 2**r
            for r in range(args.max_degree + 1)]
    for name, moments in (("Exp(1)", gaussian), ("normalized H21", wick)):
        tests = probe(moments, args.max_degree)
        assert all(b["psd_exact"] for r in tests for b in r["blocks"]), name
        out.setdefault("calibrations", []).append({"name": name,
            "all_pass_exact": True, "maximum_degree": args.max_degree})
    for path in args.laws:
        raw = path.read_bytes()
        d = json.loads(raw)
        atoms = [(Q(z["v"])**2, Q(z["weight"])) for z in d["support"]]
        moments = [sum(w*u**r for u,w in atoms)
                   for r in range(args.max_degree+1)]
        assert moments[0] == moments[1] == 1
        tests = probe(moments, args.max_degree)
        failures = [r["degree"] for r in tests
                    if any(not b["psd_exact"] for b in r["blocks"])]
        out["laws"].append({"source": str(path), "sha256": hashlib.sha256(raw).hexdigest(),
            "index": d["index"], "atoms": len(atoms),
            "radial_moments": list(map(str, moments)),
            "radial_moments_decimal": list(map(float, moments)),
            "first_failing_degree": failures[0] if failures else None,
            "tests": tests})
        print(d["index"], "first failure", failures[0] if failures else None,
              "m2,m3", float(moments[2]), float(moments[3]), flush=True)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(out, indent=2)+"\n")


if __name__ == "__main__":
    main()
