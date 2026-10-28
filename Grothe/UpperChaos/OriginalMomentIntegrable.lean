import Mathlib.Analysis.SpecialFunctions.Integrability.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Integrability of the original historical moment integrand, including its
h=0 endpoint singularity. The change of variables to the angular model remains
separate. Agent-ID: codex-8c4d. -/
open MeasureTheory Set
namespace Grothe.UpperChaos.OriginalPositiveMoment
noncomputable section

def integrand (h : ℕ) (x t : ℝ) : ℝ :=
  t ^ ((h : ℝ) - 1 / 2) * (Real.sqrt (1 - t) * Real.exp (-x * t))

def moment (h : ℕ) (x : ℝ) : ℝ :=
  (2 / Real.pi) * ∫ t in (0 : ℝ)..1, integrand h x t

/-- The historical integrand is interval integrable even for h = 0. -/
theorem integrand_intervalIntegrable (h : ℕ) (x : ℝ) :
    IntervalIntegrable (integrand h x) volume 0 1 := by
  have hn : (0 : ℝ) ≤ h := Nat.cast_nonneg h
  have hs : IntervalIntegrable (fun t : ℝ => t ^ ((h : ℝ) - 1 / 2)) volume 0 1 :=
    intervalIntegral.intervalIntegrable_rpow' (by linarith)
  have hc : Continuous (fun t : ℝ => Real.sqrt (1 - t) * Real.exp (-x * t)) := by
    fun_prop
  exact hs.mul_continuousOn hc.continuousOn

end
end Grothe.UpperChaos.OriginalPositiveMoment
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.integrand_intervalIntegrable
