import Grothe.HJM.OriginVisibleEnergy
import Grothe.HJM.OriginWitnessLaguerre

/-!
# All-mode exact Hermite normalization and signed Gaussian integral.

The normalized coefficients and finite signed witness test are expressed
as one-dimensional Gaussian integrals.
-/

open MeasureTheory Set Finset Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.HJM.OriginPanel
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- The Hermite normalization cancels the square root introduced by
`laguerreTest`, leaving exactly the factorial-normalized radial polynomial. -/
theorem sqrt_index_mul_nrm (n : ℕ) :
    Real.sqrt ((n : ℝ) + 1) * nrm (n + 1) n = 1 / (n.factorial : ℝ) := by
  have hf : (n.factorial : ℝ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  have hs : Real.sqrt ((n : ℝ) + 1) ≠ 0 := by positivity
  have he : (((n + 1).factorial * n.factorial : ℕ) : ℝ) =
      ((n : ℝ) + 1) * (n.factorial : ℝ) ^ 2 := by
    rw [Nat.factorial_succ]
    push_cast
    ring
  rw [nrm, he, Real.sqrt_mul (by positivity), Real.sqrt_sq (by positivity)]
  field_simp [hf, hs]

/-- Normalized radial integrand for one signed Hermite mode. -/
def signedModeIntegrand (n : ℕ) (v : ℝ → ℂ) (t : ℝ) : ℂ :=
  ((2 * t ^ 2 * Real.exp (-t ^ 2) * signedLaguerreValue n (t ^ 2) : ℝ) : ℂ) * v (t ^ 2)

/-- Every normalized actual coefficient is the corresponding signed
one-dimensional Gaussian integral. -/
theorem sqrt_index_chargeOneCoeff_eq_integral (n : ℕ) (v : ℝ → ℂ)
    (hv : Measurable v) {M : ℝ} (hbound : ∀ s, ‖v s‖ ≤ M)
    (hF : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC) :
    (Real.sqrt ((n : ℝ) + 1) : ℂ) *
        chargeOneCoeff (hF.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))) n =
      ∫ t in Ioi (0 : ℝ), signedModeIntegrand n v t := by
  have hc := inner_charge_one_radial_integral n v hv hbound hF
  change chargeOneCoeff (hF.toLp (fun z : ℂ =>
    Grothe.Haag.ph z * v (‖z‖ ^ 2))) n = _ at hc
  rw [hc]
  have hscale : (Real.sqrt ((n : ℝ) + 1) : ℂ) * ((2 * nrm (n + 1) n : ℝ) : ℂ) =
      ((2 / (n.factorial : ℝ) : ℝ) : ℂ) := by
    have hr : Real.sqrt ((n : ℝ) + 1) * (2 * nrm (n + 1) n) =
        2 / (n.factorial : ℝ) := by rw [show Real.sqrt ((n : ℝ) + 1) *
          (2 * nrm (n + 1) n) = 2 * (Real.sqrt ((n : ℝ) + 1) * nrm (n + 1) n) by ring,
          sqrt_index_mul_nrm]; ring
    exact_mod_cast hr
  rw [← mul_assoc, hscale, ← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with t
  change ((2 / (n.factorial : ℝ) : ℝ) : ℂ) *
      (((t ^ 2 * Real.exp (-t ^ 2) *
        (originRadialPoly n).eval (t ^ 2) : ℝ) : ℂ) * v (t ^ 2)) =
    (((2 * t ^ 2 * Real.exp (-t ^ 2) *
      ((originRadialPoly n).eval (t ^ 2) / (n.factorial : ℝ)) : ℝ) : ℂ) * v (t ^ 2))
  simp only [Complex.ofReal_mul, Complex.ofReal_div, Complex.ofReal_ofNat]
  ring


/-- Gaussian radial polynomials are integrable on the positive half-line. -/
theorem integrable_gaussian_radial_polynomial (P : Polynomial ℝ) :
    IntegrableOn (fun r : ℝ => r ^ 2 * Real.exp (-r ^ 2) * P.eval (r ^ 2)) (Ioi 0) := by
  induction P using Polynomial.induction_on' with
  | monomial n a =>
    have h := integrableOn_rpow_mul_exp_neg_mul_sq (b := 1) one_pos
      (s := ((2 * n + 2 : ℕ) : ℝ))
      (lt_of_lt_of_le (by norm_num : (-1 : ℝ) < 0) (Nat.cast_nonneg _))
    have hi : IntegrableOn (fun r : ℝ => r ^ (2 * n + 2) * Real.exp (-r ^ 2)) (Ioi 0) := by
      simpa only [Real.rpow_natCast, neg_mul, one_mul] using h
    have he : (fun r : ℝ => r ^ 2 * Real.exp (-r ^ 2) *
        (Polynomial.monomial n a).eval (r ^ 2)) =
        (fun r : ℝ => a * (r ^ (2 * n + 2) * Real.exp (-r ^ 2))) := by
      funext r
      simp only [Polynomial.eval_monomial, ← pow_mul, pow_add]
      ring
    rw [he]
    exact hi.const_mul a
  | add P Q hP hQ =>
    have he : (fun r : ℝ => r ^ 2 * Real.exp (-r ^ 2) * (P + Q).eval (r ^ 2)) =
        (fun r : ℝ => r ^ 2 * Real.exp (-r ^ 2) * P.eval (r ^ 2)) +
          (fun r : ℝ => r ^ 2 * Real.exp (-r ^ 2) * Q.eval (r ^ 2)) := by
      funext r
      simp only [Pi.add_apply, Polynomial.eval_add, mul_add]
    rw [he]
    exact hP.add hQ

/-- Integrability uses the actual uniform amplitude bound, not a presumed
unit-disk bound for the polynomial approximation. -/
theorem integrable_signedModeIntegrand (n : ℕ) (v : ℝ → ℂ)
    (hv : Measurable v) {M : ℝ} (hbound : ∀ s, ‖v s‖ ≤ M) :
    IntegrableOn (signedModeIntegrand n v) (Ioi 0) := by
  have h := (integrable_gaussian_radial_polynomial (originRadialPoly n)).ofReal.mul_bdd
    (hv.comp (by fun_prop : Measurable fun r : ℝ => r ^ 2)).aestronglyMeasurable
    (Filter.Eventually.of_forall fun r => hbound (r ^ 2))
  have he : signedModeIntegrand n v = fun t =>
      ((2 / (n.factorial : ℝ) : ℝ) : ℂ) *
        (((t ^ 2 * Real.exp (-t ^ 2) * (originRadialPoly n).eval (t ^ 2) : ℝ) : ℂ) *
          v (t ^ 2)) := by
    funext t
    simp only [signedModeIntegrand, signedLaguerreValue,
      Complex.ofReal_mul, Complex.ofReal_div, Complex.ofReal_ofNat]
    ring
  rw [he]
  exact h.const_mul _

/-- The actual finite signed correlation is a single complex Gaussian
integral of the rational witness polynomial. -/
theorem witnessPolynomial_correlation_integral
    (xs : List (ℚ × ℚ)) (N : ℕ) (v : ℝ → ℂ) (hv : Measurable v)
    {M : ℝ} (hbound : ∀ s, ‖v s‖ ≤ M)
    (hF : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC) :
    testCorrelation (laguerreTest (witnessAlpha xs))
        (hF.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))) N =
      ∫ t in Ioi (0 : ℝ), ((2 * t ^ 2 * Real.exp (-t ^ 2) : ℝ) : ℂ) *
        conj (evalC (witnessPolynomial xs N) (t ^ 2)) * v (t ^ 2) := by
  let F : ℕ → ℝ → ℂ := fun n t =>
    (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (witnessAlpha xs n)) * signedModeIntegrand n v t
  have hi (n : ℕ) : IntegrableOn (F n) (Ioi 0) :=
    (integrable_signedModeIntegrand n v hv hbound).const_mul _
  have hp (t : ℝ) : (∑ n ∈ range N, F n t) =
      ((2 * t ^ 2 * Real.exp (-t ^ 2) : ℝ) : ℂ) *
        conj (evalC (witnessPolynomial xs N) (t ^ 2)) * v (t ^ 2) := by
    rw [witnessPolynomial_eval]
    simp only [map_sum, map_mul, Complex.conj_ofReal, Finset.mul_sum, Finset.sum_mul]
    apply sum_congr rfl
    intro n _hn
    simp only [F, signedModeIntegrand, Complex.ofReal_mul, Complex.ofReal_ofNat]
    ring
  calc
    _ = ∑ n ∈ range N, (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (witnessAlpha xs n)) *
        (∫ t in Ioi (0 : ℝ), signedModeIntegrand n v t) := by
      rw [laguerreTest_correlation]
      apply sum_congr rfl
      intro n _hn
      rw [sqrt_index_chargeOneCoeff_eq_integral n v hv hbound hF]
    _ = ∑ n ∈ range N, ∫ t in Ioi (0 : ℝ), F n t := by
      apply sum_congr rfl
      intro n _hn
      rw [integral_const_mul]
    _ = ∫ t in Ioi (0 : ℝ), ∑ n ∈ range N, F n t :=
      (integral_finsetSum (range N) (fun n _ => hi n)).symm
    _ = _ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall hp

