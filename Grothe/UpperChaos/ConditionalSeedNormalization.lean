import Grothe.UpperChaos.F0ConditionalSeedRecurrence
import Grothe.UpperChaos.ConditionalCoefficientCharge
import Grothe.UpperChaos.F0ConditionalCoefficientBounds
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Tactic.Ring

/-!
# Common-scalar normalization of actual Gaussian coefficients

For a positive real shift A, the actual zero-zero Gaussian coefficient is
the positive real scalar S(A) = (sqrt(pi)/2) A J_0(A^2). Dividing every
actual coefficient by that same scalar gives U_00 = 1 and preserves the
zero-row and charge recurrences. One finite Bessel budget controls the
entire normalized vector.

There are no saved-center, numerical-interval, transcript, or transport
assumptions in these statements. The physical-node-to-shift binding,
finite-to-actual 5e-15 estimate, and all numerical enclosures remain
separate. No final endpoint is claimed.

Agent-ID: codex-aa04. Refs #21.
-/

open Grothe.LowerAnalytic
open scoped BigOperators InnerProductSpace

namespace Grothe.UpperChaos.ConditionalSeedNormalization

noncomputable section

open F0ConditionalEvaluator

/-- The real common scalar is the actual Gaussian zero-zero seed. -/
def seedScalar (A : ℝ) : ℝ :=
  (Real.sqrt Real.pi / 2) * A * OriginalPositiveMoment.moment 0 (A ^ 2)

/-- All coefficients are divided by the same actual seed, not independent
interval approximations of it. Results below require A > 0 where needed. -/
def normalizedCoefficient (A : ℝ) (i : ℕ × ℕ) : ℂ :=
  canonicalCoefficient A i / (seedScalar A : ℂ)

theorem seedScalar_pos {A : ℝ} (hA : 0 < A) : 0 < seedScalar A := by
  have hpi : 0 < Real.sqrt Real.pi := Real.sqrt_pos.2 Real.pi_pos
  have hm : 0 < OriginalPositiveMoment.moment 0 (A ^ 2) :=
    OriginalPositiveMoment.moment_pos 0 (A ^ 2)
  exact mul_pos (mul_pos (div_pos hpi (by norm_num)) hA) hm

theorem seedScalar_ne_zero {A : ℝ} (hA : 0 < A) : seedScalar A ≠ 0 :=
  (seedScalar_pos hA).ne'

theorem seedScalar_complex_ne_zero {A : ℝ} (hA : 0 < A) :
    (seedScalar A : ℂ) ≠ 0 := by
  exact_mod_cast seedScalar_ne_zero hA

/-- The actual integral seed, including its normalization factor. -/
theorem canonicalCoefficient_zero_zero (A : ℝ) :
    canonicalCoefficient A (0, 0) = (seedScalar A : ℂ) :=
  F0ConditionalSeed.canonicalCoefficient_zero_zero A

/-- Exact common-scalar reconstruction at every pair of Hermite indices. -/
theorem canonicalCoefficient_eq_seed_mul {A : ℝ} (hA : 0 < A)
    (i : ℕ × ℕ) :
    canonicalCoefficient A i = (seedScalar A : ℂ) * normalizedCoefficient A i := by
  calc
    _ = (canonicalCoefficient A i / (seedScalar A : ℂ)) * (seedScalar A : ℂ) :=
      (div_mul_cancel₀ _ (seedScalar_complex_ne_zero hA)).symm
    _ = _ := mul_comm _ _

theorem normalizedCoefficient_zero_zero {A : ℝ} (hA : 0 < A) :
    normalizedCoefficient A (0, 0) = 1 := by
  rw [normalizedCoefficient, canonicalCoefficient_zero_zero]
  exact div_self (seedScalar_complex_ne_zero hA)

/-- The exact zero-row recurrence, with its original negative sign and
successor factorial normalization. Together with U_00=1 this fixes the row. -/
theorem normalizedCoefficient_zero_row_step (A : ℝ) (d : ℕ) :
    normalizedCoefficient A (0, d + 1) =
      (((-A) * OriginalPositiveMoment.ratio d (A ^ 2) /
        Real.sqrt ((d + 1 : ℕ) : ℝ) : ℝ) : ℂ) *
        normalizedCoefficient A (0, d) := by
  unfold normalizedCoefficient
  rw [F0ConditionalSeed.canonicalCoefficient_zero_row_step, mul_div_assoc]

