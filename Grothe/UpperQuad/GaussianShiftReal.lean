import Grothe.UpperQuad.TwistFunctional
import Grothe.UpperQuad.GaussianShiftVector

/-!
# The signed real slice of the shifted Gaussian representation

The production profile can change sign. Keeping the actual radial argument unchanged requires
a signed canonical shift and one scalar profile sign outside the integral.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open Complex MeasureTheory Grothe.UpperChaos Grothe.LowerAnalytic
open Grothe.UpperChaos.F0ConditionalEvaluator
open scoped ComplexConjugate

noncomputable section

/-- Multiplication by the real profile sign commutes with taking the unit phase. -/
theorem ph_profileSign (s : ℝ) (z : ℂ) :
    Haag.ph ((profileSign s : ℂ) * z) = (profileSign s : ℂ) * Haag.ph z := by
  simp only [Haag.ph, norm_mul, norm_profileSign, one_mul]
  ring

/-- With an unchanged radial argument, the canonical shift carries the profile sign. -/
theorem F0_signed_shift (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0) (w : ℂ) :
    F0 ((Real.sqrt s : ℂ), w) = (profileSign s : ℂ) *
      Haag.ph (((profileSign s * profileShift s : ℝ) : ℂ) + w) := by
  have hsq : (profileSign s : ℂ) * (profileSign s : ℂ) = 1 := by
    rcases profileSign_sq s with h | h <;> simp [h]
  have h := phaseSlice_signed s hs hv ((profileSign s : ℂ) * w)
  have hw : (profileSign s : ℂ) * ((profileSign s : ℂ) * w) = w := by
    rw [← mul_assoc, hsq, one_mul]
  rw [hw] at h
  change F0 ((Real.sqrt s : ℂ), w) = _ at h
  rw [h, ← ph_profileSign]
  congr 1
  push_cast
  rw [mul_add, ← mul_assoc, hsq, one_mul]

/-- The actual twisted coefficient is a signed bare-phase Gaussian integral.
There is no factorial, Jacobian, or power-dependent sign in this representation. -/
theorem twistCoef_eq_signed_integral (j : ℕ) (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) (i : ℕ × ℕ) :
    twistCoef j s i = (profileSign s : ℂ) *
      ∫ w, conj (hfun i w) *
        ((I * (phiT ((Real.sqrt s : ℂ), w) : ℂ)) ^ j *
          Haag.ph (((profileSign s * profileShift s : ℝ) : ℂ) + w)) ∂gaussC := by
  rw [twistCoef, ← integral_const_mul]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun w ↦ by
    change conj (hfun i w) *
      ((I * (phiT ((Real.sqrt s : ℂ), w) : ℂ)) ^ j *
        F0 ((Real.sqrt s : ℂ), w)) = _
    rw [F0_signed_shift s hs hv]
    ring

/-- The shifted coefficient agrees with the actual twisted source on its signed real slice. -/
theorem twistCoef_eq_signed_coefficient (j : ℕ) (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) (i : ℕ × ℕ) :
    twistCoef j s i = (profileSign s : ℂ) *
      coefficient j (Real.sqrt s : ℂ) (profileSign s * profileShift s) 0 i := by
  rw [twistCoef_eq_signed_integral j s hs hv, coefficient_real_zero]
  simp only [mul_assoc]

/-- The profile sign disappears from the norm of each actual conditional coefficient. -/
theorem norm_twistCoef_eq (j : ℕ) (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) (i : ℕ × ℕ) :
    ‖twistCoef j s i‖ =
      ‖coefficient j (Real.sqrt s : ℂ) (profileSign s * profileShift s) 0 i‖ := by
  rw [twistCoef_eq_signed_coefficient j s hs hv, norm_mul, norm_profileSign, one_mul]

/-- The real production vector has exactly the shifted representation's squared norm. -/
theorem sum_twistCoef_sq_eq (j : ℕ) (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) (S : Finset (ℕ × ℕ)) :
    ∑ i ∈ S, ‖twistCoef j s i‖ ^ 2 =
      ∑ i ∈ S,
        ‖coefficient j (Real.sqrt s : ℂ) (profileSign s * profileShift s) 0 i‖ ^ 2 := by
  apply Finset.sum_congr rfl
  intro i _
  rw [norm_twistCoef_eq j s hs hv]

end

end Grothe.UpperQuad.GaussianShift

/-- info: 'Grothe.UpperQuad.GaussianShift.twistCoef_eq_signed_integral' depends on axioms:
[propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperQuad.GaussianShift.twistCoef_eq_signed_integral
