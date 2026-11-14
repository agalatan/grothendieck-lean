<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture_K_handoff.md (file dated 2026-10-12). Only this line was added. -->
# Conjecture K (Gaussian domination): the one lemma between the cubic witness and 1.402

## 1. Why this problem

The Lean repository proves 1.40148809 < K_G^C < 1.404599424. The lower bound uses the witness
T = P - eps*Q (P = P_{1,0}, Q = P_{2,1} on complex Gaussian space) and HJM's reduction with matrix "gates".
Three independent computations now agree on where the remaining loss is:

  * the witness is fine: its norm in the exact Gaussian model is 0.713136 at eps = 0.7564 (K = 1.40226);
  * the residual-law layer is essentially lossless (Stein cuts; in the formulation below not even needed);
  * the price layer is being closed by the anchored potentials (and disappears below);
  * the GATES lose 1.5e-4 at the peak row for the cubic witness, exactly the distance to the 1.402 cap
    0.713267, and 3-4e-3 for the degree-5 witness, which is why degree 5 fails with the present method.

There is an exact reduction with no gates at all. One conjecture makes it a certificate.

## 2. The exact row (proved)

f, g unimodular; h = (f+g)/2, k = (f-g)/2; rotate so that P h = t z_1. Then
    Re<f, T g> = t^2 - eps*||Q h||^2 - ||P k||^2 + eps*||Q k||^2.
h-side, as in HJM (8.5): with B = beta*z_1(|z_1|^2 - 2) in H_{2,1},
    -eps*||Q h||^2 <= 2 Re E[conj(B) h] + ||B||^2/eps,   ||B||^2 = 2 beta^2.
k-side: with G := eps*Q k in H_{2,1}(C^n), the identity eps*||Q k||^2 = 2 Re<G, k> - ||G||^2/eps. Drop -||P k||^2.
With L := z_1*(ell + beta(|z_1|^2 - 2)):

    Re<f, T g> <= t^2 - 2 ell t + 2 beta^2/eps + Lambda(G),
    Lambda(G) := E|L + G| + E|L - G| - ||G||_2^2/eps.                                    (*K)

So for all real ell, beta:
    sup_{f,g: ||P h|| = t} Re<f,T g> <= t^2 - 2 ell t + 2 beta^2/eps + sup_{G in H_{2,1}(C^n)} Lambda(G).

## 3. The conjecture

Let a(u) = ell + beta(u - 2) with ell > 2 beta > 0, L(z) = z_1 a(|z_1|^2), eps > 0.

CONJECTURE K. For every n and every G in H_{2,1}(C^n),

    Lambda(G) <= S(ell, beta) := sup_{sigma >= 0} { E|L + sigma W| + E|L - sigma W| - sigma^2/eps },

where W is a standard complex Gaussian independent of z_1. (W is the diffuse limit of
sigma*N^{-1/2}*sum_j H(w_j), H(w) = w(|w|^2-2)/sqrt 2, so S is attained in the limit n -> infinity.)

Needed range only: eps in [0.74, 0.76], ell in [0.76, 0.90], beta in [0.12, 0.16].

WEAK FORM K_eta: Lambda(G) <= S(ell,beta) + eta. Already eta <= 1.3e-4 (uniformly on the range) gives
K_G^C > 1.402; eta = 1e-4 gives 1.40206.

Equivalent reading: sup_n ||T_n|| equals the norm of the three-coordinate Gaussian model. Our certified cap
confirms this to 1.7e-4 at eps = 0.745 (0.713288 <= ||T|| <= 0.71352729).

## 4. Structure of G and of the problem

Decompose G by its dependence on z_1 (A(z_1) = z_1^2, B(z_1) = |z_1|^2 - 1 up to normalization, H(z_1) = z_1(|z_1|^2-2)/sqrt 2,
w = (z_2,...,z_n)):

    G = q(w) + r_A(w) A(z_1) + r_B(w) B(z_1) + r_z(w) z_1 + nu H(z_1) + r_zbar(w) conj(z_1),

    q in H_{2,1}(w), r_A in H_{1,0}(w), r_B in H_{0,1}(w), r_z in H_{1,1}(w), nu in C, r_zbar in H_{2,0}(w)
(exact normalizations and conjugations: see KSIDE.md section 2; r_A and r_B are GAUSSIAN, r_z and r_zbar are
second-chaos, q is the cubic residual). For fixed w, G(.,w) lies in a 6-dimensional space of functions of z_1, so

    Lambda(G) = E_w[ Phi(c(w)) ] - E|c(w)|^2/eps,   Phi(c) := E_{z_1}|L + c.e| + E_{z_1}|L - c.e|,

