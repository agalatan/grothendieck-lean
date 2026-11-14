<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kclt/RESULTS.md (file dated 2026-10-12). Only this line was added. -->
# L4 (monotonicity along the CLT): test, verdict, and what survives        (Worker K3, 2026-10-12)

Everything numerical is FLOAT (grids stated).  No repository change.  Code: gaussfam.py, l4.py, check1d.py, jump.py, conc.py, conc2.py.
Notation as in conjecture_K_handoff.md / PROOF_NOTES.md.  Gauge z1 = sqrt(u) >= 0.  Basis (unit vectors): q-part H(z2); r_A z2 (u-1); r_B conj(z2) z1^2/sqrt2;
r_z (|z2|^2-1) z1; r_zb z2^2 conj(z1)/sqrt2.

## 1. The S-limit family and its supremum
Under S^k the coefficient vector (q, r_A, r_B, r_z, r_zb)(w) converges to a jointly Gaussian vector with the same covariance AND pseudo-covariance.
Chaos orthogonality and charge kill every cross moment except two:  kap := E[r_A r_B]  (both of w-charge +-1 in the first chaos; |kap| <= ||r_A|| ||r_B||)
and  p := E[r_z^2]  (r_z in H11 has charge 0 and may be REAL, e.g. |z2|^2-1; |p| <= ||r_z||^2).  So the limit is NOT "independent circular Gaussians":
   G | u  ~  complex Gaussian with mean nu sqrt(u)(u-2)/sqrt2,
   variance         V(u) = sig^2 + a^2 (u-1)^2 + b^2 u^2/2 + vz u          (vz = ||r_z||^2 + ||r_zb||^2),
   pseudo-variance  P(u) = sqrt2 kap u(u-1) + p u,
and   Lambda = E_u E_g[ rho(|x + mu + e^{i psi} sqrt|P| g|, sqrt(V-|P|)) + rho(|x - mu + ...|, .) ] - (sig^2+a^2+b^2+vz+|nu|^2)/eps,
x = sqrt(u) a(u), psi = arg(P)/2, g real N(0,1), rho(x,s) = E|x + sW| (closed form).  One Gauss-Legendre x one Gauss-Hermite integral.
Supremum over the 10 real parameters (gaussfam.py; 30x8 radial nodes, 40 Hermite nodes; 23-42 starts incl. correlated/non-circular/large ones):
   row                                   S            sup - S (nu = 0)   sup - S (nu free)
   eps .7564 (ell,beta) = (.8456,.1432)  1.373953526  0.0e+00            0.0e+00
   eps .745  (.8534,.1467)               1.383803308  2e-16              2e-16
   eps .7564 (.76,.1192) (flank)         1.249705241  0.0e+00            (see gf_flank.log)
Every start converges to the pure point (sig = sig*, all else 0) or stays at the saddle G = 0 (Lambda(0) = S - 2.07e-3 at the peak).
Effective second-order constants at the Gaussian point (must be < 1/eps = 1.322), peak row:
   r_A circular 0.857 | r_B circular 0.389 | a=b, kap=+ab 0.468 | kap=-ab 0.777 | kap=i ab 0.623 |
   r_z circular 0.622 | r_z REAL multiplier 0.118 | r_z IMAGINARY multiplier 1.126 (the worst) | nu real 0.153 | nu imaginary 0.897.
So: K restricted to the S-limit family holds (float), and non-circular r_z (untested before) is stable.

## 2. L4 as stated is FALSE
Lambda(G) <= Lambda(SG) fails for mixed components.  Cleanest counterexample (exact one-dimensional integrals, check1d.py):
   G = c z1 (|z2|^2 - 1)   (r_z real).   Then |L+G| + |L-G| = 2|z1| max(a(u), |m|), m = c(|z2|^2-1), a convex function that is FLAT near m = 0,
   so heavier tails of m increase its mean:
      c = 0.15:  E f(G) = 1.372739705 > E f(SG) = 1.372246586 > E f(S^2G) = 1.372027244 > Gaussian 1.371880318      D1 = +4.9e-4
      c = 0.40:  1.412602972 > 1.404817218 > 1.398866161 > 1.392568927                                              D1 = +7.8e-3
   (the 5-dimensional grid of l4.py reproduces D1 = +4.945e-4 and +8.19e-3).  Lambda decreases monotonically along S here.
Other violations (l4.py, grid 24 radial x 16 angles per coordinate): r_A = 0.4 with q = 0.15 H(z2), sigma_W = 0.14: D1 = +3.3e-3;  r_B = 0.4: +1.5e-3;
r_zb = 0.4 alone: +7.5e-4.  Adversarial maximisation of D1 over c in C^5 (nu = 0): +8.2e-4 at |c| <= 0.15, +8.2e-3 at |c| <= 0.4 (r_z-dominated).
None of these G is near the maximiser (Lambda(G) <= S - 2.9e-2 in the 1-d example), so Conjecture K is NOT contradicted: L4 is simply not the right
statement.  Gaussianisation does not dominate pointwise either: Lambda(G) > Lambda(G_inf) for q = .15 H, r_A = .4 (+6e-3).

