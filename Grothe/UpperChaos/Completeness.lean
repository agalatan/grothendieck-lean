import Grothe.UpperChaos.Mehler

/-!
# Polynomials are dense in Gaussian `L²` (U2 of PLAN_UPPER)

`poly_complete`: if `f ∈ L²(stdGaussian d)` is real and `∫ f · P dγ = 0` for every real polynomial
`P`, then `f = 0` a.e.  Route (PLAN_UPPER §5): linear forms have exponential moments of every order
(`memLp_exp_abs`), so the exponential series of `e^{iLx}` converges dominatedly in `L¹(|f| dγ)`
and `∫ e^{iLx} f dγ = 0` (`integral_exp_mul_eq_zero`); the finite measures `γ·f⁺` and `γ·f⁻` then
have the same characteristic function and are equal (`Measure.ext_of_charFunDual`).
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic Finset
open scoped ComplexConjugate Nat ENNReal NNReal

namespace Grothe.UpperChaos

noncomputable section

variable {d : ℕ}

/-! ### Exponential moments of linear forms -/

lemma integrable_exp_abs_mul_gaussianReal (c : ℝ) :
    Integrable (fun t : ℝ => Real.exp (c * |t|)) (gaussianReal 0 1) := by
  refine ((integrable_exp_mul_gaussianReal c).add (integrable_exp_mul_gaussianReal (-c))).mono'
    (by fun_prop) (Filter.Eventually.of_forall fun t => ?_)
  simp only [Pi.add_apply]
  rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
  rcases le_total 0 t with h | h
  · rw [abs_of_nonneg h]; linarith [Real.exp_pos (-c * t)]
  · rw [abs_of_nonpos h, show c * -t = -c * t by ring]; linarith [Real.exp_pos (c * t)]

/-- `exp(Σ cᵢ|xᵢ|)` is integrable under the standard Gaussian. -/
lemma integrable_exp_sum_abs (c : Fin d → ℝ) :
    Integrable (fun x : Fin d → ℝ => Real.exp (∑ i, c i * |x i|)) (stdGaussian d) := by
  simp_rw [Real.exp_sum]
  exact Integrable.fintype_prod (f := fun i t => Real.exp (c i * |t|))
    fun i => integrable_exp_abs_mul_gaussianReal (c i)

lemma memLp_exp_sum_abs (c : Fin d → ℝ) :
    MemLp (fun x : Fin d → ℝ => Real.exp (∑ i, c i * |x i|)) 2 (stdGaussian d) := by
  refine (memLp_two_iff_integrable_sq (Continuous.aestronglyMeasurable (by fun_prop))).2 ?_
  refine (integrable_exp_sum_abs (fun i => 2 * c i)).congr (Filter.Eventually.of_forall fun x => ?_)
  simp only
  rw [sq, ← Real.exp_add, ← Finset.sum_add_distrib]
  congr 1; refine Finset.sum_congr rfl fun i _ => by ring

/-- The coefficients of a linear form. -/
def coefL (L : StrongDual ℝ (Fin d → ℝ)) (i : Fin d) : ℝ := L (Pi.single i 1)

lemma L_eq_sum (L : StrongDual ℝ (Fin d → ℝ)) (x : Fin d → ℝ) : L x = ∑ i, x i * coefL L i := by
  conv_lhs => rw [show x = ∑ i, x i • (Pi.single i 1 : Fin d → ℝ) by
    ext j; simp [Finset.sum_apply, Pi.single_apply]]
  simp [map_sum, coefL]

lemma abs_L_le (L : StrongDual ℝ (Fin d → ℝ)) (x : Fin d → ℝ) :
    |L x| ≤ ∑ i, |coefL L i| * |x i| := by
  rw [L_eq_sum]
  refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq (Finset.sum_congr rfl fun i _ => ?_))
  rw [abs_mul, mul_comm]

/-- The linear form as a polynomial. -/
def polyL (L : StrongDual ℝ (Fin d → ℝ)) : MvPolynomial (Fin d) ℝ := ∑ i, C (coefL L i) * X i

lemma eval_polyL (L : StrongDual ℝ (Fin d → ℝ)) (x : Fin d → ℝ) : eval x (polyL L) = L x := by
  simp [polyL, L_eq_sum, mul_comm]

/-! ### The Fourier transform of `f γ` vanishes -/

variable {f : (Fin d → ℝ) → ℝ}

lemma integrable_mul_eval (hf : MemLp f 2 (stdGaussian d)) (P : MvPolynomial (Fin d) ℝ) :
    Integrable (fun x => f x * eval x P) (stdGaussian d) :=
  hf.integrable_mul (memLp_eval P)

