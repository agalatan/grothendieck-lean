# Review of codex-a786's third content-law package ("shared trace"), by a review worker of claude-b9ee, 16 Nov 2026.
# Own symbolic checks (sympy; label C for my own arithmetic) of PROOFS.md sections 2-6 and SHARED_HOLOMORPHIC.md, and a
# 30-digit numerical check (N) of the signed Gamma identity (20), whose printed form is wrong.
#   S ~ Gamma(d, 1):  E S^k = d(d+1)...(d+k-1),  E S^-1 = 1/(d-1),  E S^-2 = 1/((d-1)(d-2)).
#   R = S^2 - 2S + d,  A_lam = R + lam S^2,  u = E A,  L = Var A,  N = (S-d)(A-u) + S A'.
# usage: exact_checks3.py
import sympy as sp
import mpmath as mp

def ok(cond, msg):
    print(('  ok   ' if cond else '  FAIL ') + msg); assert cond, msg

d, S, lam, x = sp.symbols('d S lam x')
def E(poly):
    """expectation of a polynomial in S (coefficients in d, lam) under Gamma(d, 1); negative powers -1, -2 allowed."""
    poly = sp.expand(poly); out = 0
    for term in sp.Add.make_args(poly):
        c, k = term.as_coeff_exponent(S)
        k = int(k)
        if k >= 0: mom = sp.prod([d + j for j in range(k)])
        elif k == -1: mom = 1 / (d - 1)
        elif k == -2: mom = 1 / ((d - 1) * (d - 2))
        else: raise ValueError(k)
        out += c * mom
    return sp.simplify(out)
Z = lambda e: sp.simplify(sp.expand(e)) == 0
def shifted_coeffs(p, var, shift):
    return sp.Poly(sp.expand(p.subs(var, shift + x)), x).all_coeffs()
def nonneg_in(p, shift):
    """all coefficients of p(d = shift + x, lam) as a polynomial in (x, lam) are >= 0."""
    return all(c >= 0 for c in sp.Poly(sp.expand(p.subs(d, shift + x)), x, lam).coeffs())

print('1. PROOFS sections 2-4: the single block')
R = S ** 2 - 2 * S + d
N = sp.expand((S - d) * (R - d ** 2) + S * sp.diff(R, S))
L = 2 * d * (2 * d ** 2 + d + 1)
ok(Z(E(R) - d ** 2) and Z(E(R ** 2) - d ** 4 - L), 'E R = d^2 (= u_d), Var R = 2d(2d^2 + d + 1) (= L_d); delta = 2L, chi = 2L/u^2 = 4(2d^2+d+1)/d^3')
ok(Z(N - (S ** 3 - d * S ** 2 - (d - 1) * (d - 2) * S + d ** 2 * (d - 1))), '(16): N_d = S^3 - d S^2 - (d-1)(d-2) S + d^2(d-1)')
ok(Z(E(N) - 4 * d ** 2) and Z(E(N ** 2) - 2 * d * (12 * d ** 3 + 81 * d ** 2 + 109 * d + 50)), '(17): E N_d = 4d^2, E N_d^2 = 2d(12d^3 + 81d^2 + 109d + 50)')
Qd = S ** 4 + (2 - 2 * d) * S ** 3 + (-d ** 2 + d) * S ** 2 + (4 * d ** 3 - 8 * d ** 2 + 4 * d) * S - d ** 4 + 5 * d ** 3 - 4 * d ** 2 - 4 * d + 4
ok(Z(N ** 2 - R * Qd - (d - 1) * (d ** 2 - 2) ** 2 * (d - 2 * S)), '(21): N_d^2 = R Q_d + (d-1)(d^2-2)^2 (d - 2S)')
Bpol = d ** 4 - d ** 3 + 14 * d ** 2 + 6 * d + 4
ok(Z(E(Qd) - Bpol), 'E Q_d = d^4 - d^3 + 14d^2 + 6d + 4 = B^pol_d')
ok(Z((S - d) ** 2 - R - (d - 1) * (d - 2 * S)), '(S-d)^2 = R + (d-1)(d - 2S)')
ok(Z(R - (d - 1) * S ** 2 / d - (S - d) ** 2 / d), 'R - ((d-1)/d) S^2 = (S-d)^2/d, hence 1/R <= d/((d-1) S^2)')
Binv = 2 * d * (12 * d ** 3 - 27 * d ** 2 + 12 * d - 4) / ((d - 2) * (d - 1)); binv = d * (d + 2) / ((d - 2) * (d - 1) ** 2)
ok(Z(d / (d - 1) * E(N ** 2 / S ** 2) - Binv) and Z(d / (d - 1) * E((S - d) ** 2 / S ** 2) - binv), '(19): (d/(d-1)) E[N^2/S^2] = B^inv_d, (d/(d-1)) E[(S-d)^2/S^2] = d(d+2)/((d-2)(d-1)^2)')

