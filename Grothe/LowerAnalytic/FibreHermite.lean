import Grothe.LowerAnalytic.FibreRot

/-!
# The six fibre functions are orthonormal in `L²(gaussC)` (L4, INFRA-C)

`B = (1, |z|² − 1, z²/√2, z, z(|z|² − 2)/√2, z̄)` (the complex form of the twelve real basis
functions of the certified potential).  Distinct charges are orthogonal by rotation invariance
(`integral_eq_zero_of_rot`); the remaining entries are the radial moments `E|z|^{2k} = k!`
(`integral_normSq_pow_two`, `integral_normSq_pow_three`).  `fibreGram i j = δ_ij`
(`fibreGram_eq`).
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower MvPolynomial
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Radial moments -/

lemma integral_normSq_pow_two : ∫ z, Complex.normSq z ^ 2 ∂gaussC = 2 := by
  rw [integral_normSq_pow 2 ((X 0 ^ 2 + X 1 ^ 2) ^ 2) (fun x => by simp)]
  rw [show ((X 0 ^ 2 + X 1 ^ 2) ^ 2 : MvPolynomial (Fin 2) ℝ)
      = X 0 ^ 4 + 2 * (X 0 ^ 2 * X 1 ^ 2) + X 1 ^ 4 by ring]
  simp only [map_add]
  rw [ofNat_mul_apply, gE_X_pow_four, gE_X_pow_four, gE_X_sq_mul_X_sq]
  norm_num

lemma integral_normSq_pow_three : ∫ z, Complex.normSq z ^ 3 ∂gaussC = 6 := by
  rw [integral_normSq_pow 3 ((X 0 ^ 2 + X 1 ^ 2) ^ 3) (fun x => by simp)]
  rw [show ((X 0 ^ 2 + X 1 ^ 2) ^ 3 : MvPolynomial (Fin 2) ℝ)
      = X 0 ^ 6 + 3 * (X 0 ^ 4 * X 1 ^ 2) + 3 * (X 1 ^ 4 * X 0 ^ 2) + X 1 ^ 6 by ring]
  simp only [map_add]
  rw [ofNat_mul_apply, ofNat_mul_apply, gE_X_pow_six, gE_X_pow_six,
    gE_X_pow_four_mul_X_sq (by decide), gE_X_pow_four_mul_X_sq (by decide)]
  norm_num

lemma integrable_normSq_pow (k : ℕ) (hk : k ≤ 3) :
    Integrable (fun z => Complex.normSq z ^ k) gaussC := by
  refine integrable_gaussC_of_bound _ (Complex.continuous_normSq.pow k) 1 1 1 1 fun z => ?_
  have h := Complex.normSq_nonneg z
  rw [abs_of_nonneg (pow_nonneg h k)]
  interval_cases k <;> nlinarith [pow_nonneg h 2, pow_nonneg h 3]

/-! ### The Gram matrix -/

/-- The six fibre functions. -/
def fibreB : Fin 6 → ℂ → ℂ := ![fun _ => 1, fB1, fB2, fun z => z, fB4, fun z => conj z]

/-- `⟪B_i, B_j⟫ = ∫ conj(B_i) B_j`. -/
def fibreGram (i j : Fin 6) : ℂ := ∫ z, conj (fibreB i z) * fibreB j z ∂gaussC

lemma I_normSq (z : ℂ) : Complex.normSq (Complex.I * z) = Complex.normSq z := by
  rw [map_mul, Complex.normSq_I, one_mul]

lemma sqrt2_sq_C : ((√2 : ℝ) : ℂ) ^ 2 = 2 := by
  rw [← Complex.ofReal_pow, Real.sq_sqrt (by norm_num)]; norm_num

lemma integral_ofReal' (f : ℂ → ℝ) : ∫ z, (f z : ℂ) ∂gaussC = ((∫ z, f z ∂gaussC : ℝ) : ℂ) :=
  integral_complex_ofReal