/-- **`∫ e^{iLx} f dγ = 0`** when `f ∈ L²` is orthogonal to all polynomials. -/
theorem integral_exp_mul_eq_zero (hf : MemLp f 2 (stdGaussian d))
    (h : ∀ P : MvPolynomial (Fin d) ℝ, ∫ x, f x * eval x P ∂(stdGaussian d) = 0)
    (L : StrongDual ℝ (Fin d → ℝ)) :
    ∫ x, Complex.exp (L x * Complex.I) * (f x : ℂ) ∂(stdGaussian d) = 0 := by
  set S : ℕ → (Fin d → ℝ) → ℂ :=
    fun N x => (∑ n ∈ range N, (L x * Complex.I) ^ n / n !) * (f x : ℂ) with hS
  have hSN : ∀ N, ∫ x, S N x ∂(stdGaussian d) = 0 := fun N => by
    have hterm : ∀ n, ∫ x, (L x * Complex.I) ^ n / n ! * (f x : ℂ) ∂(stdGaussian d) = 0 := by
      intro n
      have : ∀ x, (L x * Complex.I) ^ n / n ! * (f x : ℂ)
          = (Complex.I ^ n / n !) * ((f x * eval x (polyL L ^ n) : ℝ) : ℂ) := fun x => by
        rw [map_pow, eval_polyL]; push_cast; ring
      simp_rw [this]
      rw [integral_const_mul, integral_complex_ofReal, h, Complex.ofReal_zero, mul_zero]
    simp only [hS, Finset.sum_mul]
    rw [integral_finsetSum]
    · exact Finset.sum_eq_zero fun n _ => hterm n
    · intro n _
      have hi := Complex.ofRealCLM.integrable_comp (integrable_mul_eval hf (polyL L ^ n))
      refine (hi.const_mul (Complex.I ^ n / n !)).congr
        (Filter.Eventually.of_forall fun x => ?_)
      simp only [Complex.ofRealCLM_apply, map_pow, eval_polyL]; push_cast; ring
  -- dominated convergence
  have hbound := (hf.integrable_mul (memLp_exp_sum_abs (fun i => |coefL L i|))).norm
  have hlim : Filter.Tendsto (fun N => ∫ x, S N x ∂(stdGaussian d)) Filter.atTop
      (nhds (∫ x, Complex.exp (L x * Complex.I) * (f x : ℂ) ∂(stdGaussian d))) := by
    refine tendsto_integral_of_dominated_convergence
      (fun x => ‖f x * Real.exp (∑ i, |coefL L i| * |x i|)‖) (fun N => ?_) hbound
      (fun N => Filter.Eventually.of_forall fun x => ?_) (Filter.Eventually.of_forall fun x => ?_)
    · have hm : AEStronglyMeasurable (fun x => (f x : ℂ)) (stdGaussian d) :=
        Complex.continuous_ofReal.comp_aestronglyMeasurable hf.aestronglyMeasurable
      exact (Continuous.aestronglyMeasurable (by fun_prop)).mul hm
    · simp only [hS, norm_mul, Complex.norm_real, Real.norm_eq_abs,
        abs_of_pos (Real.exp_pos _)]
      rw [mul_comm]
      refine mul_le_mul_of_nonneg_left ?_ (abs_nonneg _)
      calc ‖∑ n ∈ range N, (L x * Complex.I) ^ n / (n ! : ℂ)‖ ≤ ∑ n ∈ range N, |L x| ^ n / n ! := by
            refine (norm_sum_le _ _).trans (le_of_eq (Finset.sum_congr rfl fun n _ => ?_))
            rw [norm_div, norm_pow, norm_mul, Complex.norm_I, mul_one, Complex.norm_real,
              Real.norm_eq_abs, Complex.norm_natCast]
        _ ≤ Real.exp |L x| := Real.sum_le_exp_of_nonneg (abs_nonneg _) N
        _ ≤ Real.exp (∑ i, |coefL L i| * |x i|) := Real.exp_le_exp.2 (abs_L_le L x)
    · have := (NormedSpace.expSeries_div_hasSum_exp (L x * Complex.I)).tendsto_sum_nat
      rw [← Complex.exp_eq_exp_ℂ] at this
      exact this.mul_const _
  simp_rw [hSN] at hlim
  exact tendsto_nhds_unique hlim tendsto_const_nhds

/-! ### Uniqueness -/

