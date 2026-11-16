"""INDEPENDENT referee check of Lemma 2 of PROOF.tex, split into small exact identities (claude-b9ee worker, 16 Nov 2026).
Same conventions as indep_identities.py (unit phases reduced modulo f1^2 + f2^2 - 1, g1^2 + g2^2 - 1; no rational parametrisation).
  (W1) 1/2 ||V(p) - Mw||^2_{M^-1} = (2/sig)|X|^2 + cP |Z|^2,   X = l - L_U, Z = (p - p_U) + rho X          [identities (2.1)-(2.4)]
  (W2) h(l, p) = hhat + 4 l Re Z                                                                            [h affine in p]
  (W3) hhat = (Delta/sig) Ht                                                                                [identity (3.3), the crux]
  (W4) c t^2 - k (h + m t)^2 = (c - k m^2)(t - t*)^2 - k c h^2/(c - k m^2)                                 [identity (5.3)]
  (W5) (g/16) cP/(cP - g l^2) (Delta/sig)^2 2 sig = g Delta^2/(8 (sig - 2 g Delta l^2))                      [identity (5.4)]
  (W6) 4 |X|^2 = N = |2l - e2 f - e3 g|^2
Together with (G) (Lemma 1) these give Lemma 2: E_w(p) = (2/sig)|X|^2 + cP|Z|^2 - (g/16)(hhat + 4l Re Z)^2, minimised over Z."""
import sympy as sp
nu = sp.Symbol('nu', nonnegative=True); e2, e3 = sp.symbols('e2 e3', positive=True)
f1, f2, g1, g2, l, p1, p2, gm = sp.symbols('f1 f2 g1 g2 l p1 p2 gamma', real=True)
c_, k_, h_, m_, t_ = sp.symbols('c k h m t', real=True)
d2, d3 = e2 + nu, e3 + nu; D = sp.expand(d2 * d3 - nu ** 2); sig, dl = e2 + e3, e3 - e2; eta = dl / (e2 * e3)
c1 = -4 * nu * (d2 - d3) / (e2 * e3); c0 = d2 ** 2 - d3 ** 2 + nu * (d2 - d3) * (e2 ** 2 + e3 ** 2) / (e2 * e3)
UNIT = [f2 ** 2 + f1 ** 2 - 1, g2 ** 2 + g1 ** 2 - 1]
def mod_unit(expr):
    num, den = sp.fraction(sp.together(expr)); num = sp.expand(num)
    r = sp.rem(sp.Poly(num, f2), sp.Poly(UNIT[0], f2)).as_expr()
    r = sp.rem(sp.Poly(sp.expand(r), g2), sp.Poly(UNIT[1], g2)).as_expr()
    return sp.expand(r)
ok_all = True
def report(name, rem):
    global ok_all
    ok = (sp.simplify(rem) == 0); ok_all &= ok
    print(f"[{'OK' if ok else 'FAIL'}] {name}", flush=True)
U1 = (d2 * f1 - nu * g1, d2 * f2 - nu * g2); U2 = (d3 * g1 - nu * f1, d3 * g2 - nu * f2)
LU = ((U1[0] + U2[0]) / 2, (U1[1] + U2[1]) / 2); pU = ((U1[0] - U2[0]) / 2, (U1[1] - U2[1]) / 2)
X = (l - LU[0], -LU[1]); s = 2 * l; cP = sig / (2 * D); rho = dl / sig
Z = (p1 - pU[0] + rho * X[0], p2 - pU[1] + rho * X[1])
A = (l + p1 - U1[0], p2 - U1[1]); B = (l - p1 - U2[0], -p2 - U2[1])          # V(p) - M w
half_norm = (d3 * (A[0] ** 2 + A[1] ** 2) + d2 * (B[0] ** 2 + B[1] ** 2) + 2 * nu * (A[0] * B[0] + A[1] * B[1])) / (2 * D)
report("(W1) 1/2 ||V(p) - Mw||^2 = (2/sig)|X|^2 + cP|Z|^2", mod_unit(half_norm - (2 / sig * (X[0] ** 2 + X[1] ** 2) + cP * (Z[0] ** 2 + Z[1] ** 2))))
h = lambda q1: 4 * l * q1 - c0 - c1 * l ** 2
hhat = h(pU[0] - rho * X[0])
report("(W2) h(l, p) = hhat + 4 l Re Z", mod_unit(h(p1) - (hhat + 4 * l * Z[0])))
Ht = 2 * s * (f1 - g1) + eta * (sig ** 2 - s ** 2)
report("(W3) hhat = (Delta/sig) Ht", mod_unit(hhat - D / sig * Ht))
ts = k_ * m_ * h_ / (c_ - k_ * m_ ** 2)
report("(W4) c t^2 - k (h + m t)^2 = (c - k m^2)(t - t*)^2 - k c h^2/(c - k m^2)",
       sp.cancel(c_ * t_ ** 2 - k_ * (h_ + m_ * t_) ** 2 - ((c_ - k_ * m_ ** 2) * (t_ - ts) ** 2 - k_ * c_ * h_ ** 2 / (c_ - k_ * m_ ** 2))))
report("(W5) kappa", sp.cancel(gm / 16 * cP / (cP - gm * l ** 2) * (D / sig) ** 2 * 2 * sig - gm * D ** 2 / (8 * (sig - 2 * gm * D * l ** 2))))
report("(W6) 4|X|^2 = |2l - e2 f - e3 g|^2", mod_unit(4 * (X[0] ** 2 + X[1] ** 2) - ((s - e2 * f1 - e3 * g1) ** 2 + (e2 * f2 + e3 * g2) ** 2)))
report("(W7) c - k m^2 with c = cP, k = g/16, m = 4l equals (sig - 2 g Delta l^2)/(2 Delta)", sp.cancel(cP - gm / 16 * 16 * l ** 2 - (sig - 2 * gm * D * l ** 2) / (2 * D)))
print("ALL SPLIT IDENTITIES VERIFIED" if ok_all else "SOME SPLIT IDENTITY FAILED", flush=True)
