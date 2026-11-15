<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kproof/PROOF_NOTES.md (file dated 2026-10-12). Only this line was added. -->
# Conjecture K: what is proved about the two ingredients, with constants, and what is missing     (Worker K2, 2026-10-12)

Status legend: **[P]** proved here (pen and paper; inputs: H1, Gaussian integration by parts), **[CA]** proved up to constants that are
computed in FLOAT (accurate quadrature, not interval arithmetic), **[N]** numerical observation only.  No repository change.
Peak row throughout the numerics: eps = 0.7564, (ell, beta) = (0.8456, 0.1432), 1/eps = 1.3221, S = 1.3739535, sigma* = 0.2009.

**Verdict.**  K_eta is NOT closed.  The reduction is made exact and three rigorous content bounds are proved, but with provable constants the
chain closes K_eta (eta = 1e-4) only for residuals with x = sqrt(m-2) <= 0.22; at x ~ 1 the proved constant is ~100 times too large, and for the
Wick monomial at sigma ~ 0.25-0.3 the required inequality is true only with a factor 1.05-1.1 when the slack is the moment-LP slack.  Two
statements of Worker K1 are corrected (section 6).  The precise open lemmas are in section 7.

## 0. Notation
z = z_1; w = remote coordinates; L = z a(|z|^2), a(U) = ell + beta(U-2) (ell > 2 beta > 0).  A = |z|^2-1, B = z^2/sqrt2 (unit vectors).
G = q + r_A A + r_B B + r_z z + nu H + r_zb conj(z);  q in H21(w), r_A in H10(w), r_B in H01(w), r_z in H11(w), r_zb in H20(w), nu in C.
sigma^2 = E|q|^2, m = E|q|^4/sigma^4, x^2 = m - 2.   d_j = d/dw_j, dbar_j = d/d conj(w_j);  D_j = d_j q (in H11), Db_j = dbar_j q (in H20).
Gam_jk = E[D_j conj D_k] (trace 2 sigma^2), Gam'_jk = E[Db_j conj Db_k] (trace sigma^2).
3W = sum_j |D_j|^2 + |Db_j|^2,  (3/2) C = sum_j D_j Db_j   (W = Gamma(q,conj q)/3, C = Gamma(q,q)/3; E W = sigma^2).
**H1** (proved in Lean, Grothe.LowerAnalytic.fluctuation_bound):  Var(W) + (1/2) E|C|^2 <= sigma^4 x^2 / 3.
N = sum_j (w_j d_j + conj(w_j) dbar_j - 2 d_j dbar_j) is the number operator (N = p on the p-th chaos; E[X N Y] = E[(N X) Y]).
N_u^sigma = u d_u + ubar d_ubar - 2 sigma^2 d_u d_ubar: the same operator in one complex variable u with reference law CN(0, sigma^2); P_s its semigroup.

## 1. The profiles are smooth  [P]; their derivative bounds [CA]
F_A(u) := E_z[A(z) phase(L(z)+u)],  F_B(u) := E_z[B(z) conj(phase(L(z)+u))].  Then c_A(q) = F_A(q) and c_B(q) = conj(F_B(q)) are the gradients of the
fibre potential in the directions A, B at the q-only point (A, B are even in z and L is odd, so the two halves of k* = (phase(L+q)-phase(L-q))/2 agree).
**Lemma 1.**  F_A, F_B are C-infinity on C, of charge one (F(e^{it}u) = e^{it}F(u)), i.e. F(u) = u P(|u|^2) with P smooth, and all derivatives are bounded.
Proof.  zeta = L(z) is a diffeomorphism of C (r -> r a(r^2) is increasing with derivative ell - 2 beta > 0 at 0), so F = omega * phase with a Schwartz
density omega; derivatives fall on omega and phase is bounded.  []
So Delta_A(s) = c_A(s) - gamma_A s is CUBIC at 0 (Delta_A = 2.15 s^3 + ..., Delta_B = 1.03 s^3 + ...), not ~ s|s| as stated in KSIDE section 4.
Constants (prof.py: polar quadrature centred at the singular point, agreement 1e-16 between two grids; derivs.py: Chebyshev fit, tail 5e-11):
| profile | gamma | sup F_uub = sup F_uu | sup F_ubub | sup F_uuub (at 0) | sup F_uuu = sup F_uubub | sup F_ububub |
|---|---|---|---|---|---|---|
| A | -0.835136 | 0.6941 (r = 0.285) | 0.3312 | 4.30 | 1.3058 | 0.7610 |
| B | -0.422028 | 0.3395 (r = 0.290) | 0.1616 | 2.06 | 0.6209 | 0.3611 |
(sub-indices: u = d/du, ub = d/d ubar.)  c_A peaks at |c_A| = 0.2534 near s = 0.5 and decays like 1/s.