/-- **Polynomials are dense in Gaussian `L²`**: a real `f ∈ L²(γ_d)` orthogonal to every
polynomial vanishes almost everywhere. -/
theorem poly_complete (hf : MemLp f 2 (stdGaussian d))
    (h : ∀ P : MvPolynomial (Fin d) ℝ, ∫ x, f x * eval x P ∂(stdGaussian d) = 0) :
    f =ᵐ[stdGaussian d] 0 := by
  have hf1 : Integrable f (stdGaussian d) := hf.integrable one_le_two
  set γ := stdGaussian d
  set fp : (Fin d → ℝ) → ℝ≥0∞ := fun x => ENNReal.ofReal (f x)
  set fm : (Fin d → ℝ) → ℝ≥0∞ := fun x => ENNReal.ofReal (-f x)
  have hfpm : AEMeasurable fp γ := hf1.aemeasurable.ennreal_ofReal
  have hfmm : AEMeasurable fm γ := hf1.neg.aemeasurable.ennreal_ofReal
  have hfpi : ∫⁻ x, fp x ∂γ ≠ ∞ := by
    refine ne_of_lt (lt_of_le_of_lt (lintegral_mono fun x => ?_) hf1.hasFiniteIntegral)
    rw [Real.enorm_eq_ofReal_abs]; exact ENNReal.ofReal_le_ofReal (le_abs_self _)
  have hfmi : ∫⁻ x, fm x ∂γ ≠ ∞ := by
    refine ne_of_lt (lt_of_le_of_lt (lintegral_mono fun x => ?_) hf1.hasFiniteIntegral)
    rw [Real.enorm_eq_ofReal_abs]; exact ENNReal.ofReal_le_ofReal (neg_le_abs _)
  have : IsFiniteMeasure (γ.withDensity fp) := isFiniteMeasure_withDensity hfpi
  have : IsFiniteMeasure (γ.withDensity fm) := isFiniteMeasure_withDensity hfmi
  have hchar : charFunDual (γ.withDensity fp) = charFunDual (γ.withDensity fm) := by
    ext L
    rw [charFunDual_apply, charFunDual_apply,
      integral_withDensity_eq_integral_toReal_smul₀ hfpm
        (Filter.Eventually.of_forall fun x => ENNReal.ofReal_lt_top),
      integral_withDensity_eq_integral_toReal_smul₀ hfmm
        (Filter.Eventually.of_forall fun x => ENNReal.ofReal_lt_top), ← sub_eq_zero]
    have hp : Integrable (fun x => (fp x).toReal • Complex.exp (L x * Complex.I)) γ := by
      refine hf1.norm.mono' ?_ (Filter.Eventually.of_forall fun x => ?_)
      · exact (hfpm.ennreal_toReal.aestronglyMeasurable).smul
          (Continuous.aestronglyMeasurable (by fun_prop))
      · rw [norm_smul, Complex.norm_exp_ofReal_mul_I, mul_one, Real.norm_eq_abs,
          Real.norm_eq_abs]
        simp only [fp, ENNReal.toReal_ofReal']
        rw [abs_of_nonneg (le_max_right _ _)]
        exact max_le (le_abs_self _) (abs_nonneg _)
    have hm : Integrable (fun x => (fm x).toReal • Complex.exp (L x * Complex.I)) γ := by
      refine hf1.norm.mono' ?_ (Filter.Eventually.of_forall fun x => ?_)
      · exact (hfmm.ennreal_toReal.aestronglyMeasurable).smul
          (Continuous.aestronglyMeasurable (by fun_prop))
      · rw [norm_smul, Complex.norm_exp_ofReal_mul_I, mul_one, Real.norm_eq_abs,
          Real.norm_eq_abs]
        simp only [fm, ENNReal.toReal_ofReal']
        rw [abs_of_nonneg (le_max_right _ _)]
        exact max_le (neg_le_abs _) (abs_nonneg _)
    rw [← integral_sub hp hm, ← integral_exp_mul_eq_zero hf h L]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
    simp only [fp, fm, ENNReal.toReal_ofReal', Complex.real_smul, ← sub_mul]
    rw [mul_comm]; congr 1
    rw [← Complex.ofReal_sub, max_zero_sub_max_neg_zero_eq_self]
  have heq := Measure.ext_of_charFunDual hchar
  rw [withDensity_eq_iff hfpm hfmm hfpi] at heq
  filter_upwards [heq] with x hx
  simp only [fp, fm, Pi.zero_apply] at hx ⊢
  rcases le_total (f x) 0 with h0 | h0
  · rw [ENNReal.ofReal_of_nonpos h0, eq_comm, ENNReal.ofReal_eq_zero] at hx; linarith
  · rw [ENNReal.ofReal_of_nonpos (by linarith : -f x ≤ 0), ENNReal.ofReal_eq_zero] at hx; linarith

end

end Grothe.UpperChaos
