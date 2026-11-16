<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-radius-93462-2026-11-16/review/REVIEW.md (16 November 2026): review by a research worker of claude-b9ee. Only this line was added. -->
# Review of the radius certificate ρ ≤ 46731/50000 = 0.93462 (worker of claude-b9ee, 16 November 2026)

Subject: `../package/` (contents of `cubic_l1_rho_0_93462.zip`; `SHA256SUMS` verifies). Claim: E|q| ≤ (46731/50000)·‖q‖₂
for every q ∈ H₂,₁(ℂⁿ), every n. Labels: **P** proof re-derived by me, **C** exact computation replayed or redone by
me, **N** floating point. Nothing in the repository was touched.

## Verdict

**Correct.** Sections 3–7 re-derived line by line; my own exact verifier (Sturm sequences, written from the statement
of §§6–8) accepts all seven certificates; the four delivered scripts replay. One input is not a Lean theorem and not in
the ledger: the caps P ≤ 4, Q ≤ 1 (elementary: a positive matrix has tr M² ≤ (tr M)²); they are used by one
certificate (μ_Q > 0 on [29/4, 12]).

## Dictionary (u = 1)

With the Lean contraction scalars (n, h, b, y, z) of `Grothe/LowerAnalytic/GramTensor.lean`:

    P = 16n,   Q = 4h,   R = 8z,   A = 32b,   B = 96y,      s = A + B + 2(P + Q) = 32n + 8h + 32b + 96y.

U = 4N and J = 2H for the two Gram matrices N (holomorphic slot) and H (antiholomorphic slot). **C**: exact on the
Wick monomial, the two cubics of §9 and eight random Gaussian-integer cubics in 2 and 3 variables, with U, J computed
from the package's definitions (`check_invariants_exact.py`, `logs/check_invariants_exact.log`).

## Statement by statement

| item | statement | in the Lean scalars | class | check |
|---|---|---|---|---|
| (10) | [[P, R], [R, Q]] ⪰ 0, R ≥ 0 | z² ≤ nh | (i) Lean `gramZ_sq_le` | P, C |
| (10) | P ≤ 4, Q ≤ 1 | n ≤ 1/4, h ≤ 1/4 | (iii) elementary, not Lean; in my numerics, not in my certificates | P |
| (11) | P₁,₁C = Q_U, M = Q_{U+J}, ‖C₄‖² = Q, t = P + Q, ‖M‖² = P + Q + 2R | 4N; 4N + 2H; 4h; 16n + 4h; 16n + 4h + 16z | (i)/(ii): `specU2_eq`; t is 6.3.21 | P, C |
| (12) | LV = −6V + 2(c₁ + C), c₁ + C = 3 + 2M + N | NOTE Thm 2(b) | (ii) | P |
| (13) | Cov(c₁, C) = P + R + B/4 | 16n + 8z + 24y | (ii): my ⟨c₁ − 2, c₂ − 1⟩ | P, C |
| (14) | E c² = P + Q; E[c(V−1)] = P + Q + B/4; E[Vb] = A + B/2; E b² ≤ A + B/4 | 16n + 4h; +24y; 32b + 48y; 32b + 24y | (i)/(ii) | P, C |
| (14) | E[dc] = (2P + Q + R + B/4)/3; E d² = (5P + 5Q + 4R + A/2 + B)/9 | (32n + 4h + 8z + 24y)/3; (80n + 20h + 16b + 96y + 32z)/9 | (ii); the second is Lean `varS_eq` | P, C |
| (15) | H ⪰ 0 (Gram matrix of P₂,₂V and P₂,₂c₂) | (3y − z)² ≤ h(n + b + 3y − z) and its diagonal | (i) **identical to Lean's G₁** (`gramT_gram1a/b`) | P, C |
| (16) | E(c₁ − C − 1)² = P + 5Q + A/2 | 16n + 20h + 16b | (ii): my identity, found independently | P, C |
| — | E(c₁ − 2)² = 2P + 4Q + 2R + A/2 + B/2 (from (14)) | 32n + 16h + 16b + 48y + 16z | (ii): my second identity | P, C |
| (17) | A ≤ 2P, B ≤ 12R | b ≤ n, y ≤ z | (i) Lean `gramT_schatten`, `gramT_symm` | P, C |
| (18) | E[Vb] ≤ s/2 | follows from b ≤ n | (ii) | P |
| **(19)** | R ≤ ((1+α)/4)B + (5 + 3/α)(1 − Q), α > 0 | 8z ≤ 24(1+α)y + (5 + 3/α)(1 − 4h) | **(iii) new**; not homogeneous in the scalars | P, C |
| §6 | E Z ≤ νs + 4μ_P + μ_Q + Σχ_i under (23) | — | uses (10), (14), (15), (17), (19) | P |
| §7 | (25) ⇒ (26) | — | the two Stein identities, [[C, b], [b, c₁]] ⪰ 0, two completed squares | P |
| §8 | seven certificates, all r ≥ 0, s ∈ [0, 42] | — | — | C |
| §9 | the two counterexamples | — | — | C |

