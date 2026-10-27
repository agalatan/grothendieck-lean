import Grothe.LowerAnalytic.ComplexGaussianCore

/-!
# The moments of the standard complex Gaussian (U1 of PLAN_UPPER, analytic input)

For the standard complex Gaussian `gaussC` (density `π⁻¹e^{−|z|²}`),

    E[z^a z̄^b] = δ_{ab} a!                                        (`integral_moment`)

The radial moments `E|z|^{2n} = n!` follow from the real Gaussian integration by parts
(`gaussE_S_pow`: `E(x₀² + x₁²)^n = 2^n n!`); the off-diagonal moments vanish by rotation
invariance.  Every polynomial in `z, z̄` is integrable (`integrable_monomial`).  These are the only
analytic facts the complex Hermite calculus (`ComplexHermite.lean`) needs.
-/

open MeasureTheory ProbabilityTheory Real Set MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-! ### Radial moments -/

/-- `S = x₀² + x₁²`. -/
abbrev Srad : MvPolynomial (Fin 2) ℝ := X 0 ^ 2 + X 1 ^ 2

lemma pderiv_Srad_pow (n : ℕ) :
    pderiv 0 (X 0 * Srad ^ n) + pderiv 1 (X 1 * Srad ^ n) = C (2 * ((n : ℝ) + 1)) * Srad ^ n := by
  cases n with
  | zero => simp [map_ofNat]; ring
  | succ m =>
    simp only [Derivation.leibniz, Derivation.leibniz_pow, pderiv_X_self, map_add,
      smul_eq_mul, nsmul_eq_mul, Nat.add_sub_cancel]
    simp [pderiv_X, map_ofNat]
    ring

lemma gaussE_S_pow (n : ℕ) : gaussE 2 (Srad ^ n) = 2 ^ n * n.factorial := by
  induction n with
  | zero => simp [(gaussE_isGaussianExpectation 2).one]
  | succ n ih =>
    have hS : Srad ^ (n + 1) = X 0 * (X 0 * Srad ^ n) + X 1 * (X 1 * Srad ^ n) := by ring
    rw [hS, map_add, (gaussE_isGaussianExpectation 2).ibp, (gaussE_isGaussianExpectation 2).ibp,
      ← map_add, pderiv_Srad_pow, C_mul', map_smul, ih, smul_eq_mul, Nat.factorial_succ]
    push_cast; ring

/-- **`E|z|^{2n} = n!`.** -/
theorem integral_normSq_pow_eq (n : ℕ) :
    ∫ z, Complex.normSq z ^ n ∂gaussC = n.factorial := by
  rw [integral_normSq_pow n (Srad ^ n) (fun x => by simp), gaussE_S_pow]
  field_simp

/-! ### Integrability -/

lemma integrable_normSq_pow' (n : ℕ) : Integrable (fun z => Complex.normSq z ^ n) gaussC := by
  refine (integrable_gaussC_iff (fun z => Complex.normSq z ^ n)
    (Complex.continuous_normSq.pow n).aestronglyMeasurable).2 ?_
  refine (integrable_eval (Pn ^ n)).congr (Filter.Eventually.of_forall fun x => ?_)
  simp [eval_Pn]

lemma integrable_norm_pow (n : ℕ) : Integrable (fun z : ℂ => ‖z‖ ^ n) gaussC := by
  refine ((integrable_const 1).add (integrable_normSq_pow' n)).mono'
    (continuous_norm.pow n).aestronglyMeasurable (Filter.Eventually.of_forall fun z => ?_)
  simp only [Pi.add_apply]
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity), Complex.normSq_eq_norm_sq, ← pow_mul]
  rcases le_total ‖z‖ 1 with h | h
  · have : ‖z‖ ^ n ≤ 1 := pow_le_one₀ (norm_nonneg z) h
    have : 0 ≤ ‖z‖ ^ (2 * n) := by positivity
    linarith
  · have : ‖z‖ ^ n ≤ ‖z‖ ^ (2 * n) := pow_le_pow_right₀ h (by omega)
    linarith

lemma integrable_monomial (a b : ℕ) : Integrable (fun z : ℂ => z ^ a * conj z ^ b) gaussC := by
  refine (integrable_norm_pow (a + b)).mono' (by fun_prop)
    (Filter.Eventually.of_forall fun z => ?_)
  rw [norm_mul, norm_pow, norm_pow, Complex.norm_conj, pow_add]

/-! ### The moments -/

lemma integral_moment_diag (a : ℕ) : ∫ z, z ^ a * conj z ^ a ∂gaussC = a.factorial := by
  have h : ∀ z : ℂ, z ^ a * conj z ^ a = ((Complex.normSq z ^ a : ℝ) : ℂ) := fun z => by
    rw [← mul_pow, Complex.mul_conj]; push_cast; rfl
  simp_rw [h]
  rw [integral_complex_ofReal, integral_normSq_pow_eq]
  norm_cast

lemma integral_moment_lt {a b : ℕ} (hab : b < a) : ∫ z, z ^ a * conj z ^ b ∂gaussC = 0 := by
  obtain ⟨k, rfl⟩ : ∃ k, a = b + (k + 1) := ⟨a - b - 1, by omega⟩
  set c : ℂ := Complex.exp (((π / ((k : ℝ) + 1) : ℝ) : ℂ) * Complex.I) with hc_def
  have hc : ‖c‖ = 1 := Complex.norm_exp_ofReal_mul_I _
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]; simp
  have hck : c ^ (k + 1) = -1 := by
    rw [hc_def, ← Complex.exp_nat_mul]
    have : ((k + 1 : ℕ) : ℂ) * (((π / ((k : ℝ) + 1) : ℝ) : ℂ) * Complex.I) = π * Complex.I := by
      push_cast
      field_simp
    rw [this, Complex.exp_pi_mul_I]
  have hcb : conj c ^ b * c ^ b = 1 := by rw [← mul_pow, hcc, one_pow]
  refine integral_eq_zero_of_rot _ c hc fun z => ?_
  rw [map_mul, mul_pow, mul_pow]
  linear_combination (c ^ (k + 1) * (z ^ (b + (k + 1)) * conj z ^ b)) * hcb
    + (z ^ (b + (k + 1)) * conj z ^ b) * hck

/-- **The moments of the complex Gaussian**: `E[z^a z̄^b] = δ_{ab} a!`. -/
theorem integral_moment (a b : ℕ) :
    ∫ z, z ^ a * conj z ^ b ∂gaussC = if a = b then (a.factorial : ℂ) else 0 := by
  rcases lt_trichotomy a b with h | rfl | h
  · have : ∫ z, z ^ a * conj z ^ b ∂gaussC = conj (∫ z, z ^ b * conj z ^ a ∂gaussC) := by
      rw [← integral_conj]; congr 1; ext z; simp [mul_comm]
    rw [this, integral_moment_lt h, map_zero]; simp [h.ne]
  · simp [integral_moment_diag]
  · rw [integral_moment_lt h]; simp [h.ne']

end

end Grothe.UpperChaos