## 2. Ingredient 1: the reduction, exactly  [P given the majorant]; the majorant constants [N]
Fibre potential (nu = 0): Phi(s; m) = E_z|L + s + m.e| + E_z|L - s - m.e|, e = (A, B, z, conj z), m in C^4, s in C.   Phi(s; 0) = Phi0(|s|).
Gradient at m = 0: 2 conj(c_D(s)), with c_z = c_zb = 0 (k*_s is even in z, the directions z, conj z are odd).
**Majorant M(h_X, h_Y):**  for all s in C, m in C^4:
   Phi(s; m) <= Phi0(|s|) + 2 Re( conj(c_A(s)) m_A + conj(c_B(s)) m_B ) + h_X (|m_A|^2 + |m_B|^2) + h_Y (|m_z|^2 + |m_zb|^2).
**Proposition 2 [P].**  If M(h_X, h_Y) holds with h_X, h_Y < 1/eps, then for every G with nu = 0
   Lambda(G) <= Lambda_q + ( ||Pi_10 F_A(q)||^2 + ||Pi_10 F_B(q)||^2 ) / (1/eps - h_X),      Lambda_q := E Phi0(|q|) - sigma^2/eps.          (R)
Proof.  Integrate M over w with m_D = r_D(w); ||G||^2 = sigma^2 + sum ||r_D||^2.  E[conj(c_A(q)) r_A] = <r_A, Pi_10 c_A(q)> since r_A is in H10;
E[conj(c_B(q)) r_B] = <r_B, Pi_01 c_B(q)> and ||Pi_01 conj(F_B(q))|| = ||Pi_10 F_B(q)||.  Maximise 2 rho kappa - (1/eps - h_X) rho^2 in each of the two
directions; the (z, zb) part is <= 0.  (The linear parts gamma_A q, gamma_B conj(q) never enter: Pi_10 q = 0.)  []
Numerics for the majorant (peak row):
* Local Hessian (hess.py, hess4.py; centred quadrature, exact to ~1e-10): the (A,B) block and the (z,zb) block DECOUPLE for every s (parity), the
  (A,B) block has largest eigenvalue 1.0237 at s = 0, decreasing in s (0.95 at 0.2, 0.80 at 0.5, 0.65 at 1); the (z,zb) block has 1.19 (imaginary
  direction of m_z).  The A-B cross term is -2 kap Re(m_A m_B), kap = 0.118 at s = 0 (it helps when the two contents are aligned, which they are
  when F_B ~ F_A/2).
* Global secant quotient (maj.py: 13 values of s x 120 magnitudes pairs x 144 phases, 208 x 256 nodes; maj4.py: 16,430 random points in C^4):
  (A,B) plane: sup Q/|m|^2 = 1.013 on the grid (i.e. the global constant equals the local one within the grid);
  block form M(1.03, 1.20): no violation on either scan;  isotropic constant over all four directions: 1.17-1.19 (driven by Im m_z).
  **Worker K1's value 1.20 for the (A,B) plane is not reproduced** (his scan used |m| = 0.01 on a coarser quadrature; noise).
* So the denominator in (R) is 1/eps - h_X = 0.292 (not 0.122).  [N]: this is a statement about one explicit function on C x C^4; a certified
  proof needs interval evaluation of two-dimensional integrals on a compact parameter box plus a tail argument (Phi is 2-Lipschitz in m, so
  Q <= 4|m| disposes of |m| >= 4/h; large |s| by 1/|L+s| <= C/s).  It is the same kind of computation as GPT's anchored potential certificates.
