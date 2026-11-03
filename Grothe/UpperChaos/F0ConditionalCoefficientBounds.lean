import Grothe.UpperChaos.F0ConditionalEvaluator
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Unit coefficient bounds for the actual Gaussian evaluator.
These bounds control the raising sum that occurs in its parameter derivative;
the differentiability identity itself is a separate analytic step.
Agent-ID: codex-8c4d. -/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

def canonicalPhase (A : ℝ) (w : ℂ) : ℂ := Haag.ph ((A : ℂ) + w)

theorem canonicalPhase_memLp (A : ℝ) : MemLp (canonicalPhase A) 2 gaussC := by
  have hm : Measurable (canonicalPhase A) := by
    unfold canonicalPhase
    exact Haag.measurable_ph.comp (measurable_const.add measurable_id)
  exact MemLp.of_bound hm.aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun w => Haag.norm_ph_le ((A : ℂ) + w))

def canonicalPhaseLp (A : ℝ) : Lp ℂ 2 gaussC :=
  (canonicalPhase_memLp A).toLp (canonicalPhase A)

theorem norm_canonicalPhaseLp_le_one (A : ℝ) : ‖canonicalPhaseLp A‖ ≤ 1 := by
  have ha : ∀ᵐ w ∂gaussC, ‖canonicalPhaseLp A w‖ ≤ 1 := by
    filter_upwards [(canonicalPhase_memLp A).coeFn_toLp] with w hw
    change ‖((canonicalPhase_memLp A).toLp (canonicalPhase A)) w‖ ≤ 1
    rw [hw]
    exact Haag.norm_ph_le ((A : ℂ) + w)
  have h := Lp.norm_le_of_ae_bound (f := canonicalPhaseLp A)
    (by norm_num : (0 : ℝ) ≤ 1) ha
  simpa [measureUnivNNReal] using h

theorem canonicalCoefficient_eq_inner (A : ℝ) (i : ℕ × ℕ) :
    canonicalCoefficient A i = ⟪hvec i, canonicalPhaseLp A⟫_ℂ := by
  exact (inner_toLp (memLp_hfun i) (canonicalPhase_memLp A)).symm

theorem norm_canonicalCoefficient_le_one (A : ℝ) (i : ℕ × ℕ) :
    ‖canonicalCoefficient A i‖ ≤ 1 := by
  rw [canonicalCoefficient_eq_inner]
  calc
    _ ≤ ‖hvec i‖ * ‖canonicalPhaseLp A‖ := norm_inner_le_norm _ _
    _ = ‖canonicalPhaseLp A‖ := by rw [orthonormal_hvec.norm_eq_one i, one_mul]
    _ ≤ 1 := norm_canonicalPhaseLp_le_one A

theorem norm_canonicalRaisingSum_le (A : ℝ) (c d : ℕ) :
    ‖(Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c + 1, d) +
      (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c, d + 1)‖ ≤
      Real.sqrt ((c + 1 : ℕ) : ℝ) + Real.sqrt ((d + 1 : ℕ) : ℝ) := by
  have hc : ‖(Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ)‖ =
      Real.sqrt ((c + 1 : ℕ) : ℝ) := by simp
  have hd : ‖(Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ)‖ =
      Real.sqrt ((d + 1 : ℕ) : ℝ) := by simp
  calc
    _ ≤ ‖(Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c + 1, d)‖ +
        ‖(Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c, d + 1)‖ :=
      norm_add_le _ _
    _ = Real.sqrt ((c + 1 : ℕ) : ℝ) * ‖canonicalCoefficient A (c + 1, d)‖ +
        Real.sqrt ((d + 1 : ℕ) : ℝ) * ‖canonicalCoefficient A (c, d + 1)‖ := by
      rw [norm_mul, norm_mul, hc, hd]
    _ ≤ Real.sqrt ((c + 1 : ℕ) : ℝ) * 1 + Real.sqrt ((d + 1 : ℕ) : ℝ) * 1 :=
      add_le_add
        (mul_le_mul_of_nonneg_left (norm_canonicalCoefficient_le_one A _)
          (Real.sqrt_nonneg _))
        (mul_le_mul_of_nonneg_left (norm_canonicalCoefficient_le_one A _)
          (Real.sqrt_nonneg _))
    _ = _ := by simp

theorem storage_raising_constant_lt (c d : ℕ) (hc : c ≤ 266) (hd : d ≤ 265) :
    Real.sqrt ((c + 1 : ℕ) : ℝ) + Real.sqrt ((d + 1 : ℕ) : ℝ) < 35 := by
  have hcs : Real.sqrt ((c + 1 : ℕ) : ℝ) < 17 := by
    apply (Real.sqrt_lt (Nat.cast_nonneg _) (by norm_num : (0 : ℝ) ≤ 17)).2
    exact_mod_cast (show c + 1 < 17 ^ 2 by omega)
  have hds : Real.sqrt ((d + 1 : ℕ) : ℝ) < 17 := by
    apply (Real.sqrt_lt (Nat.cast_nonneg _) (by norm_num : (0 : ℝ) ≤ 17)).2
    exact_mod_cast (show d + 1 < 17 ^ 2 by omega)
  linarith

theorem norm_canonicalRaisingSum_lt (A : ℝ) (c d : ℕ)
    (hc : c ≤ 266) (hd : d ≤ 265) :
    ‖(Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c + 1, d) +
      (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) * canonicalCoefficient A (c, d + 1)‖ < 35 :=
  lt_of_le_of_lt (norm_canonicalRaisingSum_le A c d) (storage_raising_constant_lt c d hc hd)

end
end Grothe.UpperChaos.F0ConditionalEvaluator
