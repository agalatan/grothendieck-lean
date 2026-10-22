import Grothe.LowerAnalytic.Gaussian
import Grothe.Lower.Transfer
import Grothe.Lower.Moment

/-!
# The Gaussian witness `T = P₁,₀ − ε P₂,₁` and its value on `z/‖z‖` (L5, value half)

The complex Gaussian space `ℂⁿ = ℝ^{n+n}` carries the standard Gaussian measure
`stdGaussian (n + n)` (`z_l = x_l + i y_l`, `E|z_l|² = 2`; the normalisation is immaterial for the
projections and for the unimodular test family).  In `L²(γ_n)`:

* `H10 n = span{z_l}` is the first chaos `H₁,₀` and `H21 n` the third chaos `H₂,₁`, defined as the
  orthogonal complement of `H₁,₀` inside the charge-one polynomials of degree `≤ 3`
  (`chargeOne3 n = span{z_l, z_a z_b z̄_c}`); this is the span of the Wick cubics
  `z_a z_b z̄_c − δ_ac z_b − δ_bc z_a`, since each monomial `z_a z_b z̄_c` is a Wick cubic plus an
  element of `H₁,₀` and the Wick cubics are orthogonal to `H₁,₀` (`wickL_mem_H21` in
  `WickCubic.lean`, by the complex Wick identity).  Both are finite-dimensional, so
  the orthogonal projections `P₁,₀ = (H10 n).starProjection`, `P₂,₁ = (H21 n).starProjection`
  exist, and the **witness** is `witness n = P₁,₀ − ε P₂,₁`, `ε = 149/200`
  (`witnessOf n K` for a general closed `K`; the value theorem needs only `K ⊥ H₁,₀`).
* `uL n l = z_l/‖z‖` (`0` at `z = 0`) is the unimodular-normalised coordinate family:
  `∑ₗ |uₗ|² ≤ 1` everywhere (`sum_normSq_uc_le`).

**The value theorem** (`norm_pairVal_witness`): `‖∑ₗ ⟪uₗ, T uₗ⟫‖ ≥ 1 − (1+ε)/(n+1)`.  Proof:
`Re ⟪u, T u⟫ = ‖P₁,₀u‖² − ε‖P₂,₁u‖²` and `‖P₁,₀u‖² + ‖P₂,₁u‖² ≤ ‖u‖²` (the ranges are orthogonal), so
the value is at least `(1+ε) A − ε S` with `A = ∑ₗ ‖P₁,₀ uₗ‖²` and `S = ∑ₗ ‖uₗ‖² ≤ 1`.  Since
`z_l ∈ H₁,₀` with `‖z_l‖² = 2`, `‖P₁,₀ uₗ‖² ≥ |⟪z_l, uₗ⟫|²/2 = m_l²/2` with
`m_l = E[|z_l|²/‖z‖] ≥ 0`, `∑ₗ m_l = E‖z‖`, and `E‖z‖ ≥ 2n/√(2(n+1))` from `E‖z‖² = 2n`,
`E‖z‖⁴ = 4n(n+1)` and the pointwise bound `r ≥ (3c²r² − r⁴)/(2c³)` (`r(r−c)²(r+2c) ≥ 0`) at
`c² = 2(n+1)`; by Cauchy–Schwarz `A ≥ (E‖z‖)²/(2n) ≥ n/(n+1)`, whence the bound
`(1+ε)n/(n+1) − ε = 1 − (1+ε)/(n+1)`.  (The exact value is `a_n − ε(1 − a_n)` with
`a_n = Γ(n+½)²/(nΓ(n)²) ≥ 1 − 1/(4n)`; the elementary moment bound `a_n ≥ n/(n+1)` suffices.)

**The transfer link** (`transferInputs_of_witnessCap`): if the scalar cap `WitnessCap n B`
(`‖⟪f, T g⟫‖ ≤ B` for a.e. unimodular `f, g`) holds for all large `n`, then `TransferInputsL2 B`,
hence `lower_bound_of_witnessCap : (∀ n ≥ N, WitnessCap n Bcap) → IsGrothendieckBound K → Llow < K`.
The scalar cap itself is the subject of `WitnessCap.lean`.
-/


namespace Grothe.LowerAnalytic

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

noncomputable section

variable (n : ℕ)

def zc (l : Fin n) (x : Fin (n + n) → ℝ) : ℂ := ⟨x (Fin.castAdd n l), x (Fin.natAdd n l)⟩

def rad (x : Fin (n + n) → ℝ) : ℝ := √(∑ i, x i ^ 2)

