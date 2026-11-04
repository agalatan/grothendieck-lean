import Grothe.UpperChaos.ConditionalMomentCharge
import Grothe.UpperChaos.F0ConditionalEvaluator
import Mathlib.Tactic.LinearCombination

/-!
# Charge recurrence for actual normalized conditional Gaussian coefficients

The charge identity holds for all real shifts, including zero. Solving it
forward requires a nonzero shift and reconstructs every finite triangular
coefficient table from the existing zero-row seeds, without an independent
diagonal recurrence. Numerical enclosures and parameter transport remain
separate obligations.

Agent-ID: codex-aa04. Refs #21.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

private theorem nrm_square (p q : ℕ) :
    nrm p q ^ 2 = (((p.factorial * q.factorial : ℕ) : ℝ))⁻¹ := by
  rw [nrm, inv_pow, Real.sq_sqrt (by positivity)]

private theorem sqrt_mul_nrm_succ_left (c d : ℕ) :
    Real.sqrt ((c + 1 : ℕ) : ℝ) * nrm (c + 1) d = nrm c d := by
  apply (sq_eq_sq₀
    (mul_nonneg (Real.sqrt_nonneg _) (nrm_pos _ _).le) (nrm_pos _ _).le).mp
  rw [mul_pow, Real.sq_sqrt (by positivity), nrm_square, nrm_square]
  have hc : (c.factorial : ℝ) ≠ 0 := by positivity
  have hd : (d.factorial : ℝ) ≠ 0 := by positivity
  have hc1 : (c : ℝ) + 1 ≠ 0 := by positivity
  simp only [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
  field_simp [hc, hd, hc1]

private theorem nrm_swap (c d : ℕ) : nrm c d = nrm d c := by
  simp only [nrm, Nat.mul_comm]

private theorem sqrt_mul_nrm_succ_right (c d : ℕ) :
    Real.sqrt ((d + 1 : ℕ) : ℝ) * nrm c (d + 1) = nrm c d := by
  rw [nrm_swap c (d + 1), sqrt_mul_nrm_succ_left, nrm_swap d c]

private theorem canonicalCoefficient_eq_phase_integral (A : ℝ) (c d : ℕ) :
    canonicalCoefficient A (c, d) = (nrm c d : ℂ) *
      ∫ w, ev w (H d c) * Haag.ph ((A : ℂ) + w) ∂gaussC := by
  unfold canonicalCoefficient
  simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap, mul_assoc,
    integral_const_mul]

private theorem sqrt_mul_canonicalCoefficient_succ_left (A : ℝ) (c d : ℕ) :
    (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c + 1, d) =
      (nrm c d : ℂ) *
        ∫ w, ev w (H d (c + 1)) * Haag.ph ((A : ℂ) + w) ∂gaussC := by
  rw [canonicalCoefficient_eq_phase_integral, ← mul_assoc, ← Complex.ofReal_mul,
    sqrt_mul_nrm_succ_left]

private theorem sqrt_mul_canonicalCoefficient_succ_right (A : ℝ) (c d : ℕ) :
    (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c, d + 1) =
      (nrm c d : ℂ) *
        ∫ w, ev w (H (d + 1) c) * Haag.ph ((A : ℂ) + w) ∂gaussC := by
  rw [canonicalCoefficient_eq_phase_integral, ← mul_assoc, ← Complex.ofReal_mul,
    sqrt_mul_nrm_succ_right]

/-- The actual normalized charge identity. The Hermite indices are reversed
inside the integral by complex conjugation; consequently the charge is
`d + 1 - c`, with subtraction in `ℂ`, not in `ℕ`. -/
theorem canonicalCoefficient_charge (A : ℝ) (c d : ℕ) :
    (A : ℂ) *
        ((Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c + 1, d) -
          (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c, d + 1)) =
      ((d : ℂ) + 1 - (c : ℂ)) * canonicalCoefficient A (c, d) := by
  rw [sqrt_mul_canonicalCoefficient_succ_left,
    sqrt_mul_canonicalCoefficient_succ_right, canonicalCoefficient_eq_phase_integral]
  calc
    _ = (nrm c d : ℂ) * ((A : ℂ) *
        ((∫ w, ev w (H d (c + 1)) * Haag.ph ((A : ℂ) + w) ∂gaussC) -
          ∫ w, ev w (H (d + 1) c) * Haag.ph ((A : ℂ) + w) ∂gaussC)) := by ring
    _ = (nrm c d : ℂ) * (((d : ℂ) + 1 - (c : ℂ)) *
        ∫ w, ev w (H d c) * Haag.ph ((A : ℂ) + w) ∂gaussC) := by
      rw [ConditionalMomentCharge.integral_phase_H_charge A d c]
    _ = _ := by ring

/-- Forward reconstruction of the next actual coefficient row. Its two
inputs lie in the preceding row, so a finite zero row determines the entire
finite triangle; no independent diagonal formula is needed. -/
theorem canonicalCoefficient_forward (A : ℝ) (hA : A ≠ 0) (c d : ℕ) :
    canonicalCoefficient A (c + 1, d) =
      ((A : ℂ) * (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) *
          canonicalCoefficient A (c, d + 1) +
        ((d : ℂ) + 1 - (c : ℂ)) * canonicalCoefficient A (c, d)) /
        ((A : ℂ) * (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ)) := by
  have hAC : (A : ℂ) ≠ 0 := by exact_mod_cast hA
  have hc : (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) ≠ 0 := by
    exact_mod_cast (show Real.sqrt ((c + 1 : ℕ) : ℝ) ≠ 0 by positivity)
  apply (eq_div_iff (mul_ne_zero hAC hc)).2
  linear_combination canonicalCoefficient_charge A c d

end
end Grothe.UpperChaos.F0ConditionalEvaluator

/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_charge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_charge

/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_forward' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_forward