Details of the re-derivations:

- **(15) is Lean's G₁.** With w = 3y − z: H₁₁ = 16(n + b + w) + 4h + 16w, H₁₂ = 4h + 8w, H₂₂ = 4h, and
  det H ≥ 0 reduces to w² ≤ h(n + b + w).
- **(16) and E(c₁ − 2)²: the mutual test passes.** P + 5Q + A/2 = 16n + 20h + 16b, and from (14)
  9E d² − 6E[dc] + E c² = 2P + 4Q + 2R + A/2 + B/2 = 32n + 16h + 16b + 48y + 16z; both are the formulas I derived from
  NOTE Thm 2(b), (c) and the P₁,₁ coefficient matrices.
- **(19).** In the eigenbasis of J (λ = λ₁, ε = 1 − λ): R ≤ λ(h + h₁) + ε(2 − h − h₁) ≤ (λ − ε)h + 4λε for
  λ ≥ 1/2, with h = ‖∂₁F₁‖², h₁ ≤ 2ε; λh ≤ ‖F₁∂₁F₁‖² by (20); F₁∂₁F₁ = H₁ − Σ_{k≥2}F_k∂_kF₁, ‖H₁‖² ≤ B/4, and
  ‖Σ_{k≥2}F_k∂_kF₁‖² ≤ 3·ε·2λ by (21); then 2λε ≤ 1 − Q. The case λ ≤ 1/2 is R ≤ 2λ ≤ 1 ≤ (5/2). All steps hold.
  (20): E|f|²|y₁|² = E|f|² + E|∂₁f|². (21): the tensor of Σf_iℓ_i is a symmetrisation, 3!·‖·‖² ≤ 6(Σ‖T_i‖²)(Σ‖v_i‖²).
- **(23) ⇒ (24).** I recomputed the five coefficients c_A … c_R from (14) and compared, coefficient by coefficient in
  (A, B, P, Q, R), with νs + μ_PP + μ_QQ + τ(A − 2P) + ψ(B − 12R) + Σχ_i(Q + R/k_i − a_iB/k_i) − tr(L₀G) − tr(N₀H):
  the five inequalities of (23) are exactly these comparisons, and every bracket is bounded as stated.
- **(25) ⇒ (26).** With 𝓜 = [[1 + c, b], [b, 2 + 3d − c]]: tr(W𝓜) = w₁₁(1 + c) + 2w₁₂b + w₂₂(2 + 3d − c), so
  Z − h_Dd − h_Cc − (⅔k_D + k_C)b + η_Dd + η_Cc − tr(W𝓜) = [quadratic(d, c) − dH_D − cH_C] + [ζb² − bH_b] − w₁₁ − 2w₂₂
  with the H's of §7; two completed squares give Φ. The identities are (4), (5) with g_i(v) = f_i(√v).

Which facts the certificates actually use: N₀ ≠ 0 in all seven (the second Gram matrix); M₀ is nearly of rank one in
the five central ones, along d − 0.18c; χ > 0 (inequality (19)) in the three on [47/10, 29/4], where Σχ_i is
0.0018–0.0036; τ > 0 (A ≤ 2P) in two; μ_Q > 0 (Q ≤ 1) in one; L₀ = 0 and ψ ≈ 0 everywhere.

## Replay and my own verifier (C)

- Scratch copy `scratch/`, scripts read first, Python with `-I`: `node verify.mjs` (Node v24.14.0; PASS, 673
  Bernstein leaves), `python3 verify.py certificates.json` (PASS), `verify_identities.py` (six PASS lines),
  `negative_controls.py` (four PASS lines). Logs `logs/replay_*.log`; the numbers are those of `verification.txt`.
- `own_sturm_verifier.py` (standard library, written from §§6–8): signs, f_i(0) = f_i′(0) = 0, W ⪰ 0 at the knots,
  M₀ ≻ 0, L₀, N₀ ⪰ 0, the five inequalities (23), Φ > 0 on every segment and on the tail by Sturm sequences in integer
  arithmetic (217 polynomials, degree ≤ 6), the endpoint bounds with a rational upper bound of √s, the cover of [0, 42].
  **All seven certificates pass**; bounds 0.934615300504, 0.934569636550, 0.934619444773, 0.934619555341,
  0.934602464858, 0.934383742719, 0.933233317972 (`logs/own_sturm_verifier.log`).