lemma rad_nonneg (x : Fin (n + n) → ℝ) : 0 ≤ rad n x := Real.sqrt_nonneg _

lemma rad_sq (x : Fin (n + n) → ℝ) : rad n x ^ 2 = ∑ i, x i ^ 2 :=
  Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _)

lemma normSq_zc (l : Fin n) (x : Fin (n + n) → ℝ) :
    ‖zc n l x‖ ^ 2 = x (Fin.castAdd n l) ^ 2 + x (Fin.natAdd n l) ^ 2 := by
  rw [Complex.sq_norm, zc, Complex.normSq_mk]; ring

lemma sum_normSq_zc (x : Fin (n + n) → ℝ) : ∑ l, ‖zc n l x‖ ^ 2 = ∑ i, x i ^ 2 := by
  rw [Fin.sum_univ_add, ← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl fun l _ => normSq_zc n l x

lemma normSq_zc_le (l : Fin n) (x : Fin (n + n) → ℝ) : ‖zc n l x‖ ^ 2 ≤ rad n x ^ 2 := by
  rw [rad_sq, ← sum_normSq_zc]
  exact Finset.single_le_sum (f := fun l => ‖zc n l x‖ ^ 2) (fun _ _ => sq_nonneg _)
    (Finset.mem_univ l)

lemma norm_zc_le (l : Fin n) (x : Fin (n + n) → ℝ) : ‖zc n l x‖ ≤ rad n x :=
  (pow_le_pow_iff_left₀ (norm_nonneg _) (rad_nonneg n x) two_ne_zero).1 (normSq_zc_le n l x)

lemma continuous_zc (l : Fin n) : Continuous (zc n l) := by
  have : zc n l = fun x => ((x (Fin.castAdd n l) : ℝ) : ℂ) + ((x (Fin.natAdd n l) : ℝ) : ℂ) * Complex.I := by
    funext x; apply Complex.ext <;> simp [zc]
  rw [this]; fun_prop

lemma continuous_rad : Continuous (rad n) := Real.continuous_sqrt.comp (by fun_prop)

lemma memLp_zc (l : Fin n) : MemLp (zc n l) 2 (stdGaussian (n + n)) := by
  rw [memLp_two_iff_integrable_sq_norm (continuous_zc n l).aestronglyMeasurable]
  refine (integrable_eval (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)).congr
    (Filter.Eventually.of_forall fun x => ?_)
  simp [normSq_zc]

def uc (l : Fin n) (x : Fin (n + n) → ℝ) : ℂ := (((rad n x)⁻¹ : ℝ) : ℂ) * zc n l x

lemma norm_uc_le (l : Fin n) (x : Fin (n + n) → ℝ) : ‖uc n l x‖ ≤ 1 := by
  unfold uc
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (inv_nonneg.2 (rad_nonneg n x))]
  rcases (rad_nonneg n x).eq_or_lt with h | h
  · rw [← h]; simp
  · rw [inv_mul_le_iff₀ h, mul_one]; exact norm_zc_le n l x

lemma measurable_uc (l : Fin n) : Measurable (uc n l) :=
  (Complex.measurable_ofReal.comp (continuous_rad n).measurable.inv).mul
    (continuous_zc n l).measurable

lemma memLp_uc (l : Fin n) : MemLp (uc n l) 2 (stdGaussian (n + n)) :=
  MemLp.of_bound (measurable_uc n l).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_uc_le n l))