/-- The same integrand is integrable, allowing its real part to pass through
the Bochner integral. -/
theorem integrable_witnessPolynomial_integrand
    (xs : List (ℚ × ℚ)) (N : ℕ) (v : ℝ → ℂ) (hv : Measurable v)
    {M : ℝ} (hbound : ∀ s, ‖v s‖ ≤ M) :
    IntegrableOn (fun t : ℝ => ((2 * t ^ 2 * Real.exp (-t ^ 2) : ℝ) : ℂ) *
      conj (evalC (witnessPolynomial xs N) (t ^ 2)) * v (t ^ 2)) (Ioi 0) := by
  let F : ℕ → ℝ → ℂ := fun n t =>
    (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (witnessAlpha xs n)) * signedModeIntegrand n v t
  have hi : IntegrableOn (fun t => ∑ n ∈ range N, F n t) (Ioi 0) :=
    integrable_finsetSum (range N) (fun n _ =>
      (integrable_signedModeIntegrand n v hv hbound).const_mul _)
  apply hi.congr
  filter_upwards [] with t
  rw [witnessPolynomial_eval]
  simp only [map_sum, map_mul, Complex.conj_ofReal, Finset.mul_sum, Finset.sum_mul]
  apply sum_congr rfl
  intro n _hn
  simp only [F, signedModeIntegrand, Complex.ofReal_mul, Complex.ofReal_ofNat]
  ring


end

end Grothe.HJM.Origin
