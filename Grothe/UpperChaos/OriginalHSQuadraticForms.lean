import Grothe.UpperChaos.OriginalHSParameterSoundness
import Mathlib.Tactic.FinCases

/-!
# Positive quadratic forms for every original weighted Gaussian gate

The two physical coordinate pairs use the original rational weights, with the
single enlarged input weight in its recorded coordinate. The conclusions below
supply the actual leading and Schur rates required by Gaussian integration.
They do not assume an integral or a Hilbert–Schmidt mass estimate.

Agent-ID: codex-2ca4.
-/

namespace Grothe.UpperChaos.OriginalHSQuadraticForms

open OriginalHSCovariance OriginalHSParameterGates OriginalHSParameterSoundness

noncomputable section

/-- A coordinate receives the enlarged weight exactly when the certificate says so. -/
def axisWeight (g : Gate) (i : ℕ) : ℝ :=
  if g.coordinate = i then (g.t : ℝ) else 1

/-- First diagonal entry of the actual two-variable quadratic form. -/
def leadingRate (g : Gate) (side : Fin 2) : ℝ :=
  1 - damping g.power ^ 2 * (g.r : ℝ) ^ 2 -
    nu g.power ^ 2 * (g.r : ℝ) * axisWeight g (2 * side.val)

/-- The cross coefficient includes the original square-root scaling. -/
def crossRate (g : Gate) (side : Fin 2) : ℝ :=
  damping g.power * nu g.power *
    Real.sqrt ((g.r : ℝ) * axisWeight g (2 * side.val + 1)) *
      ((g.r : ℝ) + axisWeight g (2 * side.val))

/-- Second diagonal entry of the actual two-variable quadratic form. -/
def trailingRate (g : Gate) (side : Fin 2) : ℝ :=
  1 - nu g.power ^ 2 * (g.r : ℝ) * axisWeight g (2 * side.val + 1) -
    damping g.power ^ 2 * axisWeight g (2 * side.val) *
      axisWeight g (2 * side.val + 1)

theorem radial_pos (g : Gate) (hg : g ∈ gates) : 0 < (g.r : ℝ) := by
  have h := gate_checked_of_mem g hg
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
  exact_mod_cast h.1.1.1

theorem enlarged_weight_gt_one (g : Gate) (hg : g ∈ gates) : 1 < (g.t : ℝ) := by
  have h := gate_checked_of_mem g hg
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
  exact_mod_cast h.1.1.2.2.1

theorem axisWeight_pos (g : Gate) (hg : g ∈ gates) (i : ℕ) :
    0 < axisWeight g i := by
  unfold axisWeight
  split
  · exact lt_trans zero_lt_one (enlarged_weight_gt_one g hg)
  · exact zero_lt_one

/-- Both coordinate pairs inherit the checked covariance inequalities. -/
theorem pair_positive (g : Gate) (hg : g ∈ gates) (side : Fin 2) :
    CovariancePositive (damping g.power) (nu g.power) (g.r : ℝ)
      (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) := by
  fin_cases side
  · simpa only [axisWeight, Fin.val_zero, mul_zero, zero_add] using
      first_pair_positive g hg
  · simpa only [axisWeight, Fin.val_one, mul_one, Nat.reduceAdd] using
      second_pair_positive g hg

theorem leadingRate_pos (g : Gate) (hg : g ∈ gates) (side : Fin 2) :
    0 < leadingRate g side :=
  (pair_positive g hg side).blockMinor

/-- The radicand is positive for every certified physical pair. -/
theorem radicand_pos (g : Gate) (hg : g ∈ gates) (side : Fin 2) :
    0 < (g.r : ℝ) * axisWeight g (2 * side.val + 1) :=
  mul_pos (radial_pos g hg) (axisWeight_pos g hg _)

theorem determinant_pos (g : Gate) (hg : g ∈ gates) (side : Fin 2) :
    0 < leadingRate g side * trailingRate g side - crossRate g side ^ 2 := by
  dsimp only [leadingRate, trailingRate, crossRate]
  rw [actual_block_det _ _ _ _ _ (radicand_pos g hg side).le]
  exact (pair_positive g hg side).determinant

/-- This is the actual remainder rate after integrating the first coordinate. -/
theorem schurRate_pos (g : Gate) (hg : g ∈ gates) (side : Fin 2) :
    0 < trailingRate g side - crossRate g side ^ 2 / leadingRate g side :=
  schur_complement_pos _ _ _ (leadingRate_pos g hg side) (determinant_pos g hg side)

/-- Every original gate gives a positive form on every nonzero real vector. -/
theorem quadratic_positive (g : Gate) (hg : g ∈ gates) (side : Fin 2)
    (x y : ℝ) (hxy : x ≠ 0 ∨ y ≠ 0) :
    0 < leadingRate g side * x ^ 2 + 2 * crossRate g side * x * y +
      trailingRate g side * y ^ 2 :=
  quadratic_pos _ _ _ x y (leadingRate_pos g hg side) (determinant_pos g hg side) hxy

end
end Grothe.UpperChaos.OriginalHSQuadraticForms
