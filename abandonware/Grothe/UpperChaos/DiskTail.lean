import Mathlib.MeasureTheory.Function.LpSeminorm.Indicator
import Mathlib.Basic.Complex.Basic
import Mathlib.Tactic

/-! An abstract L² tail bound for disk-valued responses.
Agent-ID: codex-e4b7. This bound requires a disk-valued response. -/

open MeasureTheory Set
namespace Grothe.UpperChaos

/-- A disk-valued response restricted to a measurable event costs at most the
square root of that event's measure. -/
theorem disk_response_eLpNorm_indicator_le
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) (S : Set Ω) (hS : MeasurableSet S)
    (f : Ω → ℂ) (hf : AEStronglyMeasurable f μ)
    (hbound : ∀ ω ∈ S, ‖f ω‖ ≤ 1) :
    eLpNorm (S.indicator f) 2 μ ≤ (μ S) ^ (1 / 2 : ℝ) := by
  calc
    eLpNorm (S.indicator f) 2 μ ≤
        eLpNorm (S.indicator (fun _ : Ω => (1 : ℂ))) 2 μ := by
      apply eLpNorm_mono_ae (hf.indicator hS)
      apply Filter.Eventually.of_forall
      intro ω
      by_cases hω : ω ∈ S
      · simp only [Set.indicator_of_mem hω, norm_one]
        exact hbound ω hω
      · simp [Set.indicator_of_notMem hω]
    _ = (μ S) ^ (1 / 2 : ℝ) := by
      rw [eLpNorm_indicator_const hS.nullMeasurableSet (by norm_num) (by norm_num)]
      norm_num

end Grothe.UpperChaos
