import Grothe.UpperChaos.ChargeBandParseval

/-! A global L² approximation error is charged once per band, rather than once
per coefficient. The approximation and finite coefficient bounds are explicit
hypotheses; this module does not establish the numerical bounds.

Agent-ID: codex-2ca4
-/
open MeasureTheory
namespace Grothe.UpperChaos
noncomputable section

theorem norm_band_error_le_shared_approx (B : Set Idx2)
    (F Y C : Lp ℂ 2 mu2) (ε δ : ℝ)
    (happrox : ‖F - Y‖ ≤ ε) (hfinite : ‖projOn B (Y - C)‖ ≤ δ) :
    ‖projOn B (F - C)‖ ≤ ε + δ := by
  have hcontract : ‖projOn B (F - Y)‖ ≤ ‖F - Y‖ := by
    exact (modeSpace B).norm_starProjection_apply_le (F - Y)
  have hid : F - C = (F - Y) + (Y - C) := by abel
  rw [hid, map_add]
  exact (norm_add_le _ _).trans (add_le_add (hcontract.trans happrox) hfinite)

end
end Grothe.UpperChaos

namespace Grothe.UpperChaos
noncomputable section
open scoped InnerProductSpace

/-- An L² approximation and a finite coefficient-energy bound imply the
band estimate. All numerical and charge-one premises remain explicit. -/
theorem norm_band_error_le_shared_coefficients (B : Set Idx2)
    [DecidablePred (· ∈ B)] (N : ℕ) (F Y C : Lp ℂ 2 mu2) (ε δ : ℝ)
    (happrox : ‖F - Y‖ ≤ ε) (hδ : 0 ≤ δ)
    (hcharge : ChargeOne (Y - C))
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hsum : (∑ i ∈ (gradedSupport N).filter (· ∈ B),
      ‖⟪hvec2 i, Y - C⟫_ℂ‖ ^ 2) ≤ δ ^ 2) :
    ‖projOn B (F - C)‖ ≤ ε + δ := by
  apply norm_band_error_le_shared_approx B F Y C ε δ happrox
  have hs := norm_projOn_chargeOne_sq_coefficients B N (Y - C) hcharge hdegree
  have hnonneg := norm_nonneg (projOn B (Y - C))
  rw [← hs] at hsum
  nlinarith

end
end Grothe.UpperChaos