* The constant nu (component nu H(z)) cannot be put in m: the (z,H) plane has secant constant 1.71 > 1/eps (it re-tunes ell, beta).  It must be a
  parameter of the base profile: L +- (s + nu H) = z a_+-(U) +- s with a_+- = ell + (beta +- nu/sqrt2)(U-2) (nu real; complex nu similar).  All of
  sections 1-5 go through for each fixed nu with (F_A, F_B, Phi0, S) replaced by their nu-versions; K_eta then needs the q-only bound and (R)
  uniformly in nu.  Not done here (KSIDE: nu = 0.05 already costs 1.1e-3 to 2.9e-3, so only |nu| <~ 0.02 is delicate).

## 3. The resolvent identity (Stein's method for the law of a cubic chaos)  [P]
**Theorem 3.**  Let q in H21(C^n), sigma^2 = E|q|^2, Psi in C^2(C) with derivatives of polynomial growth, and Y in the p-th Wiener chaos of w.  Then
   E[ conj(Y) ((3 N_u^sigma - p) Psi)(q) ] = 3 E[ conj(Y) R_Psi ],     R_Psi := 2 (W - sigma^2) Psi_uub(q) + C Psi_uu(q) + conj(C) Psi_ubub(q).
Proof.  Chain rule: N(Psi(q)) = 3 (u Psi_u + ubar Psi_ub)(q) - 2[ (3/2) C Psi_uu + 3 W Psi_uub + (3/2) conj(C) Psi_ubub ](q) = 3 (N_u^sigma Psi)(q) - 3 R_Psi
(N q = 3 q; sum_j D_j Db_j = (3/2) C; sum_j |D_j|^2 + |Db_j|^2 = 3W).  N is symmetric and N Y = p Y.  []
Checked exactly (polynomial quadrature, chk_poly.py, 40 random kernels in H21(C^3) + diffuse part): for Psi with (3N_u - 1)Psi = u^2 ubar, i.e.
E[conj(w_j) q^2 conj q] = (3/4) E[conj(w_j)(2 (W - sigma^2) q + C conj q)]: relative error <= 2e-15.
Resolvents.  On charge-one functions N_u has spectrum {1, 3, 5, ...}; on charge-0 functions orthogonal to constants and on charge-2 functions, {2, 4, ...}.
   (3 N_u - 1)^{-1} F = int_0^inf e^{t} P_{3t} F dt,       (3 N_u - 2)^{-1} g = int_0^inf e^{2t} P_{3t} g dt,
and d_u d_ub P_s = e^{-2s} P_s d_u d_ub (same for d_u^2, d_ub^2), so second derivatives of the resolvents are bounded by 1/5, resp. 1/4, of those of F, g.

## 4. Three rigorous bounds for the first-chaos content
**Theorem 4 (second order) [P].**  F in C^2(C) of charge one with bounded second derivatives, q in H21(C^n).  Then
   ||Pi_10 F(q)||^2 <= (3/25) (4 A_1^2 + 2 B_1^2) sigma^4 (m - 2),     A_1 = sup|F_uub|,  B_1 = sup|F_uu| + sup|F_ubub|.
