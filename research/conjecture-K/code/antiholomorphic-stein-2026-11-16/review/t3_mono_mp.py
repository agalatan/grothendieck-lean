"""Theorem 3 on the Wick monomial q = c X(|X|^2-2)/sqrt2 (u = |c|^2) for NON-SMOOTH profiles, by mpmath (30 digits),
with the integration split at every kink.  R = |X|^2 ~ Exp(1), V = u R (R-2)^2 / 2,
  lhs = E[conj(X) q h(V)]/c                 = E[ R(R-2)/sqrt2 * h(V) ],
  rhs = E[conj(X) k'(V)(conj(q) a + q x)]/c = u E[ k'(V) (R^2 (R-2)(R-1) + R(R-2)(R^2/2 - 1))/sqrt2 ],
with a = c^2 X^2 (R-1), x = u (R^2/2 - 1) (derived by hand; they agree with NOTE section 2)."""
import mpmath as mp
mp.mp.dps = 30
u = mp.mpf("0.0463"); v0 = mp.mpf("0.02"); s2 = mp.sqrt(2)
V = lambda R: u * R * (R - 2) ** 2 / 2
roots = sorted(mp.findroot(lambda R: V(R) - v0, g) for g in (0.3, 1.12, 2.58))
pts = [0] + roots[:2] + [2] + roots[2:] + [6, 12, 30, 80]
PROF = {
 "sqrt(v)":     (lambda v: mp.sqrt(v), lambda v: mp.sqrt(mp.pi) / (2 * mp.sqrt(u)) * mp.exp(v / u) * mp.erfc(mp.sqrt(v / u))),
 "|v - v0|":    (lambda v: abs(v - v0), lambda v: mp.mpf(1) if v >= v0 else -1 + 2 * mp.exp(-(v0 - v) / u)),
 "1[v >= v0]":  (lambda v: mp.mpf(1) if v >= v0 else mp.mpf(0), lambda v: mp.mpf(0) if v >= v0 else mp.exp(-(v0 - v) / u) / u),
 "min(v, v0)":  (lambda v: min(v, v0), lambda v: mp.mpf(0) if v >= v0 else 1 - mp.exp(-(v0 - v) / u)),
 "exp(-20 v)":  (lambda v: mp.exp(-20 * v), lambda v: -20 * mp.exp(-20 * v) / (1 + 20 * u)),
}
for name, (h, kp) in PROF.items():
    # check k - u k' = h at a few points through k = E h(v + u tau) by quadrature
    for v in (mp.mpf("0.004"), mp.mpf("0.0199"), mp.mpf("0.07")):
        brk = sorted(set([mp.mpf(0)] + ([(v0 - v) / u] if v < v0 else []) + [mp.mpf(40), mp.mpf(120)]))
        k = mp.quad(lambda t: mp.exp(-t) * h(v + u * t), brk)
        assert abs(k - u * kp(v) - h(v)) < mp.mpf(10) ** (-22), (name, v, k - u * kp(v) - h(v))
    lhs = mp.quad(lambda R: mp.exp(-R) * R * (R - 2) / s2 * h(V(R)), pts)
    rhs = u * mp.quad(lambda R: mp.exp(-R) * kp(V(R)) * (R ** 2 * (R - 2) * (R - 1) + R * (R - 2) * (R ** 2 / 2 - 1)) / s2, pts)
    print("%-11s lhs = %s   rhs = %s   diff = %s" % (name, mp.nstr(lhs, 20), mp.nstr(rhs, 20), mp.nstr(lhs - rhs, 3)))
