import Grothe.UpperChaos.ProfileRootScreen
import LeanCert.Core.IntervalRat.Basic

/-!
# Rational enclosure of the Gaussian normalization

The existing certified bounds for the square root of pi give reciprocal
endpoints for the normalization of retained Gaussian integrals. Multiplying
an integral enclosure by this interval accounts for normalization without
introducing a separate analytic error allowance.

Agent-ID: codex-2ca4
-/

open LeanCert.Core

namespace Grothe.UpperChaos.GaussianNormalizationInterval

private theorem sqrtPiLo_pos : 0 < ProfileRootScreen.sqrtPiLo := by
  norm_num [ProfileRootScreen.sqrtPiLo]

private theorem sqrtPiLo_le_sqrtPiHi :
    ProfileRootScreen.sqrtPiLo ≤ ProfileRootScreen.sqrtPiHi :=
  Rat.cast_le.mp (ProfileRootScreen.sqrtPi_real_bounds.1.trans
    ProfileRootScreen.sqrtPi_real_bounds.2)

/-- Reciprocal endpoints of the existing certified square-root interval. -/
def normalization : IntervalRat where
  lo := ProfileRootScreen.sqrtPiHi⁻¹
  hi := ProfileRootScreen.sqrtPiLo⁻¹
  le := inv_anti₀ sqrtPiLo_pos sqrtPiLo_le_sqrtPiHi

private theorem reciprocal_bounds {lo x hi : ℝ}
    (hlo : 0 < lo) (hlx : lo ≤ x) (hxh : x ≤ hi) :
    hi⁻¹ ≤ x⁻¹ ∧ x⁻¹ ≤ lo⁻¹ :=
  ⟨inv_anti₀ (hlo.trans_le hlx) hxh, inv_anti₀ hlo hlx⟩

/-- The actual Gaussian normalization belongs to the rational interval. -/
theorem normalization_mem : (Real.sqrt Real.pi)⁻¹ ∈ normalization := by
  have hlo : (0 : ℝ) < (ProfileRootScreen.sqrtPiLo : ℝ) :=
    Rat.cast_pos.mpr sqrtPiLo_pos
  have h := reciprocal_bounds hlo ProfileRootScreen.sqrtPi_real_bounds.1
    ProfileRootScreen.sqrtPi_real_bounds.2
  simpa only [IntervalRat.mem_def, normalization, Rat.cast_inv] using h

/-- Normalize any certified real integral by interval multiplication. -/
theorem normalized_mem {x : ℝ} {I : IntervalRat} (hx : x ∈ I) :
    (Real.sqrt Real.pi)⁻¹ * x ∈ IntervalRat.mul normalization I :=
  IntervalRat.mem_mul normalization_mem hx

end Grothe.UpperChaos.GaussianNormalizationInterval