lemma sum_normSq_uc_le (x : Fin (n + n) → ℝ) : ∑ l, ‖uc n l x‖ ^ 2 ≤ 1 := by
  simp only [uc, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs]
  rw [← Finset.mul_sum, sum_normSq_zc, ← rad_sq]
  rcases (rad_nonneg n x).eq_or_lt with h | h
  · rw [← h]; simp
  · rw [inv_pow, inv_mul_cancel₀ (pow_ne_zero 2 h.ne')]

abbrev L2G := Lp ℂ 2 (stdGaussian (n + n))

def zL (l : Fin n) : L2G n := (memLp_zc n l).toLp _
def uL (l : Fin n) : L2G n := (memLp_uc n l).toLp _

def H10 : Submodule ℂ (L2G n) := Submodule.span ℂ (Set.range (zL n))

instance : FiniteDimensional ℂ (H10 n) := FiniteDimensional.span_of_finite ℂ (Set.finite_range _)

instance : (H10 n).HasOrthogonalProjection := by
  have := Submodule.complete_of_finiteDimensional (H10 n)
  infer_instance

lemma inner_L2 (f g : L2G n) :
    inner ℂ f g = ∫ x, conj (f x) * g x ∂(stdGaussian (n + n)) := by
  rw [MeasureTheory.L2.inner_def]
  simp only [RCLike.inner_apply, mul_comm]

-- moments
lemma gE_X_sq {d : ℕ} (i : Fin d) : gaussE d (X i ^ 2) = 1 := by
  have h := (gaussE_isGaussianExpectation d).ibp i (X i)
  rw [pderiv_X_self, ← sq] at h
  rw [h, (gaussE_isGaussianExpectation d).one]

lemma gE_X_sq_mul_X_sq {d : ℕ} (i j : Fin d) :
    gaussE d (X i ^ 2 * X j ^ 2) = 1 + if i = j then 2 else 0 := by
  have hE := gaussE_isGaussianExpectation d
  by_cases hij : i = j
  · subst hij
    have h := hE.ibp i (X i ^ 3)
    rw [pderiv_pow, pderiv_X_self, mul_one] at h
    simp only [ite_true]
    rw [← pow_add, show (2 + 2 : ℕ) = 3 + 1 by norm_num, pow_succ, mul_comm, h]
    simp only [Nat.cast_ofNat, Nat.add_one_sub_one]
    rw [ofNat_mul_apply, gE_X_sq]; norm_num
  · have h := hE.ibp i (X i * X j ^ 2)
    rw [pderiv_mul, pderiv_X_self, pderiv_pow, pderiv_X_of_ne (Ne.symm hij)] at h
    simp only [hij, ite_false, add_zero]
    rw [show X i ^ 2 * X j ^ 2 = X i * (X i * X j ^ 2) by ring, h]
    simp only [mul_zero, add_zero, one_mul]; exact gE_X_sq j

/-! ### Moments of the radius -/

lemma integral_rad_sq : ∫ x, rad n x ^ 2 ∂(stdGaussian (n + n)) = 2 * n := by
  have h : ∀ x, rad n x ^ 2 = eval x (∑ i : Fin (n + n), X i ^ 2) := fun x => by
    simp [rad_sq]
  simp_rw [h]
  rw [← gaussE_apply, map_sum]
  simp only [gE_X_sq, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul, mul_one]
  push_cast; ring

lemma integral_rad_pow_four :
    ∫ x, rad n x ^ 4 ∂(stdGaussian (n + n)) = 4 * n * (n + 1) := by
  have h : ∀ x, rad n x ^ 4 = eval x (∑ i : Fin (n + n), ∑ j : Fin (n + n), X i ^ 2 * X j ^ 2) :=
    fun x => by
    rw [show (4 : ℕ) = 2 * 2 by norm_num, pow_mul, rad_sq, sq, Finset.sum_mul_sum]
    simp
  simp_rw [h]
  rw [← gaussE_apply, map_sum]
  simp only [map_sum, gE_X_sq_mul_X_sq, Finset.sum_add_distrib, Finset.sum_ite_eq, Finset.mem_univ,
    ite_true, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul, mul_one]
  push_cast; ring

lemma integrable_rad : Integrable (rad n) (stdGaussian (n + n)) :=
  integrable_of_abs_le_eval (continuous_rad n).aestronglyMeasurable (1 + ∑ i : Fin (n + n), X i ^ 2)
    fun x => by
      rw [abs_of_nonneg (rad_nonneg n x)]
      simp only [map_add, map_one, map_sum, map_pow, eval_X]
      rw [← rad_sq]; nlinarith [rad_nonneg n x]

lemma integrable_rad_sq : Integrable (fun x => rad n x ^ 2) (stdGaussian (n + n)) := by
  refine (integrable_eval (∑ i : Fin (n + n), X i ^ 2)).congr (Filter.Eventually.of_forall fun x => ?_)
  simp [rad_sq]

lemma integrable_rad_pow_four : Integrable (fun x => rad n x ^ 4) (stdGaussian (n + n)) := by
  refine (integrable_eval ((∑ i : Fin (n + n), X i ^ 2) ^ 2)).congr
    (Filter.Eventually.of_forall fun x => ?_)
  simp only [map_pow, map_sum, eval_X]
  rw [← rad_sq, ← pow_mul]

lemma rad_ge_poly (c : ℝ) (hc : 0 < c) (x : Fin (n + n) → ℝ) :
    (3 * c ^ 2 * rad n x ^ 2 - rad n x ^ 4) / (2 * c ^ 3) ≤ rad n x := by
  rw [div_le_iff₀ (by positivity)]
  have hr := rad_nonneg n x
  nlinarith [mul_nonneg hr (mul_nonneg (sq_nonneg (rad n x - c)) (by linarith : 0 ≤ rad n x + 2 * c))]

/-- `E‖z‖ ≥ 2n / √(2(n+1))`, from `E‖z‖² = 2n`, `E‖z‖⁴ = 4n(n+1)` and the pointwise bound
`r ≥ (3c²r² − r⁴)/(2c³)` at `c² = 2(n+1)`. -/
lemma integral_rad_ge : 2 * n / √(2 * (n + 1)) ≤ ∫ x, rad n x ∂(stdGaussian (n + n)) := by
  have hc : 0 < √(2 * ((n : ℝ) + 1)) := Real.sqrt_pos.2 (by positivity)
  have hc2 : √(2 * ((n : ℝ) + 1)) ^ 2 = 2 * (n + 1) := Real.sq_sqrt (by positivity)
  have h := integral_mono (μ := stdGaussian (n + n))
    (f := fun x => (3 * √(2 * ((n : ℝ) + 1)) ^ 2 * rad n x ^ 2 - rad n x ^ 4) / (2 * √(2 * ((n : ℝ) + 1)) ^ 3))
    (g := rad n) (((integrable_rad_sq n).const_mul _).sub (integrable_rad_pow_four n) |>.div_const _)
    (integrable_rad n) (fun x => rad_ge_poly n _ hc x)
  refine le_trans (le_of_eq ?_) h
  rw [integral_div, integral_sub ((integrable_rad_sq n).const_mul _) (integrable_rad_pow_four n),
    integral_const_mul, integral_rad_sq, integral_rad_pow_four]
  generalize √(2 * ((n : ℝ) + 1)) = c at hc hc2
  rw [div_eq_div_iff hc.ne' (by positivity), pow_succ, hc2]
  ring

/-! ### The inner products `⟪z_l, u_l⟫` -/

/-- `m_l = E[|z_l|² / ‖z‖]`. -/
def mcoef (l : Fin n) : ℝ := ∫ x, (rad n x)⁻¹ * ‖zc n l x‖ ^ 2 ∂(stdGaussian (n + n))

lemma integrable_mterm (l : Fin n) :
    Integrable (fun x => (rad n x)⁻¹ * ‖zc n l x‖ ^ 2) (stdGaussian (n + n)) :=
  integrable_of_abs_le_eval
    (((continuous_rad n).measurable.inv.mul ((continuous_zc n l).measurable.norm.pow_const 2)).aestronglyMeasurable)
    (1 + ∑ i : Fin (n + n), X i ^ 2) fun x => by
      simp only [map_add, map_one, map_sum, map_pow, eval_X]
      rw [← rad_sq]
      have hr := rad_nonneg n x
      have h1 : (rad n x)⁻¹ * ‖zc n l x‖ ^ 2 ≤ rad n x := by
        rcases hr.eq_or_lt with h | h
        · rw [← h]; simp
        · rw [inv_mul_le_iff₀ h, ← sq]; exact normSq_zc_le n l x
      rw [abs_of_nonneg (mul_nonneg (inv_nonneg.2 hr) (sq_nonneg _))]
      nlinarith

lemma mcoef_nonneg (l : Fin n) : 0 ≤ mcoef n l :=
  integral_nonneg fun x => mul_nonneg (inv_nonneg.2 (rad_nonneg n x)) (sq_nonneg _)

lemma sum_mcoef : ∑ l, mcoef n l = ∫ x, rad n x ∂(stdGaussian (n + n)) := by
  unfold mcoef
  rw [← integral_finsetSum _ fun l _ => integrable_mterm n l]
  refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
  simp only
  rw [← Finset.mul_sum, sum_normSq_zc, ← rad_sq]
  rcases (rad_nonneg n x).eq_or_lt with h | h
  · rw [← h]; simp
  · field_simp

lemma inner_zL_uL (l : Fin n) : inner ℂ (zL n l) (uL n l) = (mcoef n l : ℂ) := by
  rw [inner_L2, mcoef, ← integral_complex_ofReal]
  refine integral_congr_ae ?_
  filter_upwards [MemLp.coeFn_toLp (memLp_zc n l), MemLp.coeFn_toLp (memLp_uc n l)] with x h1 h2
  rw [zL, uL, h1, h2, uc, mul_left_comm, Complex.conj_mul']
  push_cast; ring

lemma norm_zL_sq (l : Fin n) : ‖zL n l‖ ^ 2 = 2 := by
  have h := inner_self_eq_norm_sq_to_K (𝕜 := ℂ) (zL n l)
  rw [inner_L2] at h
  have h2 : ∫ x, conj (zL n l x) * zL n l x ∂(stdGaussian (n + n))
      = ((∫ x, ‖zc n l x‖ ^ 2 ∂(stdGaussian (n + n)) : ℝ) : ℂ) := by
    rw [← integral_complex_ofReal]
    refine integral_congr_ae ?_
    filter_upwards [MemLp.coeFn_toLp (memLp_zc n l)] with x h1
    rw [zL, h1, Complex.conj_mul']; push_cast; rfl
  have h3 : ∫ x, ‖zc n l x‖ ^ 2 ∂(stdGaussian (n + n)) = 2 := by
    simp_rw [normSq_zc]
    rw [integral_add (integrable_eval (X (Fin.castAdd n l) ^ 2) |>.congr
        (Filter.Eventually.of_forall fun x => by simp))
      (integrable_eval (X (Fin.natAdd n l) ^ 2) |>.congr (Filter.Eventually.of_forall fun x => by simp))]
    have := fun i : Fin (n + n) => (gaussE_apply (d := n + n) (X i ^ 2)).symm.trans (gE_X_sq i)
    simp only [map_pow, eval_X] at this
    rw [this, this]; norm_num
  rw [h2, h3] at h
  have h4 : ((‖zL n l‖ ^ 2 : ℝ) : ℂ) = ((2 : ℝ) : ℂ) := by rw [Complex.ofReal_pow]; exact h.symm
  exact Complex.ofReal_injective h4


/-! ### Projections -/

section proj

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℂ F]
  (K : Submodule ℂ F) [K.HasOrthogonalProjection]

lemma re_inner_starProjection (u : F) :
    (inner ℂ u (K.starProjection u)).re = ‖K.starProjection u‖ ^ 2 := by
  rw [← Submodule.inner_starProjection_left_eq_right]
  have h := Submodule.re_inner_starProjection_eq_normSq K u
  rw [Submodule.starProjection_apply] at h ⊢
  rw [Submodule.norm_coe]
  exact h

lemma normSq_inner_le_normSq_starProjection (u e : F) (he : e ∈ K) :
    ‖inner ℂ e u‖ ^ 2 ≤ ‖e‖ ^ 2 * ‖K.starProjection u‖ ^ 2 := by
  have h1 : inner ℂ e u = inner ℂ e (K.starProjection u) := by
    rw [← Submodule.inner_starProjection_left_eq_right, Submodule.starProjection_eq_self_iff.2 he]
  rw [h1, ← mul_pow]
  exact pow_le_pow_left₀ (norm_nonneg _) (norm_inner_le_norm _ _) 2

lemma normSq_starProjection_add_le (K' : Submodule ℂ F) [K'.HasOrthogonalProjection] (hK : K' ≤ Kᗮ)
    (u : F) : ‖K.starProjection u‖ ^ 2 + ‖K'.starProjection u‖ ^ 2 ≤ ‖u‖ ^ 2 := by
  rw [Submodule.norm_sq_eq_add_norm_sq_starProjection u K]
  have : K'.starProjection u = K'.starProjection (Kᗮ.starProjection u) := by
    rw [← ContinuousLinearMap.comp_apply, Submodule.starProjection_comp_starProjection_of_le hK]
  rw [this]
  exact add_le_add le_rfl (pow_le_pow_left₀ (norm_nonneg _) (Submodule.norm_starProjection_apply_le _ _) 2)

end proj

/-! ### The witness and its value on `z/‖z‖` -/

/-- The operator `P₁,₀ − ε P_K` for a closed subspace `K` (the intended `K` is `H₂,₁`). -/
def witnessOf (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] : L2G n →L[ℂ] L2G n :=
  (H10 n).starProjection - ((ε : ℝ) : ℂ) • K.starProjection

lemma re_inner_witnessOf (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] (u : L2G n) :
    (inner ℂ u (witnessOf n K u)).re
      = ‖(H10 n).starProjection u‖ ^ 2 - ε * ‖K.starProjection u‖ ^ 2 := by
  simp only [witnessOf, FunLike.coe_sub, Pi.sub_apply, FunLike.coe_smul, Pi.smul_apply,
    inner_sub_right, inner_smul_right, Complex.sub_re, Complex.re_ofReal_mul,
    re_inner_starProjection]

lemma zL_mem_H10 (l : Fin n) : zL n l ∈ H10 n := Submodule.subset_span ⟨l, rfl⟩

lemma normSq_uL_le_sum : ∑ l, ‖uL n l‖ ^ 2 ≤ 1 := by
  have h : ∀ l, ‖uL n l‖ ^ 2 = ∫ x, ‖uc n l x‖ ^ 2 ∂(stdGaussian (n + n)) := fun l => by
    have h := inner_self_eq_norm_sq_to_K (𝕜 := ℂ) (uL n l)
    rw [inner_L2] at h
    have h2 : ∫ x, conj (uL n l x) * uL n l x ∂(stdGaussian (n + n))
        = ((∫ x, ‖uc n l x‖ ^ 2 ∂(stdGaussian (n + n)) : ℝ) : ℂ) := by
      rw [← integral_complex_ofReal]
      refine integral_congr_ae ?_
      filter_upwards [MemLp.coeFn_toLp (memLp_uc n l)] with x h1
      rw [uL, h1, Complex.conj_mul']; push_cast; rfl
    rw [h2] at h
    have h4 : ((‖uL n l‖ ^ 2 : ℝ) : ℂ)
        = ((∫ x, ‖uc n l x‖ ^ 2 ∂(stdGaussian (n + n)) : ℝ) : ℂ) := by
      rw [Complex.ofReal_pow]; exact h.symm
    exact Complex.ofReal_injective h4
  simp_rw [h]
  rw [← integral_finsetSum _ fun l _ => ?_]
  · calc ∫ x, ∑ l, ‖uc n l x‖ ^ 2 ∂(stdGaussian (n + n))
        ≤ ∫ _x, (1 : ℝ) ∂(stdGaussian (n + n)) :=
          integral_mono_of_nonneg (Filter.Eventually.of_forall fun x => Finset.sum_nonneg fun l _ => sq_nonneg _)
            (integrable_const _) (Filter.Eventually.of_forall (sum_normSq_uc_le n))
      _ = 1 := by simp
  · exact (memLp_two_iff_integrable_sq_norm (measurable_uc n l).aestronglyMeasurable).1 (memLp_uc n l)

/-- Σₗ ‖P₁,₀ uₗ‖² ≥ n/(n+1). -/
lemma sum_normSq_starProjection_uL (hn : 0 < n) :
    (n : ℝ) / (n + 1) ≤ ∑ l, ‖(H10 n).starProjection (uL n l)‖ ^ 2 := by
  have h1 : ∀ l, mcoef n l ^ 2 ≤ 2 * ‖(H10 n).starProjection (uL n l)‖ ^ 2 := fun l => by
    have := normSq_inner_le_normSq_starProjection (H10 n) (uL n l) (zL n l) (zL_mem_H10 n l)
    rwa [inner_zL_uL, norm_zL_sq, Complex.norm_real, Real.norm_eq_abs, sq_abs] at this
  have h2 := sq_sum_le_card_mul_sum_sq (s := Finset.univ) (f := mcoef n)
  rw [Finset.card_univ, Fintype.card_fin, sum_mcoef] at h2
  have h3 := integral_rad_ge n
  have hc : 0 < √(2 * ((n : ℝ) + 1)) := Real.sqrt_pos.2 (by positivity)
  have hc2 : √(2 * ((n : ℝ) + 1)) ^ 2 = 2 * (n + 1) := Real.sq_sqrt (by positivity)
  have h4 : (2 * n / √(2 * ((n : ℝ) + 1))) ^ 2 ≤ (∫ x, rad n x ∂(stdGaussian (n + n))) ^ 2 :=
    pow_le_pow_left₀ (by positivity) h3 2
  rw [div_pow, hc2] at h4
  have h5 : ∑ l, mcoef n l ^ 2 ≤ 2 * ∑ l, ‖(H10 n).starProjection (uL n l)‖ ^ 2 := by
    rw [Finset.mul_sum]; exact Finset.sum_le_sum fun l _ => h1 l
  have hn' : (0 : ℝ) < n := by exact_mod_cast hn
  rw [div_le_iff₀ (by positivity)]
  have h6 : (2 * (n : ℝ)) ^ 2 / (2 * (n + 1)) ≤ n * (2 * ∑ l, ‖(H10 n).starProjection (uL n l)‖ ^ 2) :=
    h4.trans (h2.trans (by nlinarith))
  rw [div_le_iff₀ (by positivity)] at h6
  nlinarith

/-- **The value of the witness on `z/‖z‖`**: for every closed `K ⊥ H₁,₀`,
`Re Σₗ ⟪uₗ, (P₁,₀ − εP_K) uₗ⟫ ≥ 1 − (1+ε)/(n+1)`. -/
theorem re_pairVal_witnessOf (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection]
    (hK : K ≤ (H10 n)ᗮ) (hn : 0 < n) :
    1 - (1 + ε) / (n + 1) ≤ (pairVal (witnessOf n K) (uL n) (uL n)).re := by
  unfold pairVal
  rw [Complex.re_sum]
  simp_rw [re_inner_witnessOf]
  rw [Finset.sum_sub_distrib, ← Finset.mul_sum]
  have hA := sum_normSq_starProjection_uL n hn
  have hS := normSq_uL_le_sum n
  have hB : ∑ l, ‖K.starProjection (uL n l)‖ ^ 2
      ≤ ∑ l, ‖uL n l‖ ^ 2 - ∑ l, ‖(H10 n).starProjection (uL n l)‖ ^ 2 := by
    rw [← Finset.sum_sub_distrib]
    exact Finset.sum_le_sum fun l _ => by
      linarith [normSq_starProjection_add_le (H10 n) K hK (uL n l)]
  have hε : (0 : ℝ) ≤ ε := by unfold ε; norm_num
  have hn' : (0 : ℝ) < n + 1 := by positivity
  rw [div_le_iff₀ hn'] at hA
  have h2 : (1 + ε) * (1 - ∑ l, ‖(H10 n).starProjection (uL n l)‖ ^ 2) ≤ (1 + ε) / (n + 1) := by
    rw [le_div_iff₀ hn']; nlinarith
  nlinarith [mul_le_mul_of_nonneg_left hB hε, mul_le_mul_of_nonneg_left hS hε]

theorem norm_pairVal_witnessOf (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection]
    (hK : K ≤ (H10 n)ᗮ) (hn : 0 < n) :
    1 - (1 + ε) / (n + 1) ≤ ‖pairVal (witnessOf n K) (uL n) (uL n)‖ :=
  (re_pairVal_witnessOf n K hK hn).trans (Complex.re_le_norm _)


/-! ### The third chaos `H₂,₁` and the witness -/

/-- The charge-one cubic monomial `z_a z_b conj(z_c)`. -/
def wc (a b c : Fin n) (x : Fin (n + n) → ℝ) : ℂ := zc n a x * zc n b x * conj (zc n c x)

lemma continuous_wc (a b c : Fin n) : Continuous (wc n a b c) :=
  ((continuous_zc n a).mul (continuous_zc n b)).mul (Complex.continuous_conj.comp (continuous_zc n c))

lemma memLp_wc (a b c : Fin n) : MemLp (wc n a b c) 2 (stdGaussian (n + n)) := by
  rw [memLp_two_iff_integrable_sq_norm (continuous_wc n a b c).aestronglyMeasurable]
  refine integrable_of_abs_le_eval ((continuous_wc n a b c).norm.pow 2).aestronglyMeasurable
    ((∑ i : Fin (n + n), X i ^ 2) ^ 3) fun x => ?_
  simp only [map_pow, map_sum, eval_X]
  rw [← rad_sq, abs_of_nonneg (sq_nonneg _), wc, norm_mul, norm_mul, Complex.norm_conj, mul_pow,
    mul_pow]
  calc ‖zc n a x‖ ^ 2 * ‖zc n b x‖ ^ 2 * ‖zc n c x‖ ^ 2
      ≤ rad n x ^ 2 * rad n x ^ 2 * rad n x ^ 2 := by
        gcongr <;> exact norm_zc_le n _ x
    _ = (rad n x ^ 2) ^ 3 := by ring

/-- `z_a z_b conj(z_c)` as an element of `L²`. -/
def wL (a b c : Fin n) : L2G n := (memLp_wc n a b c).toLp _

/-- The charge-one polynomials of degree `≤ 3`: the span of the `z_l` and the `z_a z_b conj(z_c)`. -/
def chargeOne3 : Submodule ℂ (L2G n) :=
  Submodule.span ℂ (Set.range (zL n) ∪ Set.range fun p : Fin n × Fin n × Fin n => wL n p.1 p.2.1 p.2.2)

instance : FiniteDimensional ℂ (chargeOne3 n) :=
  FiniteDimensional.span_of_finite ℂ ((Set.finite_range _).union (Set.finite_range _))

/-- **The third chaos `H₂,₁`**: the orthogonal complement of the first chaos inside the charge-one
polynomials of degree `≤ 3`, i.e. the span of the Wick cubics `z_a z_b z̄_c − δ_ac z_b − δ_bc z_a`
(each `z_a z_b z̄_c` is a Wick cubic plus an element of `H₁,₀`). -/
def H21 : Submodule ℂ (L2G n) := chargeOne3 n ⊓ (H10 n)ᗮ

instance : FiniteDimensional ℂ (H21 n) := Submodule.finiteDimensional_inf_left _ _

instance : (H21 n).HasOrthogonalProjection := by
  have := Submodule.complete_of_finiteDimensional (H21 n)
  infer_instance

lemma H21_le_orthogonal : H21 n ≤ (H10 n)ᗮ := inf_le_right

/-- **The witness** `T = P₁,₀ − ε P₂,₁` on `L²(γ_n)`, `ε = 149/200`. -/
def witness : L2G n →L[ℂ] L2G n := witnessOf n (H21 n)

/-- **The value of the witness on the family `uₗ = zₗ/‖z‖`**: `‖Σₗ ⟪uₗ, T uₗ⟫‖ ≥ 1 − (1+ε)/(n+1)`. -/
theorem norm_pairVal_witness (hn : 0 < n) :
    1 - (1 + ε) / (n + 1) ≤ ‖pairVal (witness n) (uL n) (uL n)‖ :=
  norm_pairVal_witnessOf n _ (H21_le_orthogonal n) hn

/-- The scalar cap `B` of the witness in dimension `n`: `‖⟪f, T g⟫‖ ≤ B` for a.e. unimodular
`f, g ∈ L²(γ_n)`. -/
def WitnessCap (n : ℕ) (B : ℝ) : Prop := ScalarCap (stdGaussian (n + n)) (witness n) B

lemma ae_sum_normSq_uL_le : ∀ᵐ x ∂(stdGaussian (n + n)), ∑ l, ‖uL n l x‖ ^ 2 ≤ 1 := by
  have h : ∀ᵐ x ∂(stdGaussian (n + n)), ∀ l, uL n l x = uc n l x :=
    ae_all_iff.2 fun l => MemLp.coeFn_toLp (memLp_uc n l)
  filter_upwards [h] with x hx
  simp_rw [hx]
  exact sum_normSq_uc_le n x

/-- **The transfer inputs from the scalar caps of the witness**: if `WitnessCap n B` holds for all
large `n`, then `TransferInputsL2 B` (the value side is `norm_pairVal_witness`). -/
theorem transferInputs_of_witnessCap {B : ℝ} (N : ℕ) (hcap : ∀ n, N ≤ n → WitnessCap n B) :
    TransferInputsL2 B := by
  intro δ hδ
  have hε : (0 : ℝ) < ε := by unfold ε; norm_num
  obtain ⟨n, hNn, hn, hδn⟩ : ∃ n : ℕ, N ≤ n ∧ 0 < n ∧ (1 + ε) / (n + 1) ≤ δ := by
    refine ⟨max N ⌈(1 + (ε : ℝ)) / δ⌉₊, le_max_left _ _, ?_, ?_⟩
    · have : 0 < ⌈(1 + (ε : ℝ)) / δ⌉₊ := Nat.ceil_pos.2 (div_pos (by linarith) hδ)
      exact lt_of_lt_of_le this (le_max_right _ _)
    · have h1 : (1 + (ε : ℝ)) / δ ≤ ⌈(1 + (ε : ℝ)) / δ⌉₊ := Nat.le_ceil _
      have h2 : (⌈(1 + (ε : ℝ)) / δ⌉₊ : ℝ) ≤ ((max N ⌈(1 + (ε : ℝ)) / δ⌉₊ : ℕ) : ℝ) := by
        exact_mod_cast le_max_right _ _
      rw [div_le_iff₀ (by positivity)]
      rw [div_le_iff₀ hδ] at h1
      nlinarith
  exact ⟨Fin (n + n) → ℝ, inferInstance, stdGaussian (n + n), inferInstance, witness n, Fin n,
    inferInstance, uL n, uL n, hcap n hNn, ae_sum_normSq_uL_le n, ae_sum_normSq_uL_le n,
    le_trans (by linarith) (norm_pairVal_witness n hn)⟩

/-- `Llow < K` for every Grothendieck bound `K`, from the scalar caps of the witness. -/
theorem lower_bound_of_witnessCap {K : ℝ} (N : ℕ) (hcap : ∀ n, N ≤ n → WitnessCap n Bcap)
    (hK : IsGrothendieckBound K) : (Llow : ℝ) < K :=
  lower_bound_of_transferL2 (transferInputs_of_witnessCap N hcap) hK


end

end Grothe.LowerAnalytic
