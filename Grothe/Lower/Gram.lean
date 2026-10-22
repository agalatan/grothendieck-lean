import Grothe.Lower.Cuts

/-!
# Law budgets cited by spectral nodes: the contraction-Gram certificate and the coupled family

A spectral node of the certificate completes two squares against a *law budget*
`λ E X² + μ E r² ≤ a P + b₀ Q` (`X = w − 1`, `r = Re(c q̄²)/U`, `P = E[XU]`, `Q = E[rU]`).  Besides
the separate budgets `E X² ≤ (2/3)P`, `E r² ≤ (2/3)Q` (and the covariance order `Q ≤ χ/3`), a node
may cite one of two further universal budgets of genuine circular cubics `q ∈ H₂,₁`, both
consequences of finite contraction identities for the coefficient tensor `t` of
`q = Σ t_{abc} :Z_a Z_b Z̄_c:` (`Grothe/LowerAnalytic/GramBudget.lean`).  With the contractions
`N, H, B, W, Y` and the scalars `n = ‖N‖², h = ‖H‖², b = ‖B‖², y = ‖Y‖², z = tr(N Hᵀ)`,

  `P = 16n + 4h + 16b/3 + 32y`,  `Q = 64b/3 + 32y`,
  `E X² = (80n + 20h + 16b + 96y + 32z)/9`,  `E|c|² = (128b + 96y)/9`,

the Gram matrices `G₀ = Gram(N, Hᵀ) = [[n, z], [z, h]]` and
`G₁ = Gram(D, C₊₊) = [[h, T], [T, (n + b + 2T)/4]]`, `T = (3y − z)/2`, are positive semidefinite,
`b ≤ n` (Schatten–Hölder) and `y ≤ z` (symmetrisation).

* **The contraction-Gram certificate** (`GramData`, `gramCert`): rational `a = A`, `b₀ = B`, two
  PSD `2×2` matrices `M₀ = (m₀₀, m₀₁, m₁₁)`, `M₁ = (k₀₀, k₀₁, k₁₁)` and `α, β ≥ 0` such that,
  coefficient by coefficient in `(n, h, b, y, z)`,

  `aP + b₀Q − λ E X² − μ E|c|² = tr(M₀G₀) + tr(M₁G₁) + α(n − b) + β(z − y) + Σⱼ eⱼ vⱼ`,  `eⱼ ≥ 0`

  (identity (4) of the certificate's `TENSOR_BUDGET_PROOF.md`; the five remainders `eⱼ` are
  checked nonnegative, positivity of a symmetric `2×2` matrix by its diagonal and determinant).
  `gram_budget_of_scalars` is its soundness: for any reals with the Gram constraints and the four
  formulas, `λ E X² + μ E|c|² ≤ aP + b₀Q`.
* **The coupled one-parameter family** `E X² ≤ a_s P − b_s Q`, `a_s = (s + 5)/9`,
  `b_s = (s + 1/2 − 3/s)/9`, `s ≥ 2` (`COUPLED_BUDGET_PROOF.md`), cited through nonnegative
  multipliers `η_j` with `Σ η_j ≤ λ`.
* **The joint sixth-moment budget** (`JointData`, `jointCert`): a Gram certificate whose identity
  (4) also pays for `ζ x_* J`, `J = A_α s₀ + B_α h₀` with `s₀ = (8, 2, 8, 0, 8)·v`,
  `h₀ = (8/3, 2/3, 8/3, 24, −16/3)·v` in the coordinates `v = (n, h, b, y, z)` and
  `(A_α, B_α) = (150α, 198 + 150/α)` or `((135/2)α, 11781/32 + 135/(2α))` (the two brackets of the
  joint sixth-moment inequality `E U³ ≤ 6 + 9χ + x J`, `x = √χ`, `JointContractions.lean`): the rational
  vector of `ζ x_* J` is subtracted from the five remainders.  `gram_joint_of_scalars` is its
  soundness: `λ E X² + μ E|c|² + ζ x_* J ≤ A P + B Q`.  A node citing it adds `ζ(−u³ + 9u² − 12)`
  to its cut and is used only for `x ≤ x_*` (`GBud.xcap`).
