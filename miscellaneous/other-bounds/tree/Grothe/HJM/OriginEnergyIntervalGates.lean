import Grothe.HJM.OriginEnergyPolynomialRange
import Mathlib.Data.Nat.Sqrt

/-!
# Positive inverse and square-root gates for origin-energy intervals

Agent-ID: codex-aa04.

The executable gates return `none` on failure. The square-root gate checks
integer witnesses explicitly, so its soundness does not assume the accuracy
of an external numerical root. These generic lemmas make no claim that any
particular origin-energy mesh passes the gates or that any numerical energy
bound has been certified.
-/

namespace Grothe.HJM.OriginEnergyIntervalGates

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper
open Grothe.UpperChaos.HardyArcSound Grothe.HJM.OriginEnergyPolynomialRange

/-- A reciprocal is returned only for a strictly positive interval. -/
def inverseChecked (I : Ival) : Option Ival :=
  if 0 < I.lo then some (invPosI I) else none

/-- Integer witness inequalities for a square-root enclosure, with D the
existing fixed-point scale. -/
def sqrtWitnessOK (I J : Ival) : Bool :=
  decide (0 ≤ I.lo ∧ 0 ≤ J.lo ∧ 0 ≤ J.hi ∧
    J.lo ^ 2 ≤ I.lo * D ∧ I.hi * D ≤ J.hi ^ 2)

/-- The two endpoints are computed with integer square roots and are returned
only after the exact witness inequalities have been checked. -/
def sqrtChecked (I : Ival) : Option Ival :=
  if 0 ≤ I.lo ∧ 0 ≤ I.hi then
    let J : Ival := ⟨Int.ofNat (Nat.sqrt ((I.lo * D).toNat)),
      Int.ofNat (Nat.sqrt ((I.hi * D).toNat)) + 1⟩
    if sqrtWitnessOK I J = true then some J else none
  else none

/-- A successful reciprocal gate proves both positivity and membership. -/
theorem inverseChecked_sound {x : ℝ} {I J : Ival} (hx : mem x I)
    (h : inverseChecked I = some J) : 0 < x ∧ mem x⁻¹ J := by
  unfold inverseChecked at h
  split_ifs at h with hpos
  · have hJ : invPosI I = J := Option.some.inj h
    have hp : posI I = true := by simpa only [posI, decide_eq_true_eq] using hpos
    subst J
    exact ⟨pos_of_posI hx hp, mem_invPosI hx hp⟩

/-- The exact integer inequalities imply that the checked interval contains
`Real.sqrt x` for every x in the original interval. -/
theorem mem_sqrt_of_witness {x : ℝ} {I J : Ival} (hx : mem x I)
    (hcheck : sqrtWitnessOK I J = true) : mem (Real.sqrt x) J := by
  have h : 0 ≤ I.lo ∧ 0 ≤ J.lo ∧ 0 ≤ J.hi ∧
      J.lo ^ 2 ≤ I.lo * D ∧ I.hi * D ≤ J.hi ^ 2 := by
    simpa only [sqrtWitnessOK, decide_eq_true_eq] using hcheck
  have hI : (0 : ℝ) ≤ I.lo := by exact_mod_cast h.1
  have hJlo : (0 : ℝ) ≤ J.lo := by exact_mod_cast h.2.1
  have hJhi : (0 : ℝ) ≤ J.hi := by exact_mod_cast h.2.2.1
  have hx0 : 0 ≤ x := (mul_nonneg_iff_of_pos_right D_pos).mp (hI.trans hx.1)
  have hL : (J.lo : ℝ) ^ 2 ≤ x * (D : ℝ) ^ 2 := by
    calc
      _ ≤ (I.lo : ℝ) * D := by exact_mod_cast h.2.2.2.1
      _ ≤ (x * D) * D := mul_le_mul_of_nonneg_right hx.1 D_pos.le
      _ = _ := by ring
  have hU : x * (D : ℝ) ^ 2 ≤ (J.hi : ℝ) ^ 2 := by
    calc
      _ = (x * D) * D := by ring
      _ ≤ (I.hi : ℝ) * D := mul_le_mul_of_nonneg_right hx.2 D_pos.le
      _ ≤ _ := by exact_mod_cast h.2.2.2.2
  have hroot : 0 ≤ Real.sqrt x * (D : ℝ) := mul_nonneg (Real.sqrt_nonneg _) D_pos.le
  have hsq : (Real.sqrt x * (D : ℝ)) ^ 2 = x * (D : ℝ) ^ 2 := by
    rw [mul_pow, Real.sq_sqrt hx0]
  constructor <;> nlinarith

/-- A successful executable root gate carries its own witness proof. -/
theorem sqrtChecked_sound {x : ℝ} {I J : Ival} (hx : mem x I)
    (h : sqrtChecked I = some J) : mem (Real.sqrt x) J := by
  unfold sqrtChecked at h
  dsimp only at h
  split_ifs at h with hinput htest
  have hJ : (⟨Int.ofNat (Nat.sqrt ((I.lo * D).toNat)),
      Int.ofNat (Nat.sqrt ((I.hi * D).toNat)) + 1⟩ : Ival) = J := Option.some.inj h
  subst J
  exact mem_sqrt_of_witness hx htest

/-- A successful root gate for an enclosed squared modulus contains the
actual modulus. -/
theorem sqrtChecked_norm {z : ℂ} {I J : Ival}
    (hz : mem (Complex.normSq z) I) (h : sqrtChecked I = some J) : mem ‖z‖ J := by
  have hroot := sqrtChecked_sound hz h
  simpa only [Complex.normSq_eq_norm_sq, Real.sqrt_sq (norm_nonneg z)] using hroot

/-- The squared-modulus interval from the staged numerator-range module may
be fed directly to the checked root. -/
theorem sqrtChecked_complex {z : ℂ} {Z : CI} {J : Ival}
    (hz : memC z Z) (h : sqrtChecked (normSqI Z) = some J) : mem ‖z‖ J :=
  sqrtChecked_norm (mem_normSqI hz) h

/-- A successful inverse gate on squared modulus proves that the phase is
well-defined at the actual complex input. -/
theorem nonzero_of_inverse_normSq {z : ℂ} {I J : Ival}
    (hz : mem (Complex.normSq z) I) (h : inverseChecked I = some J) : z ≠ 0 := by
  have hpos := (inverseChecked_sound hz h).1
  intro hz0
  subst z
  simp at hpos

end Grothe.HJM.OriginEnergyIntervalGates