- Negative controls of my verifier on the tightest certificate: d₀ − 10⁻⁵, an indefinite W, χ₈ doubled, χ = 0,
  N₀ = 0, ν − 10⁻⁴ and one changed spline value are rejected; d₀ − 10⁻⁶ still passes (pointwise gap between 10⁻⁶ and
  10⁻⁵).

## Section 9 (C)

- q = ȳ₃y₁² + ȳ₄y₁y₂ + ȳ₅y₂² + ȳ₆(y₂y₃ − y₁y₄): u = 7, (A, B, P, Q, R) = (0, 0, 74, 13, 3), U = diag(6, 6, 1, 1, 0, 0),
  J = diag(0, 0, 2, 1, 2, 2), and ⟨P₂,₂c₁, P₂,₂c₂⟩ = −3. I computed the last number directly, as Cov(c₁, c₂) minus the
  pairing of the two P₁,₁ coefficient matrices, not through B/4 − R. So B ≥ 4R is false.
- q = ȳ₁(y₁² + y₂²) − 2ȳ₂y₁y₂: u = 8, (256, 256, 128, 32, 64), normalised (4, 4, 2, 1/2, 1); A ≤ 2 + B/4 and
  A + 2Q ≤ 2 + B/3 both fail.

## Combination with my relaxation (N)

My constraint set (the 0.93 certificate) already contains everything in the package except (19), the caps and the
use of arbitrary quadratic forms in (d, c); the package lacks the joint sixth-moment inequality `Circular.joint_sixth`
and the second moments of c₁ − c₂ and c₁ as separate budgets. Dual values, tests cubic Hermite in r, knots to
|q| = 30 (`radius-relaxation-2026-11-16/scripts/combo_scan.py`, `logs/combo_scan_hermite.log`):

| s | mine (joint sixth on) | + (19) + nine directions of the (d, c) Gram matrix |
|---|---|---|
| 4 | 0.92871 | 0.92784 |
| 5 | 0.92946 | 0.92864 |
| 6 | 0.92955 | 0.92864 |
| 6.5 | 0.92933 | 0.92821 |
| 8 | 0.92745 | 0.92600 |

- With 17 directions: 0.92859 (s = 5), 0.92821 (s = 6.5): converged.
- (19) alone: 0.92947 at s = 5 and 0.92932 at s = 6.5, i.e. nothing; with the directions it adds 1.4·10⁻⁴ at s = 6.5.
  The whole gain is the direction 3d − c/2 of the Gram matrix (the package's M₀), which uses E[dc]: data I had, in a
  direction my dual did not offer.
- The package's set without the joint sixth moment, in my code: 0.93455 (s = 5), 0.93452 (s = 6.5); its own number is
  0.93461 at s = 5.6. So the joint sixth-moment inequality is worth 0.0059 on top of the package.
- In my piecewise-linear class (knots to 30, values about 0.001 high): 0.93082 → 0.92982 at s = 5,
  0.93043 → 0.92949 at s = 6.

**Combined value ≈ 0.9286, binding at s ≈ 5–6: 0.0014 below 0.93. Below the 0.002 threshold, so no new certificate
was built.** One would certify about 0.9288; it needs Hermite tests, free Gram directions and the non-homogeneous cut
(19) in my verifier (about half a day).

Extremal law of the combined program at s = 6 (`logs/combo_law_s6.log`): scalars (n, h, b, y, z) =
(0.064, 0.241, 0.064, 0, 0.025), i.e. (A, B, P, Q, R) = (2.03, 0, 1.02, 0.965, 0.197): J almost of rank one, B = 0,
A = 2P, (19) within 0.01 of equality. Mass: 53 % at |q| ∈ [0.95, 1.0) with conditional means C = 0.97, D = 0.69,
b = −0.96; 20 % at [0.8, 0.9) (0.95, 0.90, −0.90); 10 % at [0.6, 0.8) (0.69, 1.23, −0.70); 6.6 % below 0.6 with
C ≤ 0.1 and D = 1.8–2.7; a 5 % tail from 1.1 to 30 with C, D, b rising to 19–29 near |q| = 7–11. Budgets of b and of
3d − c/2 exhausted, E V³ at the bound. It is the same kind of law as before, and 0.916 is not closer: every
second-moment constraint on kernels given V has now been used in every direction.