print('2. the signed Gamma identity (20)  [30-digit quadrature]')
mp.mp.dps = 30
worst = 0
for dd in (2, 3, 4, 5, 8, 16):
    dens = lambda s: s ** (dd - 1) * mp.exp(-s) / mp.gamma(dd)
    Rf = lambda s: s * s - 2 * s + dd; Rp = lambda s: 2 * s - 2
    Ex = lambda f: mp.quad(lambda s: dens(s) * f(s), [0, 1, dd, 3 * dd, 10 * dd, 60 * dd])
    lhs = Ex(lambda s: (dd - 2 * s) / Rf(s)); printed = -Ex(lambda s: s * (Rf(s) + Rp(s)) / Rf(s) ** 2); right = -Ex(lambda s: s * (Rf(s) - Rp(s)) / Rf(s) ** 2)
    worst = max(worst, abs(lhs - right))
    print('     d = %2d: E[(d-2S)/R] = %s ; printed right side -E[S(R+R\')/R^2] = %s ; correct right side -E[S(R-R\')/R^2] = %s' % (dd, mp.nstr(lhs, 12), mp.nstr(printed, 12), mp.nstr(right, 12)))
    assert abs(lhs - printed) > 0.01 and lhs < 0
ok(worst < mp.mpf(10) ** -20, 'E[(d-2S)/R] = -E[S(R - R\')/R^2], with R - R\' = (S-2)^2 + d - 2 >= 0 for d >= 2: the sign claim of (20) holds, its printed middle and right members do not')
ok(Z((R - sp.diff(R, S)) - ((S - 2) ** 2 + d - 2)), 'R - R\' = (S-2)^2 + d - 2')

print('3. PROOFS sections 1, 5, 6: the constants')
den = 3 * d * L                                          # 3 d L_d = 6 d^2 (2d^2 + d + 1)
Tpol = (Bpol + 16 * d ** 2) / den; Tinv = (Binv + 16 * d ** 2) / den
ok(Z(Tpol - (d ** 4 - d ** 3 + 30 * d ** 2 + 6 * d + 4) / (6 * d ** 2 * (2 * d ** 2 + d + 1))) and Z(Tinv - (20 * d ** 3 - 51 * d ** 2 + 28 * d - 4) / (3 * d * (d - 2) * (d - 1) * (2 * d ** 2 + d + 1))),
   '(4): Theta^pol = (B^pol + 16d^2)/(3dL), Theta^inv = (B^inv + 16d^2)/(3dL)')
th = lambda k: min([Tpol.subs(d, k)] + ([Tinv.subs(d, k)] if k >= 4 else []))
vals = {k: sp.nsimplify(th(k)) for k in (2, 3, 4, 5, 8, 16)}
ok(vals == {2: sp.Rational(6, 11), 3: sp.Rational(173, 594), 4: sp.Rational(175, 888), 5: sp.Rational(1361, 10080), 8: sp.Rational(257, 4932), 16: sp.Rational(17327, 1333080)},
   'Theta_2, 3, 4, 5, 8, 16 = 6/11, 173/594, 175/888, 1361/10080, 257/4932, 17327/1333080')
low = lambda k: sp.Rational(16, 3 * (2 * k * k + k + 1))
ok([low(k) for k in (2, 3, 4, 5, 8)] == [sp.Rational(16, 33), sp.Rational(8, 33), sp.Rational(16, 111), sp.Rational(2, 21), sp.Rational(16, 411)] and all(low(k) <= th(k) for k in range(2, 60)),
   'h(v) = v: ratio 16/(3(2d^2+d+1)) = 16/33, 8/33, 16/111, 2/21, 16/411 at d = 2, 3, 4, 5, 8; below Theta_d for d = 2..59')
