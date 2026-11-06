import Grothe.UpperChaos.TaylorRootWindow
import Grothe.UpperChaos.Q0NearZeroProfileIntervals

/-!
# Concrete Taylor-source bounds on the three root windows

The windows use the endpoints of the actual source-panel blocks 102–318, 521–720 and
933–1118. Their existing centered interval certificates bound the scaled profile throughout
each interval. Every Taylor power consequently has residual radius at most `5 / (9 * 10^20)`
there, including at the profile zeros, with the same bound for every finite coefficient vector.

Agent-ID: codex-2f3d. Refs #334, #41.
-/

namespace Grothe.UpperChaos.TaylorRootWindow

open Q0NearZeroSourceProfile Q0SourceProfileRatio
open ZeroProfilePhaseStability

set_option maxRecDepth 8192

noncomputable section

/-- The three closed windows, with endpoints from the committed source-panel list. -/
def nearZeroWindows : Set ℝ :=
  Set.Icc (block0.lo : ℝ) block0.hi ∪ Set.Icc (block1.lo : ℝ) block1.hi ∪
    Set.Icc (block2.lo : ℝ) block2.hi

theorem measurableSet_nearZeroWindows : MeasurableSet nearZeroWindows :=
  (measurableSet_Icc.union measurableSet_Icc).union measurableSet_Icc

/-- All three whole windows lie above squared radius 13. -/
theorem nearZeroWindows_ge_thirteen (s : ℝ) (hs : s ∈ nearZeroWindows) : 13 ≤ s := by
  rcases hs with (hs | hs) | hs
  · have hq : (13 : ℚ) ≤ block0.lo := block_starts.1
    have hr : (13 : ℝ) ≤ (block0.lo : ℝ) := by exact_mod_cast hq
    exact hr.trans hs.1
  · have hq : (13 : ℚ) ≤ block1.lo := block_starts.2.1
    have hr : (13 : ℝ) ≤ (block1.lo : ℝ) := by exact_mod_cast hq
    exact hr.trans hs.1
  · have hq : (13 : ℚ) ≤ block2.lo := block_starts.2.2
    have hr : (13 : ℝ) ≤ (block2.lo : ℝ) := by exact_mod_cast hq
    exact hr.trans hs.1

/-- The checked profile bound holds at every point of the windows, not only at Gauss nodes. -/
theorem nearZeroWindows_profile_le (s : ℝ) (hs : s ∈ nearZeroWindows) :
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s| ≤ 1 / 10 ^ 10 := by
  have h : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s| ≤ (profileBound : ℝ) := by
    rcases hs with (hs | hs) | hs
    · exact row_scaled_profile_abs_le block0 s profileBound hs.1 hs.2 block0_checked
    · exact row_scaled_profile_abs_le block1 s profileBound hs.1 hs.2 block1_checked
    · exact row_scaled_profile_abs_le block2 s profileBound hs.1 hs.2 block2_checked
  simpa only [profileBound, Rat.cast_div, Rat.cast_one, Rat.cast_pow, Rat.cast_ofNat] using h

/-- The physical signed ratio is uniformly small on the three certified windows. -/
theorem nearZeroWindows_ratio_le (s : ℝ) (hs : s ∈ nearZeroWindows) :
    |signedProfileRatio s| ≤ 1 / (3 * 10 ^ 10) := by
  have h := ratio_abs_le_of_scaled_profile s (1 / 10 ^ 10)
    (nearZeroWindows_ge_thirteen s hs) (nearZeroWindows_profile_le s hs)
  convert h using 1
  norm_num

/-- The quadratic radius is a concrete constant on the whole windows. -/
theorem nearZeroWindows_radius_le (s : ℝ) (hs : s ∈ nearZeroWindows) :
    5 * signedProfileRatio s ^ 2 ≤ 5 / (9 * 10 ^ 20) := by
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / (3 * 10 ^ 10) : ℝ) ^ 2 := by
    rw [← sq_abs]
    exact pow_le_pow_left₀ (abs_nonneg _) (nearZeroWindows_ratio_le s hs) 2
  calc
    _ ≤ 5 * (1 / (3 * 10 ^ 10) : ℝ) ^ 2 :=
      mul_le_mul_of_nonneg_left hsq (by norm_num)
    _ = _ := by norm_num

/-- Every actual Taylor source has the certified residual radius on the whole windows. -/
theorem norm_residualLp_nearZero_le (j : ℕ) (s : ℝ) (hs : s ∈ nearZeroWindows) :
    ‖residualLp j s‖ ≤ 5 / (9 * 10 ^ 20) := by
  have hs0 : 0 < s := by linarith [nearZeroWindows_ge_thirteen s hs]
  exact (norm_residualLp_le j s hs0).trans (nearZeroWindows_radius_le s hs)

/-- Every finite conditional coefficient vector has the same certified radius, for all powers. -/
theorem coefficient_error_nearZero_sq_le (j : ℕ) (s : ℝ) (hs : s ∈ nearZeroWindows)
    (S : Finset (ℕ × ℕ)) :
    ∑ i ∈ S, ‖coefficient j s i - modelCoefficient j s i‖ ^ 2 ≤
      (5 / (9 * 10 ^ 20) : ℝ) ^ 2 := by
  have hs0 : 0 < s := by linarith [nearZeroWindows_ge_thirteen s hs]
  exact (coefficient_error_sq_le j s hs0 S).trans
    (pow_le_pow_left₀ (by positivity) (nearZeroWindows_radius_le s hs) 2)


end

end Grothe.UpperChaos.TaylorRootWindow

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound,
    `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  for target in #[``Grothe.UpperChaos.TaylorRootWindow.nearZeroWindows_profile_le,
      ``Grothe.UpperChaos.TaylorRootWindow.norm_residualLp_nearZero_le,
      ``Grothe.UpperChaos.TaylorRootWindow.coefficient_error_nearZero_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
