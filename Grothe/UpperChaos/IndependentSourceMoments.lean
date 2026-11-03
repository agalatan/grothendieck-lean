import Grothe.UpperChaos.DampedCoherentKernel
import Grothe.UpperChaos.LinearTiltedMoments
import Mathlib.Analysis.Calculus.ParametricIntegral

/-!
# Independent-source polynomial Gaussian integrability and differentiation

Agent-ID: codex-2ca4.

Unlike a real linear tilt, the two complex sources below are independent.
A uniform Gaussian majorant on every bounded source set justifies insertion
of either z or conjugate z by complex differentiation under the integral.
IndependentSourcePolynomial supplies the complete finite evaluator. Actual
multiplier/Fock identification and numerical bounds remain separate obligations.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.IndependentSourceMoments

noncomputable section

/-- Mixed monomial insertion with two independent complex linear sources. -/
def integrand (rate : ℝ) (a b : ℂ) (p q : ℕ) (z : ℂ) : ℂ :=
  z ^ p * conj z ^ q *
    Complex.exp (-((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) +
      a * z + b * conj z)

/-- A source-uniform envelope retaining half of the positive Gaussian rate. -/
def envelope (rate M : ℝ) (p q : ℕ) (z : ℂ) : ℝ :=
  Real.exp ((M / 2) ^ 2 / (rate / 2)) *
    ‖z ^ p * conj z ^ q *
      (Real.exp (-((rate / 2) - 1) * Complex.normSq z) : ℂ)‖

private theorem source_re_le {a b : ℂ} {M : ℝ}
    (hM : ‖a‖ + ‖b‖ ≤ M) (z : ℂ) :
    (a * z + b * conj z).re ≤ M * ‖z‖ := by
  calc
    _ ≤ ‖a * z + b * conj z‖ := Complex.re_le_norm _
    _ ≤ ‖a * z‖ + ‖b * conj z‖ := norm_add_le _ _
    _ = (‖a‖ + ‖b‖) * ‖z‖ := by
      rw [norm_mul, norm_mul, Complex.norm_conj]
      ring
    _ ≤ M * ‖z‖ := mul_le_mul_of_nonneg_right hM (norm_nonneg z)

/-- The majorant holds uniformly for arbitrary independent sources whose
sum of norms is bounded by M; no conjugacy relation is used. -/
theorem norm_integrand_le_envelope (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) {a b : ℂ} {M : ℝ}
    (hM : ‖a‖ + ‖b‖ ≤ M) (z : ℂ) :
    ‖integrand rate a b p q z‖ ≤ envelope rate M p q z := by
  have hsource := source_re_le hM z
  have hhalf := LinearTiltedMoments.linear_tilt_le_half_rate hrate
    ((M / 2 : ℝ) : ℂ) ((‖z‖ : ℝ) : ℂ)
  have hhalf' :
      Real.exp (-(rate - 1) * Complex.normSq z + M * ‖z‖) ≤
        Real.exp ((M / 2) ^ 2 / (rate / 2)) *
          Real.exp (-((rate / 2) - 1) * Complex.normSq z) := by
    have hz : Complex.normSq ((‖z‖ : ℝ) : ℂ) = Complex.normSq z := by
      simpa only [Complex.normSq_ofReal, pow_two] using (Complex.sq_norm z)
    have hM : Complex.normSq ((M / 2 : ℝ) : ℂ) = (M / 2) ^ 2 := by
      simp only [Complex.normSq_ofReal, pow_two]
    simp only [hz, hM] at hhalf
    simpa only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
      mul_zero, sub_zero,
      show (2 : ℝ) * (M / 2 * ‖z‖) = M * ‖z‖ by ring] using hhalf
  have hkernel :
      ‖Complex.exp (-((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) +
          a * z + b * conj z)‖ ≤
        Real.exp ((M / 2) ^ 2 / (rate / 2)) *
          Real.exp (-((rate / 2) - 1) * Complex.normSq z) := by
    rw [Complex.norm_exp]
    apply le_trans _ hhalf'
    apply Real.exp_le_exp.mpr
    simp only [Complex.add_re, Complex.mul_re, Complex.neg_re,
      Complex.ofReal_re, Complex.ofReal_im, Complex.neg_im, neg_zero,
      zero_mul, sub_zero] at hsource ⊢
    linarith
  have h := mul_le_mul_of_nonneg_left hkernel
    (norm_nonneg (z ^ p * conj z ^ q))
  simpa only [integrand, envelope, norm_mul, Complex.norm_real,
    Real.norm_eq_abs, abs_of_pos (Real.exp_pos _),
    mul_assoc, mul_left_comm] using h

/-- The uniform envelope is integrable for every finite polynomial degree. -/
theorem integrable_envelope (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) (M : ℝ) :
    Integrable (envelope rate M p q) gaussC := by
  exact (integrable_monomial_damped p q (half_pos hrate)).norm.const_mul _

/-- Independent complex sources admit every polynomial moment absolutely. -/
theorem integrable_integrand (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) (a b : ℂ) :
    Integrable (integrand rate a b p q) gaussC := by
  refine (integrable_envelope p q hrate (‖a‖ + ‖b‖)).mono'
    (by unfold integrand; fun_prop) (Filter.Eventually.of_forall fun z => ?_)
  exact norm_integrand_le_envelope p q hrate le_rfl z

/-- Finite polynomial insertions inherit absolute integrability. -/
theorem integrable_finite_polynomial {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p q : ι → ℕ) {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    Integrable (fun z : ℂ => ∑ i ∈ t, c i * integrand rate a b (p i) (q i) z)
      gaussC := by
  exact integrable_finsetSum t fun i _ =>
    (integrable_integrand (p i) (q i) hrate a b).const_mul (c i)

private theorem hasDerivAt_integrand_a (p q : ℕ) (rate : ℝ) (a b z : ℂ) :
    HasDerivAt (fun t : ℂ => integrand rate t b p q z)
      (integrand rate a b (p + 1) q z) a := by
  have harg : HasDerivAt (fun t : ℂ =>
      -((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) + t * z + b * conj z) z a := by
    exact ((hasDerivAt_mul_const (x := a) z).const_add
      (-((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ))).add_const (b * conj z)
  convert HasDerivAt.const_mul (z ^ p * conj z ^ q) harg.cexp using 1 <;>
    simp only [integrand, pow_succ]; ring

private theorem hasDerivAt_integrand_b (p q : ℕ) (rate : ℝ) (a b z : ℂ) :
    HasDerivAt (fun t : ℂ => integrand rate a t p q z)
      (integrand rate a b p (q + 1) z) b := by
  have harg : HasDerivAt (fun t : ℂ =>
      -((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) + a * z + t * conj z)
      (conj z) b := by
    exact (hasDerivAt_mul_const (x := b) (conj z)).const_add
      (-((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) + a * z)
  convert HasDerivAt.const_mul (z ^ p * conj z ^ q) harg.cexp using 1 <;>
    simp only [integrand, pow_succ]; ring

private theorem norm_le_ball_bound {a x : ℂ} (hx : x ∈ Metric.ball a 1) :
    ‖x‖ ≤ ‖a‖ + 1 := by
  have hdist : ‖x - a‖ < 1 := by simpa only [Metric.mem_ball, dist_eq_norm] using hx
  calc
    ‖x‖ = ‖(x - a) + a‖ := by rw [sub_add_cancel]
    _ ≤ ‖x - a‖ + ‖a‖ := norm_add_le _ _
    _ ≤ ‖a‖ + 1 := by linarith

/-- Complex differentiation in the first independent source inserts z.
The dominating function is uniform on a full complex neighborhood. -/
theorem hasDerivAt_integral_a (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) (a b : ℂ) :
    HasDerivAt (fun t : ℂ => ∫ z, integrand rate t b p q z ∂gaussC)
      (∫ z, integrand rate a b (p + 1) q z ∂gaussC) a := by
  refine (hasDerivAt_integral_of_dominated_loc_of_deriv_le (μ := gaussC)
    (F := fun t z => integrand rate t b p q z)
    (F' := fun t z => integrand rate t b (p + 1) q z)
    (bound := envelope rate (‖a‖ + 1 + ‖b‖) (p + 1) q)
    (s := Metric.ball a 1) (Metric.ball_mem_nhds a zero_lt_one)
    (Filter.Eventually.of_forall fun t => by unfold integrand; fun_prop)
    (integrable_integrand p q hrate a b)
    (by unfold integrand; fun_prop)
    (Filter.Eventually.of_forall fun z t ht => ?_)
    (integrable_envelope (p + 1) q hrate _)
    (Filter.Eventually.of_forall fun z t _ =>
      hasDerivAt_integrand_a p q rate t b z)).2
  have ht_norm : ‖t‖ ≤ ‖a‖ + 1 := norm_le_ball_bound ht
  have hM : ‖t‖ + ‖b‖ ≤ ‖a‖ + 1 + ‖b‖ := by linarith only [ht_norm]
  exact norm_integrand_le_envelope (p + 1) q hrate (a := t) (b := b) hM z

/-- Complex differentiation in the second independent source inserts conjugate z. -/
theorem hasDerivAt_integral_b (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) (a b : ℂ) :
    HasDerivAt (fun t : ℂ => ∫ z, integrand rate a t p q z ∂gaussC)
      (∫ z, integrand rate a b p (q + 1) z ∂gaussC) b := by
  refine (hasDerivAt_integral_of_dominated_loc_of_deriv_le (μ := gaussC)
    (F := fun t z => integrand rate a t p q z)
    (F' := fun t z => integrand rate a t p (q + 1) z)
    (bound := envelope rate (‖a‖ + (‖b‖ + 1)) p (q + 1))
    (s := Metric.ball b 1) (Metric.ball_mem_nhds b zero_lt_one)
    (Filter.Eventually.of_forall fun t => by unfold integrand; fun_prop)
    (integrable_integrand p q hrate a b)
    (by unfold integrand; fun_prop)
    (Filter.Eventually.of_forall fun z t ht => ?_)
    (integrable_envelope p (q + 1) hrate _)
    (Filter.Eventually.of_forall fun z t _ =>
      hasDerivAt_integrand_b p q rate a t z)).2
  have ht_norm : ‖t‖ ≤ ‖b‖ + 1 := norm_le_ball_bound ht
  have hM : ‖a‖ + ‖t‖ ≤ ‖a‖ + (‖b‖ + 1) := by linarith only [ht_norm]
  exact norm_integrand_le_envelope p (q + 1) hrate (a := a) (b := t) hM z

/-- The independent-source zeroth moment retains the normalization already
proved in DampedCoherentKernel. -/
theorem integral_zero {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z, integrand rate a b 0 0 z ∂gaussC) =
      (rate : ℂ)⁻¹ * Complex.exp (a * b / (rate : ℂ)) := by
  simpa only [integrand, pow_zero, one_mul] using
    WeightedHSMass.integral_gaussC_cexp_linear hrate a b

/-- One actual z insertion has mean b/rate, with the full zeroth mass retained. -/
theorem integral_one_zero {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z, integrand rate a b 1 0 z ∂gaussC) =
      (rate : ℂ)⁻¹ * (Complex.exp (a * b / (rate : ℂ)) * (b / (rate : ℂ))) := by
  have hd := hasDerivAt_integral_a 0 0 hrate a b
  have he : (fun t : ℂ => ∫ z, integrand rate t b 0 0 z ∂gaussC) =
      (fun t : ℂ => (rate : ℂ)⁻¹ * Complex.exp (t * b / (rate : ℂ))) :=
    funext fun t => integral_zero hrate t b
  rw [he] at hd
  have harg : HasDerivAt (fun t : ℂ => t * b / (rate : ℂ)) (b / (rate : ℂ)) a := by
    exact (hasDerivAt_mul_const (x := a) b).div_const (rate : ℂ)
  exact hd.unique (HasDerivAt.const_mul (rate : ℂ)⁻¹ harg.cexp)

/-- One actual conjugate-z insertion has mean a/rate, independently of b. -/
theorem integral_zero_one {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z, integrand rate a b 0 1 z ∂gaussC) =
      (rate : ℂ)⁻¹ * (Complex.exp (a * b / (rate : ℂ)) * (a / (rate : ℂ))) := by
  have hd := hasDerivAt_integral_b 0 0 hrate a b
  have he : (fun t : ℂ => ∫ z, integrand rate a t 0 0 z ∂gaussC) =
      (fun t : ℂ => (rate : ℂ)⁻¹ * Complex.exp (a * t / (rate : ℂ))) :=
    funext fun t => integral_zero hrate a t
  rw [he] at hd
  have harg : HasDerivAt (fun t : ℂ => a * t / (rate : ℂ)) (a / (rate : ℂ)) b := by
    exact (hasDerivAt_const_mul (x := b) a).div_const (rate : ℂ)
  exact hd.unique (HasDerivAt.const_mul (rate : ℂ)⁻¹ harg.cexp)

end
end Grothe.UpperChaos.IndependentSourceMoments