print('     Theta_d / (h = v value): ' + ', '.join('d=%d: %.3f' % (k, float(th(k) / low(k))) for k in (2, 3, 4, 5, 8, 16, 64)) + '  (limit 10/3 : 8/3 = 1.25)')
c26 = shifted_coeffs(173 * 6 * d ** 2 * (2 * d ** 2 + d + 1) - 594 * (d ** 4 - d ** 3 + 30 * d ** 2 + 6 * d + 4), d, 3)
ok(c26 == [1482, 19416, 77934, 99864, 0], '(26): 173 [6d^2(2d^2+d+1)] - 594 [d^4 - d^3 + 30d^2 + 6d + 4] at d = 3 + x is 1482x^4 + 19416x^3 + 77934x^2 + 99864x, so sup_{d>=3} Theta_d = 173/594')
# the second requirement theta >= b_d/(3d)
ok(all(c >= 0 for c in shifted_coeffs(d ** 4 - 5 * d ** 3 + 28 * d ** 2 + 4 * d + 4, d, 2)), '1/(3d) <= Theta^pol_d for d >= 2 (b_d <= 1): d^4 - 5d^3 + 28d^2 + 4d + 4 >= 0, coefficients at d = 2 + x nonnegative')
p_inv = sp.expand((d - 1) * (20 * d ** 3 - 51 * d ** 2 + 28 * d - 4) - (d + 2) * d * (2 * d ** 2 + d + 1))
ok(all(c >= 0 for c in shifted_coeffs(p_inv, d, 4)) and p_inv.subs(d, 3) < 0, 'b^inv_d/(3d) <= Theta^inv_d for d >= 4 (coefficients at d = 4 + x nonnegative); it fails at d = 3, where Theta^inv is not used')
p16 = d ** 6 - 4 * d ** 5 - 5 * d ** 4 + 16 * d ** 3 - 10 * d ** 2 + 8 * d + 8
diff_ = sp.together(Tpol - Tinv); num, dn = sp.fraction(diff_)
ok(Z(num / dn - p16 / (6 * d ** 2 * (d - 2) * (d - 1) * (2 * d ** 2 + d + 1))) and all(c > 0 for c in shifted_coeffs(p16, d, 5)) and Tinv.subs(d, 4) > Tpol.subs(d, 4),
   '(16) of SHARED_HOLOMORPHIC: Theta^pol - Theta^inv = (d^6 - 4d^5 - 5d^4 + 16d^3 - 10d^2 + 8d + 8)/(6d^2(d-2)(d-1)(2d^2+d+1)) > 0 for d >= 5; at d = 4 Theta^pol is the smaller')
ok(Z(sp.limit(Tinv * d ** 2, d, sp.oo) - sp.Rational(10, 3)) and Z(sp.limit(low(1) * 0 + 16 / (3 * (2 * d ** 2 + d + 1)) * d ** 2, d, sp.oo) - sp.Rational(8, 3)), 'd^2 Theta^inv -> 10/3, d^2 (h = v value) -> 8/3')
ok(Z(E((S - d) * R) - 2 * d ** 2), '(27): E[(S-d) R] = 2d^2, so c_j = 4 a_j^3 d_j^(3/2) for h(v) = v')

print('4. SHARED_HOLOMORPHIC.md: every identity in (d, lambda), and the certificates')
A = R + lam * S ** 2; u = d ** 2 + lam * d * (d + 1)
ok(Z(E(A) - u), '(3): u_lam = d^2 + lam d(d+1)')
Ll = 2 * d * ((2 * d ** 2 + d + 1) + (4 * d ** 2 + 6 * d + 2) * lam + (2 * d ** 2 + 5 * d + 3) * lam ** 2)
ok(Z(E(A ** 2) - u ** 2 - Ll), '(3): L_lam = Var A_lam')
Nl = sp.expand((S - d) * (A - u) + S * sp.diff(A, S))
ok(Z(E(Nl) - 4 * u), '(3): E N_lam = 4 u_lam')
Qq, J = sp.div(sp.Poly(sp.expand(Nl ** 2), S), sp.Poly(R, S))
Cdl = (d ** 2 - 2 + lam * (d ** 2 + 4 * d - 8)) * ((d - 1) * (d ** 2 - 2) + lam * (d ** 3 + d ** 2 - 8 * d + 8)); J0 = -2 * d ** 2 * lam * (d - 2) * (d ** 2 - 2 + lam * (d ** 2 + 2 * d - 4))
ok(Z(J.as_expr() - Cdl * (d - 2 * S) - J0), '(8), (9): N_lam^2 = R Q + C_{d,lam} (d - 2S) + J_0')
Bl = Bpol + (2 * d ** 4 + 6 * d ** 3 + 16 * d ** 2 + 24 * d + 32) * lam + (d ** 4 + 7 * d ** 3 + 14 * d ** 2 - 14 * d + 64) * lam ** 2
ok(Z(E(Qq.as_expr()) - Bl), '(6), (7): E Q = B_{d,lam}')
ok(nonneg_in(d ** 2 - 2 + lam * (d ** 2 + 4 * d - 8), 2) and nonneg_in((d - 1) * (d ** 2 - 2) + lam * (d ** 3 + d ** 2 - 8 * d + 8), 2) and nonneg_in(d ** 2 - 2 + lam * (d ** 2 + 2 * d - 4), 2),
   'the three brackets are polynomials in (d - 2, lam) with nonnegative coefficients: C_{d,lam} >= 0 and J_0 <= 0 for d >= 2, lam >= 0')
