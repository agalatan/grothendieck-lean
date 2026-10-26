#!/usr/bin/env python3
"""Verify a rational dual excluding every shared response-Gram completion.

This is a finite rational certificate, not an integration certificate or a
Grothendieck endpoint. No optimizer, eigenvalue tolerance, or third-party
package is trusted. See reassessment-20261023/completion-dual.md for the proof.
"""
from __future__ import annotations

import argparse
import copy
import json
from fractions import Fraction as Q
from pathlib import Path


def matrix(a):
    if not a or any(len(row) != len(a) for row in a):
        raise ValueError("expected a nonempty square matrix")
    return [[Q(v) for v in row] for row in a]


def psd(a):
    """Exact symmetric LDL/Schur test, including singular PSD matrices."""
    a = copy.deepcopy(a)
    n = len(a)
    if any(a[i][j] != a[j][i] for i in range(n) for j in range(n)):
        return False
    for k in range(n):
        if a[k][k] < 0:
            return False
        if a[k][k] == 0:
            if any(a[k][j] != 0 for j in range(k + 1, n)):
                return False
            continue
        pivot = a[k][k]
        for i in range(k + 1, n):
            for j in range(i, n):
                a[i][j] -= a[i][k] * a[k][j] / pivot
                a[j][i] = a[i][j]
    return True


def pair(a, b):
    return sum((a[i][j] * b[j][i] for i in range(len(a))
                for j in range(len(a))), Q(0))


def subtract(a, b):
    return [[u - v for u, v in zip(x, y)] for x, y in zip(a, b)]


def verify(data):
    eps = Q(data["epsilon"])
    split = data["split"]
    V, H0, Y, R = [matrix(data[k]) for k in ("V", "H0", "Y", "R")]
    n = len(V)
    if any(len(a) != n for a in (H0, Y, R)) or not 0 < split < n:
        raise ValueError("inconsistent matrix dimensions or branch split")
    if eps <= 0 or not psd(V) or not psd(Y) or not psd(R):
        raise ValueError("epsilon, V, Y or R failed its exact positivity check")
    if any(H0[i][j] != H0[j][i] for i in range(n) for j in range(n)):
        raise ValueError("H0 must be symmetric")
    if sum((Y[i][i] for i in range(n)), Q(0)) != 1:
        raise ValueError("Y must have trace exactly one")
    Z = [[eps * Y[i][j] if (i < split) != (j < split) else Q(0)
          for j in range(n)] for i in range(n)]
    if not psd(subtract(R, Z)):
        raise ValueError("R-Z failed its exact PSD check")
    herr = Q(data.get("H0_operator_error", "0"))
    verr = Q(data.get("V_operator_error", "0"))
    if herr < 0 or verr < 0:
        raise ValueError("operator error allowances must be nonnegative")
    upper = pair(Y, H0) + pair(R, V) + herr + verr * sum(
        (R[i][i] for i in range(n)), Q(0))
    if upper >= 0:
        raise ValueError("the dual has no strict negative separation margin")
    return -upper


def fixture():
    eps, d, c = Q(149, 200), Q(2, 5), Q(4, 5)
    sign = [1, 1, -1, -1]
    eye = [[Q(i == j) for j in range(4)] for i in range(4)]
    Y = [[Q(sign[i] * sign[j], 4) for j in range(4)] for i in range(4)]
    R = [[eps * Y[i][j] / 2 for j in range(4)] for i in range(4)]
    H0 = [[d * eye[i][j] if (i < 2) == (j < 2) else eps * c
           for j in range(4)] for i in range(4)]
    data = {"epsilon": str(eps), "split": 2,
            "scope": "abstract rational Gram fixture; no actual Gaussian response asserted",
            **{k: [[str(v) for v in row] for row in a]
               for k, a in {"V": eye, "H0": H0, "Y": Y, "R": R}.items()}}
    # Each individual coordinate-pair completion screen accepts this data.
    assert 2 * c <= 1 + 2 * d / eps
    assert abs(c - Q(3, 10)) <= d / eps
    # Joint optimum is attained by K=(I + 2 Z/eps)/2.
    K = [[eye[i][j] / 2 + (Q(-1, 4) if (i < 2) != (j < 2) else Q(0))
          for j in range(4)] for i in range(4)]
    assert psd(K) and psd(subtract(eye, K))
    eta = verify(data)
    assert eta == Q(839, 2000)
    H = [[H0[i][j] + (eps * K[i][j] if (i < 2) != (j < 2) else Q(0))
          for j in range(4)] for i in range(4)]
    assert psd([[H[i][j] + eta * eye[i][j] for j in range(4)] for i in range(4)])
    assert pair(Y, H) == -eta
    return data


def self_test():
    data = fixture()
    for name, mutate in [
        ("negative price", lambda d: d["R"][0].__setitem__(0, "-1")),
        ("broken trace", lambda d: d["Y"][0].__setitem__(0, "1/3")),
        ("lost separation", lambda d: d.__setitem__("H0", [["2" if i == j else "0"
                                                           for j in range(4)] for i in range(4)])),
        ("invalid complementary price", lambda d: d.__setitem__("R", [["0"] * 4 for _ in range(4)])),
    ]:
        bad = copy.deepcopy(data)
        mutate(bad)
        try:
            verify(bad)
        except ValueError:
            pass
        else:
            raise AssertionError(f"accepted invalid mutation: {name}")
    assert not psd([[Q(0), Q(1)], [Q(1), Q(1)]])
    assert psd([[Q(0), Q(0)], [Q(0), Q(1)]])
    padded = copy.deepcopy(data)
    padded.update(H0_operator_error="1/100", V_operator_error="1/50")
    assert verify(padded) == Q(839, 2000) - Q(1, 100) - Q(1, 50) * Q(149, 400)
    print("PASS exact shared-completion dual: best stability eigenvalue <= -839/2000")
    print("PASS all four coordinate-pair scalar screens accept the same abstract data")
    print("PASS four deliberate certificate corruptions are rejected; singular PSD checks pass")


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("certificate", nargs="?", type=Path)
    ap.add_argument("--write-fixture", type=Path)
    args = ap.parse_args()
    if args.certificate:
        eta = verify(json.loads(args.certificate.read_text()))
        print(f"PASS strict all-completions separation margin {eta} ({float(eta):.12g})")
    else:
        self_test()
    if args.write_fixture:
        args.write_fixture.write_text(json.dumps(fixture(), indent=2) + "\n")


if __name__ == "__main__":
    main()
