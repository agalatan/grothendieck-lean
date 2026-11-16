<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/radius-relaxation-2026-11-16/REVIEW.md (16 November 2026): the independent review of the two certificates, by a review worker of claude-b9ee. Only this line was added. -->
# Review of the radius certificates 0.9387 (G) and 0.93 (N)

Reviewer: an independent worker of claude-b9ee (16 November 2026, 18:10–18:55 Bucharest time). Subject:
`results/cert_G_final.json`, `results/cert_N_final.json`, `scripts/verify_cert.py`, `scripts/check_budgets_exact.py`
of this folder (SHA-256 at the end).
Lean statements were read in the main checkout at master `b1e046783` (nothing was built). Labels: **P** proof
re-derived by me, **C** exact computation replayed or redone by me, **N** floating point. My scripts and logs are in
`review/`.

## 0. Verdict

For every n and every q ∈ H₂,₁(ℂⁿ):

| claim | verdict |
|---|---|
| **(N)** E\|q\| ≤ (93/100)·(E\|q\|²)^{1/2} | **Proved** (P + C). Largest row bound 0.9299970681 (row 13, s ∈ [25/4, 13/2]); margin to the claim 2.9·10⁻⁶, exact. Inputs: Lean theorems, Lemma 1 of the antiholomorphic-Stein note in its two forms, the pointwise cone, and three second moments that are not in Lean (two of them new); all re-derived and checked exactly here. |
| **(G)** E\|q\| ≤ (9387/10000)·(E\|q\|²)^{1/2} "from Lean theorems only" | **Proved** (P + C), and **every input is a Lean theorem of this repository** (§3; names and files given). Largest row bound 0.9386801701 (row 11, s ∈ [11/2, 6]). The certificate itself (C1–C3) is checked in Python, not in Lean; a port needs a checker and its soundness lemma, no new analysis (§3). |

I found no error in the proof, in the facts, or in the verifier. I re-derived the argument (§1), matched the scalars
with the Lean definitions line by line and re-derived the two new identities (§2), wrote an independent exact verifier
by another method, which accepts both certificates with the same exact bounds as the author's, row by row (§4), and
evaluated the whole chain on genuine cubics (§7). The corrections of §8 concern the documentation only.

## 1. The proof that a verified row gives E|q| ≤ max(B(s_lo), B(s_hi))   [P]

Notation of the docstring: V = |q|², r = √V, k = (c₂, c₁, ρ), ρ = Re(q̄²a)/V, l₁…l₅ = (1,0,0), (−1,1,0), (1,1,0),
(0,1,0), (0,0,1), c = (1,1,3,2,0), q_j = (l_j·k − c_j)².

