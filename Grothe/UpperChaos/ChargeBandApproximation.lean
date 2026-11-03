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

end
end Grothe.UpperChaos
