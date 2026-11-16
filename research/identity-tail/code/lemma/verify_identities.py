"""EXACT symbolic verification (sympy) of every algebraic identity used in PROOF.tex (claude-b9ee worker, 15 Nov 2026).
Unit complex numbers are parametrised rationally, f = ((1 - t^2) + 2 i t)/(1 + t^2), so each identity becomes an identity of
rational functions, checked by `cancel(lhs - rhs) == 0` (a proof, not sampling).  Numbering as in PROOF.tex.
usage: python3 verify_identities.py      (prints one line per identity, exits 1 on any failure)"""
import sys
import sympy as sp

ok_all = True
def check(name, expr, assume=None):
    global ok_all
    e = sp.cancel(sp.together(sp.expand(expr)))
    ok = (e == 0)
    ok_all &= ok
    print(f"[{'OK' if ok else 'FAIL'}] {name}" + ("" if ok else f"   residual: {sp.factor(e)}"))

nu = sp.Symbol('nu', nonnegative=True)
e2, e3 = sp.symbols('e2 e3', positive=True)
d2, d3 = e2 + nu, e3 + nu
t1, t2 = sp.symbols('t1 t2', real=True)
f1, f2 = (1 - t1**2) / (1 + t1**2), 2 * t1 / (1 + t1**2)     # f = f1 + i f2, |f| = 1
g1, g2 = (1 - t2**2) / (1 + t2**2), 2 * t2 / (1 + t2**2)     # g = g1 + i g2, |g| = 1
A1, A2, B1, B2, l, p1, p2, X1, X2, Y1, Y2 = sp.symbols('A1 A2 B1 B2 l p1 p2 X1 X2 Y1 Y2', real=True)
D = d2 * d3 - nu**2
sig = e2 + e3; dl = e3 - e2; eta = dl / (e2 * e3)
cL = (d2 + d3 + 2 * nu) / (2 * D); cP = (d2 + d3 - 2 * nu) / (2 * D); tau = (d3 - d2) / (2 * D)
c0 = d2**2 - d3**2 + nu * (d2 - d3) * (e2**2 + e3**2) / (e2 * e3); c1 = -4 * nu * (d2 - d3) / (e2 * e3)

def re_mul_conj(x1, x2, y1, y2):   # Re(x conj(y))
    return x1 * y1 + x2 * y2

# (1.1) gap identity: Phi_d(A,B) - l_w(A,B) = 1/2 (V - M w)^* M^{-1} (V - M w),  M = [[d2, -nu], [-nu, d3]]
Phi = (d2 + d3) / 2 + (d3 * (A1**2 + A2**2) + d2 * (B1**2 + B2**2) + 2 * nu * re_mul_conj(A1, A2, B1, B2)) / (2 * D)
lw = re_mul_conj(A1, A2, f1, f2) + re_mul_conj(B1, B2, g1, g2) + nu * re_mul_conj(g1, g2, f1, f2)
U1r, U1i = d2 * f1 - nu * g1, d2 * f2 - nu * g2           # U = M w
U2r, U2i = d3 * g1 - nu * f1, d3 * g2 - nu * f2
R1r, R1i, R2r, R2i = A1 - U1r, A2 - U1i, B1 - U2r, B2 - U2i
quad = (d3 * (R1r**2 + R1i**2) + d2 * (R2r**2 + R2i**2) + 2 * nu * re_mul_conj(R1r, R1i, R2r, R2i)) / D   # (V-U)^* M^{-1} (V-U)
check("(1.1) Phi_d - l_w = 1/2 ||V - Mw||^2_{M^-1}  (|f| = |g| = 1)", Phi - lw - quad / 2)
Mi = sp.Matrix([[d2, -nu], [-nu, d3]]) * sp.Matrix([[d3, nu], [nu, d2]]) / D - sp.eye(2)
for i in range(2):
    for j in range(2):
        check(f"(1.1') (M * [[d3, nu], [nu, d2]]/Delta - I)[{i},{j}] = 0", Mi[i, j])