| step | what I checked | verdict |
|---|---|---|
| cone pairing | C* = {ξ₂, ξ₁ ≥ 0, ξ_a² ≤ 4ξ₁ξ₂} is a convex cone (rotated second-order cone) and is exactly the dual of C = {k₂, k₁ ≥ 0, a_t² ≤ k₁k₂}: min over a_t of ξ_a a_t is −\|ξ_a\|√(k₁k₂), and ξ₂k₂ + ξ₁k₁ − 2√(ξ₁ξ₂k₁k₂) = (√(ξ₂k₂) − √(ξ₁k₁))². ξ(v) is piecewise linear between the knots and constant on the tail, so (C1) at the knots gives ξ(v) ∈ C* for all v ≥ 0 | P ok |
| k ∈ C | c₁, c₂ ≥ 0; ρ² ≤ \|a\|² because \|q̄²a\|/V = \|a\|; \|a\|² ≤ c₁c₂ by Cauchy–Schwarz on a = Σ ∂_jq·∂̄_jq | P ok |
| decomposition | Σ_j θ_j l_j = (θ₁ − θ₂ + θ₃, θ₂ + θ₃ + θ₄, θ₅) and ξ − β = (ξ₂ + φ₁, ξ₁ + φ₂/2, ξ_a + Y₁ + Y₂/2 − σv); the definitions of θ₃, θ₁, θ₅ are these three equations solved with θ₂, θ₄ free. So θ_j is the multiplier of the centred budget variable l_j·k − c_j (θ₁: c₂ − 1; θ₂: c₁ − c₂ − 1; θ₃: c₁ + c₂ − 3; θ₄: c₁ − 2; θ₅: ρ); θ₂, θ₄ choose how the linear part in (c₁, c₂) is split over the four linearly dependent directions | P ok |
| Young | μt² − θt + θ²/(4μ) = μ(t − θ/(2μ))² ≥ 0 for μ > 0; for μ_j = 0 the checker requires θ_j ≡ 0 (knot values for θ₂, θ₄; the piece polynomials for θ₁, θ₃; μ₅ > 0 is required). Summing with t_j = l_j·k − c_j: β·k + Σμ_jq_j ≥ ξ·k − Σθ_jc_j − Σθ_j²/(4μ_j) ≥ −(θ₁ + θ₂ + 3θ₃ + 2θ₄) − Σθ_j²/(4μ_j) | P ok |
| pointwise majorant | (C2) at v = V plus the previous line: \|q\| ≤ λ₀ + λ₁V + λ₂V² + λ₃V³ + [G₁ − c₂φ₁ − ρY₁] + [G₂ − c₁φ₂/2 − ρY₂/2] + σVρ + Σμ_jq_j, for V > 0 (V = 0 is a null set) | P ok; N: holds at 3.2·10⁶ samples of 8 cubics (§7) |
| expectation | the brackets have mean zero by (I) on (φ₁, G₁, Y₁) and (II) on (φ₂, G₂, Y₂); E V = 1, E V² = 2 + s (λ₀, λ₁, λ₂ of any sign); λ₃ = l3s + l3a + l3b with each part ≥ 0 paid by one of the three upper bounds of E V³; σ of any sign (E[Vρ] is an identity); μ₁…μ₄ multiply identities, μ₅ ≥ 0 multiplies E ρ² ≤ E\|a\|². All terms are polynomially bounded | P ok |
| regularity of the tests | g = G/v must be C¹ on [0, ∞) with g, g′ of polynomial growth (Lemma 1 with the test q̄g(V)). φ is continuous, piecewise linear in v plus a multiple of v, so G is C¹, g is C¹ on (0, ∞) with g′ = Y/v; on the first piece φ = A + Bv gives g = A + Bv/2 (smooth at 0, Y(0) = 0); beyond the last knot φ = c + κv, g′ = Y/v is bounded | P ok |
| v = 0 in (C2) | on the first piece v·θ₅ = v·ξ_a + O(v²), so v² divides the cleared polynomial; the quotient at r = 0 is λ₀ − Σθ_j(0)c_j − Σθ_j(0)²/(4μ_j) (θ₅(0) = ξ_a(0)); positivity is checked on the closed interval [0, e₁] | P ok, C |
| the scalars | every cut of (F3) is homogeneous and s = 32n + 8h + 32b + 96y, so π = s·p with p in a set P1 that does not depend on s | P ok |
| convexity in s | for the p of the given q: E\|q\| ≤ f_p(s) = base(s) + s·A(p) + s^{3/2}C(p), C(p) = inf_α d_J(α)·p = l3a(198h₀ + 300√(s₀h₀)) + l3b((11781/32)h₀ + 135√(s₀h₀)) ≥ 0 since s₀, h₀ ≥ 0 and l3 ≥ 0; base is affine plus l3s·C₆·s^{3/2}. So f_p is convex on [0, ∞) and f_p(s) ≤ max(f_p(s_lo), f_p(s_hi)); the supremum over P1 is not even needed. (In Lean: `cubic_endpoint_le`, Grothe/Lower/Basic.lean:101, in the variable x = √s) | P ok |
| endpoint | f_p(s_e) ≤ base(s_e) + s_e(d_lin + √s_e·d_J(α_e))·p for any α_e > 0 (AM–GM), ≤ B(s_e) because d_J·p ≥ 0, sb ≥ √s_e, C₆ ≥ 0, l3s ≥ 0 and (C3). At s_e = 0: f_p(0) = λ₀ + λ₁ + 2λ₂ + 6λ₃ | P ok |
| weak duality (C3) | with resid = obj − η·(32, 8, 32, 96, 0) + Σy_k a_k, y_k ≥ 0, a_k·p ≥ 0: obj·p = η + resid·p − Σy_k a_k·p ≤ η + Σ max(resid_i, 0)·P_i, using 0 ≤ p_i ≤ P_i on P1. The box (1/32, 1/8, 1/32, 1/96, 3/64): the first four from the normalisation and nonnegativity; z ≤ 3/64 from h₀ ≥ 0: 16z ≤ 8n + 2h + 8b + 72y = 1/4 + 48y ≤ 3/4. The tangent cuts: 2z ≤ θn + h/θ from z² ≤ nh; 2\|3y − z\| ≤ θh + m/θ from (3y − z)² ≤ hm, h, m ≥ 0 | P ok (the box is used by the code but not stated in the docstring, §8) |
| cover | the rows are contiguous from 0 to 42 and s ≤ 42 | C; Lean |

No step is left open.

## 2. The facts (F1)–(F4)

### 2.1 Conventions matched with Lean   [P + C]

Lean works with real polynomials a = Re q, b = Im q in real standard Gaussian variables, a complex structure J with
`rotD J a = −b`, `rotD J b = a` (`Circular`), the normalisation E a² = 1/2, and the tensor
`gramT J a b = 3·P₊P₊P₋(f + ig)`, f = ∂³a/6, g = ∂³b/6, P± = (1 ∓ iJ)/2 (GramTensor.lean:49–60), with real indices
(2n of them).