/-- Division by the common scalar preserves the actual charge identity.
The charge is d+1-c in C, not truncated subtraction of natural numbers. -/
theorem normalizedCoefficient_charge (A : ℝ) (c d : ℕ) :
    (A : ℂ) *
        ((Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) * normalizedCoefficient A (c + 1, d) -
          (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) * normalizedCoefficient A (c, d + 1)) =
      ((d : ℂ) + 1 - (c : ℂ)) * normalizedCoefficient A (c, d) := by
  have h := congrArg (fun z : ℂ => z / (seedScalar A : ℂ))
    (F0ConditionalEvaluator.canonicalCoefficient_charge A c d)
  simpa only [normalizedCoefficient, sub_div, mul_div_assoc] using h

/-- The forward step reconstructs row c+1 from two entries in row c.
Positivity supplies the only division condition, A != 0. -/
theorem normalizedCoefficient_forward {A : ℝ} (hA : 0 < A) (c d : ℕ) :
    normalizedCoefficient A (c + 1, d) =
      ((A : ℂ) * (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) *
          normalizedCoefficient A (c, d + 1) +
        ((d : ℂ) + 1 - (c : ℂ)) * normalizedCoefficient A (c, d)) /
        ((A : ℂ) * (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ)) := by
  unfold normalizedCoefficient
  rw [F0ConditionalEvaluator.canonicalCoefficient_forward A hA.ne' c d]
  simp only [div_eq_mul_inv]
  ring

/-- Bessel's inequality for the actual, unscaled coefficient vector. -/
theorem sum_sq_canonicalCoefficient_le_one (A : ℝ)
    (modes : Finset (ℕ × ℕ)) :
    (∑ i ∈ modes, ‖canonicalCoefficient A i‖ ^ 2) ≤ 1 := by
  simp_rw [canonicalCoefficient_eq_inner]
  calc
    _ ≤ ‖canonicalPhaseLp A‖ ^ 2 :=
      orthonormal_hvec.sum_inner_products_le (canonicalPhaseLp A)
    _ ≤ 1 := by
      nlinarith [norm_canonicalPhaseLp_le_one A, norm_nonneg (canonicalPhaseLp A)]

theorem norm_normalizedCoefficient_sq {A : ℝ} (hA : 0 < A)
    (i : ℕ × ℕ) :
    ‖normalizedCoefficient A i‖ ^ 2 =
      ‖canonicalCoefficient A i‖ ^ 2 / seedScalar A ^ 2 := by
  simp only [normalizedCoefficient, norm_div, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (seedScalar_pos hA), div_pow]

/-- One common scalar controls any finite normalized coefficient vector.
This does not count coefficients separately or assert a unit bound for U. -/
theorem sum_sq_normalizedCoefficient_le {A : ℝ} (hA : 0 < A)
    (modes : Finset (ℕ × ℕ)) :
    (∑ i ∈ modes, ‖normalizedCoefficient A i‖ ^ 2) ≤ 1 / seedScalar A ^ 2 := by
  calc
    _ = (∑ i ∈ modes, ‖canonicalCoefficient A i‖ ^ 2) / seedScalar A ^ 2 := by
      simp_rw [norm_normalizedCoefficient_sq hA]
      exact (Finset.sum_div modes (fun i => ‖canonicalCoefficient A i‖ ^ 2)
        (seedScalar A ^ 2)).symm
    _ ≤ 1 / seedScalar A ^ 2 :=
      div_le_div_of_nonneg_right (sum_sq_canonicalCoefficient_le_one A modes)
        (sq_nonneg (seedScalar A))

end
end Grothe.UpperChaos.ConditionalSeedNormalization

/-- info: 'Grothe.UpperChaos.ConditionalSeedNormalization.canonicalCoefficient_eq_seed_mul' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedNormalization.canonicalCoefficient_eq_seed_mul

/-- info: 'Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_zero_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_zero_zero

/-- info: 'Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_zero_row_step' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_zero_row_step

/-- info: 'Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_charge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_charge

/-- info: 'Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_forward' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedNormalization.normalizedCoefficient_forward

/-- info: 'Grothe.UpperChaos.ConditionalSeedNormalization.sum_sq_normalizedCoefficient_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedNormalization.sum_sq_normalizedCoefficient_le