a convex even function on C^6, integrated against the law of the random coefficient vector c(w).
If only q is present: Lambda = E_w Phi_0(|q|) - sigma^2/eps with the explicit one-variable potential
    Phi_0(s) = E_z[|L + s| + |L - s|] = 2 E_U[ m(sqrt(U) a(U), s) ],  m(x,s) = (2/pi)(x+s) E_ell(4xs/(x+s)^2),  U ~ Exp(1).

(K-a) q only. For q in H_{2,1}(w) of ANY law: E Phi_0(|q|) - sigma^2/eps <= S - c_1(x), x^2 = E|q|^4/sigma^4 - 2,
with slack c_1(x) = 1.2e-5, 4.8e-5, 1.2e-4, 6.4e-4, 2.0e-3 at x = 0.2, 0.6, 1, 2, 7.75 (float). This already follows
from E U = 1, E U^2 = 2 + x^2 and the sixth-moment bound: Phi_0 is majorised by a polynomial in s^2 with negative
s^4 coefficient touching at the Gaussian law, and the Gaussian has the smallest fourth moment. So (K-a) is
provable with tools in hand, and the Stein cuts are not even needed.

(K-b) mixed components. This is the open part. At the q-only maximiser k* = (phase(L+q) - phase(L-q))/2 the
profiles are c_A(s) = -0.835 s + Delta_A(s), c_B(s) = -0.422 s + Delta_B(s), c_z = c_H = c_zbar = 0, with
Delta_A(s)/s^2 = 0.21, 0.31, 0.39, 0.52 at s = 0.1, 0.15, 0.2, 0.3 (non-analytic: Delta ~ s|s|).
First order: only r_A, r_B couple, through the FIRST-CHAOS CONTENT of an odd nonlinear function of the cubic chaos,
    ||Pi_{1,0}[Delta_A(q)]||^2 and ||Pi_{0,1}[Delta_B(q)]||^2,
which vanish in the Gaussian limit. Second order: the Hessians in the mixed directions are
A: 1.00-0.70, B: 0.38-0.40, z: 1.19-1.04, H: 0.99-0.78, zbar: 0.60-0.65, all below 1/eps = 1.322.
A crude Cauchy-Schwarz with the full norm E|Delta_A(q)|^2 costs 7e-4: that IS the gate loss. A proof must show
the first-chaos content of Delta_A(q), Delta_B(q) is small (ratio to the full norm below about 0.1 near the
maximiser) and grows more slowly than the slack c_1(x) as q moves away from Gaussian.

Useful facts you proved: H1 (Var(w) + 1/2 E|c|^2 <= (m-2)/3), H2 (radial integration by parts), and your quintic
leakage theorem, which is the same phenomenon on the h-side: a chaos projection of a nonlinear function of a
cubic chaos is controlled by sigma^4 (m - 2). (K-b) asks for the degree-ONE projection of an odd, charge-one,
non-smooth function of q. Stein: E[conj(w_j) F(q)] = E[F_u(q) d_j q + F_ubar(q) d_j conj(q)].
The elementary inequality |a+g| <= |a| + Re(g conj(phase a)) + |g|^2/(2|a|) gives a global quadratic majorant
with constants 2.0 (A), 0.76 (B), 1.19 (z), 0.99 (H): enough for B, z, H, zbar but not for A (2.0 > 1.322),
where the factor 1/2 of the phase average must be kept.

## 5. Evidence (float)

1. n = 2 (z_1 and one ordinary coordinate; all of the 6-dimensional H_{2,1}(C^2)): sup Lambda = 1.3649281
   against S = 1.3669130. The Gaussian wins by 2.0e-3.
2. Junta + diffuse: G = sigma_W W + all six ordinary components (13 real parameters, W integrated analytically):
   every start returns to the pure Gaussian point; excess <= 1e-10 at three parameter points.
3. q-only, any law: (K-a).
4. The Gaussian point is a strict local maximum in all mixed directions.
5. Not tested: several influential coordinates of comparable size; three or more ordinary coordinates; mixed
   components spread over several remote coordinates. Your coupled quadratic-phase adversaries live in high
   Hermite degrees; here G is confined to H_{2,1}, but please test the analogue.

Quadrature caution: Gauss-Laguerre in |z|^2 overestimates phase-like payoffs by 1e-3 at 24 nodes and 1.2e-4 at
100. Use Gauss-Legendre in the radius or exact formulas.

## 6. What I ask

1. Try to break K: adversarial G with several influential coordinates and all mixed components, with correct
   quadrature. A certified violation of K_eta for eta = 1.3e-4 on the needed range would end this route.
