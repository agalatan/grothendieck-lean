<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kconj/RESULTS.md (file dated 2026-10-12). Only this line was added. -->
# Conjecture K: attack, partial proofs, realistic cap, degree 5      (Worker K1, 2026-10-12)
Everything numerical is FLOAT (grids stated).  Nothing is certified.  No repository change.
Notation: L = z1(ell + beta(|z1|^2 - 2)), Lambda(G) = E|L+G| + E|L-G| - ||G||^2/eps, S = sup_sigma Lambda(sigma W).

## A. Attack: no violation found
Excess = sup Lambda - S on the same grid.  Peak = (eps, ell, beta) = (0.7564, 0.8456, 0.1432); second = (0.745, 0.8534, 0.1467); flank = (0.7564, 0.76, 0.1192).
| family | parameters | starts | max excess | file |
|---|---|---|---|---|
| n = 2 (z1 + one ordinary coordinate) + diffuse W, all of H21(C^2) | 13 real | 11 (grid 10x6 radial, 32 angles) | +1.4e-12 | att3.py n=2 |
| n = 3 (z1 + two ordinary coordinates) + diffuse W, all of H21(C^3): 18 complex components incl. z2(|z3|^2-1), z2^2 conj z3, z2 z3 conj z1, all mixed r_A, r_B, r_z, r_zbar, nu | 37 real | 20 at each of the three points (grid 3x5 radial per coordinate, 12 angles, N = 486,000) | +3.9e-9, +5.2e-9, +4.3e-9 (coarse-grid artefact: a 0.003 junta component; every start returns to the Gaussian point) | a3_*.log |
| scale mixtures / multiplicative Gaussian multipliers: G = junta(z1,z2) + sigma_W W + (a z2 + b z1) xi + ((d z2^2 + e z1^2)/sqrt2 + f z1 z2) conj(eta), xi, eta independent Gaussians (conditional Gaussian integrated analytically) | 23 real | 15 at each point; 2-3 starts per run ended in nan (overflow) and are discarded | -2.6e-14 .. -5e-11 | am_*.log |
The pure multiplicative point (sigma_W = 0, a = 0.126) is a local maximum 5.7e-4 BELOW S.
Not tested: four or more ordinary coordinates of comparable influence; real (non-circular) Gaussian multipliers.
Verdict: Conjecture K survives.  In every family the Gaussian point is the global maximum found; honest eta from these searches: 0 (to grid accuracy 5e-9).

