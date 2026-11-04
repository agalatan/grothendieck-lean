import Grothe.UpperChaos.F0ConditionalEvaluator
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-!
# Source interval to canonical Gaussian shift

The bounds concern the actual physical profile, with a positive lower bound
on its absolute scale. Squared rational endpoint checks avoid a numerical
square-root oracle. No phase value at zero is differentiated or divided by.

Agent-ID: codex-aa04. Refs #21.
-/

namespace Grothe.UpperChaos.F0ConditionalEvaluator

theorem profileScale_eq_abs_scaled_profile (s : ℝ) :
    profileScale s = |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s| := by
  rw [abs_mul, abs_of_nonneg (Real.sqrt_nonneg _)]
  rfl

/-- The squared shift identity holds algebraically even at a profile zero;
using it for Gaussian coefficient reconstruction still requires nonzero scale. -/
theorem profileShift_sq (s : ℝ) (hs : 0 ≤ s) :
    profileShift s ^ 2 = s / ((1 + (Upper.aQ : ℝ) ^ 2) * vprof s ^ 2) := by
  rw [profileShift, div_pow, Real.sq_sqrt hs, profileScale, mul_pow,
    Real.sq_sqrt (by positivity), sq_abs]

/-- Positive absolute-profile bounds and squared endpoint checks enclose the
actual shift. The profile itself can have either sign. -/
theorem profileShift_mem_of_squared_bounds
    (s sLo sHi bLo bHi aLo aHi : ℝ)
    (hs : 0 ≤ s) (hsLo : sLo ≤ s) (hsHi : s ≤ sHi)
    (hbLo : 0 < bLo) (hbLower : bLo ≤ profileScale s)
    (hbUpper : profileScale s ≤ bHi)
    (haLo : 0 ≤ aLo) (haHi : 0 ≤ aHi)
    (hLower : (aLo * bHi) ^ 2 ≤ sLo)
    (hUpper : sHi ≤ (aHi * bLo) ^ 2) :
    vprof s ≠ 0 ∧ aLo ≤ profileShift s ∧ profileShift s ≤ aHi := by
  have hb : 0 < profileScale s := hbLo.trans_le hbLower
  have hv : vprof s ≠ 0 := by
    intro hzero
    have hz : profileScale s = 0 := by simp only [profileScale, hzero, abs_zero, mul_zero]
    exact hb.ne' hz
  have hbHi : 0 ≤ bHi := hb.le.trans hbUpper
  have hLowerSqrt : aLo * bHi ≤ Real.sqrt s :=
    (Real.le_sqrt (mul_nonneg haLo hbHi) hs).mpr (hLower.trans hsLo)
  have hUpperSqrt : Real.sqrt s ≤ aHi * bLo :=
    Real.sqrt_le_iff.mpr ⟨mul_nonneg haHi hbLo.le, hsHi.trans hUpper⟩
  refine ⟨hv, ?_, ?_⟩
  · change aLo ≤ Real.sqrt s / profileScale s
    apply (le_div_iff₀ hb).mpr
    exact (mul_le_mul_of_nonneg_left hbUpper haLo).trans hLowerSqrt
  · change Real.sqrt s / profileScale s ≤ aHi
    apply (div_le_iff₀ hb).mpr
    exact hUpperSqrt.trans (mul_le_mul_of_nonneg_left hbLower haHi)

/-- A certified endpoint interval transports to a chosen midpoint without
assuming that the midpoint equals the physical parameter. -/
theorem profileShift_midpoint_error
    (s aLo aHi midpoint radius : ℝ)
    (haLo : aLo ≤ profileShift s) (haHi : profileShift s ≤ aHi)
    (hLo : midpoint - radius ≤ aLo) (hHi : aHi ≤ midpoint + radius) :
    |profileShift s - midpoint| ≤ radius := by
  apply abs_le.mpr
  constructor <;> linarith

end Grothe.UpperChaos.F0ConditionalEvaluator

/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.profileShift_mem_of_squared_bounds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.profileShift_mem_of_squared_bounds
/-- info: 'Grothe.UpperChaos.F0ConditionalEvaluator.profileShift_midpoint_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.F0ConditionalEvaluator.profileShift_midpoint_error
