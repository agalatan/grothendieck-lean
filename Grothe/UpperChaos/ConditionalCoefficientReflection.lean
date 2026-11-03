import Grothe.UpperChaos.ConditionalMomentReflection
import Grothe.UpperChaos.F0ConditionalEvaluator

/-! Normalized reflection of the actual conditional coefficients.
The exact square-root factor and profile sign match the production reconstruction.
Agent-ID: codex-7c2e. -/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate
namespace Grothe.UpperChaos.F0ConditionalEvaluator
noncomputable section

private theorem nrm_square (p q : ℕ) :
    nrm p q ^ 2 = (((p.factorial * q.factorial : ℕ) : ℝ))⁻¹ := by
  rw [nrm, inv_pow, Real.sq_sqrt (by positivity)]

/-- Exact factor used when reconstructing the other half of a coefficient block. -/
theorem nrm_reflection (p q : ℕ) :
    nrm (q + 1) p = Real.sqrt (((p + 1 : ℕ) : ℝ) / (q + 1 : ℕ)) * nrm (p + 1) q := by
  apply (sq_eq_sq₀ (nrm_pos _ _).le (mul_nonneg (Real.sqrt_nonneg _) (nrm_pos _ _).le)).mp
  rw [mul_pow, Real.sq_sqrt (by positivity), nrm_square, nrm_square]
  have hp : (p.factorial : ℝ) ≠ 0 := by positivity
  have hq : (q.factorial : ℝ) ≠ 0 := by positivity
  have hp1 : (p : ℝ) + 1 ≠ 0 := by positivity
  have hq1 : (q : ℝ) + 1 ≠ 0 := by positivity
  push_cast
  simp only [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
  field_simp [hp, hq, hp1, hq1]

/-- Actual integral identity, valid for every real shift, including zero. -/
theorem canonicalCoefficient_reflection (A : ℝ) (p q : ℕ) :
    canonicalCoefficient A (q + 1, p) =
      (Real.sqrt (((p + 1 : ℕ) : ℝ) / (q + 1 : ℕ)) : ℂ) *
        canonicalCoefficient A (p + 1, q) := by
  unfold canonicalCoefficient
  simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap, mul_assoc,
    integral_const_mul]
  rw [ConditionalMomentReflection.integral_phase_H_reflection A p q,
    nrm_reflection, Complex.ofReal_mul, mul_assoc]


/-- The profile sign is unchanged by reflection: both total degrees coincide. -/
theorem coefficient_reflection (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0)
    (p q : ℕ) :
    F0ConditionalNode.coefficient s (q + 1, p) =
      (Real.sqrt (((p + 1 : ℕ) : ℝ) / (q + 1 : ℕ)) : ℂ) *
        F0ConditionalNode.coefficient s (p + 1, q) := by
  rw [coefficient_eq_signed s hs hv, coefficient_eq_signed s hs hv,
    canonicalCoefficient_reflection]
  have hdeg : q + 1 + p = p + 1 + q := by omega
  simp only [hdeg]
  ring

/-- Precisely the noncanonical lookup used by `finalize_finite_head.py`. -/
theorem production_reflected_coefficient (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) (c d : ℕ) (h : d + 1 < c) :
    F0ConditionalNode.coefficient s (c, d) =
      (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) *
        F0ConditionalNode.coefficient s (d + 1, c - 1) := by
  have hc : 1 ≤ c := by omega
  simpa only [Nat.sub_add_cancel hc] using coefficient_reflection s hs hv d (c - 1)

/-- Exact reflected entries never amplify the canonical coefficient error.
The floating square root and multiplication still need separate enclosures. -/
theorem production_reflection_factor_le_one (c d : ℕ) (h : d + 1 < c) :
    Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) ≤ 1 := by
  apply Real.sqrt_le_one.mpr
  apply (div_le_one (by exact_mod_cast (show 0 < c by omega))).mpr
  exact_mod_cast (show d + 1 ≤ c by omega)

end
end Grothe.UpperChaos.F0ConditionalEvaluator

/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_reflection' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_reflection

/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.production_reflected_coefficient' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.production_reflected_coefficient