2. Prove K, or K_eta with explicit eta <= 1.3e-4 on the needed range. Partial results in order of usefulness:
   (a) K_eta for G with no influential coordinate (maximal influence below an explicit threshold), with the
       complementary junta case handled by a finite-dimensional certified computation;
   (b) an explicit bound on the first-chaos content of Delta_A(q), Delta_B(q) in terms of sigma and m - 2;
   (c) K restricted to G = q + r_A A + r_B B (the two first-order directions).
3. State the degree-5 analogue K_5 and say whether the same proof would cover it. For T = P - eps_1 Q + eta R
   the same three lines give
   V <= t^2 - 2 ell t + ||B_3||^2/eps_1 + ||C||^2/eta
        + sup_{G_3 in H_{2,1}, G_5 in H_{3,2}} { E|L + G_5 + G_3 - C| + E|L + G_5 - G_3 + C| - ||G_3||^2/eps_1 - ||G_5||^2/eta },
   whose Gaussian ideal is at most 0.71245 (K >= 1.4036), margin 8.2e-4 to the 1.402 cap instead of 1.3e-4.

## 7. What a proof buys

With K (or K_eta) the certificate becomes: rows (ell, beta) only; potential Phi_0 by one-dimensional interval
integration; residual layer by the existing moment rectangles; envelope over t. Float caps:
eps = 0.7564: 0.713135 + eta (K >= 1.40226 - ...); eps = 0.75: 0.713183; eps = 0.745: 0.713288.
It removes the gate loss, the residual-law loss and the price layer together. 1.4023 is then the hard ceiling
of the cubic witness, and K_5 would open 1.4036.

## 8. Files

  /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/gate/KSIDE.md        full derivation, tables, evidence
  /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/gate/AUDIT_DELTA.md  audit of the gate conditions
  /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/gate/                kmodel.py, kmodel2.py (Gaussian ideal),
        lowdim.py, lowdim2.py (adversarial tests), profiles.py, stab.py (profiles, Hessians), xscan.py, stein_phi.py (K-a)
  /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/d5/RESULTS.md, DERIVATION5.md   degree 5: where gates lose
  /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/deg9/RESULTS.md      witness ceilings, coupled adversaries
  /Users/alingalatan/workspaces/grothe/README.md                                                    current theorem and hypotheses

## 9. Deliverables

  1. A verdict: K (or K_eta with eta stated) proved / refuted / partial, with the exact range.
  2. The proof or the counterexample with an exact or interval certificate.
  3. Verifiers runnable under `python3 -I` from another directory, standard library only.
  4. For a partial result: the precise remaining statement.

## 10. Update (2026-10-12): attack results and the reduction to one content inequality

Details: /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kconj/RESULTS.md (all float).

Attack. No violation: z_1 + one ordinary coordinate + diffuse W (all of H_{2,1}(C^2)): excess +1.4e-12;
z_1 + two ordinary coordinates + diffuse W (all 18 components of H_{2,1}(C^3)): excess 4-5e-9 (coarse-grid
artefact; every start returns to the Gaussian point); scale mixtures with Gaussian multipliers + junta + W:
excess <= 0 (the purely multiplicative point is a local maximum 5.7e-4 below S). Not tested: four or more
coordinates of comparable influence; real (non-circular) Gaussian multipliers.

Realistic cap under K (explicit Phi_0, moment LP, node-grid chords): 0.713160 at eps = 0.7564 (K = 1.40221),
0.713201 at 0.75, 0.713310 at 0.745. So K_eta leaves eta <= 1.0e-4 for 1.402. The q-only part is certificate-ready
with the existing moment-rectangle layer (at flank rows the moment LP is not lossless, but those rows stay below
the peak).

Reduction of the mixed part. If the fibre potential has a global quadratic majorant with constant h < 1/eps
in the mixed directions, then
    Lambda(q + mixed) <= Lambda_q + ( ||Pi_{1,0} Delta_A(q)||^2 + ||Pi_{0,1} Delta_B(q)||^2 ) / (1/eps - h).
Measured constants (1/eps = 1.322): A 1.03, B 0.62, z 1.19, H 0.99, zbar 0.70; 1.20 on the spans (A,B) and
(A,B,z,zbar). One failure: the (z,H) plane gives 1.71 > 1/eps because it re-tunes ell and beta, so the constant
nu must be treated as a parameter of the base profile L, not through the majorant.