Proof.  Ft = (3N_u - 1)^{-1} F.  Theorem 3 with p = 1, Y = w_j: Pi_10 F(q) = 3 Pi_10 R_Ft.  |R_Ft|^2 <= (4 a^2 + 2 b^2)((W - sigma^2)^2 + |C|^2/2) with
a = sup|Ft_uub| <= A_1/5, b <= B_1/5; then H1.  []
**Theorem 5 (influences) [P].**  lam_max(Gam)^2 + lam_max(Gam')^2 <= ||Gam||_HS^2 + ||Gam'||_HS^2 <= ||Pi_11 |q|^2||^2 <= (3/4) sigma^4 (m - 2).
Also  4 ||Pi_11 |q|^2||^2 + 2 ||Pi_20 q^2||^2 <= 3 sigma^4 (m-2).
Proof.  <|q|^2, :w_j conj(w_k):> = E[d_j dbar_k |q|^2] = Gam_jk + Gam'_kj (two Gaussian integrations by parts; the terms with d_j dbar_k q vanish by
orthogonality), so ||Pi_11|q|^2||^2 = ||Gam + Gam'^T||_HS^2 >= ||Gam||^2 + ||Gam'||^2 (both PSD).  Gamma(q, conj q) = 3|q|^2 - N(|q|^2)/2 gives
W - sigma^2 = (2/3) U_2 + (1/3) U_4 (U_k = k-th chaos part of |q|^2), likewise C = (2/3) V_2 + (1/3) V_4 for q^2; H1 gives the two inequalities.  []
(Checked: chk_poly.py; the ratios to the bounds are <= 0.58 and <= 0.83 on 40 random kernels; Wick monomial: lam_max(Gam) = 2, bound 5.6.)
**Theorem 6 (third order) [P].**  F in C^3(C) of charge one with bounded second and third derivatives.  Then
   ||Pi_10 F(q)||^2 <= (3 sqrt6 / 2) (M_1 + M_2) sigma^6 (m - 2)^{3/2},
   M_1 = (4 sup|F_uuub|^2 + 2 (sup|F_uuu| + sup|F_uubub|)^2)/16,    M_2 = (4 sup|F_uubub|^2 + 2 (sup|F_uuub| + sup|F_ububub|)^2)/16.