# (2.1) 1/2 ||(X+Y, X-Y)||^2_{M^{-1}} = cL|X|^2 + cP|Y|^2 + 2 tau Re(X conj Y)
Sr, Si, Tr, Ti = X1 + Y1, X2 + Y2, X1 - Y1, X2 - Y2
q2 = (d3 * (Sr**2 + Si**2) + d2 * (Tr**2 + Ti**2) + 2 * nu * re_mul_conj(Sr, Si, Tr, Ti)) / D
check("(2.1) 1/2||(X+Y, X-Y)||^2 = cL|X|^2 + cP|Y|^2 + 2 tau Re(X conj Y)", q2 / 2 - (cL * (X1**2 + X2**2) + cP * (Y1**2 + Y2**2) + 2 * tau * re_mul_conj(X1, X2, Y1, Y2)))
check("(2.2) cL cP - tau^2 = 1/Delta", cL * cP - tau**2 - 1 / D)
check("(2.3a) cP = sig/(2 Delta)", cP - sig / (2 * D))
check("(2.3b) tau/cP = (e3 - e2)/sig", tau / cP - dl / sig)
rho = tau / cP
check("(2.4) cL|X|^2 + cP|Y|^2 + 2 tau Re(X conj Y) = (2/sig)|X|^2 + cP |Y + rho X|^2",
      cL * (X1**2 + X2**2) + cP * (Y1**2 + Y2**2) + 2 * tau * re_mul_conj(X1, X2, Y1, Y2) - (2 / sig * (X1**2 + X2**2) + cP * ((Y1 + rho * X1)**2 + (Y2 + rho * X2)**2)))
