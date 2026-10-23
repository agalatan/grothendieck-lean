#!/usr/bin/env python3
"""Exact small checks of the response Gram lift; no endpoint data asserted."""
from fractions import Fraction as F
from itertools import product


def dot(x, y):
    return sum((a*b for a, b in zip(x, y)), F(0))


def matvec(P, x):
    return [dot(r, x) for r in P]


def sub(x, y):
    return [a-b for a, b in zip(x, y)]


def main():
    P = [[F(1,2), F(1,2)], [F(1,2), F(1,2)]]
    # Exact sharpness of the factor-two completion radius.
    x, y = [F(1),F(0)], [F(0),F(1)]
    px, py = matvec(P,x), matvec(P,y)
    k, v = dot(px,py), dot(x,y)
    assert k == F(1,2) and (2*k-v)**2 == dot(x,x)*dot(y,y)
    checks = 0
    for a,b,c,d in product(range(-3,4), repeat=4):
        x, y = [F(a,3),F(b,3)], [F(c,3),F(d,3)]
        px, py = matvec(P,x), matvec(P,y)
        assert (2*dot(px,py)-dot(x,y))**2 <= dot(x,x)*dot(y,y)
        checks += 1
    # A completion accepted by separate Cauchy but excluded by the joint budget.
    c, v, R, a, separate_k = F(1,5), F(0), F(1,10), F(13,100), F(-2,25)
    assert abs(separate_k) <= R and abs(c+separate_k) <= a
    assert abs(2*c+v) > R+2*a
    assert abs(2*separate_k-v) > R
    # Price accounting: the PSD price and its complement share one budget.
    V = [[F(1),F(0)], [F(0),F(1)]]
    K = P
    Z = [[F(0),F(1,2)], [F(1,2),F(0)]]
    Y = [[F(1,4),F(1,4)], [F(1,4),F(1,4)]]
    pair = lambda A,B: sum(A[i][j]*B[j][i] for i,j in product(range(2),repeat=2))
    assert pair(Z,K) == pair(Y,V) == F(1,2)
    # Y and Y-Z are the two rank-one matrices (1,+/-1)(1,+/-1)^T/4.
    for a,b in product(range(-4,5), repeat=2):
        x = [F(a),F(b)]
        assert dot(x,matvec(Y,x)) >= 0
        YmZ = [[Y[i][j]-Z[i][j] for j in range(2)] for i in range(2)]
        assert dot(x,matvec(YmZ,x)) >= 0
    print(f'PASS {checks} rational reflection checks; sharp endpoint k=1/2')
    print('PASS strict all-completions exclusion: 2/5 > 9/25')
    print('PASS shared PSD price bound, attained at 1/2')
    print('Scope: finite exact examples only; general theorems are in ResponseGram.lean.')


if __name__ == '__main__':
    main()
