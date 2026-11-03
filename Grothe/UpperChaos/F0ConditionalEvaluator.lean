import Grothe.UpperChaos.F0ConditionalNode
import Grothe.UpperChaos.Charge
import Grothe.UpperChaos.ConditionalNodeIndices
import Grothe.UpperChaos.GradedHermite

/-!
# The signed conditional evaluator at the actual production profile

The historical evaluator stores normalized coefficients of `phase(A + w)`.
This file identifies its profile sign and shift with the actual conditional
`F0` coefficients. It does not certify numerical entries or omitted tails.

Agent-ID: codex-7c2e
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

/-- The mathematical coefficient evaluated by the conditional node recurrence. -/
def canonicalCoefficient (A : ℝ) (i : ℕ × ℕ) : ℂ :=
  ∫ w, conj (hfun i w) * Haag.ph ((A : ℂ) + w) ∂gaussC

/-- The sign used by the stored conditional coefficients, at nonzero profile values. -/
def profileSign (s : ℝ) : ℝ := if vprof s < 0 then -1 else 1

/-- Positive scale of the actual second-coordinate coefficient. -/
def profileScale (s : ℝ) : ℝ := Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * |vprof s|

/-- The actual shift used by the conditional evaluator. -/
def profileShift (s : ℝ) : ℝ := Real.sqrt s / profileScale s

private theorem phase_pos_mul (r : ℝ) (hr : 0 < r) (z : ℂ) :
    Haag.ph ((r : ℂ) * z) = Haag.ph z := by
  simp only [Haag.ph, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos hr, Complex.ofReal_mul]
  exact mul_div_mul_left z (↑‖z‖) (by exact_mod_cast hr.ne')

theorem hfun_neg (i : ℕ × ℕ) (w : ℂ) :
    hfun i (-w) = (-1 : ℂ) ^ (i.1 + i.2) * hfun i w := by
  have h := ev_mul_H (c := (-1 : ℂ)) (by norm_num) w i.1 i.2
  simp only [neg_one_mul, map_neg, map_one, ← pow_add] at h
  simp only [hfun, h]
  ring

theorem profileScale_pos (s : ℝ) (hv : vprof s ≠ 0) : 0 < profileScale s := by
  unfold profileScale
  exact mul_pos (Real.sqrt_pos.2 (by positivity)) (abs_pos.2 hv)

theorem phaseSlice_signed (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0) (w : ℂ) :
    F0ConditionalNode.phaseSlice s ((profileSign s : ℂ) * w) =
      Haag.ph ((profileShift s : ℂ) + w) := by
  rw [F0ConditionalNode.phaseSlice_eq s hs]
  have hsign : vprof s * profileSign s = |vprof s| := by
    by_cases h : vprof s < 0
    · simp [profileSign, h, abs_of_neg h]
    · simp [profileSign, h, abs_of_nonneg (le_of_not_gt h)]
  have hr := profileScale_pos s hv
  have he : (Real.sqrt s : ℂ) +
      ((Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s : ℝ) : ℂ) *
        ((profileSign s : ℂ) * w) =
      (profileScale s : ℂ) * ((profileShift s : ℂ) + w) := by
    rw [mul_add, profileShift, Complex.ofReal_div,
      mul_div_cancel₀ _ (by exact_mod_cast hr.ne')]
    congr 1
    rw [← mul_assoc, ← Complex.ofReal_mul, mul_assoc, hsign]
    rfl
  rw [he, phase_pos_mul _ hr]

/-- The profile sign exponent is `c+d`, with the same Hermite index order as
the actual Gaussian inner product. This holds for every mode, not just a
numerical prefix retained by the implementation. -/
theorem coefficient_eq_signed (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0)
    (i : ℕ × ℕ) :
    F0ConditionalNode.coefficient s i =
      (profileSign s : ℂ) ^ (i.1 + i.2) * canonicalCoefficient (profileShift s) i := by
  rw [F0ConditionalNode.coefficient_eq_integral]
  have hnorm : ‖(profileSign s : ℂ)‖ = 1 := by
    by_cases h : vprof s < 0 <;> simp [profileSign, h]
  rw [← integral_rot_gaussC (profileSign s : ℂ) hnorm
    (fun w => conj (hfun i w) * F0ConditionalNode.phaseSlice s w)]
  have hh : ∀ w, hfun i ((profileSign s : ℂ) * w) =
      (profileSign s : ℂ) ^ (i.1 + i.2) * hfun i w := by
    intro w
    by_cases h : vprof s < 0
    · simpa [profileSign, h] using hfun_neg i w
    · simp [profileSign, h]
  simp_rw [hh, phaseSlice_signed s hs hv, map_mul, map_pow, Complex.conj_ofReal,
    mul_assoc, integral_const_mul]
  rfl

/-- Canonical entries of each production grade use exactly the selected
conditional pair, with primary indices `(j+k,j)`. -/
theorem production_canonical_indices (q c d : ℕ) (hq : q ≤ 250)
    (hd : d ≤ q) (hc : c ≤ d + 1) :
    (gradedMode q c d).2 ∈ ConditionalNodeIndices.modes ∧
      (gradedMode q c d).1 = (q - d + (d + 1 - c), q - d) := by
  constructor
  · exact (ConditionalNodeIndices.mem_modes c d).mpr ⟨by omega, hc⟩
  · apply Prod.ext
    · change q + 1 - c = q - d + (d + 1 - c)
      omega
    · rfl

/-- The reflected pair requested by the reconstruction is also selected.
This statement proves its indices only; the analytic reflection identity
and floating multiplication error must be supplied separately. -/
theorem production_reflected_indices (q c d : ℕ) (hq : q ≤ 250)
    (hcq : c ≤ q + 1) (hdc : d + 1 < c) :
    (d + 1, c - 1) ∈ ConditionalNodeIndices.modes ∧
      (gradedMode q c d).1 = (q + 1 - c, q + 1 - c + (c - d - 1)) := by
  constructor
  · apply (ConditionalNodeIndices.mem_modes _ _).mpr
    omega
  · apply Prod.ext
    · rfl
    · change q - d = q + 1 - c + (c - d - 1)
      omega

end
end Grothe.UpperChaos.F0ConditionalEvaluator

/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.coefficient_eq_signed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.coefficient_eq_signed