## 3. What survives numerically
(a) q-only monotonicity: for q = sigma(a H(z2) + sqrt(1-a^2) W), the jump J(q) := Lam_q(Sq) - Lam_q(q) is > 0 for all 24 (sigma, a) tested
    (sigma in {.14,.2,.25,.3}, a in {.1,...,1}), and Lam_q(q) < Lam_q(Sq) < Lam_q(Gaussian) on every chain.
(b) Sup-monotonicity L4*:  sup_mixed Lambda(q + mixed) <= sup_mixed Lambda(Sq + mixed').  With M0 = optimal mixed gain at level 0 and M1 the level-1 value
    with the symmetrised response (a lower bound of the level-1 supremum), relative to Lam_q(q):
       sigma  a     T = S - Lam_q   J          R (bound)   M0 (actual)   M1 - M0
       0.14   1.0   4.18e-3         1.15e-3    1.09e-3     4.06e-4       +9.6e-4
       0.20   0.5   1.18e-3         4.3e-4     1.9e-4      9.2e-5        +3.8e-4
       0.20   1.0   1.01e-2         2.9e-3     3.6e-3      1.70e-3       +2.2e-3
       0.25   0.5   2.69e-3         7.6e-4     3.8e-4      1.65e-4       +6.7e-4
       0.25   1.0   1.83e-2         4.8e-3     7.0e-3      3.32e-3       +3.1e-3
       0.30   1.0   2.97e-2         6.7e-3     1.14e-2     4.67e-3       +4.5e-3
       0.40   1.0   6.47e-2         1.14e-2    2.22e-2     7.41e-3       +8.5e-3
    L4* holds at all seven points.  R = content^2/(1/eps - 1.03) is PROOF_NOTES' rigorous bound of the mixed gain; the actual gain M0 is 0.33-0.48 of it.
(c) Content against slack: R/T <= 0.383 (max at the pure Wick monomial, sigma = .25-.30) and M0/T <= 0.18; for a <= 0.5, R/T <= 0.16.
    The SINGLE-step inequality R(q) <= J(q) is false for the Wick monomial (R/J = 0.95, 1.22, 1.47, 1.71, 1.95 at sigma = .14, .2, .25, .3, .4) and true for
    a <= 0.7 (R/J <= 0.83).  The actual gain satisfies M0 <= J at sigma <= 0.3 (ratio 0.35-0.70).

## 4. What can be proved, and what it gives
* [float, one explicit function] h(v) := E_W Phi0(sqrt(v)|W|) is concave on [0, 2] (h'' from -3.3 at v = .001 to -0.11 at v = 2; h'(sigma*^2) = 1/eps).
  Hence, by Jensen, Lam_q(q) <= S for every Gaussian SCALE MIXTURE q (decoupled kernels), with no moment data.  This re-proves (K-a) on that class.
* The joint functional is NOT concave in the covariance parameters (conc.py: largest Hessian eigenvalue +1.3..+2.9 on the full cone, +0.1..+0.6 on the
  circular block; convex in b^2, vz and in the pseudo-variance), and the family of conditionally Gaussian G with arbitrary conditional cross-covariance
  (e.g. q = z2 X, r_A = z2) leaves the S-limit family: conditional correlations between q and r_A have a first-order effect 2 gamma_A a sigma that only
  cancels on average.  So no Jensen argument proves K on conditionally Gaussian G; this is exactly the content mechanism of PROOF_NOTES.
* Why L4 fails and (a) holds: along a ray, f is "alpha + beta|c|^2 - gamma|c|^4" with gamma > 0 only in the q-direction (Phi0 is strictly concave in v);
  in the directions r_z (real), r_A, r_B, r_zb the fibre potential is flat-then-linear (gamma < 0): fourth cumulants help the adversary there.
  A cumulant statement that is true and usable must therefore weigh the q-direction cumulant against the mixed ones: this is L3 (content against true
  slack), now with data: R <= 0.39 T on the junta family, M0 <= 0.18 T.
* Usable consequence of section 1: K follows from L3-type control for q near Gaussian (PROOF_NOTES closes x <= 0.22 at eta = 1e-4) PLUS any statement
  that moves a general q into that neighbourhood without losing: L4* is such a statement (iterate S: x^2 halves at each step; 8 steps take the Wick monomial
  x^2 = 42 to 0.16).  L4* is strictly weaker than L4, is not contradicted by the counterexamples above, and holds at the seven points tested.
  Proving L4* needs: M0(q) <= J(q) + M0'(Sq)-type bookkeeping, i.e. "mixed gain <= CLT jump of the q-only functional + mixed gain one level up".
