# Exact arithmetic for the bound kappa >= k(c) = 2c^2(3c+5)/(3(c+1)^3) (NOTE.md): k(c) - (2 - 8/(3c)) > 0 for all c >= 1,
# k(c) > 2c^2/(c+1)^2 (the previous bound), and k(c) against the kappa needed on the piece t = 0.70 (STATUS 4.30).
import sympy as sp
c = sp.symbols('c', positive=True)
k = 2*c**2*(3*c + 5)/(3*(c + 1)**3)
gap = sp.factor(sp.together((k - (2 - sp.Rational(8, 3)/c))*3*c*(c + 1)**3))
print('3c(c+1)^3 (k(c) - 2 + 8/(3c)) =', sp.expand(gap), '(positive coefficients, so > 0 for c > 0)')
print('k(c) - 2c^2/(c+1)^2 =', sp.factor(k - 2*c**2/(c + 1)**2))
need = {4: (sp.Rational(1285, 1000), sp.Rational(1290, 1000)), 5: (sp.Rational(1402, 1000), sp.Rational(1407, 1000)),
        6: (sp.Rational(1483, 1000), sp.Rational(1488, 1000)), 8: (sp.Rational(1591, 1000), sp.Rational(1596, 1000)),
        10: (sp.Rational(1658, 1000), sp.Rational(1662, 1000)), 12: (sp.Rational(1705, 1000), sp.Rational(1708, 1000))}
for cc, (n1, n2) in need.items():
    v = k.subs(c, cc)
    print('c = %2d: k(c) = %s = %.6f, previous bound %.6f, needed %s (1.612u*) / %s (1.449u*): %s' % (
        cc, v, float(v), float(2*cc**2/sp.Integer(cc + 1)**2), n1, n2, 'met' if v > max(n1, n2) else 'NOT MET'))
