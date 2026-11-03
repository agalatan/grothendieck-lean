import Grothe.UpperChaos.OriginalHSQuadraticForms
import Grothe.UpperChaos.OriginalHSFirstPowerParameters

/-!
# Physical quadratic forms from any checked original gate

Agent-ID: codex-2ca4. Successor proof source; not yet compiled.

The twelve recovered first-power gates are not members of the later 52-gate
table. Consume their actual Boolean certificates instead of asserting membership
in that different table. Definitions of the physical rates stay shared.
-/

namespace Grothe.UpperChaos.OriginalHSCheckedForms

open OriginalHSCovariance OriginalHSParameterGates OriginalHSParameterSoundness
open OriginalHSQuadraticForms

noncomputable section

theorem radial_pos_of_checked (g : Gate) (h : gateOK g = true) :
    0 < (g.r : ℝ) := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
  exact_mod_cast h.1.1.1

theorem axisWeight_pos_of_checked (g : Gate) (h : gateOK g = true) (i : ℕ) :
    0 < axisWeight g i := by
  have ht : 1 < (g.t : ℝ) := by
    simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
    exact_mod_cast h.1.1.2.2.1
  unfold axisWeight
  split
  · exact lt_trans zero_lt_one ht
  · exact zero_lt_one

/-- The same scalar checker controls either physical coordinate pair. -/
theorem pair_positive_of_checked (g : Gate) (h : gateOK g = true) (side : Fin 2) :
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

theorem leadingRate_pos_of_checked (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    0 < leadingRate g side :=
  (pair_positive_of_checked g h side).blockMinor

theorem determinant_pos_of_checked (g : Gate) (h : gateOK g = true)
    (side : Fin 2) :
    0 < leadingRate g side * trailingRate g side - crossRate g side ^ 2 := by
  have hRQ : 0 ≤ (g.r : ℝ) * axisWeight g (2 * side.val + 1) :=
    (mul_pos (radial_pos_of_checked g h) (axisWeight_pos_of_checked g h _)).le
  dsimp only [leadingRate, trailingRate, crossRate]
  rw [actual_block_det _ _ _ _ _ hRQ]
  exact (pair_positive_of_checked g h side).determinant

theorem schurRate_pos_of_checked (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    0 < trailingRate g side - crossRate g side ^ 2 / leadingRate g side :=
  schur_complement_pos _ _ _ (leadingRate_pos_of_checked g h side)
    (determinant_pos_of_checked g h side)

theorem quadratic_positive_of_checked (g : Gate) (h : gateOK g = true)
    (side : Fin 2) (x y : ℝ) (hxy : x ≠ 0 ∨ y ≠ 0) :
    0 < leadingRate g side * x ^ 2 + 2 * crossRate g side * x * y +
      trailingRate g side * y ^ 2 :=
  quadratic_pos _ _ _ x y (leadingRate_pos_of_checked g h side)
    (determinant_pos_of_checked g h side) hxy

/-- Every recovered D=51,101,151 first-power certificate controls both pairs. -/
theorem first_power_pair_positive (g : Gate)
    (hg : g ∈ OriginalHSFirstPowerParameters.firstGates) (side : Fin 2) :
    CovariancePositive (damping g.power) (nu g.power) (g.r : ℝ)
      (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) :=
  pair_positive_of_checked g
    (OriginalHSFirstPowerParameters.gate_checked_of_mem g hg) side

theorem first_power_schurRate_pos (g : Gate)
    (hg : g ∈ OriginalHSFirstPowerParameters.firstGates) (side : Fin 2) :
    0 < trailingRate g side - crossRate g side ^ 2 / leadingRate g side :=
  schurRate_pos_of_checked g
    (OriginalHSFirstPowerParameters.gate_checked_of_mem g hg) side

theorem first_power_quadratic_positive (g : Gate)
    (hg : g ∈ OriginalHSFirstPowerParameters.firstGates)
    (side : Fin 2) (x y : ℝ) (hxy : x ≠ 0 ∨ y ≠ 0) :
    0 < leadingRate g side * x ^ 2 + 2 * crossRate g side * x * y +
      trailingRate g side * y ^ 2 :=
  quadratic_positive_of_checked g
    (OriginalHSFirstPowerParameters.gate_checked_of_mem g hg) side x y hxy

end
end Grothe.UpperChaos.OriginalHSCheckedForms
