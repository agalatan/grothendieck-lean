#!/usr/bin/env python3
"""Check written when research/conjecture-K was updated (15 November 2026); see STATUS.md, 11.27 and section 14, item 38.

Question: the review of the first version of the report on the tilted sector says that the term F(q) - F(0) >= 0,
which the proof of the global bound (STATUS.md 11.26) drops, has no dimension-free lower bound "from the fourth moment
alone".  Is that so?

It is not.  Peak row: a = 699/1250, b = 179/1250, L = Z(a + b|Z|^2), T = |Z|^2 ~ Exp(1), l(T) = |L| = sqrt(T)(a + bT);
F(q) = 2E|L + q| for q independent of Z, u = E|q|^2, V = |q|^2; C(t) is the mean of |1 + t e^{i theta}| over theta.
The argument (that of the second version of the report and of its note localization_notes.md, both under
sources/received-2026-11-15-tilted-sector/; re-derived for this record):

  1. C(t) >= sqrt(4 + t^2) - 1 for t >= 0   (series for t <= 1; reciprocity C(t) = t C(1/t) for t >= 1),
     so  F(q) - F(0) = 2E[l (C(|q|/l) - 1)] >= E[V g_l(V)],   g_l(v) = 2/(sqrt(4 l^2 + v) + 2 l);
  2. g_l is decreasing and convex in v, so by Jensen under the size-biased law (weight V/u):
     E[V g_l(V)] >= u g_l(E V^2 / u) >= u g_l(44 u), using E|q|^4 <= 44 u^2
     (for circular cubic chaos: Circular.gaussian_fourth_moment_le_44 in Grothe/LowerAnalytic/CircularFourth.lean);
  3. hence F(q) - F(0) >= u c(u),  c(u) = E_T[g_{l(T)}(44 u)], decreasing in u, and with 11.26
     J(q, r) <= (1074/625 - c(u)) u - (859/2500) |r|^2.

This script checks step 1 on a grid, computes c(u) and the resulting radius, and compares u c(u) with the true value
of F(q) - F(0) on the Wick monomial q = sqrt(u/2) y(|y|^2 - 2).  Floating point (double precision, composite Simpson;
the elliptic integral by the arithmetic-geometric mean); no interval arithmetic: status N.  Standard library only.
Run: python3 -I localisation_check.py

Output on 15 November 2026:

    1. min over t in [0, 50] (step 0.001) of C(t) - (sqrt(4 + t^2) - 1) = 0.000e+00 at t = 0.000  (must be >= 0)
    2. c(u):  c(0.0050) = 1.065108   c(0.0200) = 0.850512   c(0.0463) = 0.703641   (the note certifies c(0.0463) > 7/10)
    3. radius of a maximiser at u = 0.0463:  without the term 0.4812;  with c(u) 0.3698;  with 7/10 0.3704
    4. Wick monomial, u = 0.0463:  F(q) - F(0) = 0.051182  (review: 0.0512),  lower bound u c(u) = 0.032579,
       radius with the true term 0.2874  (review: 0.29)

Reading: the lower bound holds with room on the monomial (0.0326 against 0.0512) and brings the proved radius from
0.4812 to 0.370 (the report states it as 371/1000), for every remote cubic of energy at most 0.0463.  The radius needed
by STATUS.md 11.35 is 17/200 = 0.085.  The value in line 4 does not move in its seventh decimal when the grid is halved or doubled.
"""
import math

a, b = 699/1250, 179/1250


def ellip_e(m):
    """Complete elliptic integral of the second kind, parameter m in [0, 1), by the arithmetic-geometric mean."""
    x, y, c2 = 1.0, math.sqrt(1.0 - m), m
    s, w = c2/2, 1.0
    while abs(x - y) > 1e-15*x:
        x, y, c = (x + y)/2, math.sqrt(x*y), (x - y)/2
        s += w*c*c
        w *= 2
    return math.pi/(2*x)*(1.0 - s)


def mean_abs(x, z):
    """E_theta |x + z e^{i theta}| for x, z >= 0."""
    tot = x + z
    if tot == 0.0:
        return 0.0
    m = 4*x*z/(tot*tot)
    if m > 1.0 - 1e-14:
        return 2*tot/math.pi          # E(1) = 1
    return 2/math.pi*tot*ellip_e(m)


def simpson(f, lo, hi, n):
    h = (hi - lo)/n
    return (f(lo) + f(hi) + sum((4 if i % 2 else 2)*f(lo + i*h) for i in range(1, n)))*h/3


def c_of(u):
    def f(s):                         # t = s^2
        t = s*s
        ell = s*(a + b*t)
        return 2*math.exp(-t)/(math.sqrt(4*ell*ell + 44*u) + 2*ell)*2*s
    return simpson(f, 0.0, 6.5, 200000)


def monomial_shift(u, n=600):
    """F(q) - F(0) for q = sqrt(u/2) y (|y|^2 - 2): 2 E[E_theta|l + |q| e^{i theta}| - l] over T, |y|^2 ~ Exp(1)."""
    def outer(s):                     # T = s^2
        t = s*s
        ell = s*(a + b*t)

        def inner(r):                 # |y|^2 = r^2
            y2 = r*r
            return (mean_abs(ell, math.sqrt(u/2)*r*abs(y2 - 2)) - ell)*math.exp(-y2)*2*r
        return simpson(inner, 0.0, 6.0, n)*math.exp(-t)*2*s
    return 2*simpson(outer, 0.0, 6.0, n)


def main():
    worst, at = min((mean_abs(1.0, k/1000) - (math.sqrt(4 + (k/1000)**2) - 1), k/1000) for k in range(50001))
    print('1. min over t in [0, 50] (step 0.001) of C(t) - (sqrt(4 + t^2) - 1) = %.3e at t = %.3f  (must be >= 0)'
          % (worst, at))
    cs = {u: c_of(u) for u in (0.005, 0.02, 0.0463)}
    print('2. c(u):  ' + '   '.join('c(%.4f) = %.6f' % (u, cs[u]) for u in cs)
          + '   (the note certifies c(0.0463) > 7/10)')
    u, k1, k2 = 0.0463, 1074/625, 859/2500
    print('3. radius of a maximiser at u = 0.0463:  without the term %.4f;  with c(u) %.4f;  with 7/10 %.4f'
          % (math.sqrt(k1*u/k2), math.sqrt((k1 - cs[u])*u/k2), math.sqrt((k1 - 0.7)*u/k2)))
    shift = monomial_shift(u)
    print('4. Wick monomial, u = 0.0463:  F(q) - F(0) = %.6f  (review: 0.0512),  lower bound u c(u) = %.6f,'
          % (shift, u*cs[u]))
    print('   radius with the true term %.4f  (review: 0.29)' % math.sqrt((k1*u - shift)/k2))


if __name__ == '__main__':
    main()