CONTENT INEQUALITY (what K_eta then needs):
    ||Pi_{1,0} Delta_A(q)||^2 + ||Pi_{0,1} Delta_B(q)||^2 <= 0.122 * ( c_1(q) + eta ),
with c_1(q) the q-only slack (about 1.2e-4 * x^2 for x <= 1, x^2 = E|q|^4/sigma^4 - 2) and eta <= 1.0e-4.
Observed on two families (junta H(z_2) + diffuse; skew multiplicative z_2(|z_3|^2-1) + diffuse): the left side
divided by 0.122 is at most 0.25 * slack for mixing weight >= 0.2 and at most 5.5e-6 below it; the content ratio
never exceeds 0.20; the content is THIRD order (content^2 ~ x^2.7, about 2.2e-5 * x^3 on the junta family) while
the slack is second order (~ x^2), in line with a charge-counting argument.

Proved so far (Bessel bound): ||Pi_{1,0} F(q)||^2 <= 2 Var(F_u(q)) lambda_max(Gamma) + 2 Var(F_ubar(q)) lambda_max(Gamma'),
Gamma, Gamma' the Gram matrices of the two gradients of q. It closes the content inequality only when the largest
influence share is below about 0.027. What is missing is the third-order structure, e.g.
    ||Pi_{1,0} F(q)||^2 <= C * sigma^4 * (m - 2)^{3/2}   with small explicit C,
for F = Delta_A, Delta_B (odd, charge one, |F(u)| <= 0.6|u|^2, F ~ u|u| near 0), in the style of the quintic
leakage theorem (there the exponent of m-2 is 1; here the needed gain is the extra half power or a small constant).

Hybrid schemes: none found with Gaussian ideal below 0.71320; using the full norm of Delta costs 1.9e-3.
Any improvement has to use the chaos constraint on r_A, r_B.

Degree 5: the gate-free row for P - 0.848926 Q + 0.281576 R reproduces the model norm: maximum over t
0.71243-0.71245 (K about 1.4036). The coupling of our term C to the adversary's residual is essential (without it
0.743-0.753). The diffuse quintic direction was not tested.

Requests, updated: (1) prove the content inequality, or the third-order bound with explicit C, for F = Delta_A,
Delta_B; (2) certify the global quadratic majorant constants h < 1/eps in the mixed directions other than nu, and
the treatment of nu as a base-profile parameter; (3) attack K with four or more comparable coordinates and with
real Gaussian multipliers.

## 11. Update (2026-10-12, later): what is proved toward K, and why the content route does not close

Details and full proofs: /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kproof/PROOF_NOTES.md.

Corrections to sections 4 and 10: the profiles F_A, F_B are C-infinity charge-one functions with bounded derivatives;
Delta_A = 2.15 s^3 and Delta_B = 1.03 s^3 near 0 (not s|s|). The (A,B)-block majorant constant is h_X = 1.03
(not 1.20); (z,zbar) block h_Y = 1.20; so the denominator in the reduction is 1/eps - h_X = 0.292 (not 0.122).
The "factor 4 to spare" of section 10 re-optimised sigma for each q; at fixed sigma the ratio on the junta family is
up to 0.385 with the correct denominator.