/-- **The fibre functions are orthonormal.** -/
theorem fibreGram_eq (i j : Fin 6) : fibreGram i j = if i = j then 1 else 0 := by
  have hs : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast sqrt_two_ne
  have hs2 : ((√2 : ℝ) : ℂ) ^ 2 = 2 := sqrt2_sq_C
  have i1 : Integrable (fun z : ℂ => Complex.normSq z) gaussC := by
    simpa using integrable_normSq_pow 1 (by norm_num)
  have i2 := integrable_normSq_pow 2 (by norm_num)
  have i3 := integrable_normSq_pow 3 (by norm_num)
  have m1 : ∫ z, Complex.normSq z ∂gaussC = 1 := integral_normSq_gaussC
  have m2 := integral_normSq_pow_two
  have m3 := integral_normSq_pow_three
  have rad3 : ∀ (a b c d : ℝ), ∫ z, ((a + b * Complex.normSq z + c * Complex.normSq z ^ 2
      + d * Complex.normSq z ^ 3 : ℝ) : ℂ) ∂gaussC = ((a + b + 2 * c + 6 * d : ℝ) : ℂ) := by
    intro a b c d
    rw [integral_ofReal']
    congr 1
    have j0 : Integrable (fun _ : ℂ => a) gaussC := integrable_const a
    have j1 : Integrable (fun z : ℂ => b * Complex.normSq z) gaussC := i1.const_mul b
    have j2 : Integrable (fun z : ℂ => c * Complex.normSq z ^ 2) gaussC := i2.const_mul c
    have j3 : Integrable (fun z : ℂ => d * Complex.normSq z ^ 3) gaussC := i3.const_mul d
    have j01 : Integrable (fun z : ℂ => a + b * Complex.normSq z) gaussC := j0.add j1
    have j012 : Integrable (fun z : ℂ => a + b * Complex.normSq z + c * Complex.normSq z ^ 2) gaussC :=
      j01.add j2
    rw [integral_add j012 j3, integral_add j01 j2, integral_add j0 j1, integral_const_mul,
      integral_const_mul, integral_const_mul, m1, m2, m3, integral_const, probReal_univ, one_smul]
    ring
  have nsq : ∀ z : ℂ, conj z * z = ((Complex.normSq z : ℝ) : ℂ) := fun z => by
    rw [mul_comm, Complex.mul_conj]
  have hinv : ((√2 : ℝ) : ℂ)⁻¹ ^ 2 = 1 / 2 := by rw [inv_pow, hs2, one_div]
  unfold fibreGram
  fin_cases i <;> fin_cases j <;> simp only [fibreB, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val, Fin.isValue, Fin.reduceFinMk, ite_true]
  · -- (0,0)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 1 0 0 0).trans ?_)
    · try simp only [map_one]
      push_cast
      ring
    · push_cast; ring
  · -- (0,1)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 (-1) 1 0 0).trans ?_)
    · try simp only [fB1, map_one]
      push_cast
      ring
    · push_cast; ring
  · -- (0,2)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [fB2]
    try ring_nf
    try simp only [Complex.I_sq, mul_one, neg_mul, mul_neg]
    try ring_nf
  · -- (0,3)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [mul_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (0,4)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB4, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (0,5)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [map_neg, mul_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (1,0)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 (-1) 1 0 0).trans ?_)
    · try simp only [fB1,
        Complex.conj_ofReal]
      push_cast
      ring
    · push_cast; ring
  · -- (1,1)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 1 (-2) 1 0).trans ?_)
    · try simp only [fB1,
        Complex.conj_ofReal]
      push_cast
      ring
    · push_cast; ring
  · -- (1,2)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [fB1, fB2, map_mul, Complex.conj_ofReal, Complex.normSq_I, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, mul_one, neg_mul, mul_neg]
    try ring_nf
  · -- (1,3)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB1, Complex.conj_ofReal, Complex.normSq_neg, mul_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (1,4)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB1, fB4, Complex.conj_ofReal, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (1,5)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB1, map_neg, Complex.conj_ofReal, Complex.normSq_neg, mul_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (2,0)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [fB2, map_mul, map_div₀, map_pow, Complex.conj_ofReal, Complex.conj_I, neg_mul]
    try ring_nf
    try simp only [Complex.I_sq, one_mul, neg_mul]
    try ring_nf
  · -- (2,1)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [fB1, fB2, map_mul, map_div₀, map_pow, Complex.conj_ofReal, Complex.conj_I, neg_mul, Complex.normSq_I, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, one_mul, neg_mul]
    try ring_nf
  · -- (2,2)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 0 0 (1/2) 0).trans ?_)
    · try simp only [fB2, map_div₀, map_pow,
        Complex.conj_ofReal]
      push_cast
      linear_combination ((√2 : ℝ) : ℂ)⁻¹ ^ 2 * (conj z * z + ((Complex.normSq z : ℝ) : ℂ)) * nsq z + ((Complex.normSq z : ℝ) : ℂ) ^ 2 * hinv
    · push_cast; ring
  · -- (2,3)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB2, map_neg, map_div₀, map_pow, Complex.conj_ofReal, mul_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (2,4)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB2, fB4, map_neg, map_div₀, map_pow, Complex.conj_ofReal, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (2,5)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB2, map_neg, map_div₀, map_pow, Complex.conj_ofReal, mul_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (3,0)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [map_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (3,1)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB1, map_neg, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (3,2)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB2, map_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (3,3)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 0 1 0 0).trans ?_)
    · try simp only [fB1, fB2, fB4, map_mul, map_div₀, map_pow, map_sub, map_one,
        Complex.conj_ofReal, Complex.conj_conj]
      push_cast
      linear_combination nsq z
    · push_cast; ring
  · -- (3,4)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 0 (-2/√2) (1/√2) 0).trans ?_)
    · try simp only [fB4]
      push_cast
      linear_combination ((√2 : ℝ) : ℂ)⁻¹ * (((Complex.normSq z : ℝ) : ℂ) - 2) * nsq z
    · push_cast; ring
  · -- (3,5)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [map_mul, Complex.conj_I, mul_neg, neg_mul, neg_neg]
    try ring_nf
    try simp only [Complex.I_sq, one_mul, neg_mul]
    try ring_nf
  · -- (4,0)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB4, map_mul, map_neg, map_div₀, Complex.conj_ofReal, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (4,1)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB1, fB4, map_mul, map_neg, map_div₀, Complex.conj_ofReal, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (4,2)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB2, fB4, map_mul, map_neg, map_div₀, Complex.conj_ofReal, Complex.normSq_neg, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (4,3)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 0 (-2/√2) (1/√2) 0).trans ?_)
    · try simp only [fB4, map_mul, map_div₀,
        Complex.conj_ofReal]
      push_cast
      linear_combination ((√2 : ℝ) : ℂ)⁻¹ * (((Complex.normSq z : ℝ) : ℂ) - 2) * nsq z
    · push_cast; ring
  · -- (4,4)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 0 2 (-2) (1/2)).trans ?_)
    · try simp only [fB4, map_mul, map_div₀,
        Complex.conj_ofReal]
      push_cast
      linear_combination ((√2 : ℝ) : ℂ)⁻¹ ^ 2 * (((Complex.normSq z : ℝ) : ℂ) - 2) ^ 2 * nsq z + ((Complex.normSq z : ℝ) : ℂ) * (((Complex.normSq z : ℝ) : ℂ) - 2) ^ 2 * hinv
    · push_cast; ring
  · -- (4,5)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [fB4, map_mul, map_div₀, Complex.conj_ofReal, Complex.conj_I, mul_neg, neg_mul, Complex.normSq_I, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, one_mul, neg_mul]
    try ring_nf
  · -- (5,0)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [map_neg, Complex.conj_conj, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (5,1)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB1, map_neg, Complex.normSq_neg, Complex.conj_conj, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (5,2)
    refine integral_eq_zero_of_rot _ (-1) (by simp) fun z => ?_
    simp only [fB2, map_neg, Complex.conj_conj, neg_mul, one_mul]
    try ring_nf
    try simp only [Complex.I_sq, Complex.I_pow_four, Complex.normSq_I, one_mul, mul_one, neg_mul, mul_neg, neg_neg]
    try ring_nf
  · -- (5,3)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [map_mul, map_neg, Complex.conj_I, Complex.conj_conj, neg_mul, neg_neg]
    try ring_nf
    try simp only [Complex.I_sq, one_mul, neg_mul]
    try ring_nf
  · -- (5,4)
    refine integral_eq_zero_of_rot _ Complex.I (by simp) fun z => ?_
    simp only [fB4, map_mul, map_neg, Complex.conj_I, Complex.conj_conj, neg_mul, Complex.normSq_I, one_mul, neg_neg]
    try ring_nf
    try simp only [Complex.I_sq, one_mul, neg_mul]
    try ring_nf
  · -- (5,5)
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((rad3 0 1 0 0).trans ?_)
    · try simp only [
        Complex.conj_conj]
      push_cast
      linear_combination nsq z
    · push_cast; ring

end

end Grothe.LowerAnalytic