* `GBud` is what a node carries: nothing (`sep`, the separate budgets), a Gram certificate, a
  list of `(s_j, η_j)`, or a joint certificate; `GBud.af`, `GBud.ag` are the shifts of the
  coefficients of `u` in the two completed squares (as in the certificate's `certify_spectral.py`),
  and `GBud.ok` the exact check of the first three kinds (the joint kind is checked by `jointCert`).
-/

namespace Grothe.Lower

/-- A contraction-Gram certificate of the budget `λ E X² + μ E r² ≤ A P + B Q`: the matrices
`M₀ = (m₀₀, m₀₁, m₁₁)`, `M₁ = (k₀₀, k₀₁, k₁₁)` and the multipliers `α` (of `n − b`) and `β`
(of `z − y`). -/
structure GramData where
  A : ℚ
  B : ℚ
  m00 : ℚ
  m01 : ℚ
  m11 : ℚ
  k00 : ℚ
  k01 : ℚ
  k11 : ℚ
  ga : ℚ
  gb : ℚ

/-- Positivity of the symmetric matrix `[[p, q], [q, r]]`. -/
def psd2 (p q r : ℚ) : Bool := decide (0 ≤ p) && decide (0 ≤ r) && decide (q ^ 2 ≤ p * r)

/-- The five remainders `eⱼ` of identity (4) (coefficients of `n, h, b, y, z`), from the coefficient
vectors `P = (16, 4, 16/3, 32, 0)`, `Q = (0, 0, 64/3, 32, 0)`, `E X² = (80, 20, 16, 96, 32)/9`,
`E|c|² = (0, 0, 128, 96, 0)/9` and the trace pairings
`(m₀₀ + k₁₁/4 + α, m₁₁ + k₀₀, k₁₁/4 − α, 3k₀₁ + 3k₁₁/4 − β, 2m₀₁ − k₀₁ − k₁₁/4 + β)`. -/
def GramData.en (lam : ℚ) (g : GramData) : ℚ :=
  16 * g.A - 80 / 9 * lam - (g.m00 + g.k11 / 4 + g.ga)
def GramData.eh (lam : ℚ) (g : GramData) : ℚ := 4 * g.A - 20 / 9 * lam - (g.m11 + g.k00)
def GramData.eb (lam mu : ℚ) (g : GramData) : ℚ :=
  16 / 3 * g.A + 64 / 3 * g.B - 16 / 9 * lam - 128 / 9 * mu - (g.k11 / 4 - g.ga)
def GramData.ey (lam mu : ℚ) (g : GramData) : ℚ :=
  32 * g.A + 32 * g.B - 96 / 9 * lam - 96 / 9 * mu - (3 * g.k01 + 3 * g.k11 / 4 - g.gb)
def GramData.ez (lam : ℚ) (g : GramData) : ℚ :=
  -(32 / 9) * lam - (2 * g.m01 - g.k01 - g.k11 / 4 + g.gb)

/-- **The exact acceptance of a contraction-Gram certificate**: `λ, μ ≥ 0`, both matrices positive
semidefinite, `α, β ≥ 0`, and the five remainders of identity (4) nonnegative. -/
def gramCert (lam mu : ℚ) (g : GramData) : Bool :=
  decide (0 ≤ lam) && decide (0 ≤ mu) && psd2 g.m00 g.m01 g.m11 && psd2 g.k00 g.k01 g.k11 &&
    decide (0 ≤ g.ga) && decide (0 ≤ g.gb) && decide (0 ≤ g.en lam) && decide (0 ≤ g.eh lam) &&
    decide (0 ≤ g.eb lam mu) && decide (0 ≤ g.ey lam mu) && decide (0 ≤ g.ez lam)

/-- The trace pairing of two positive semidefinite `2×2` matrices is nonnegative. -/
lemma psd_pair {p q r a c s : ℝ} (hp : 0 ≤ p) (hr : 0 ≤ r) (hpr : q ^ 2 ≤ p * r) (ha : 0 ≤ a)
    (hc : 0 ≤ c) (hac : s ^ 2 ≤ a * c) : 0 ≤ p * a + 2 * q * s + r * c := by
  have h0 : 0 ≤ p * a + r * c := by positivity
  have h1 : (2 * q * s) ^ 2 ≤ (p * a + r * c) ^ 2 := by
    nlinarith [sq_nonneg (p * a - r * c), mul_le_mul hpr hac (sq_nonneg s) (mul_nonneg hp hr)]
  have h2 : |2 * q * s| ≤ |p * a + r * c| := sq_le_sq.1 h1
  rw [abs_of_nonneg h0] at h2
  linarith [neg_abs_le (2 * q * s)]

/-- **Soundness of a contraction-Gram certificate.**  For reals `n, h, b, y, z ≥ 0` with
`b ≤ n`, `y ≤ z`, `z² ≤ nh` (`G₀ ⪰ 0`), `n + b + 2T ≥ 0` and `4T² ≤ h(n + b + 2T)` (`G₁ ⪰ 0`,
`T = (3y − z)/2`) and the four formulas for `P, Q, E X², E|c|²`, an accepted certificate gives
`λ E X² + μ E|c|² ≤ A P + B Q`. -/
theorem gram_budget_of_scalars (lam mu : ℚ) (g : GramData) (hg : gramCert lam mu g = true)
    (n h b y z P Q X2 C2 : ℝ) (hn : 0 ≤ n) (hh : 0 ≤ h) (hb : 0 ≤ b) (hy : 0 ≤ y) (hz : 0 ≤ z)
    (hbn : b ≤ n) (hyz : y ≤ z) (hG0 : z ^ 2 ≤ n * h) (hG1a : 0 ≤ n + b + (3 * y - z))
    (hG1b : (3 * y - z) ^ 2 ≤ h * (n + b + (3 * y - z)))
    (hP : P = 16 * n + 4 * h + 16 / 3 * b + 32 * y) (hQ : Q = 64 / 3 * b + 32 * y)
    (hX : X2 = (80 * n + 20 * h + 16 * b + 96 * y + 32 * z) / 9)
    (hC : C2 = (128 * b + 96 * y) / 9) :
    (lam : ℝ) * X2 + mu * C2 ≤ g.A * P + g.B * Q := by
  simp only [gramCert, psd2, Bool.and_eq_true, decide_eq_true_eq, GramData.en, GramData.eh,
    GramData.eb, GramData.ey, GramData.ez] at hg
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨-, -⟩, ⟨⟨h00, h11⟩, h01⟩⟩, ⟨⟨k00, k11⟩, k01⟩⟩, hga⟩, hgb⟩, en⟩, eh⟩, eb⟩, ey⟩,
    ez⟩ := hg
  replace en := of_decide_eq_true en
  replace eh := of_decide_eq_true eh
  replace eb := of_decide_eq_true eb
  replace ey := of_decide_eq_true ey
  replace ez := of_decide_eq_true ez
  have t0 := psd_pair (p := (g.m00 : ℝ)) (q := (g.m01 : ℝ)) (r := (g.m11 : ℝ)) (a := n) (c := h)
    (s := z) (by exact_mod_cast h00) (by exact_mod_cast h11) (by exact_mod_cast h01) hn hh hG0
  have t1 := psd_pair (p := (g.k00 : ℝ)) (q := (g.k01 : ℝ)) (r := (g.k11 : ℝ)) (a := h)
    (c := (n + b + (3 * y - z)) / 4) (s := (3 * y - z) / 2) (by exact_mod_cast k00)
    (by exact_mod_cast k11) (by exact_mod_cast k01) hh (by linarith) (by nlinarith)
  have en' : (0 : ℝ) ≤ ((16 * g.A - 80 / 9 * lam - (g.m00 + g.k11 / 4 + g.ga) : ℚ) : ℝ) := by
    exact_mod_cast en
  have eh' : (0 : ℝ) ≤ ((4 * g.A - 20 / 9 * lam - (g.m11 + g.k00) : ℚ) : ℝ) := by exact_mod_cast eh
  have eb' : (0 : ℝ) ≤ ((16 / 3 * g.A + 64 / 3 * g.B - 16 / 9 * lam - 128 / 9 * mu
      - (g.k11 / 4 - g.ga) : ℚ) : ℝ) := by exact_mod_cast eb
  have ey' : (0 : ℝ) ≤ ((32 * g.A + 32 * g.B - 96 / 9 * lam - 96 / 9 * mu
      - (3 * g.k01 + 3 * g.k11 / 4 - g.gb) : ℚ) : ℝ) := by exact_mod_cast ey
  have ez' : (0 : ℝ) ≤ ((-(32 / 9) * lam - (2 * g.m01 - g.k01 - g.k11 / 4 + g.gb) : ℚ) : ℝ) := by
    exact_mod_cast ez
  push_cast at en' eh' eb' ey' ez'
  have hga' : (0 : ℝ) ≤ g.ga := by exact_mod_cast hga
  have hgb' : (0 : ℝ) ≤ g.gb := by exact_mod_cast hgb
  subst hP hQ hX hC
  nlinarith [mul_nonneg en' hn, mul_nonneg eh' hh, mul_nonneg eb' hb, mul_nonneg ey' hy,
    mul_nonneg ez' hz, mul_nonneg hga' (sub_nonneg.2 hbn), mul_nonneg hgb' (sub_nonneg.2 hyz)]

lemma gramCert_nonneg {lam mu : ℚ} {g : GramData} (h : gramCert lam mu g = true) :
    0 ≤ lam ∧ 0 ≤ mu := by
  simp only [gramCert, Bool.and_eq_true, decide_eq_true_eq] at h
  exact ⟨h.1.1.1.1.1.1.1.1.1.1, h.1.1.1.1.1.1.1.1.1.2⟩

/-- **The coupled family is an instance of the Gram certificate**: for `s ≥ 2`, the data
`λ = 9s`, `μ = 0`, `a = s(s + 5)`, `b₀ = −(s² + s/2 − 3)`, `M₀ = (64, −16s, 4s²)`
(`4‖4N − sHᵀ‖²`), `M₁ = 0`, `α = 16(s² − 4)`, `β = 0`, remainder `e_y = 48s + 96`, is accepted,
and gives `E X² ≤ a_s P − b_s Q`. -/
lemma coupled_of_gram (V R P Q : ℝ)
    (hgram : ∀ (lam mu : ℚ) (g : GramData), gramCert lam mu g = true →
      lam * V + mu * R ≤ g.A * P + g.B * Q)
    (s : ℚ) (hs : 2 ≤ s) : V ≤ (s + 5) / 9 * P - (s + 1 / 2 - 3 / s) / 9 * Q := by
  have hcert : gramCert (9 * s) 0 ⟨s * (s + 5), -(s ^ 2 + s / 2 - 3), 64, -16 * s, 4 * s ^ 2,
      0, 0, 0, 16 * (s ^ 2 - 4), 0⟩ = true := by
    simp only [gramCert, psd2, GramData.en, GramData.eh, GramData.eb, GramData.ey, GramData.ez,
      Bool.and_eq_true, decide_eq_true_eq]
    refine ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨?_, ?_⟩, ⟨⟨?_, ?_⟩, ?_⟩⟩, ⟨⟨?_, ?_⟩, ?_⟩⟩, ?_⟩, ?_⟩, ?_⟩, ?_⟩, ?_⟩, ?_⟩,
      ?_⟩ <;> first | nlinarith | exact decide_eq_true (by nlinarith)
  have h := hgram (9 * s) 0 _ hcert
  push_cast at h
  have hs' : (0 : ℝ) < s := by exact_mod_cast (by linarith : (0 : ℚ) < s)
  have key : (s : ℝ) * (9 * ((s + 5) / 9 * P - (s + 1 / 2 - 3 / s) / 9 * Q - V))
      = s * (s + 5) * P - (s ^ 2 + s / 2 - 3) * Q - 9 * s * V := by
    field_simp
  have h2 : 0 ≤ (s : ℝ) * (9 * ((s + 5) / 9 * P - (s + 1 / 2 - 3 / s) / 9 * Q - V)) := by
    rw [key]; linarith
  have h3 := (mul_nonneg_iff_of_pos_left hs').1 h2
  linarith

/-! ### The joint sixth-moment budget -/

/-- The joint data of a node: the bracket (`young`: (J3), otherwise (J2)), the parameter `α`, the
range `x_*` and the weight `ζ` of the cut `ζ(−u³ + 9u² − 12)`. -/
structure JointData where
  young : Bool
  al : ℚ
  xs : ℚ
  ze : ℚ

/-- The coefficient `A_α` of `s₀`. -/
def JointData.cA (j : JointData) : ℚ := if j.young then 135 / 2 * j.al else 150 * j.al
/-- The coefficient `B_α` of `h₀`. -/
def JointData.cB (j : JointData) : ℚ :=
  if j.young then 11781 / 32 + 135 / (2 * j.al) else 198 + 150 / j.al

/-- The coefficients of `ζ x_* (A_α s₀ + B_α h₀)` in `(n, h, b, y, z)`. -/
def JointData.jn (j : JointData) : ℚ := j.ze * j.xs * (8 * j.cA + 8 / 3 * j.cB)
def JointData.jh (j : JointData) : ℚ := j.ze * j.xs * (2 * j.cA + 2 / 3 * j.cB)
def JointData.jb (j : JointData) : ℚ := j.ze * j.xs * (8 * j.cA + 8 / 3 * j.cB)
def JointData.jy (j : JointData) : ℚ := j.ze * j.xs * (24 * j.cB)
def JointData.jz (j : JointData) : ℚ := j.ze * j.xs * (8 * j.cA - 16 / 3 * j.cB)

/-- **The exact acceptance of a joint certificate**: `α, x_* > 0`, `ζ ≥ 0`, and the checks of
`gramCert` with the vector of `ζ x_* J` subtracted from the five remainders. -/
def jointCert (lam mu : ℚ) (g : GramData) (j : JointData) : Bool :=
  decide (0 < j.al) && decide (0 < j.xs) && decide (0 ≤ j.ze) &&
    decide (0 ≤ lam) && decide (0 ≤ mu) && psd2 g.m00 g.m01 g.m11 && psd2 g.k00 g.k01 g.k11 &&
    decide (0 ≤ g.ga) && decide (0 ≤ g.gb) && decide (j.jn ≤ g.en lam) && decide (j.jh ≤ g.eh lam) &&
    decide (j.jb ≤ g.eb lam mu) && decide (j.jy ≤ g.ey lam mu) && decide (j.jz ≤ g.ez lam)

lemma jointCert_pos {lam mu : ℚ} {g : GramData} {j : JointData} (h : jointCert lam mu g j = true) :
    0 < j.al ∧ 0 < j.xs ∧ 0 ≤ j.ze ∧ 0 ≤ lam ∧ 0 ≤ mu := by
  simp only [jointCert, Bool.and_eq_true, decide_eq_true_eq] at h
  exact ⟨h.1.1.1.1.1.1.1.1.1.1.1.1.1, h.1.1.1.1.1.1.1.1.1.1.1.1.2, h.1.1.1.1.1.1.1.1.1.1.1.2,
    h.1.1.1.1.1.1.1.1.1.1.2, h.1.1.1.1.1.1.1.1.1.2⟩

/-- **Soundness of a joint certificate**: under the hypotheses of `gram_budget_of_scalars` and the
definitions of `s₀`, `h₀`, `λ E X² + μ E|c|² + ζ x_* (A_α s₀ + B_α h₀) ≤ A P + B Q`. -/
theorem gram_joint_of_scalars (lam mu : ℚ) (g : GramData) (j : JointData)
    (hg : jointCert lam mu g j = true)
    (n h b y z P Q X2 C2 S0 H0 : ℝ) (hn : 0 ≤ n) (hh : 0 ≤ h) (hb : 0 ≤ b) (hy : 0 ≤ y)
    (hz : 0 ≤ z) (hbn : b ≤ n) (hyz : y ≤ z) (hG0 : z ^ 2 ≤ n * h)
    (hG1a : 0 ≤ n + b + (3 * y - z)) (hG1b : (3 * y - z) ^ 2 ≤ h * (n + b + (3 * y - z)))
    (hP : P = 16 * n + 4 * h + 16 / 3 * b + 32 * y) (hQ : Q = 64 / 3 * b + 32 * y)
    (hX : X2 = (80 * n + 20 * h + 16 * b + 96 * y + 32 * z) / 9)
    (hC : C2 = (128 * b + 96 * y) / 9) (hS0 : S0 = 8 * n + 2 * h + 8 * b + 8 * z)
    (hH0 : H0 = 8 / 3 * n + 2 / 3 * h + 8 / 3 * b + 24 * y - 16 / 3 * z) :
    (lam : ℝ) * X2 + mu * C2 + j.ze * j.xs * (j.cA * S0 + j.cB * H0) ≤ g.A * P + g.B * Q := by
  simp only [jointCert, psd2, Bool.and_eq_true, decide_eq_true_eq] at hg
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨-, -⟩, -⟩, -⟩, -⟩, ⟨⟨h00, h11⟩, h01⟩⟩, ⟨⟨k00, k11⟩, k01⟩⟩, hga⟩, hgb⟩, en⟩,
    eh⟩, eb⟩, ey⟩, ez⟩ := hg
  have t0 := psd_pair (p := (g.m00 : ℝ)) (q := (g.m01 : ℝ)) (r := (g.m11 : ℝ)) (a := n) (c := h)
    (s := z) (by exact_mod_cast h00) (by exact_mod_cast h11) (by exact_mod_cast h01) hn hh hG0
  have t1 := psd_pair (p := (g.k00 : ℝ)) (q := (g.k01 : ℝ)) (r := (g.k11 : ℝ)) (a := h)
    (c := (n + b + (3 * y - z)) / 4) (s := (3 * y - z) / 2) (by exact_mod_cast k00)
    (by exact_mod_cast k11) (by exact_mod_cast k01) hh (by linarith) (by nlinarith)
  have en' : (0 : ℝ) ≤ ((g.en lam - j.jn : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 en
  have eh' : (0 : ℝ) ≤ ((g.eh lam - j.jh : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 eh
  have eb' : (0 : ℝ) ≤ ((g.eb lam mu - j.jb : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 eb
  have ey' : (0 : ℝ) ≤ ((g.ey lam mu - j.jy : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 ey
  have ez' : (0 : ℝ) ≤ ((g.ez lam - j.jz : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 ez
  simp only [GramData.en, GramData.eh, GramData.eb, GramData.ey, GramData.ez, JointData.jn,
    JointData.jh, JointData.jb, JointData.jy, JointData.jz] at en' eh' eb' ey' ez'
  push_cast at en' eh' eb' ey' ez'
  have hga' : (0 : ℝ) ≤ g.ga := by exact_mod_cast hga
  have hgb' : (0 : ℝ) ≤ g.gb := by exact_mod_cast hgb
  subst hP hQ hX hC hS0 hH0
  nlinarith [mul_nonneg en' hn, mul_nonneg eh' hh, mul_nonneg eb' hb, mul_nonneg ey' hy,
    mul_nonneg ez' hz, mul_nonneg hga' (sub_nonneg.2 hbn), mul_nonneg hgb' (sub_nonneg.2 hyz)]

/-! ### What a node carries -/

/-- The budget a spectral node cites: the separate budgets only (`sep`, the inherited spectral
cut), a contraction-Gram certificate, multipliers `(s_j, η_j)` of the coupled family, or a joint
sixth-moment certificate. -/
inductive GBud where
  | sep
  | gram (g : GramData)
  | coupled (se : List (ℚ × ℚ))
  | joint (g : GramData) (j : JointData)

/-- `Σ η_j`, `Σ η_j (s_j − 1)/18` and `Σ η_j (s_j + 1/2 − 3/s_j)/18`. -/
def budSum1 : List (ℚ × ℚ) → ℚ
  | [] => 0
  | p :: r => p.2 + budSum1 r
def budSum2 : List (ℚ × ℚ) → ℚ
  | [] => 0
  | p :: r => p.2 * (p.1 - 1) / 18 + budSum2 r
def budSum3 : List (ℚ × ℚ) → ℚ
  | [] => 0
  | p :: r => p.2 * (p.1 + 1 / 2 - 3 / p.1) / 18 + budSum3 r

/-- Every `s_j ≥ 2`, every `η_j ≥ 0`. -/
def budOKs : List (ℚ × ℚ) → Bool
  | [] => true
  | p :: r => decide (2 ≤ p.1) && decide (0 ≤ p.2) && budOKs r

/-- The shift `af` of the coefficient of `u` in `f` (`2t + λ/3 + af`). -/
def GBud.af (lam : ℚ) : GBud → ℚ
  | .sep => 0
  | .gram g => g.A / 2 - lam / 3
  | .coupled se => budSum2 se
  | .joint g _ => g.A / 2 - lam / 3

/-- The shift `ag` of the coefficient of `u` in `g` (`t + μ/3 − ν/2 − ag`). -/
def GBud.ag (mu : ℚ) : GBud → ℚ
  | .sep => 0
  | .gram g => mu / 3 - g.B / 2
  | .coupled se => budSum3 se
  | .joint g _ => mu / 3 - g.B / 2

/-- The exact check of the cited budget (a joint certificate is checked by `jointCert` with its
own cut). -/
def GBud.ok (lam mu : ℚ) : GBud → Bool
  | .sep => true
  | .gram g => gramCert lam mu g
  | .coupled se => budOKs se && decide (budSum1 se ≤ lam)
  | .joint _ _ => false

/-- The range `x ≤ x_*` of a node: `x_*` for a joint certificate, `31/4` (all of the domain)
otherwise. -/
def GBud.xcap : GBud → ℚ
  | .joint _ j => j.xs
  | _ => xMax

/-- The coupled family summed with nonnegative multipliers:
`(Σ η_j) E X² ≤ (2 Σ η_j (s_j − 1)/18 + (2/3) Σ η_j) P − 2 (Σ η_j (s_j + 1/2 − 3/s_j)/18) Q`. -/
lemma coupled_sum (V P Q : ℝ)
    (hfam : ∀ s : ℚ, 2 ≤ s → V ≤ (s + 5) / 9 * P - (s + 1 / 2 - 3 / s) / 9 * Q) :
    ∀ se : List (ℚ × ℚ), budOKs se = true →
      (budSum1 se : ℝ) * V ≤ (2 * budSum2 se + 2 / 3 * budSum1 se) * P - 2 * budSum3 se * Q
  | [], _ => by simp [budSum1, budSum2, budSum3]
  | p :: r, h => by
    simp only [budOKs, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨hs, hη⟩, hr⟩ := h
    have ih := coupled_sum V P Q hfam r hr
    have h1 := mul_le_mul_of_nonneg_left (hfam p.1 hs) (by exact_mod_cast hη : (0 : ℝ) ≤ p.2)
    simp only [budSum1, budSum2, budSum3]
    push_cast
    nlinarith [h1, ih]

end Grothe.Lower