Proved (from H1 and Gaussian integration by parts):
  * resolvent identity: for Y in the p-th chaos, E[conj(Y) ((3 N_u - p) Psi)(q)] = 3 E[conj(Y) R_Psi],
    R_Psi = 2(W - sigma^2) Psi_{u ubar} + C Psi_{uu} + conj(C) Psi_{ubar ubar};
  * second-order content bound: ||Pi_{1,0} F(q)||^2 <= (3/25)(4 A_1^2 + 2 B_1^2) sigma^4 (m - 2);
  * influence bound: lambda_max(Gamma)^2 + lambda_max(Gamma')^2 <= ||Pi_{1,1}|q|^2||^2 <= (3/4) sigma^4 (m - 2);
  * third-order content bound: ||Pi_{1,0} F(q)||^2 <= (3 sqrt6/2)(M_1 + M_2) sigma^6 (m - 2)^{3/2};
  * cubic tensor inequality: sum_j |E[conj(w_j) q^2 conj(q)]|^2 <= 3.674 sigma^6 x^3 (numerically 0.4775).

Does the chain close? No. With provable constants (K_2 = 0.60, K_3 = 41.2 at the peak row) K_eta with eta = 1e-4
follows only for residuals with x = sqrt(m-2) <= 0.22. A cubic bound alone would need constant <= 0.22 to cover
x <= 1; the junta family itself sits at 0.29-0.85. The content saturates (bounded profiles), so no polynomial-in-x
bound is sharp beyond x about 0.5, and against the fourth-moment (moment-LP) slack the requirement is nearly tight
at large x (ratio 0.9-0.95 for the Wick monomial at sigma = 0.25-0.30). Against the TRUE slack of the same q the
ratio is at most 0.385. So the proof cannot be split into "content <= f(x)" and "slack >= g(x)".

Open lemmas, in order of promise:
  L4 (monotonicity along the CLT): Lambda(G) <= Lambda( (G(z,w) + G(z,w'))/sqrt 2 ) for nu = 0, w' an independent
     copy of the remote coordinates. Iterated, it gives K with no content bound at all. Seen numerically for the
     q-only part on the Wick monomial (sigma = 0.2: 1.363988 < 1.366827 < 1.373953). Untested with mixed components.
     This is an entropy-jump / Shlyakhtenko-Artstein-Ball-Barthe-Naor type statement for a convex functional.
  L3 (content against true slack): the direct statement, comparing the first-chaos content with the actual slack of q.
  L1 (fibre majorant): the block inequality with (h_X, h_Y) about (1.05, 1.25), uniformly in small nu, with nu treated
     as a base-profile parameter; finite-dimensional, certifiable by interval arithmetic.
  L2 (sharp cubic contraction): the sharp constant in the tensor inequality (proved 3.674, numerically 0.4775).
  L5: the q-only bound with nu as a certificate.

Request, updated: L4 first. Test it numerically with all mixed components; if it survives, it is the cleanest route
to K (and to K_5, since the argument does not see the degree). Otherwise L3 with L1.

## 12. Update (2026-10-12, latest): L4 is false as stated; what survives

Details: /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kclt/RESULTS.md (float).

The Gaussian-limit family. Under repeated symmetrisation of the remote variables the limit is NOT independent
circular Gaussians: two cross moments survive, kappa = E[r_A r_B] (both first chaos, opposite charge) and
p = E[r_z^2] (r_z has charge 0 and may be real). Given u = |z_1|^2, G is complex Gaussian with variance
V(u) = sigma^2 + a^2 (u-1)^2 + b^2 u^2/2 + v_z u and pseudo-variance P(u) = sqrt2 kappa u(u-1) + p u (plus a mean
from nu). Over all 10 real parameters, at three rows, the supremum equals S to 2e-16: every start returns to the pure
point. So K is consistent on its own limit family, including the non-circular case (one resolution only).

L4 (Lambda(G) <= Lambda(SG)) is FALSE. Exact counterexample: G = c z_1 (|z_2|^2 - 1); then |L+G| + |L-G| =
2|z_1| max(a(u), |m|), flat near m = 0, so heavier tails raise its mean: Lambda(G) - Lambda(SG) = +4.9e-4 at c = 0.15,
+7.8e-3 at c = 0.40. Similar violations with r_A, r_B, r_zbar. None is near the maximiser (the example is 2.9e-2
below Lambda(0)). Reason: only the q-direction has a negative quartic coefficient; in the mixed directions the fibre
potential is flat then linear, so fourth cumulants help the adversary.

What survives:
  * q-only monotonicity: J(q) = Lambda_q(Sq) - Lambda_q(q) > 0 at all 19 points computed (junta + diffuse family).
  * Sup-monotonicity L4*: sup over mixed components at level 0 <= the same supremum one level up. Holds at all seven
    points tested (margins 3.8e-4 to 8.5e-3).
  * Content against true slack: rigorous bound of the mixed gain R <= 0.383 * (true slack), actual gain <= 0.18 * slack.
  * Concavity of h(v) = E Phi_0(sqrt v |W|) on [0,2] (h'' from -3.3 to -0.11): by Jensen, Lambda_q <= S for every
    Gaussian scale mixture, with no moment data.
  * The single-step inequality "R <= J" is false for the Wick monomial (ratio 0.95 to 1.95); the actual gain does
    satisfy M0 <= J (ratio 0.35-0.70).

A route that is not contradicted: L4* plus the proved small-x theorem (section 11: the chain closes K_eta, eta = 1e-4,
for x <= 0.22). S halves x^2 = m - 2, so eight steps take the Wick monomial from x^2 = 42 to 0.16. Proving L4* needs
"mixed gain <= CLT jump of the q-only functional + mixed gain one level up".

Requests, final form:
  (1) L4*: prove or refute sup-monotonicity (with mixed components in several remote coordinates and non-junta q).
  (2) Alternatively L3: mixed gain <= true slack of q, directly (ratio observed <= 0.18).
  (3) L1: certify the fibre majorant constants (finite-dimensional).
  (4) The same for the degree-5 pair (K_5).