Proof.  E[conj(w_j) F(q)] = E[d_j F(q)] = <g(q), conj(D_j)> + <g_2(q), Db_j>,  g = F_u (charge 0), g_2 = F_ub (charge 2); conj(D_j) is in H11, Db_j in H20.
Bessel for the two families: ||v||^2 <= ( sqrt(lam(Gam) P_1) + sqrt(lam(Gam') P_2) )^2 <= sqrt2 sqrt(lam(Gam)^2 + lam(Gam')^2) (P_1 + P_2), with
P_1 = ||Pi_11 g(q)||^2, P_2 = ||Pi_20 g_2(q)||^2.  Theorem 3 with p = 2 and the resolvents (3N_u - 2)^{-1}(g - E g(sigma Z)), (3N_u - 2)^{-1} g_2 gives
P_i <= 9 E|R|^2 <= 3 M_i sigma^4 (m-2) (H1 again; second derivatives of the resolvents <= 1/4 of those of g, g_2).  Theorem 5 bounds the influences.  []
**Corollary 7 (cubic tensor inequality) [P].**  sum_j |E[conj(w_j) q^2 conj q]|^2 <= (3 sqrt6/2) sigma^6 (m-2)^{3/2} = 3.674 sigma^6 x^3.
(E[conj(w_j) q^2 conj q] = 2 <U_2, conj D_j> + <V_2, Db_j>; Theorem 5.)   [N]: the sup of the ratio over H21(C^2) + diffuse part is 0.4775 (kap3.py, 60 starts;
Wick monomial alone: 0.4703), so the proved constant is 7.7 times the conjecturally sharp one.
Constants for the actual profiles (section 1):  Theorem 4:  K_2 := 0.48 (A) + 0.12 (B) = 0.60;   Theorem 6:  K_3 := 33.6 (A) + 7.65 (B) = 41.2.
   ||Pi_10 F_A(q)||^2 + ||Pi_10 F_B(q)||^2 <= min( K_2 sigma^4 x^2, K_3 sigma^6 x^3 )      for every q in H21, every sigma.      [CA]
Check on the junta family q = sigma(a H(z_2) + sqrt(1-a^2) W) at sigma = 0.2 (fam.py): true/(sigma^6 x^3) = 0.85, 0.60, 0.41, 0.29, 0.21, 0.12, 0.06 at
a = 0.1, 0.2, 0.3, 0.4, 0.5, 0.7, 1 (x = 0.065 ... 6.5): the bounds hold with factors 50-700; the truth is cubic in x at 0 and SATURATES (the profiles
are bounded), so no polynomial-in-x bound can be sharp for x >~ 0.5.

## 5. Does the chain close?  [CA]
Requirement from (R):  content^2 <= (1/eps - h_X)(S - Lambda_q + eta), where Lambda_q <= J(sigma, x) (moment LP: E U = 1, E U^2 = 2 + x^2, C6, rho).
chain.py (J on a 16 x 16 grid of (sigma, x), sigma in [0.04, eps rho], x in [0, 7.75]):
| restricted to x <= | 0.10 | 0.15 | 0.20 | 0.25 | 0.30 | 0.40 | 0.50 | 1.0 |
|---|---|---|---|---|---|---|---|---|
| eta needed, denominator 0.292 | 1.1e-5 | 2.6e-5 | 7.0e-5 | 1.6e-4 | 3.3e-4 | 7.8e-4 | 2.3e-2 | 0.49 |
| eta needed, denominator 0.122 | 2.4e-5 | 7.9e-5 | 2.2e-4 | 6.8e-4 | 1.3e-3 | 9.9e-2 | 0.23 | 1.3 |
(The 1e-5 at x -> 0 is the row/LP discretisation, not a defect of the chain: slack(0.2, 0) = -9e-6 on this grid.)
* K_eta with eta = 1.0e-4 is proved (up to the float constants and the majorant) for all q with x <= 0.22; eta = 3.3e-4 for x <= 0.30.
* For the rest the proved constants are far off: a cubic bound K_3' sigma^6 x^3 alone would need K_3' <= 1.9 to close x <= 0.5 and <= 0.22 to
  close x <= 1 (proved: 41.2; truth on the junta family: 0.85 at x -> 0, 0.29 at x = 1).
* The inequality itself is nearly tight at large x when the slack is the moment-LP slack.  Wick monomial (a = 1, x = 6.5), exact content (fam2.py):
  sigma = 0.25: content^2/0.292 = 7.0e-3 against J-slack ~7.7e-3;  sigma = 0.30: 1.14e-2 against ~1.2e-2.   Ratio 0.9-0.95.
  With the TRUE q-only slack of the same q the ratio is at most 0.385 (0.92 with the denominator 0.122), attained at (a, sigma) = (1, 0.25).
Conclusion: no chain of general-purpose inequalities (each losing a factor >= 2) can close K_eta through (R) with the moment-LP slack.  A proof along
(R) needs (i) a certified majorant, (ii) a slack bound that sees more than the fourth moment (Stein cuts, or a slack expressed through the
influences), and (iii) a content bound that is sharp to within a factor ~2 uniformly in x, including the saturation regime.

## 6. Corrections to earlier statements
1. KSIDE section 4 / K1: "Delta ~ s|s|, |F(u)| <= 0.6|u|^2".  The profiles are smooth; Delta_A = 2.15 s^3 (1 + O(s^2)), Delta_B = 1.03 s^3.
2. K1: "(A,B)-plane constant 1.20, denominator 0.122".  Local value 1.024, global 1.013 on a finer scan; block majorant M(1.03, 1.20): denominator 0.292.
3. K1: "the content inequality holds with a factor 4 to spare".  That table re-optimised sigma for each q.  The adversary also chooses sigma: at
   fixed sigma the ratio R/slack on the junta family reaches 0.92 with K1's denominator and 0.385 with 0.292 (Wick monomial, sigma = 0.25).
4. K1's Bessel bound stands; with Theorem 5 its influence factor is now controlled: lam_max(Gam) <= min(2, 0.866 x) sigma^2.

## 7. Open lemmas (each self-contained; for GPT)
**L1 (fibre majorant, finite-dimensional).**  For eps in [0.74,0.76], ell in [0.76,0.90], beta in [0.12,0.16] and |nu| <= nu_0: for all s in C, m in C^4
   E|L_nu^+ + s + m.e| + E|L_nu^- - s - m.e| <= Phi0^nu(|s|) + 2 Re(conj(c_A^nu(s)) m_A + conj(c_B^nu(s)) m_B) + h_X(|m_A|^2+|m_B|^2) + h_Y(|m_z|^2+|m_zb|^2),
with h_X <= 1.05, h_Y <= 1.25 (float at the peak row, nu = 0: 1.03, 1.20).  Plus: an explicit bound showing |nu| > nu_0 costs more than it can gain.
**L2 (sharp cubic contraction).**  sup over q in H21(C^n), all n, of  sum_j |E[conj(w_j) q^2 conj q]|^2 / (sigma^6 (m-2)^{3/2}).  Proved <= 3.674; numerically
0.4775 for n = 2 (+ diffuse).  Is it attained in dimension <= 2?  What is the sharp constant in lam_max(Gam) <= c sigma^2 sqrt(m-2) (proved c = 0.866;
Wick monomial 0.31)?  These are inequalities between contractions of one 3-tensor.
**L3 (content against slack, the real statement).**  For every q in H21 and every sigma:
   ||Pi_10 F_A(q)||^2 + ||Pi_10 F_B(q)||^2 <= (1/eps - h_X) ( S - E Phi0(|q|) + sigma^2/eps + eta ),   eta <= 1e-4.
True on the junta family with ratio <= 0.385 (eta = 0).  It cannot be split into "content <= f(x)" and "slack >= g(x)" with the fourth moment alone
(section 5).  Suggested forms: (a) both sides through the influence profile (Gam, Gam') and U_2, U_4, V_2, V_4; (b) a perturbative theorem for
x <= x_0 with the sharp constant of L2 plus a non-perturbative argument for x > x_0 that uses the boundedness of F (saturation).
**L4 (alternative to L3: monotonicity along the CLT).**  For nu = 0 and G in H21(C^n): Lambda(G) <= Lambda((G(z,w) + G(z,w'))/sqrt2) (w' an independent
copy; the right side is again of the form G~ in H21(C^{2n-1}) with the same norm).  Iterating, Lambda(G) <= the value at the Gaussian limit, where
(q, r_A, r_B, r_z, r_zb) are independent Gaussians (uncorrelated by bidegree) and the supremum is a finite-dimensional Gaussian problem equal to S
by the Hessian bounds of section 2.  [N] for the q-only part on the Wick monomial at five values of sigma (fam.py): one copy < two copies < Gaussian,
e.g. sigma = 0.2: 1.363988 < 1.366827 < 1.373953.  Not tested with mixed components.  This would give K (eta = 0) for nu = 0 without any content bound.
**L5 (q-only with nu).**  The moment-LP bound J(sigma, x; nu) <= S - c_1 for the nu-profiles, as a certificate (three parameters).

## 8. Degree 5
Theorems 3-6 use only: q is an eigenfunction of N (eigenvalue 3) and H1.  For a single chaos of order p the same proofs work with 3 -> p and H1
replaced by the Nourdin-Peccati bound Var(Gamma/p) <= ((p-1)/(3p)) kappa_4 (complex form to be written).  For the degree-5 witness the residual is a
PAIR (G_3, G_5) with two eigenvalues, so N(Psi(G_3, G_5)) is governed by a two-variable operator 3 u_3 d_3 + 5 u_5 d_5 + (second-order terms with the
joint covariance of the gradients); the resolvent identity survives as a two-variable Stein equation, the fluctuation input becomes a matrix H1
(variances of Gamma(G_i, conj G_j), Gamma(G_i, G_j)), and the first-chaos content must be controlled for the profiles of the degree-5 fibre maximiser.
Nothing in the argument is specific to degree 3, but the difficulty identified in section 5 (sharpness) is the same and the margin is larger (8.2e-4).

## 9. Files (scratchpad research/kproof, synced to handoff/research-third-decimal/pipeline/kproof)
prof.py (profiles, centred quadrature), derivs.py (derivative sup norms), chk_poly.py (exact checks of H1, Theorems 3 and 5, Corollary 7),
kap3.py (sharp constant search), fam.py, fam2.py (junta family: contents, bounds, slack, CLT test), hess.py, hess4.py (local Hessians),
maj.py, maj4.py (global majorant scans), chain.py (closure table), kmodel.py (Worker G1's q-only model), logs and .npy/.pkl outputs.