* **P.** With y_k = (x_{2k−1} + ix_{2k})/√2 and e^{(k)} = (e_{2k−1} + ie_{2k})/√2: J e^{(k)} = i e^{(k)} for J_{2k−1,2k} = 1,
  J_{2k,2k−1} = −1, which is the J with D_J q = iq. For q = Σ t_{abc} :y_ay_bȳ_c: (t symmetric in a, b),
  f + ig = Sym(Σ t_{abc} e^{(a)}⊗e^{(b)}⊗ē^{(c)}) and the projection keeps one of the three arrangements:
  `gramT J a b` = Σ t_{abc} e^{(a)}⊗e^{(b)}⊗ē^{(c)} = (U⊗U⊗Ū)t with U an isometry. Every contraction of
  GramTensor.lean pairs a slot of charge + with one of charge −, so `gramN, gramH, gramB, gramY, gramZ` of
  `gramT J a b` are the same index patterns applied to t, and Σ|t|² = E a² = 1/2 is E|q|² = 1.
* **C** (`review/own_wick.py`, `own_identities.py`, 22 exact cubics in d = 1…6, log `own_identities.log`). I
  transcribed `rotD`, `ouL`, `kern`, `cubicKernel`, `cplxProj`, `cplxT`, `ctN`, `ctH`, `ctB`, `ctW`, `ctY`, `gramN` …
  `gramZ`, `cubicTensorNormSq` literally and built (a, b) from q in real coordinates. On every instance: `Circular J`
  and `Chaos3` hold; the Lean scalars of the pair equal the complex-side patterns exactly; two Lean theorems are
  reproduced (`Circular.cubicTensorNormSq_eq`; `Circular.fourth_moment_contractions` on the real side, d ≤ 2), which
  validates the transcription; and as polynomial identities (d ≤ 5) radS = c₁ + c₂, radA + i·radB = 2a,
  radN = 2Re(q̄²a) (normalised; d ≤ 2), so Lean's w = (c₁ + c₂)/3 and r = radN/(3U) = (2/3)ρ.
* The author's function `scalars` gives exactly the same five numbers on all 22 tensors (`compare_author_scalars.log`).
  So the sentence "matched through the spectral formulas on instances" can be replaced by: matched with
  `gramN`…`gramZ` line by line.

### 2.2 Fact by fact

| fact | status | Lean name and file, or proof | my check |
|---|---|---|---|
| (F1) (I) E G(V) = E[c₂φ] + E[ρY]; (II) E G(V) = ½E[c₁φ] + ½E[ρY] | paper | Lemma 1 of `research/conjecture-K/sources/antiholomorphic-stein-2026-11-16/NOTE.md` with the test q̄g(V), g = G/v: φ = g + vg′, g′ = Y/v; real parts | P (both forms differentiated again); C for G = v², v³; N: on the Wick monomial, with the actual splines of the rows, both brackets integrate to 10⁻¹⁸ by quadrature (§7) |
| mixture ((I) + 2(II))/3 | **Lean** | `radial_cut` (RadialCut.lean:332): E[Φ(U) − φ(U)] = E[(S/3 − 1)φ(U) + r·Y(U)] for the tests (vs, z); used through `gaussian_steinInputs` (RadialCut.lean:410) | P with the dictionary of 2.1. The Lean tests vanish from the last knot on; a row's test is spline + κv with the spline equal to a constant c beyond the last knot. Decompose φ = (spline − c) + c + κv: `radial_cut`; E U = 1 with E S = 3 (`fluctuation_mean`, Fluctuation.lean:434); `energy_identity` (RadialCut.lean:391). I checked the three pieces (§8, R2) |
| (F2) c₁, c₂ ≥ 0, ρ² ≤ \|a\|² ≤ c₁c₂ | trivial; the part used by (G), r² ≤ (A² + B²)/9, is **Lean** | `radR_sq_le` (RadialCut.lean:312) | P; N asserted at every sample |
| s = 32n + 8h + 32b + 96y | **Lean** | `Circular.fourth_moment_contractions` (CircularFourth.lean:106) | literal; C on 21 instances |
| E(c₁ + c₂ − 3)² = 80n + 20h + 16b + 96y + 32z | **Lean** | `varS_eq` (GramBudget.lean:81) = 4u₂ + u₄ with `Circular.specU2_eq` (GramSpectral.lean:742), `Circular.specU4_eq` (:1844) | literal (16·4 + 16, 4·4 + 4, 16, 96, 64 − 32); C |
| E ρ² ≤ E\|a\|² = 32b + 24y | **Lean** | `AB_eq` (GramBudget.lean:118): E(A² + B²) = 4v₂ + v₄ = 128b + 96y (`specV2_eq` :777, `specV4_eq` :1794), A + iB = 2a | literal; C |
| E[Vρ] = 32b + 48y | **Lean** | `N_eq` (GramBudget.lean:123): E N = 2v₂ + v₄, N = 2Vρ (the docstring cites it as "Q") | literal; C |
| E(c₂ − 1)² = 16n + 4h | paper | NOTE Thm 2(d) with v₂ = 32b, v₄ = 96y; or directly: P₁,₁c₂ has the matrix 4N and P₂,₂c₂ the tensor D_{ab;a′b′} = Σ_i t_{abi}t̄_{a′b′i} with norm² 4h | P (direct); C |
| E(c₁ − c₂ − 1)² = 16n + 20h + 16b **(new)** | paper | docstring of `check_budgets_exact.py` | P, C: see 2.3 |
| E(c₁ − 2)² = 32n + 16h + 16b + 48y + 16z **(new)** | paper | same; equivalent to the previous row given the other two (q₂ + q₃ = 2q₁ + 2q₄) | P, C |
| n, h, b, y ≥ 0; z ≥ 0 | **Lean** | `gramN_nonneg` … `gramY_nonneg` (GramTensor.lean:90–96); z ≥ y by `gramT_symm` | literal |
| b ≤ n; y ≤ z; z² ≤ nh | **Lean** | `gramT_schatten` (GramTensor.lean:785); `gramT_symm` (:789); `gramZ_sq_le` (:101) | literal; C on instances |
| m = n + b + 3y − z ≥ 0; (3y − z)² ≤ hm | **Lean** | `gramT_gram1a` (:793); `gramT_gram1b` (:798) | literal; C |
| h₀ ≥ 0 (and s₀ ≥ 0) | **Lean** | `Circular.jointH0_nonneg` (JointContractions.lean:243), `jointS0_nonneg` (:240); `jointS0`, `jointH0` (:206–210) have the coefficients (8, 2, 8, 0, 8) and (8/3, 2/3, 8/3, 24, −16/3) | literal; C |
| (F4) E V = 1, E V² = 2 + s, s ≤ 42 | **Lean** | `gaussian_moments` (Bridge.lean:81); `Circular.gaussian_fourth_moment_le_44` (CircularFourth.lean:156) | literal |
| E V³ ≤ 6 + 9s + C₆s^{3/2}, C₆ = 4045313/100000 | **Lean** | `Circular.gaussian_sixth` (Circular.lean:587) with `Circular.tensorFacts` (CircularTensor.lean:5144); 9m − 12 = 6 + 9s | literal; C: E V³ exact on 9 cubics (the monomial: 11352 ≤ 11394.98) |
| the two joint forms, every α > 0 | **Lean** | `Circular.joint_sixth` (JointContractions.lean:252), `jointA`, `jointB` (:214–218): (150α, 198 + 150/α), ((135/2)α, 11781/32 + 135/(2α)) | literal |

