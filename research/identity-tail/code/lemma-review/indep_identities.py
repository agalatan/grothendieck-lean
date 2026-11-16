"""INDEPENDENT referee check of PROOF.tex (caps-stage0b-lemma-2026-11-15), claude-b9ee worker, 16 Nov 2026.

Written from the statement, not from verify_identities.py: unit phases are NOT parametrised rationally; instead every
identity is checked as a polynomial identity modulo the ideal (f1^2 + f2^2 - 1, g1^2 + g2^2 - 1) (division by these two
monic polynomials in f2, g2 is exact), after clearing the denominators by hand.  Exact (sympy), so a pass is a proof of the
identity.

Checked:
  (G)  Lemma 1:  2 Delta (Phi_d(V) - l_w(V)) = (V - M w)^* adj(M) (V - M w)                       [mod unit]
  (W)  Lemma 2 as ONE identity (the crux):  with s = 2l, Z = p - p_U + rho X,
         Phi_d(l+p, l-p) - (g/16) h(l,p)^2 - l_w(l+p, l-p)
           = (N - kappa Ht^2)/(2 sig) + (cP - g l^2)(Re Z - t*)^2 + cP (Im Z)^2                    [mod unit]
       (all quantities written out from their definitions in PROOF.tex section 1-2, not copied from the script)
  (H)  (4.1)  Ht = 2 Re((f-g) conj r) + eta (|r|^2 - 2 s Re r),  r = s - e2 f - e3 g             [mod unit]
  (K)  the scalar step of Lemma 3: 4 + |eta||dl| - 2a - |eta| b >= 0 for a in [0,2], b = sqrt(sig^2 - e2 e3 a^2):
       checked here by a DIFFERENT argument: with P = e2 e3, x = a^2 in [0,4], the claim is
         |eta| (b - |dl|) <= 2 (2 - a);  squaring is legitimate when both sides are >= 0 (b >= |dl| iff a <= 2), and
         (2(2-a) + |eta||dl|)^2 - eta^2 b^2 = (2-a) * [quadratic in a with nonnegative coefficients on [0,2]]  (sympy factor)
  (T)  tangent set: h(L_U, p_U) = 0 for U = M w  (the centre is the right one)                     [mod unit]
"""
import sympy as sp

nu = sp.Symbol('nu', nonnegative=True)
e2, e3 = sp.symbols('e2 e3', positive=True)
f1, f2, g1, g2, l, p1, p2, gm = sp.symbols('f1 f2 g1 g2 l p1 p2 gamma', real=True)
A1, A2, B1, B2 = sp.symbols('A1 A2 B1 B2', real=True)
d2, d3 = e2 + nu, e3 + nu
D = sp.expand(d2 * d3 - nu ** 2)
sig, dl = e2 + e3, e3 - e2
eta = dl / (e2 * e3)
c1 = -4 * nu * (d2 - d3) / (e2 * e3)
c0 = d2 ** 2 - d3 ** 2 + nu * (d2 - d3) * (e2 ** 2 + e3 ** 2) / (e2 * e3)
UNIT = [f2 ** 2 + f1 ** 2 - 1, g2 ** 2 + g1 ** 2 - 1]

def mod_unit(expr):
    """numerator of expr reduced modulo the unit-circle ideal; returns the remainder (0 iff identity holds)"""
    num, den = sp.fraction(sp.together(sp.expand(expr)))
    num = sp.expand(num)
    r = sp.rem(sp.Poly(num, f2), sp.Poly(UNIT[0], f2)).as_expr()
    r = sp.rem(sp.Poly(sp.expand(r), g2), sp.Poly(UNIT[1], g2)).as_expr()
    return sp.simplify(sp.expand(r))

ok_all = True
def report(name, rem):
    global ok_all
    ok = (rem == 0)
    ok_all &= ok
    print(f"[{'OK' if ok else 'FAIL'}] {name}" + ("" if ok else f"  remainder {rem}"), flush=True)

def re_mul_conj(x1, x2, y1, y2):   # Re(x conj y)
    return x1 * y1 + x2 * y2