check("(2.5) Delta = e2 e3 + nu sig", D - (e2 * e3 + nu * sig))
# (3.1) with L = l real, U = M w: L_U = (U1+U2)/2 = (e2 f + e3 g)/2, p_U = (U1-U2)/2 = ((d2+nu) f - (d3+nu) g)/2
LUr, LUi = (U1r + U2r) / 2, (U1i + U2i) / 2
pUr, pUi = (U1r - U2r) / 2, (U1i - U2i) / 2
check("(3.1a) Re L_U = Re (e2 f + e3 g)/2", LUr - (e2 * f1 + e3 * g1) / 2)
check("(3.1a') Im L_U = Im (e2 f + e3 g)/2", LUi - (e2 * f2 + e3 * g2) / 2)
check("(3.1b) Re p_U = Re ((d2+nu) f - (d3+nu) g)/2", pUr - ((d2 + nu) * f1 - (d3 + nu) * g1) / 2)
check("(3.1b') Im p_U = Im ((d2+nu) f - (d3+nu) g)/2", pUi - ((d2 + nu) * f2 - (d3 + nu) * g2) / 2)
s = 2 * l
Xr, Xi = l - LUr, -LUi
N = (s - e2 * f1 - e3 * g1)**2 + (e2 * f2 + e3 * g2)**2
check("(3.2) 4|X|^2 = N = |s - e2 f - e3 g|^2,  s = 2l", 4 * (Xr**2 + Xi**2) - N)
phat_r = pUr - rho * Xr                                   # Re of p_hat = p_U - rho X
hhat = 4 * phat_r * l - c0 - c1 * l**2                    # h(l, p_hat), L = l real
Ht = 2 * s * (f1 - g1) + eta * (sig**2 - s**2)
check("(3.3) h(l, p_U - rho X) = (Delta/sig) Ht,  Ht = 2s(Re f - Re g) + eta (sig^2 - s^2)", hhat - D / sig * Ht)
# tangent set: h vanishes on M(T^2): |U1|^2 - |U2|^2 - c0 - c1 |L_U|^2 = 0
check("(3.4) h = 0 on the tangent set (centre of the correction)", (U1r**2 + U1i**2) - (U2r**2 + U2i**2) - c0 - c1 * (LUr**2 + LUi**2))
# (4.1) Ht = 2 Re((f - g) conj r) + eta (|r|^2 - 2 s Re r),  r = s - e2 f - e3 g
rr, ri = s - e2 * f1 - e3 * g1, -(e2 * f2 + e3 * g2)
check("(4.1) Ht = 2 Re((f-g) conj r) + eta (|r|^2 - 2 s Re r)", Ht - (2 * re_mul_conj(f1 - g1, f2 - g2, rr, ri) + eta * (rr**2 + ri**2 - 2 * s * rr)))
check("(4.2) |r|^2 - 2 s Re r = |e2 f + e3 g|^2 - s^2", rr**2 + ri**2 - 2 * s * rr - ((e2 * f1 + e3 * g1)**2 + (e2 * f2 + e3 * g2)**2 - s**2))
check("(4.3a) |f - g|^2 = 2 - 2 Re(conj f g)", (f1 - g1)**2 + (f2 - g2)**2 - (2 - 2 * re_mul_conj(g1, g2, f1, f2)))
check("(4.3b) |e2 f + e3 g|^2 = sig^2 - e2 e3 |f - g|^2", (e2 * f1 + e3 * g1)**2 + (e2 * f2 + e3 * g2)**2 - (sig**2 - e2 * e3 * ((f1 - g1)**2 + (f2 - g2)**2)))
# (4.4) the alpha-beta bound, as an identity: with a = |f-g| in [0,2], b = |e2 f + e3 g| >= 0, b^2 = sig^2 - e2 e3 a^2, D_ = |e3 - e2|:
#   (4 + |eta| D_ - 2 a - |eta| b) (b + D_) (2 b + D_ a) = (2 - a)^2 (2 + a) sig^2
a, b, Dm = sp.symbols('a b Dm', nonnegative=True)
S_ = sp.Symbol('S', positive=True)                         # S = sig; e2 e3 = (S^2 - Dm^2)/4, |eta| = Dm/(e2 e3)
P_ = (S_**2 - Dm**2) / 4
expr = (4 + Dm / P_ * Dm - 2 * a - Dm / P_ * b) * (b + Dm) * (2 * b + Dm * a) - (2 - a)**2 * (2 + a) * S_**2
num = sp.numer(sp.together(sp.expand(expr)))
rem = sp.rem(sp.Poly(sp.expand(num), b), sp.Poly(b**2 - (S_**2 - P_ * a**2), b))
check("(4.4) (4 + |eta|D - 2a - |eta|b)(b + D)(2b + D a) = (2-a)^2(2+a) sig^2  mod  b^2 = sig^2 - e2e3 a^2", rem.as_expr())
check("(4.5) 4 b^2 - D^2 a^2 = sig^2 (4 - a^2)  mod  b^2 = sig^2 - e2e3 a^2", (4 * (S_**2 - P_ * a**2) - Dm**2 * a**2) - S_**2 * (4 - a**2))
# (5.1) equality at the binding far phases: Ht^2 = Gamma_s^2 N with Gamma_s = 4 + |eta| (s + |dl|)
G_pos = 4 + eta * (s + dl)            # dl >= 0: phases (f, g) = (-1, 1)
G_neg = 4 - eta * (s - dl)            # dl <= 0 (eta <= 0, |eta|(s + |dl|) = -eta (s - dl)): phases (1, -1)
Ht_m = 2 * s * (-1 - 1) + eta * (sig**2 - s**2); N_m = (s + e2 - e3)**2
Ht_p = 2 * s * (1 + 1) + eta * (sig**2 - s**2); N_p = (s - e2 + e3)**2
check("(5.1a) phases (-1, 1): Ht = -(s - dl) Gamma_s  [dl >= 0 branch of Gamma]", Ht_m + (s - dl) * G_pos)
check("(5.1b) phases (1, -1): Ht = (s + dl) Gamma_s   [dl <= 0 branch of Gamma]", Ht_p - (s + dl) * G_neg)
# (5.2) Gamma = (sig^2 + 2 R |dl|)/(e2 e3)  (dl >= 0 branch; the other is the same with |dl|)
R = sp.Symbol('R', nonnegative=True)
check("(5.2) 4 + |dl|(2R + |dl|)/(e2 e3) = (sig^2 + 2R|dl|)/(e2 e3)", (4 + dl * (2 * R + dl) / (e2 * e3)) - (sig**2 + 2 * R * dl) / (e2 * e3))
# (5.3) the scalar minimisation: c t^2 - k (h + m t)^2 = (c - k m^2)(t - t*)^2 - k c h^2/(c - k m^2),  t* = k m h/(c - k m^2)
c_, k_, h_, m_, t_ = sp.symbols('c k h m t', real=True)
ts = k_ * m_ * h_ / (c_ - k_ * m_**2)
check("(5.3) c t^2 - k (h + m t)^2 = (c - k m^2)(t - t*)^2 - k c h^2/(c - k m^2)", c_ * t_**2 - k_ * (h_ + m_ * t_)**2 - ((c_ - k_ * m_**2) * (t_ - ts)**2 - k_ * c_ * h_**2 / (c_ - k_ * m_**2)))
# (5.4) (g cP / (16 (cP - g l^2))) (Delta/sig)^2 * 2 sig = g Delta^2 / (8 (sig - 2 g Delta l^2))   [(S2) -> (S3), after multiplying by sig/2]
gg = sp.Symbol('g', positive=True)
check("(5.4) constant of the reduced inequality", gg * cP / (16 * (cP - gg * l**2)) * (D / sig)**2 * 2 * sig - gg * D**2 / (8 * (sig - 2 * gg * D * l**2)))
# (6) gstar equals the stage-0 discriminant formula of the binding far piece, and AF's 8/D at nu = 0
def gd_far(lv, sgn):
    c = c0 + c1 * lv**2; k0 = (d2 + d3) / 2 + nu + (d2 + d3 + 2 * nu) * lv**2 / (2 * D); b1 = lv * c / 2; b0 = (d3 - d2) * lv / D - 2 * sgn
    return (4 * cP * k0 - b0**2) / (2 * b0 * b1 + cP * c**2 / 4 + 4 * lv**2 * k0)
