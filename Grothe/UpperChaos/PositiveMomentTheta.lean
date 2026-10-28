import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Smooth angular form of the historical positive moments. The separate
change-of-variables identity relating this to the original endpoint-singular
integral is not claimed here. Agent-ID: codex-8c4d. -/
open MeasureTheory Set
open scoped Real
namespace Grothe.UpperChaos.PositiveMomentTheta

noncomputable section

def density (h : ℕ) (x t : ℝ) : ℝ :=
  Real.sin t ^ (2 * h) * Real.cos t ^ 2 * Real.exp (-x * Real.sin t ^ 2)

def moment (h : ℕ) (x : ℝ) : ℝ := ∫ t in (0 : ℝ)..(Real.pi / 2), density h x t

theorem density_continuous (h : ℕ) (x : ℝ) : Continuous (density h x) := by
  unfold density
  fun_prop

theorem density_nonneg (h : ℕ) (x t : ℝ) (ht0 : 0 ≤ t) (htpi : t ≤ Real.pi / 2) :
    0 ≤ density h x t := by
  have hs : 0 ≤ Real.sin t := Real.sin_nonneg_of_nonneg_of_le_pi ht0 (by linarith [Real.pi_pos])
  unfold density
  exact mul_nonneg (mul_nonneg (pow_nonneg hs _) (sq_nonneg _)) (Real.exp_pos _).le

theorem moment_pos (h : ℕ) (x : ℝ) : 0 < moment h x := by
  unfold moment
  apply intervalIntegral.integral_pos Real.pi_div_two_pos (density_continuous h x).continuousOn
  · intro t ht
    exact density_nonneg h x t ht.1.le ht.2
  · refine ⟨Real.pi / 4, ⟨by positivity, by linarith [Real.pi_pos]⟩, ?_⟩
    have hs : 0 < Real.sin (Real.pi / 4) :=
      Real.sin_pos_of_pos_of_lt_pi (by positivity) (by linarith [Real.pi_pos])
    have hc : 0 < Real.cos (Real.pi / 4) :=
      Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos], by linarith [Real.pi_pos]⟩
    unfold density
    positivity

/-- Consecutive angular densities differ by the factor sin². -/
theorem density_succ (h : ℕ) (x t : ℝ) :
    density (h + 1) x t = density h x t * Real.sin t ^ 2 := by
  unfold density
  rw [Nat.mul_add, Nat.mul_one, pow_add]
  ring

theorem moment_succ_le (h : ℕ) (x : ℝ) : moment (h + 1) x ≤ moment h x := by
  unfold moment
  apply intervalIntegral.integral_mono_on Real.pi_div_two_pos.le
    ((density_continuous (h + 1) x).intervalIntegrable 0 (Real.pi / 2))
    ((density_continuous h x).intervalIntegrable 0 (Real.pi / 2))
  intro t ht
  rw [density_succ]
  have hs : Real.sin t ^ 2 ≤ 1 := by
    nlinarith [Real.sin_sq_add_cos_sq t, sq_nonneg (Real.cos t)]
  calc
    density h x t * Real.sin t ^ 2 ≤ density h x t * 1 :=
      mul_le_mul_of_nonneg_left hs (density_nonneg h x t ht.1 ht.2)
    _ = density h x t := mul_one _

theorem moment_ratio_mem_unit (h : ℕ) (x : ℝ) :
    0 < moment (h + 1) x / moment h x ∧ moment (h + 1) x / moment h x ≤ 1 := by
  exact ⟨div_pos (moment_pos (h + 1) x) (moment_pos h x),
    (div_le_one (moment_pos h x)).2 (moment_succ_le h x)⟩

end
end Grothe.UpperChaos.PositiveMomentTheta
#print axioms Grothe.UpperChaos.PositiveMomentTheta.moment_pos

#print axioms Grothe.UpperChaos.PositiveMomentTheta.moment_ratio_mem_unit