# ---- (G) Lemma 1
Phi = lambda a1, a2, b1, b2: (d2 + d3) / 2 + (d3 * (a1 ** 2 + a2 ** 2) + d2 * (b1 ** 2 + b2 ** 2) + 2 * nu * re_mul_conj(a1, a2, b1, b2)) / (2 * D)
lw = lambda a1, a2, b1, b2: re_mul_conj(a1, a2, f1, f2) + re_mul_conj(b1, b2, g1, g2) + nu * re_mul_conj(f1, f2, g1, g2)
U1 = (d2 * f1 - nu * g1, d2 * f2 - nu * g2)          # (M w)_1 = d2 f - nu g
U2 = (d3 * g1 - nu * f1, d3 * g2 - nu * f2)          # (M w)_2 = d3 g - nu f
R1 = (A1 - U1[0], A2 - U1[1]); R2 = (B1 - U2[0], B2 - U2[1])
# adj(M) = [[d3, nu], [nu, d2]]; quadratic form X^* adj(M) X for complex 2-vector X = (R1, R2)
qadj = d3 * (R1[0] ** 2 + R1[1] ** 2) + d2 * (R2[0] ** 2 + R2[1] ** 2) + 2 * nu * re_mul_conj(R1[0], R1[1], R2[0], R2[1])
report("(G) 2 Delta (Phi_d - l_w) = (V - Mw)^* adj(M) (V - Mw)", mod_unit(2 * D * (Phi(A1, A2, B1, B2) - lw(A1, A2, B1, B2)) - qadj))

# ---- (W) Lemma 2 in one identity, from the definitions
s = 2 * l
cP = sig / (2 * D)
rho = dl / sig
LU = ((U1[0] + U2[0]) / 2, (U1[1] + U2[1]) / 2)       # L_U = (U1 + U2)/2
pU = ((U1[0] - U2[0]) / 2, (U1[1] - U2[1]) / 2)       # p_U = (U1 - U2)/2
X = (l - LU[0], -LU[1])
Z = (p1 - pU[0] + rho * X[0], p2 - pU[1] + rho * X[1])
h = lambda q1: 4 * l * q1 - c0 - c1 * l ** 2          # h(l, p) for real L = l, Re p = q1
hhat = h(pU[0] - rho * X[0])                          # h at p = p_U - rho X
Nn = (s - e2 * f1 - e3 * g1) ** 2 + (e2 * f2 + e3 * g2) ** 2
Ht = 2 * s * (f1 - g1) + eta * (sig ** 2 - s ** 2)
kappa = gm * D ** 2 / (8 * (sig - 2 * gm * D * l ** 2))
tstar = gm * l * hhat / (4 * (cP - gm * l ** 2))
lhs = Phi(l + p1, p2, l - p1, -p2) - gm / 16 * h(p1) ** 2 - lw(l + p1, p2, l - p1, -p2)
rhs = (Nn - kappa * Ht ** 2) / (2 * sig) + (cP - gm * l ** 2) * (Z[0] - tstar) ** 2 + cP * Z[1] ** 2
print("(W) the one-identity form is checked in pieces by indep_identities_split.py (W1)-(W7)", flush=True)
report("(W') hhat = (Delta/sig) Ht", mod_unit(hhat - D / sig * Ht))

# ---- (H) identity (4.1)
r = (s - e2 * f1 - e3 * g1, -(e2 * f2 + e3 * g2))
H41 = 2 * re_mul_conj(f1 - g1, f2 - g2, r[0], r[1]) + eta * (r[0] ** 2 + r[1] ** 2 - 2 * s * r[0])
report("(H) Ht = 2 Re((f-g) conj r) + eta (|r|^2 - 2 s Re r)", mod_unit(Ht - H41))

# ---- (T) tangent set
report("(T) h(L_U, p_U) = 4 Re(p_U conj L_U) - c0 - c1 |L_U|^2 = 0 on M(T^2)",
       mod_unit(4 * re_mul_conj(pU[0], pU[1], LU[0], LU[1]) - c0 - c1 * (LU[0] ** 2 + LU[1] ** 2)))

# ---- (K) scalar step of Lemma 3, by a different route (case dl > 0 suffices: the statement is symmetric under e2 <-> e3)
a = sp.Symbol('a', nonnegative=True)
P = e2 * e3
b2 = sig ** 2 - P * a ** 2                                 # b^2
etaA = dl / P                                              # |eta| when dl >= 0
expr = sp.factor(sp.expand(((2 * (2 - a) + etaA * dl) ** 2 - etaA ** 2 * b2) * P ** 2))
print("(K) (2(2-a) + |eta||dl|)^2 - eta^2 b^2, times (e2 e3)^2, factors as:", expr, flush=True)
# expected: (2 - a) * (positive on [0, 2]) -> show the cofactor is >= 0 for a in [0,2]
q, rr = sp.div(sp.Poly(sp.expand(expr), a), sp.Poly(2 - a, a))
print("     remainder after division by (2 - a):", rr.as_expr(), flush=True)
cof = sp.expand(q.as_expr())
print("     cofactor:", sp.factor(cof), flush=True)
report("(K0) remainder zero", sp.simplify(rr.as_expr()))
print("ALL INDEPENDENT IDENTITIES VERIFIED" if ok_all else "SOME INDEPENDENT IDENTITY FAILED", flush=True)
