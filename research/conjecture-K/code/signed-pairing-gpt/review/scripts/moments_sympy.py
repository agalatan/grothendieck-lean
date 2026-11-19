#!/usr/bin/env python3
# Reviewer (exact, sympy): the identities (5), (6), (8), (10) of PROOFS.md for SYMBOLIC eigenvalues l1, l2, l3 (three
# independent parameters, so every coefficient of u^2, s4, s3, ... is tested, not only the equal family), the null
# identities E[conj(N) q V^j] = 0, j <= 3, and Lemma 2 for h = v, v^2, v^3.
import sympy as sp
l = sp.symbols('l1:4', real=True); S = sp.Symbol('S'); T = sp.symbols('T1:4')
def E(expr):
    """expectation over independent Exp(1) variables S, T1, T2, T3:  E[x^n] = n!"""
    P = sp.Poly(sp.expand(expr), S, *T)
    tot = 0
    for mon, co in P.terms():
        f = co
        for k in mon: f *= sp.factorial(k)
        tot += f
    return sp.expand(tot)
B = sum(l[j] * (T[j] - 1) for j in range(3)); C = sum(l[j] ** 2 * T[j] for j in range(3))
u = sum(x ** 2 for x in l); s3 = sum(x ** 3 for x in l); s4 = sum(x ** 4 for x in l)
eq = lambda a, b, name: (sp.expand(a - b) == 0) or (_ for _ in ()).throw(AssertionError(name))
eq(E(B), 0, 'EB'); eq(E(B ** 2), u, 'EB2'); eq(E(B ** 3), 2 * s3, 'EB3'); eq(E(B ** 4), 3 * u ** 2 + 6 * s4, 'EB4')
eq(E(C), u, 'EC'); eq(E(C ** 2), u ** 2 + s4, 'EC2'); eq(E(B * C), s3, 'EBC'); eq(E(B ** 2 * C), u ** 2 + 2 * s4, 'EB2C')
print('(5): all eight moments of B, C hold for symbolic l1, l2, l3')
# q = X B: every pairing below has the form E[conj(X a(S,Y)) X b(S,Y)] = E[S a b]
V = S * B ** 2
eq(E(V), u, 'u'); eq(E(V ** 2) - 2 * u ** 2, 4 * u ** 2 + 12 * s4, 'delta')
print('(6): E|q|^2 = u, delta = 4u^2 + 12 s4')
Z = 2 * S * C - u; N = 2 * B ** 2 + 4 * C - 4 * S * C
eq(E(S * Z * Z), 17 * u ** 2 + 24 * s4, '|Z|^2'); eq(E(S * Z * B), 4 * s3, '<Z,q>')
eq(E(S * Z * N), -22 * u ** 2 - 16 * s4, '<Z,N>'); eq(E(S * N * N), 44 * u ** 2 + 40 * s4, '|N|^2'); eq(E(S * N * B), 0, '<N,q>')
print('(8), (10): ||Z||^2, <Z,q>, <Z,N>, ||N||^2, <N,q> hold')
for j in range(0, 4): eq(E(S * N * B * V ** j), 0, 'null %d' % j)
print('Lemma 3 on polynomials: E[conj(N) q V^j] = 0 for j = 0, 1, 2, 3')
# Lemma 2: E[conj(X) q h(V)] = <Z, q k'(V)>;  h = v^n:  k(v) = E (v + u tau)^n,  k' = sum_i C(n,i) i v^(i-1) u^(n-i) (n-i)!
for n in (1, 2, 3):
    kp = sum(sp.binomial(n, i) * i * V ** (i - 1) * u ** (n - i) * sp.factorial(n - i) for i in range(1, n + 1))
    eq(E(S * B * V ** n), E(S * Z * B * kp), 'Lemma 2, h = v^%d' % n)
print('Lemma 2 (content representation) for h = v, v^2, v^3')
eq(E(S * B * V), 4 * s3, 'content at h=v')
print('content at h(v) = v: c_X = 4 s3, so ||c||^2/(delta Omega_hat) = 16 s3^2/((4u^2+12 s4)(3u/4)) = 16 zeta/(3 + 9 kappa)')
k, z = sp.symbols('kappa zeta', positive=True)
Th = (17 + 24 * k - (22 + 16 * k) ** 2 / (44 + 40 * k) + 16 * z) / (6 + 18 * k)
G = (33 + 217 * k + 168 * k ** 2) / (3 * (1 + 3 * k) * (11 + 10 * k))
assert sp.simplify(Th.subs(z, k) - G) == 0
assert sp.simplify(sp.Rational(5, 3) - G - (22 - 2 * k - 18 * k ** 2) / (3 * (1 + 3 * k) * (11 + 10 * k))) == 0
assert sp.simplify(sp.Rational(13, 10) - G - (99 - 493 * k - 510 * k ** 2) / (30 * (1 + 3 * k) * (11 + 10 * k))) == 0
print('(11) -> (12) at zeta = kappa;  5/3 - G = (22 - 2k - 18k^2)/(3(1+3k)(11+10k));  13/10 - G = (99 - 493k - 510k^2)/(30(1+3k)(11+10k))')
print('G(1) =', G.subs(k, 1), '=', float(G.subs(k, 1)), '; largest kappa with G <= 13/10:', [float(r) for r in sp.solve(99 - 493 * k - 510 * k ** 2, k)])
print('Theta(kappa, 0) = (33 + 129k + 88k^2)/(3(1+3k)(11+10k)):', sp.simplify(Th.subs(z, 0) - (33 + 129 * k + 88 * k ** 2) / (3 * (1 + 3 * k) * (11 + 10 * k))) == 0,
      '; its range on (0,1]: from 1 down to', float(Th.subs({z: 0, k: 1})), '(min %.5f)' % min(float(Th.subs({z: 0, k: x / 1000})) for x in range(1, 1001)))
# limit-model moments (Lemma 10)
Tm = sp.Symbol('T1')
E1 = lambda e: sum(co * sp.factorial(m[0]) for m, co in sp.Poly(sp.expand(e), Tm).terms())
assert E1(Tm * (3 * Tm ** 2 - 2 * Tm - 2) ** 2) == 764 and E1(Tm * (3 * Tm ** 2 - 2 * Tm - 2) * (Tm - 2)) == 32
assert E1(Tm * (Tm - 2) ** 2) == 2 and E1(Tm ** 2 * (Tm - 2) ** 4) - 2 * 4 == 168 and E1(Tm ** 2 * (Tm - 2) ** 3) == 32
print('Lemma 10: ||C_0||^2 = 764, <C_0, p> = 32, E|p|^2 = 2, delta(p) = 168, E[conj(X) p |p|^2] = 32; ratio at h = v: 1024/(168*3/2) =', sp.Rational(1024, 252))
print('ALL OK')