Two Lean inequalities are not used by the certificates: `gramN_le_tensorNormSq_sq`, `gramH_le_tensorNormSq_sq`
(n, h ≤ 1/4; see §9).

### 2.3 The two new second moments   [P + C]

I followed the author's route and closed each step in tensor terms (u = 1, N_{jk} = Σ t_{jbc}t̄_{kbc},
H_{jk} = Σ t̄_{abj}t_{abk}, z = tr(NH)):

1. P₁,₁F = Σ m_{jk}:y_jȳ_k: with m_{jk} = E[∂_j∂̄_kF] (Gaussian integration by parts; the :y_jȳ_k: are orthonormal).
2. F = V: E[∂_jq·conj(∂_kq)] = 4N_{jk}, E[∂̄_kq·conj(∂̄_jq)] = 2H_{jk}, the two terms with ∂_j∂̄_kq vanish by
   orthogonality of H₁,₀ and H₂,₁. So m^V = 4N + 2H and ‖P₁,₁V‖² = 16n + 4h + 16z (Lean's u₂).
3. F = c₂ = Σ_i F_iF̄_i with F_i = ∂̄_iq holomorphic: m^{c₂} = 4N. Hence ⟨P₁,₁V, P₁,₁c₂⟩ = 16n + 8z.
4. c₁ + c₂ − 3 = 2P₁,₁V + P₂,₂V: N₂(qq̄) = 3V − (c₁ + c₂) by the product rule of N₂ (which I re-derived).
5. ⟨V − c₂, c₂ − 1⟩ = Σ_k‖W_k‖², W_k = Σ_jF_j∂_jF_k (Lemma 1 with the tests q̄(c₂ − 1) and w̄F_k); in tensor terms
   W_k = 2Σ(Σ_j t_{abj}t_{cjk})y_ay_by_c, so Σ_k‖W_k‖² = 4·6·‖Sym W‖² = 24y, with Lean's `ctW`, `ctY`.
6. ⟨c₁ + c₂ − 3, c₂ − 1⟩ = (16n + 8z) + ⟨V, c₂ − 1⟩ = 32n + 4h + 24y + 8z, and the two expansions give
   16n + 20h + 16b and 32n + 16h + 16b + 48y + 16z.

C: every line of this list and the five second moments hold exactly on my 22 instances, with the Lean scalars. The
instances include six dense random tensors in **d = 4** (entries up to 99), one in d = 5 and one in d = 6 (where
the contraction invariants satisfy no relation at all). This matters: the moments
are U(d)-invariants of bidegree (2,2) of a tensor in Sym²V⊗V*, and of its six slots of one type two pairs are
symmetric, so at most 4 slots can be antisymmetrised; a relation between contraction invariants that holds for all
tensors in dimension 4 therefore holds in every dimension, while dimension ≤ 3 (the author's instances) could hide a
term. The n/h asymmetry of 16n + 20h is tested (X(|Y|² − 1) has n = 1/8, h = 1/4).

## 3. "Lean theorems only" for (G)

All 22 rows of `cert_G_final.json` have ξ ≡ 0, θ₂ ≡ θ₄ ≡ 0, μ₁ = μ₂ = μ₄ = 0, φ₂ = 2φ₁ at every knot and
slope₂ = 2·slope₁ (checked exactly by my verifier, flag `lean_only`; then θ₁ ≡ 0 and θ₃ = φ₁). They use exactly:

| ingredient | where it enters | Lean |
|---|---|---|
| the mixture identity for spline + constant + linear tests | 3[G₁ − ((c₁ + c₂)/3)φ₁ − (2/3)ρY₁] has mean zero | `radial_cut`, `fluctuation_mean`, `energy_identity` |
| budget 3, E(c₁ + c₂ − 3)² | μ₃ | `varS_eq`, `Circular.specU2_eq`, `Circular.specU4_eq` |
| budget 5, E ρ² ≤ 32b + 24y | μ₅ | `radR_sq_le`, `AB_eq`, `Circular.specV2_eq`, `Circular.specV4_eq` |
| E[Vρ] = 32b + 48y | σ (negative in all rows) | `N_eq` |
| E V = 1, E V² = 2 + s, s = 32n + 8h + 32b + 96y, s ≤ 42 | λ₀, λ₁, λ₂, the normalisation of p, the cover | `gaussian_moments`, `Circular.fourth_moment_contractions`, `Circular.gaussian_fourth_moment_le_44` |
| scalar sixth moment | l3s (all rows) | `Circular.gaussian_sixth`, `Circular.tensorFacts` |
| joint sixth moment J2 (rows 0–18), J3 (all rows) | l3a, l3b | `Circular.joint_sixth` |
| cuts in the duals: y, h, z ≥ 0; b ≤ n; y ≤ z; tangents of z² ≤ nh; tangents of (3y − z)² ≤ hm (with m ≥ 0) | (C3) | `gramY_nonneg`, `gramH_nonneg`, `gramT_symm`, `gramT_schatten`, `gramZ_sq_le`, `gramT_gram1a`, `gramT_gram1b` |
| h₀ ≥ 0, s₀ ≥ 0 | the box z ≤ 3/64; d_J·p ≥ 0 | `Circular.jointH0_nonneg`, `Circular.jointS0_nonneg` |

Nothing else. **Each is a Lean theorem as stated**, so (G) rests on Lean inputs only.

What a Lean port still has to supply (algebra and checking, no analysis): the soundness lemma of the row format (the
Young step and the integration of the pointwise inequality; the integrability lemmas of the cut tests exist), a
checker for (C2) (`posOn` of Grothe/Lower/Poly.lean handles the intervals; on every tail the polynomial shifted to
the last knot has all coefficients positive, so the ray needs no subdivision — checked for all 45 rows,
`json_scan.log`), the linear
arithmetic of (C3), and the endpoint step (`cubic_endpoint_le`). One point of interface: `GramInputs` exposes the
budgets only through accepted `gramCert`/`jointCert` certificates with one joint bracket each, while the rows use
J2 and J3 together with σ; the port can either use the underlying theorems of the table directly for the Gaussian law
or split a row's dual into certificates of the existing format.

For (N) a port needs in addition: (i) the second radial identity, for instance in the form
E G(V) = E[(c₁ − c₂)φ(V)] (= 2(II) − (I)), where c₁ − c₂ = 2Σ_{ij}J_{ij}∂_ia·∂_jb in Lean's real coordinates (I derived
it from `rotD J a = −b`, `rotD J b = a` and the Gaussian integration by parts, the computation of `gE_rotD`; checked
exactly as a polynomial identity on the 21 instances with d ≤ 5); (ii) the pointwise cone, i.e. (c₁ − c₂)² + A² + B² ≤ S²;
(iii) two new tensor identities, E(c₂ − 1)² = 16n + 4h and E(c₁ − c₂ − 1)² = 16n + 20h + 16b (the third follows).

## 4. My verifier   [C]

`review/own_verifier.py`, written from the statement of (C1)–(C3) and the JSON format, standard library only, exact
integers and Fractions. Differences of method: (C2) by **Bernstein coefficients with exact subdivision** on each knot
interval (no Sturm sequences), the tail [e_K, ∞) by r = e_K + t/(1 − t); the primitives at the knots by the trapezoid
rule, compared with the piece polynomials; the linear data of (C3) from named linear forms; the box of p derived by
me. It also checks the signs (l3 ≥ 0, μ ≥ 0, μ₅ > 0, α > 0, cut multipliers ≥ 0, θ > 0), θ_j ≡ 0 where μ_j = 0,
sb² ≥ s_e, contiguity from 0 and the cover of [0, 42], and reports the ingredients of each row.

| certificate | rows | result | max bound (exact, equal to the author's) | Bernstein leaves, max depth | time |
|---|---|---|---|---|---|
| `cert_G_final.json` | 22 | all pass, cover [0, 42], claim verified | 22168548173242027115651510643893912049397 / 23616721522103699478937600000000000000000 ≤ 0.9386801701 | 2604, 8 | 1.6 s |
| `cert_N_final.json` | 23 | all pass, cover [0, 42], claim verified | 596256844912268693634676958731461230922775746431 / 641138413680354126191220668497920000000000000000 ≤ 0.9299970681 | 3350, 7 | 3.1 s |

(`own_verifier_G_final.log`, `own_verifier_N_final.log`.) Row by row, both endpoint bounds B(s_lo), B(s_hi) are
identical exact rationals in the two verifiers, on all 45 rows (`rowwise_compare.log`); `endpoint_bounds.log` lists
them (the certificates prove an s-dependent bound, e.g. (G) gives 0.8933 on [30, 42] and 0.9145 on [0, 1/2]).

**Negative controls** (`negative_controls.py`, `.log`; 97 controls, none unexpected, 25 s). Unit tests of the
positivity decision: (t − 1/3)² ± 10⁻⁹ on [0, 1], (x − 5)² ± 10⁻⁶ on [0, ∞) and on [6, ∞), a double zero, a zero at an
end point, a polynomial negative only far out on the ray, a degree-10 polynomial with a 10⁻¹² dip: all decided
correctly. On G row 11, N row 13 (the two worst rows) and N row 0, rejected as they must be: λ₀ lowered by 10⁻⁵
((C2) fails; lowered by 10⁻⁶ the rows still pass, so the pointwise margin is between), a knot value of φ₁ changed by
±1/100, μ₅ halved, μ₃ times 9/10, the sign of σ flipped, ξ_a pushed out of the cone at a knot, ξ₁ < 0 at a knot, ξ₁
raised by 1/100 everywhere (inside the cone, (C2) fails), θ₂ ≠ 0 with μ₂ = 0, φ₂ ≠ 2φ₁ with μ₁ = 0, negative l3s, μ₃,
cut multiplier, α, a tangent with θ < 0, an unknown cut, sqrt_ub lowered by 0.1 %, a row removed, the last row ending
at 41, the first starting at 1/10, the claim lowered to a row's bound, and s_hi raised by 3 (the bound passes the
claim: 0.976, 0.959, 1.225). Dropping the cut b ≤ n gives a valid row with a larger bound (0.9445 for G row 11,
0.9367 for N row 13).

**Differential test** (`differential.py`, `.log`; 24 s): 84 random perturbations of 7 rows (knot values of all seven
functions, λ₀ lowered by 0.5–4.5·10⁻⁶ around the margin, λ₂, μ_j, σ, slopes), each decided by my verifier and by the
author's (Sturm): **84 agreements** (43 accepted by both with equal exact bounds, 41 rejected by both). Perturbations
of a test function far out (for example φ₁ at the last knot, r = 200) are accepted by both: they are other valid
certificates, the margin there is enormous.

**Margins** (`margin_scan.py`, N): on a grid of 4.4·10⁵ points per row the smallest value of (right side of (C2)) − r
is 1.2·10⁻⁶ for (G) (row 15, r ≈ 14.98) and 3.1·10⁻⁶ for (N) (row 16, r ≈ 14.96); typically 7·10⁻⁶.

## 5. Replay of the author's programs   [C]

In isolated mode (`python3 -I`): `scripts/verify_cert.py` on both final certificates (2.3 s and 5.7 s),
`scripts/check_budgets_exact.py` (1.9 s) and, from a scratch copy, `scripts/test_verifier.py` on both. All outputs
are identical to `logs/verify_cert_G_final.log`, `verify_cert_N_final.log`, `check_budgets_exact.log`,
`test_verifier_G_final.log`, `test_verifier_N_final.log` apart from the timing lines (`review/replay_*.log`).
I read `verify_cert.py` in full: the Sturm chain uses positive multipliers only, handles non-squarefree polynomials
correctly given that both ends are checked positive, and its tail test uses the leading coefficients; I found nothing
wrong in it. Every number that the verifiers read from the JSON is a string of an exact rational (denominators up to
2⁶³; `json_scan.log`).

## 6. Comparison with the 0.9359 certificate

Exact algebra in `review/compare_9359.py` (C). In the Gram scalars, that certificate's unknowns are A = 32b, B = 96y,
t = 16n + 4h, and its five constraints are consequences of (F3) and of two cuts:

    Q0:  s − 3E d² − (2/3)E|a|² = 2h₀ ≥ 0     (the fluctuation bound is exactly jointH0 ≥ 0)
    Q1:  s − 2E c² − E|a|²      = 72y          Q2:  s − E|a|² − 2E[c(V − 1)] = 24y
    Q3:  E[c(V − 1)] − E c²     = 24y          Q4:  E[Vb] − E|a|²            = 24y

Its pointwise matrix [[c₂, ρ], [ρ, c₁]] ⪰ 0 is the cone C of (N), and its identities (4), (5) are (I) and
((I) + 2(II))/3. The cross moments E[c₂V], E[c₁V] of Q2, Q3 are reached here by the linear tests (slopes) together
with σ: E[c₂V] − 1 = (s − E[Vρ])/2.

* **What 0.9359 uses and (N) does not:** no constraint. Only its test space differs: C¹ cubic Hermite splines in r
  for the two tests and a matrix multiplier piecewise linear in r, against piecewise-linear φ in v here.
* **What (N) uses and 0.9359 does not:** the five Gram scalars separately with b ≤ n, y ≤ z, z² ≤ nh and the second
  Gram matrix; the exact second moments of c₁ + c₂ (there only the inequality Q0), of c₁ − c₂ and of c₁, hence the
  exact covariance of (c₁, c₂); the two joint sixth-moment inequalities.
* **(G) against 0.9359:** (G) lacks the cone, the separate identity for c₂ and every moment of c₂ alone (Q1–Q3),
  which is why it is weaker (0.9387 against 0.9359) although it has the Gram cuts and the joint sixth moment.
* **Can they be combined?** Yes, nothing prevents it: both are weak-duality certificates for the same moment problem
  on the joint law of (V, c₁, c₂, ρ), and all constraints hold together for a genuine cubic. But the union of the
  constraints is the constraint set of (N), so a combination can gain only through the test space. It would take one
  conic programme per s-interval with both families of tests and a common mesh; the cleared inequality stays a
  polynomial in r on each piece (degree ≤ 10), so the same kind of verifier applies. A real gain needs new constraints
  (§9).

## 7. Validation on genuine cubics

`review/validate_cubics.py` (log `validate_cubics.log`), with my own evaluation of q, c₁, c₂, a, ρ.

* **C.** P1 does not depend on s, so the dual bound of every row and endpoint must hold at the normalised scalars of
  every cubic: 704 triples (88 endpoints of both certificates × 8 cubics), no violation. The smallest slack is
  4.8·10⁻¹¹ (N row 21, upper end) at the ray p = (1, 1, 1, 1, 1)/168 of the Wick monomial and of sums of independent
  monomials: there the scalar relaxation is attained by genuine cubics.
* **N, quadrature, the Wick monomial** (everything is a function of |y|² ~ Exp(1); break points at the preimages
  of the knots): E|q| = 0.690821; E V, E V², E V³ = 1, 44, 11352; the brackets of (I) and (II) with the actual
  splines of the row integrate to 10⁻¹⁸; E[right side of the pointwise majorant] = 0.84324310 (G row 21),
  0.83615431 (N row 22), equal to the exact scalar-level value to 2·10⁻¹⁶ (ρ² = |a|² in one variable), below the row
  bounds 0.893288 and 0.886315.
* **N, Monte Carlo** (4·10⁵ samples each; the monomial, X²Ȳ, X(|Y|² − 1), a mixed two-variable cubic, a
  three-variable cubic, sums of 2, 8 and 30 independent monomials; s from 1.4 to 42). At every sample, for the row
  of each certificate that contains s: r ≤ (right side of (C2)) with smallest margin 6.9–7.0·10⁻⁶; (right side of
  (C2)) ≤ (majorant with the genuine c₁, c₂, ρ), i.e. the Young and cone steps; ξ·k ≥ 0; ρ² ≤ |a|² ≤ c₁c₂. The sample
  means of the two brackets are zero within three standard errors, the second moments agree with the formulas of
  (F3), and E|q| = 0.6264 (X²Ȳ), 0.6525 (X(|Y|² − 1)), 0.7082, 0.7764, 0.8355 (sums of 2, 8, 30) lie below the
  exact scalar-level values (0.86–0.91) and those below the row bounds. The means of V² and V³ are heavy-tailed and
  their Monte Carlo values are not used as evidence.
* **N, the scalar maximisation.** A direct conic maximisation over P1 (cvxpy, with the two cone constraints
  themselves, `extra_cut_probe.py`) never exceeds the exact dual bound L_e at the 88 endpoints; at the tightest
  endpoint the two agree to 4·10⁻¹², so the tangent cuts lose nothing.

## 8. Required corrections (none affects the validity of the certificates)

* **R1, docstring (C3).** State the box 0 ≤ p ≤ (1/32, 1/8, 1/32, 1/96, 3/64) used for the positive residuals and
  its derivation (z ≤ 3/64 uses h₀ ≥ 0). Without it the weak-duality claim is not self-contained.
* **R2, docstring (F1) and the last paragraph.** The Lean identity `radial_cut` is for tests that vanish from the
  last knot on. Say that a row's test is (spline − c) + c + κv and that the constant uses E U = 1, E S = 3
  (`fluctuation_mean`) and the linear part `energy_identity`; and that the Lean-only condition includes
  slope₂ = 2·slope₁ (the code checks it). State the regularity as "g = G/v is C¹ on [0, ∞)" (true because φ is
  affine near 0), not "G is C¹ with G(0) = 0".
* **R3, citations.** s: `Circular.fourth_moment_contractions`; E[Vρ]: `N_eq` (not "Q"); ρ² ≤ |a|² in Lean:
  `radR_sq_le`; the hypothesis of `Circular.gaussian_sixth`: `Circular.tensorFacts`.
* **R4, `check_budgets_exact.py`.** Add instances with d ≥ 4 (2.3: d ≤ 3 is below the stable range of these
  invariants), or cite `review/own_identities.log`; replace "reproduce … on every cubic tried" by the line-by-line
  match of 2.1.
* **R5, the record of (N).** List its non-Lean inputs precisely: (I) and (II) (equivalently the Lean mixture and the
  rotation identity), the pointwise cone, E(c₂ − 1)², E(c₁ − c₂ − 1)² (E(c₁ − 2)² follows).

## 9. Observations (not required)

* The dual treats the block (c₁ − 2, c₂ − 1) through the four fixed squares q₁…q₄; these generate the diagonally
  dominant 2×2 forms only. The same facts allow any constant positive semidefinite 2×2 multiplier (the completed
  square stays polynomial), which can only help (N).
* The coordinate cuts n, h, b, y, z ≥ 0 in the duals are redundant (negative residuals are already free); without them
  the bounds are not larger (by 1.2·10⁻⁸ on N row 13).
* The Lean inequalities n ≤ 1/4, h ≤ 1/4 are not used. As cuts p_n, p_h ≤ 1/(4s_lo) they keep the convexity argument
  (the set is fixed on the row's interval and contains every genuine p) and exclude the vertex p = (0, 1/8, 0, 0, 0)
  at which the listed optimum of the worst N rows sits (it means h = s/8, impossible for s > 2). With the
  multipliers of the rows unchanged the gain is nil on the worst rows (an optimal point with n = b remains) and at
  most 2·10⁻⁵ (N) and 5·10⁻⁵ (G), on the last rows (`extra_cut_probe_N.log`, `extra_cut_probe_G.log`, N); whether a
  re-optimisation gains is open.
* In (N), rows 11, 12, 13 are one set of multipliers (designed for [11/2, 6]) used on [11/2, 6], [6, 25/4] and
  [25/4, 13/2], and rows 14, 15 one set used on [13/2, 7] and [7, 8]; each row is verified on its own interval, so
  nothing is wrong with that. It is why the largest bound, 0.9299971, sits only 2.9·10⁻⁶ below the claim: the values
  of the conic programmes recorded in the file (the author's floats, not checked by me) are 0.92976–0.92982 on the
  worst intervals, and a certified row bound is 5–8·10⁻⁶ above the recorded value of its programme.

## 10. Not checked

* The Lean proofs (statements only, at master `b1e046783`; nothing built).
* The search and construction scripts (`dual.py`, `dualcp.py`, `outer.py`, `make_cert*.py`, `reuse_rows.py`, …), the
  intermediate certificates (`cert_G.json`, `cert_G2.json`, `cert_N.json`, `cert_N2.json`, `cert_N3.json`) and the
  exploratory logs; they are not part of the proof.
* `scripts/validate_cert.py` was not replayed (my own validation replaces it; its log agrees with my numbers on the
  monomial and on the sum of 8).
* Of the antiholomorphic-Stein note: only Lemma 1 and Theorem 2(b), (c), (d) in the forms used here.
* The remark at the end of the docstring of `check_budgets_exact.py` on the law of V alone: I checked its three steps
  on paper (the identity E f(V) − f(0) = E[(c₁ − c₂)f′(V)] is 2(II) − (I)); it is not used by the certificates.

## Files

Reviewed (SHA-256):

    074d269a8a194abb9594b435f38f1c2f81a38274b8e886ae368c3cd6913cd3ba  results/cert_G_final.json
    fb7d22b8bf268bc2960d5f5ffa522d0dddf8b4daa6a95110afd8a13ba321df44  results/cert_N_final.json
    6f0505ca44ae77b36f3f7d12047388a0bb6af52f3fe378df8e1eda24396d79fd  scripts/verify_cert.py
    bfdf3a6003be9b51b32312dcec91c138d550cc1f1d8cc1ec7c5453bc4d20e73e  scripts/check_budgets_exact.py

Of this review (`review/`):

`own_wick.py`, `own_identities.py` (+ log): the exact Wick calculus, the Lean transcription, the facts.
`compare_author_scalars.py` (+ log). `own_verifier.py` (+ two logs), `rowwise_compare.py`, `endpoint_bounds.log`,
`negative_controls.py`, `differential.py`, `margin_scan.py` (+ logs). `validate_cubics.py`, `compare_9359.py`,
`extra_cut_probe.py`, `json_scan.py` (+ logs). `replay_*.log`: the author's programs.