numl = Bl + 16 * u; denl = 3 * d * Ll
cert11 = {2: (6, 11, 800, 1220), 3: (173, 594, 69336, 88020), 4: (175, 888, 91200, 92832)}
for k, (a_, b_, c1, c2) in cert11.items():
    p = sp.Poly(sp.expand((a_ * denl - b_ * numl).subs(d, k)), lam)
    ok(p.all_coeffs() == [c2, c1, 0], '(11), d = %d: %d (3dL) - %d (B + 16u) = %d lam + %d lam^2 >= 0' % (k, a_, b_, c1, c2))
p12 = sp.Poly(sp.expand((173 * denl - 594 * numl).subs(d, 3 + x)), lam)
c12 = [sp.Poly(c, x).all_coeffs() for c in reversed(p12.all_coeffs())]
ok(c12 == [[1482, 19416, 77934, 99864, 0], [2964, 38232, 167100, 266688, 69336], [1482, 18816, 84114, 165024, 88020]], '(12): the three coefficient polynomials at d = 3 + x are as printed, all nonnegative: 173/594 for every d >= 3, lam >= 0')
D0 = (d - 1) * (d - 2)
Edl = (24 * d ** 4 - 78 * d ** 3 + 78 * d ** 2 - 32 * d + 8) + (48 * d ** 4 - 108 * d ** 3 + 36 * d ** 2 + 24 * d) * lam + (24 * d ** 4 - 30 * d ** 3 - 18 * d ** 2 + 36 * d) * lam ** 2
ok(Z(D0 * E(Nl ** 2 / S ** 2) - Edl), '(13): D_0 E[N_lam^2/S^2] = E_{d,lam}')
ok(Z(A - (lam + (d - 1) / d) * S ** 2 - (S - d) ** 2 / d), 'A_lam - (lam + (d-1)/d) S^2 = (S-d)^2/d >= 0')
Fl = ((40 * d ** 6 - 82 * d ** 5 - 67 * d ** 4 + 161 * d ** 3 - 40 * d ** 2 - 64 * d + 24) + (80 * d ** 6 - 84 * d ** 5 - 246 * d ** 4 + 148 * d ** 3 + 100 * d ** 2 - 118 * d + 12) * lam
      + (40 * d ** 6 - 2 * d ** 5 - 139 * d ** 4 - 21 * d ** 3 + 64 * d ** 2 - 12 * d) * lam ** 2)
ivN = 20 * d ** 3 - 51 * d ** 2 + 28 * d - 4; ivD = 3 * d * D0 * (2 * d ** 2 + d + 1)
n2 = d * Edl + 16 * u * D0 * (d - 1 + d * lam); d2 = denl * D0 * (d - 1 + d * lam)
ok(Z(ivN * d2 - ivD * n2 - 6 * d ** 2 * lam * D0 * Fl), '(14), (15): Theta^inv x (denominator) - (numerator) x (denominator of Theta^inv) = 6 d^2 lam (d-2)(d-1) F(d, lam)')
ok(all(c > 0 for c in sp.Poly(sp.expand(Fl.subs(d, 4 + x)), x, lam).coeffs()), 'all coefficients of F(4 + x, lam) are positive: the inverse-moment bound with lam is below Theta^inv_d for d >= 4, lam >= 0')
ok(Z(E((S - d) * A) - 2 * u), 'h(v) = v with the holomorphic companion: E[(S-d) A_lam] = 2 u_lam, squared content 16 a^6 u_lam^2/d')
print('ALL CHECKS PASSED')