## B. What is proved, what the route needs
### B1. Realistic cap under K (independent implementation, ka.py: explicit Phi0, moment LP by HiGHS on a u-grid, rows every 0.005 in t, tangent envelope, no pair mixtures)
| eps | Gaussian ideal | + moment-LP residual layer | + chord potential on the certificate node grid | 1/B |
|---|---|---|---|---|
| 0.7564 | 0.713144 | 0.713152 | 0.713160 | 1.40221 |
| 0.75 | 0.713196 | 0.713193 | 0.713201 | 1.40213 |
| 0.745 | 0.713303 | 0.713302 | 0.713310 | 1.40192 |
(KSIDE's 0.713135 / 0.713183 / 0.713288 are the continuous-t ideals; the 9e-6 difference is the 0.005 row spacing.)
* At the peak rows the moment LP alone is within 1e-5 of the Gaussian ideal (t = 0.84: 0.713121 vs 0.713115; 0.845: 0.713144 vs 0.713135; maximiser x = 0).
* At flank rows the moment LP alone is NOT lossless: t = 0.80: 0.712262 vs 0.711274 (x = 1, sigma = 0.32); t = 0.83: 0.712999 vs 0.712926.  These rows stay below the peak, so the envelope is unaffected; Stein cuts would tighten them.
* Realistic cap under K at eps = 0.7564: about 0.71316-0.71317 (K_G > 1.4022); under K_eta add eta.  Target 0.713267 leaves eta <= 1.0e-4 after these losses.
(K-a) therefore is "certificate-ready": same moment-rectangle layer as today with Phi0 (one-dimensional integral of an elliptic integral) in place of the price-layer potential.

### B2. Reduction of (K-b) to a first-chaos content inequality (derivation; one numerical input)
Fibre potential Phi(s, m) = E_z[|L + s + m.e| + |L - s - m.e|], m = (m_A, m_B, m_z, m_H, m_zb).
Gradient at m = 0: 2 conj(c_D(s)), c_z = c_H = c_zb = 0, c_A(q) = gamma_A q + Delta_A(q), c_B(q) = gamma_B conj(q) + Delta_B(q).
If Phi(s,m) <= Phi0(s) + 2 Re sum conj(c_D(s)) m_D + h |m|^2 for all s, m (global quadratic majorant with h < 1/eps), then integrating over w (r_A in H10, r_B in H01 are orthogonal to H21 and H12, so the gamma-terms drop):
   Lambda(q + mixed) <= Lambda_q + ( ||Pi_10 Delta_A(q)||^2 + ||Pi_01 Delta_B(q)||^2 ) / (1/eps - h).                           (R)
Numerical global constants sup Q/|m|^2 (hessglob.py, hessjoint.py; peak point; 1/eps = 1.3221):
   A 1.03 | B 0.62 | z 1.19 | H 0.99 | zbar 0.70 | (A,B) plane 1.20 | (A,B,z,zbar) 1.20 | (z,H) plane 1.71 (> 1/eps).
So (R) holds with h = 1.20 for mixed components WITHOUT the constant nu; the (z,H) plane is pointwise unstable (it re-tunes ell, beta), and nu has to be
treated as a parameter of the base profile (it is a single complex number; KSIDE: nu = 0.05 costs 1.1e-3..2.9e-3), not by the quadratic majorant.
Hence K_eta follows from:   **content inequality**   ||Pi_10 Delta_A(q)||^2 + ||Pi_01 Delta_B(q)||^2 <= 0.122 (c_1(q) + eta),   c_1(q) = S - Lambda_q the q-only slack.

### B3. The content inequality on explicit families (content.py; peak point; sigma re-optimised for each q)
J: q = sigma(a H(z2) + sqrt(1-a^2) W);   M: q = sigma(a z2(|z3|^2-1) + sqrt(1-a^2) W).
| a | J: x^2 | J: slack | J: R = content^2/0.122 | J: R/slack | M: x^2 | M: slack | M: R | M: R/slack |
|---|---|---|---|---|---|---|---|---|
| 0.2 | 0.067 | 4.3e-5 | 5.5e-6 | 0.13 | 0.026 | 1.6e-5 | 9.1e-7 | 0.06 |
| 0.3 | 0.34 | 1.9e-4 | 3.5e-5 | 0.18 | 0.13 | 9.2e-5 | 8.3e-6 | 0.09 |
| 0.4 | 1.08 | 4.7e-4 | 1.2e-4 | 0.24 | 0.41 | 2.5e-4 | 3.0e-5 | 0.12 |
| 0.5 | 2.63 | 8.5e-4 | 2.1e-4 | 0.24 | 1.00 | 5.1e-4 | 7.5e-5 | 0.15 |
| 0.7 | 10.1 | 1.6e-3 | 2.2e-4 | 0.14 | 3.84 | 1.2e-3 | 1.4e-4 | 0.12 |
| 1.0 | 42 | 2.0e-3 | 8.2e-5 | 0.04 | 16 | 1.8e-3 | 6.8e-5 | 0.04 |
(a = 0.1: R = 1.2e-7 and 1.7e-8, slack below grid noise.)  The content ratio theta = content/||Delta|| never exceeds 0.20.
So on these families the route closes with a factor 4 to spare even with eta = 0: the content is third order (content ~ a^2.8, content^2 ~ x^2.7) while the slack is ~ x^2.
Mechanism: by charge counting the first non-vanishing term of E[conj(z2) F(sigma_W W + a H)] is a^3 E[conj(z2) H^2 conj(H)] E[F_{u u ubar}].

### B4. What is proved here, and why it is not enough
Lemma (Bessel bound, proved): for F in C^1(C) of charge one with E|F_u(q)|^2, E|F_ubar(q)|^2 finite and q in H21(w),
   ||Pi_10 F(q)||^2 = sum_j |E[F_u(q) d_j q + F_ubar(q) conj(dbar_j q)]|^2 <= 2 Var(F_u(q)) lam_max(Gamma) + 2 E|F_ubar(q) - E F_ubar(q)|^2 lam_max(Gamma'),
   Gamma_jk = E[d_j q conj(d_k q)] (trace 2 sigma^2), Gamma'_jk = E[dbar_j q conj(dbar_k q)] (trace sigma^2).
   (Gaussian integration by parts E[conj(w_j) f] = E[d_j f]; E d_j q = 0; Bessel for the family {d_j q}.)
With Delta_A ~ 0.39 q|q| at sigma = 0.2 this gives R <= about 4.8e-3 x iota, iota = max directional influence share; R <= 1.3e-4 only for iota <= 0.027.
For 0.03 < iota < 0.5 the crude bound exceeds slack + eta (e.g. q = a z2 xi + diffuse: iota = a^2/2, x^2 = 2 a^4, where the true content is 0 by symmetry).
So the proof needs the THIRD-ORDER structure (content^2 <= C x^3-type bound, or content^2 <= kappa * slack with kappa < 0.122), not Bessel alone.
Precise statement to hand to a mathematician:  for q in H21(w), F(u) = c_A(u) - gamma_A u (odd, charge one, |F(u)| <= 0.6|u|^2, F ~ kappa u|u| near 0):
   ||Pi_10 F(q)||^2 <= C sigma^4 (m - 2)^{3/2}   (m = E|q|^4/sigma^4),  C small enough that C sigma^4 x^3 / 0.122 <= c_1(x) + 1e-4 on the needed range;
on family J at the peak point the observed values are content^2 = 4.3e-6, 2.5e-5 at x^2 = 0.34, 2.6, i.e. content^2 <= 2.2e-5 x^3 there, against a slack roughly 5.7e-4 x^2/(1 + x^2/3) (fit to the table, not a bound).

### B5. Hybrid schemes: none found below 0.71320
The pointwise relaxation (R) with theta = 1 (full norm of Delta) costs E|Delta_A(sigma W)|^2/0.122 = 1.9e-3 at sigma = 0.2: worse than HJM's optimised gates (1.5e-4).
HJM's gates are already the best pointwise (fibrewise-quadratic) relaxation found; any improvement must use the chaos constraint on r_A, r_B (they are Gaussian
and orthogonal to H21), i.e. a content bound.  No provable scheme with Gaussian ideal below 0.71320 was obtained.

## C. Degree 5: the gate-free row reproduces the model norm
d5k.py: T = P - e1 Q + eta R at (e1, eta) = (0.848926, 0.281576); ours (ell, beta, c5, bA, bB) with C = c5 H32 + sigma (bA W(U-1) + bB conj(W) z^2/sqrt2) coupled to
the adversary's residual; adversary (sigma, nu3, nu5, a, b).  Grid 36 x 24 radial, 32 angles (calibration on the cubic: 0.713134 vs 0.713135).
| t | 0.72 | 0.76 | 0.80 | 0.82 | 0.84 | 0.86 | 0.87 | 0.88 |
|---|---|---|---|---|---|---|---|---|
| row | 0.710680 | 0.711838 | 0.712329 | 0.712413 | 0.712429 | 0.712427 | 0.712451 | 0.712444 |
Maximum 0.71243-0.71245 (grid/optimiser noise 2e-5) = model norm 0.712433: K_5 would give 1.4036.  The coupling is essential: with C independent of the
residual the same rows are 0.743-0.753.  Optimal coupling (bA, bB) ~ (-0.16, -0.10); the adversary keeps a local quintic component nu5 ~ 0.03-0.05.
For t >= 0.86 the adversary's best response switches to sigma ~ 0 (plain-phase branch), so the profile is flat on [0.82, 0.88].
Finer grid (60 x 36 radial, 48 angles) at t = 0.84: 0.712432.  The diffuse quintic direction W5 was switched off in these rows; the run with W5 on did not finish in the time allowed, so that direction is UNTESTED here (Worker R2's engine, which includes diffuse grades, gives the same model norm 0.712433).
