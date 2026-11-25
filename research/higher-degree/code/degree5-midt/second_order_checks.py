#!/usr/bin/env python3
"""N.  Small numerical checks quoted in NOTE.md section 4 and in problem P7 (closed forms and a trapezoid rule).

(1) The second-order form of phi(l, G) at G = 0:  phi = (sqrt(pi)/2) l + (1/(2l)) E[(Im(G e^{-i theta}))^2/|z1|] + ...
    Its value per unit ||G||^2 on the sectors of H21 by visible Wick factor.
(2) The unsymmetrised control: E|F|/||F|| for F = z (1 - c (T - 2)).
(3) The phase-less value E sqrt(T + S)/sqrt2 for independent T, S ~ Exp(1).
"""
import math
import numpy as np

MU = math.sqrt(math.pi) / 2
# E[T^a] for T ~ Exp(1) is Gamma(a + 1)
G = math.gamma
print("(1) remote q:            %.6f   (sqrt(pi)/2 = %.6f)" % (0.5 * G(0.5), MU))
print("    i z1 Q, Q real H11:  %.6f" % G(1.5))
print("    conj(z1) B, B in H20: %.6f" % (0.5 * G(1.5)))
print("    i e21(z1):           %.6f" % ((G(3.5) - 4 * G(2.5) + 4 * G(1.5)) / 2))
print("    z1 A, A complex diffuse H11 (half of it is transverse): %.6f" % (0.5 * G(1.5)))
# span of c1 e11(z1) w + c2 e20(z1) conj(w): g = (T-1) c1 w e^{-i th} + (T/sqrt2) c2 conj(w) e^{i th};
# E[(Im g)^2/sqrt T] = E[ (|a|^2 + |b|^2)/2 - Re(a b) ]/sqrt T with a = (T-1) c1 w, b = (T/sqrt2) c2 conj(w)
m11 = 0.5 * (G(2.5) - 2 * G(1.5) + G(0.5))
m22 = 0.5 * G(2.5) / 2
m12 = 0.5 * (G(2.5) - G(1.5)) / math.sqrt(2)
ev = np.linalg.eigvalsh(np.array([[m11, m12], [m12, m22]]))
print("    span{e11(z1) w, e20(z1) conj(w)}: largest eigenvalue %.6f" % ev[-1])
s = np.linspace(0, 9, 900001)           # T = s^2: E[sqrt(T) phi(T)] = int 2 s^2 phi(s^2) e^{-s^2} ds
ds = s[1] - s[0]


def ratio(c):
    v = 2 * s * s * np.abs(1 - c * (s * s - 2)) * np.exp(-s * s)
    return float((np.sum(v) - 0.5 * (v[0] + v[-1])) * ds) / math.sqrt(1 + 2 * c * c)


best = max((ratio(c), c) for c in np.linspace(0, 0.6, 121))
print("(2) sup_c E|z(1 - c(T-2))|/norm = %.5f at c = %.3f;  at c = 1/4: %.5f;  sqrt(9 pi/32) = %.5f" % (
    best[0], best[1], ratio(0.25), math.sqrt(9 * math.pi / 32)))
print("(3) E sqrt(T+S)/sqrt2 = Gamma(5/2)/sqrt2 = %.5f" % (G(2.5) / math.sqrt(2)))
