import Grothe.UpperChaos.OriginalHSParameterSoundness
import Mathlib.Tactic.FinCases

/-!
# Physical quadratic forms from a checked parameter gate

The single certificate premise `gateOK g = true` supplies the leading-pivot
and determinant inequalities for both physical coordinate pairs. The
coordinate weights and all quadratic coefficients are defined explicitly;
no membership in a particular parameter table is needed.

These forms control the subsequently defined Gaussian kernels. Their
identification with the historical operator `HS_{j,I}` remains a separate
obligation; no integral or Hilbert--Schmidt estimate is assumed here.

Agent-ID: codex-2ca4.
-/

namespace Grothe.UpperChaos.OriginalHSQuadraticForms

open OriginalHSCovariance OriginalHSParameterGates OriginalHSParameterSoundness

noncomputable section

/-- A coordinate receives the enlarged weight exactly when the certificate says so. -/
def axisWeight (g : Gate) (i : ℕ) : ℝ :=
  if g.coordinate = i then (g.t : ℝ) else 1

/-- First diagonal entry of the defined two-variable quadratic form. -/
def leadingRate (g : Gate) (side : Fin 2) : ℝ :=
  1 - damping g.power ^ 2 * (g.r : ℝ) ^ 2 -
    nu g.power ^ 2 * (g.r : ℝ) * axisWeight g (2 * side.val)

/-- The cross coefficient includes the original square-root scaling. -/
def crossRate (g : Gate) (side : Fin 2) : ℝ :=
  damping g.power * nu g.power *
    Real.sqrt ((g.r : ℝ) * axisWeight g (2 * side.val + 1)) *
      ((g.r : ℝ) + axisWeight g (2 * side.val))

/-- Second diagonal entry of the defined two-variable quadratic form. -/
def trailingRate (g : Gate) (side : Fin 2) : ℝ :=
  1 - nu g.power ^ 2 * (g.r : ℝ) * axisWeight g (2 * side.val + 1) -
    damping g.power ^ 2 * axisWeight g (2 * side.val) *
      axisWeight g (2 * side.val + 1)

theorem radial_pos (g : Gate) (h : gateOK g = true) : 0 < (g.r : ℝ) := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
  exact_mod_cast h.1.1.1

theorem enlarged_weight_gt_one (g : Gate) (h : gateOK g = true) : 1 < (g.t : ℝ) := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
  exact_mod_cast h.1.1.2.2.1

theorem axisWeight_pos (g : Gate) (h : gateOK g = true) (i : ℕ) :
    0 < axisWeight g i := by
  unfold axisWeight
  split
  · exact lt_trans zero_lt_one (enlarged_weight_gt_one g h)
  · exact zero_lt_one

/-- Both coordinate pairs inherit the checked covariance inequalities. -/
theorem pair_positive (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    CovariancePositive (damping g.power) (nu g.power) (g.r : ℝ)
      (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) := by
  simp only [gateOK, Bool.and_eq_true] at h
  fin_cases side
  · simpa only [axisWeight, Fin.val_zero, mul_zero, zero_add,
      apply_ite, Rat.cast_one] using
      covarianceGate_sound g.power g.r
        (if g.coordinate = 0 then g.t else 1)
        (if g.coordinate = 1 then g.t else 1) h.1.2
  · simpa only [axisWeight, Fin.val_one, mul_one, Nat.reduceAdd,
      apply_ite, Rat.cast_one] using
      covarianceGate_sound g.power g.r
        (if g.coordinate = 2 then g.t else 1)
        (if g.coordinate = 3 then g.t else 1) h.2

theorem leadingRate_pos (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    0 < leadingRate g side :=
  (pair_positive g h side).blockMinor

/-- The radicand is positive for every certified physical pair. -/
theorem radicand_pos (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    0 < (g.r : ℝ) * axisWeight g (2 * side.val + 1) :=
  mul_pos (radial_pos g h) (axisWeight_pos g h _)

end
end Grothe.UpperChaos.OriginalHSQuadraticForms