def gstar_branch(lv, absdl):
    G = (sig**2 + 2 * lv * absdl) / (e2 * e3)
    return 8 * sig / (D * (D * G**2 + 16 * lv**2))
check("(6.1) dl >= 0: discriminant formula of the piece sgn = -1 (phases (-1,1)) = gstar", gd_far(l, -1) - gstar_branch(l, dl))
check("(6.2) dl <= 0: discriminant formula of the piece sgn = +1 (phases (1,-1)) = gstar", gd_far(l, 1) - gstar_branch(l, -dl))
dd2, dd3 = sp.symbols('dd2 dd3', positive=True)
S0 = dd2 + dd3
G0 = (S0**2 + 2 * l * (dd3 - dd2)) / (dd2 * dd3)
check("(6.3) nu = 0: gstar = 8/(S (S^2 + 4 l^2 + 4 l |d0|))  (AF eq. (4), dl >= 0 branch)", 8 * S0 / (dd2 * dd3 * (dd2 * dd3 * G0**2 + 16 * l**2)) - 8 / (S0 * (S0**2 + 4 * l**2 + 4 * l * (dd3 - dd2))))
# (7.1) the whole Lemma 2 as ONE identity in the original variables (L = l real, p = p1 + i p2, unit f, g):
#   Phi_d(l+p, l-p) - (g/16) h(l,p)^2 - l_w(l+p, l-p)
#     = (N - kappa Ht^2)/(2 sig) + (cP - g l^2) (Re Z - t*)^2 + cP (Im Z)^2,
#   Z = p - p_U + rho (l - L_U),  t* = g l hhat / (4 (cP - g l^2)),  kappa = g Delta^2 / (8 (sig - 2 g Delta l^2))
Ar, Ai, Br, Bi = l + p1, p2, l - p1, -p2
PhiV = (d2 + d3) / 2 + (d3 * (Ar**2 + Ai**2) + d2 * (Br**2 + Bi**2) + 2 * nu * re_mul_conj(Ar, Ai, Br, Bi)) / (2 * D)
lwV = re_mul_conj(Ar, Ai, f1, f2) + re_mul_conj(Br, Bi, g1, g2) + nu * re_mul_conj(g1, g2, f1, f2)
hV = 4 * l * p1 - c0 - c1 * l**2
Zr = p1 - pUr + rho * Xr; Zi = p2 - pUi + rho * Xi
kap = gg * D**2 / (8 * (sig - 2 * gg * D * l**2)); tstar = gg * l * (D / sig * Ht) / (4 * (cP - gg * l**2))
check("(7.1) Phi_d - (g/16) h^2 - l_w = (N - kappa Ht^2)/(2 sig) + (cP - g l^2)(Re Z - t*)^2 + cP (Im Z)^2",
      PhiV - gg / 16 * hV**2 - lwV - ((N - kap * Ht**2) / (2 * sig) + (cP - gg * l**2) * (Zr - tstar)**2 + cP * Zi**2))
print("ALL IDENTITIES VERIFIED" if ok_all else "SOME IDENTITY FAILED")
sys.exit(0 if ok_all else 1)
