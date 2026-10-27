import Grothe.UpperChaos.Rounder
import LeanCert.Tactic.LeanCert

/-!
# One Gaussian profile cell

The certificate's actual degree-one Laguerre profile component is integrated
on `[0,1]`. An elementary antiderivative reduces this cell to a single
exponential enclosure. This is a finite cell of one profile component; it
is not a bound for the complete profile, Gaussian response, or kernel.

Agent-ID: codex-aa04
-/

open MeasureTheory
namespace Grothe.UpperChaos
noncomputable section

/-- The degree-one component used by `vprof`. -/
lemma lagHalf_one (s : ℝ) : lagHalf 1 s = 1 / 2 - s := by
  norm_num [lagHalf, binHalf, Finset.sum_range_succ, Finset.prod_range_succ, Nat.factorial] <;> ring

private def profileCellPrimitive (s : ℝ) : ℝ :=
  -(s ^ 2 + s + 5 / 4) * Real.exp (-s)

private lemma profileCellPrimitive_deriv (s : ℝ) :
    HasDerivAt profileCellPrimitive ((1 / 2 - s) ^ 2 * Real.exp (-s)) s := by
  have hp : HasDerivAt (fun x : ℝ => -(x ^ 2 + x + 5 / 4)) (-(2 * s + 1)) s := by
    convert ((((hasDerivAt_id s).pow 2).add (hasDerivAt_id s)).add_const (5 / 4)).neg using 1 <;> ring
  have he : HasDerivAt (fun x : ℝ => Real.exp (-x)) (-Real.exp (-s)) s := by
    convert ((hasDerivAt_id s).neg.exp) using 1 <;> simp
  convert hp.mul he using 1 <;> simp only [profileCellPrimitive] <;> ring

/-- Exact source-bound identity for this finite Gaussian cell. -/
theorem profile_first_gaussian_cell_exact :
    (∫ s in (0 : ℝ)..1, lagHalf 1 s ^ 2 * Real.exp (-s)) =
      5 / 4 - (13 / 4) * Real.exp (-1) := by
  have hi : IntervalIntegrable (fun s : ℝ => (1 / 2 - s) ^ 2 * Real.exp (-s)) volume 0 1 :=
    (by fun_prop : Continuous (fun s : ℝ => (1 / 2 - s) ^ 2 * Real.exp (-s))).intervalIntegrable _ _
  have hf := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun s _ => profileCellPrimitive_deriv s) hi
  simp only [lagHalf_one]
  rw [hf]
  simp only [profileCellPrimitive, Real.exp_zero, mul_one]
  ring

/-- A two-sided enclosure of width `2 · 10⁻¹²`, checked in the Lean kernel. -/
theorem profile_first_gaussian_cell_enclosure :
    (54391816192 / 1000000000000 : ℝ) ≤
      (∫ s in (0 : ℝ)..1, lagHalf 1 s ^ 2 * Real.exp (-s)) ∧
    (∫ s in (0 : ℝ)..1, lagHalf 1 s ^ 2 * Real.exp (-s)) ≤
      (54391816194 / 1000000000000 : ℝ) := by
  have hlo : (36787944117144 / 100000000000000 : ℝ) ≤ Real.exp (-1) := by
    leancert (trust := kernel)
  have hhi : Real.exp (-1) ≤ (36787944117145 / 100000000000000 : ℝ) := by
    leancert (trust := kernel)
  rw [profile_first_gaussian_cell_exact]
  constructor <;> linarith

end
end Grothe.UpperChaos
