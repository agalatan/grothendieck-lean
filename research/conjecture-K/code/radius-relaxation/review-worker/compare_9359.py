#!/usr/bin/env python3
"""Exact algebra (label C) for the comparison with the 0.9359 certificate
(handoff/research-degree5/gpt-radius-9359-2026-11-16/package/README.md, section 4).

Its five scalar constraints, in its notation c = c2 - 1, d = (c1 + c2)/3 - 1, b = rho, A = |P20 q^2|^2,
B = |P31 q^2|^2, t = E c^2, written in the contraction scalars through (F3):
    A = 32 b,  B = 96 y,  t = 16 n + 4 h,  E d^2 = (80n + 20h + 16b + 96y + 32z)/9,
    E b^2 <= E|a|^2 = A + B/4,  E[V b] = A + B/2,  E[c (V - 1)] = t + B/4.
Each constraint is a consequence of (F3) and of the cuts y >= 0, h0 >= 0:
    Q0:  s - 3 E d^2 - (2/3) E|a|^2          = 2 h0
    Q1:  s - 2 E c^2 - E|a|^2                = 72 y
    Q2:  s - E|a|^2 - 2 E[c (V - 1)]         = 24 y
    Q3:  E[c (V-1)] - E c^2                  = 24 y
    Q4:  E[V b] - E|a|^2                     = 24 y
"""
import os, sys
from fractions import Fraction as Fr
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import own_verifier as OV

s, y, h0 = OV.S_FORM, OV.y_, OV.H0
A, B, t = 32 * OV.b_, 96 * OV.y_, OV.VAR_C2
Ed2 = Fr(1, 9) * OV.VAR_C1P2
Ea2 = OV.E_A2
EVb = OV.E_VRHO
EcV = t + Fr(1, 4) * B
checks = {
    'E|a|^2 = A + B/4': (Ea2 - A - Fr(1, 4) * B).v == OV.ZERO.v,
    'E[Vb] = A + B/2': (EVb - A - Fr(1, 2) * B).v == OV.ZERO.v,
    's = A + B + 2t': (s - A - B - 2 * t).v == OV.ZERO.v,
    'Q0: s - 3 E d^2 - (2/3) E|a|^2 = 2 h0': (s - 3 * Ed2 - Fr(2, 3) * Ea2 - 2 * h0).v == OV.ZERO.v,
    'Q1: s - 2t - E|a|^2 = 72 y': (s - 2 * t - Ea2 - 72 * y).v == OV.ZERO.v,
    'Q2: s - E|a|^2 - 2 E[c(V-1)] = 24 y': (s - Ea2 - 2 * EcV - 24 * y).v == OV.ZERO.v,
    'Q3: E[c(V-1)] - t = 24 y': (EcV - t - 24 * y).v == OV.ZERO.v,
    'Q4: E[Vb] - E|a|^2 = 24 y': (EVb - Ea2 - 24 * y).v == OV.ZERO.v,
    # the cross moments that the present certificate reaches through the linear tests (slope_1, slope_2):
    # (I) with G = v^2/2:  (2 + s)/2 = E[c2 V] + E[V rho]/2  =>  E[c2 V] - 1 = (s - E[V rho])/2 = t + B/4
    'E[c2 V] - 1 = (s - E[V rho])/2': ((Fr(1, 2) * (s - EVb)) - EcV).v == OV.ZERO.v,
}
for k, v in checks.items():
    print('%-48s %s' % (k, v))
sys.exit(0 if all(checks.values()) else 1)
