import Mathlib.Analysis.Complex.Exponential
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! An elementary Gaussian radial-density estimate, independent of source
tables, quadrature rules and numerical integration. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0RadialDensity

/-- Five positive terms at one suffice for the rational base bound. -/
theorem exp_one_lower : (27 / 10 : ℝ) ≤ Real.exp 1 := by
  have hsum := Real.sum_le_exp_of_nonneg (show (0 : ℝ) ≤ 1 by norm_num) 5
  have hn : (27 / 10 : ℝ) ≤
      ∑ i ∈ Finset.range 5, (1 : ℝ) ^ i / i.factorial := by
    norm_num [Finset.sum_range_succ, Nat.factorial]
  exact hn.trans hsum

/-- Raise the short bound at one to the thirteenth power. -/
theorem exp_thirteen_lower : (400000 : ℝ) ≤ Real.exp 13 := by
  calc
    _ ≤ (27 / 10 : ℝ) ^ 13 := by norm_num
    _ ≤ (Real.exp 1) ^ 13 :=
      pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 27 / 10) exp_one_lower 13
    _ = Real.exp 13 := by simpa using (Real.exp_nat_mul (1 : ℝ) 13).symm

theorem exp_neg_thirteen_le : Real.exp (-13) ≤ (1 / 400000 : ℝ) := by
  rw [Real.exp_neg]
  simpa only [one_div] using
    one_div_le_one_div_of_le (show (0 : ℝ) < 400000 by norm_num) exp_thirteen_lower

theorem density_le_of_thirteen {s : ℝ} (hs : 13 ≤ s) :
    Real.exp (-s) ≤ (1 / 400000 : ℝ) :=
  (Real.exp_le_exp.mpr (neg_le_neg hs)).trans exp_neg_thirteen_le

end Grothe.UpperChaos.Q0RadialDensity

open Lean Elab Command
run_cmd do
  let dependencies ← Lean.collectAxioms
    ``Grothe.UpperChaos.Q0RadialDensity.density_le_of_thirteen
  for dependency in dependencies do
    unless (#[`propext, `Classical.choice, `Quot.sound] : Array Name).contains dependency do
      throwError m!"radial density bound uses unexpected axiom {dependency}"
