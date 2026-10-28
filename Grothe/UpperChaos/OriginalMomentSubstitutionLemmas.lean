import Grothe.UpperChaos.OriginalMomentIntegrable
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith

/-! Elementary hypotheses for the angular change of variables. The equality of
the two moment integrals is not asserted here. Agent-ID: codex-8c4d. -/
open MeasureTheory Set
namespace Grothe.UpperChaos.OriginalPositiveMoment
noncomputable section

def sinSq (t : ℝ) : ℝ := Real.sin t ^ 2

theorem integrand_continuousOn_pos (h : ℕ) (x : ℝ) :
    ContinuousOn (integrand h x) (Ioi 0) := by
  unfold integrand
  apply ContinuousOn.mul
  · exact continuousOn_id.rpow_const (fun t ht => Or.inl (ne_of_gt ht))
  · have hc : Continuous (fun t : ℝ => Real.sqrt (1 - t) * Real.exp (-x * t)) := by fun_prop
    exact hc.continuousOn

theorem sinSq_hasDerivAt (t : ℝ) :
    HasDerivAt sinSq (2 * Real.sin t * Real.cos t) t := by
  change HasDerivAt (Real.sin ^ 2) (2 * Real.sin t * Real.cos t) t
  simpa only [Nat.cast_ofNat, Nat.reduceSub, pow_one] using (Real.hasDerivAt_sin t).pow 2

theorem sinSq_mem_Icc (t : ℝ) : sinSq t ∈ Icc (0 : ℝ) 1 := by
  constructor
  · exact sq_nonneg _
  · unfold sinSq
    nlinarith [Real.sin_sq_add_cos_sq t, sq_nonneg (Real.cos t)]

theorem sinSq_mem_Ioo {t : ℝ} (ht : t ∈ Ioo (0 : ℝ) (Real.pi / 2)) :
    sinSq t ∈ Ioo (0 : ℝ) 1 := by
  rcases ht with ⟨ht0, ht1⟩
  have hs : 0 < Real.sin t := Real.sin_pos_of_pos_of_lt_pi ht0 (by linarith [Real.pi_pos])
  have hc : 0 < Real.cos t := Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos], ht1⟩
  constructor
  · unfold sinSq; positivity
  · unfold sinSq
    nlinarith [Real.sin_sq_add_cos_sq t, sq_pos_of_pos hc]

end
end Grothe.UpperChaos.OriginalPositiveMoment
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.integrand_continuousOn_pos
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.sinSq_mem_Ioo
