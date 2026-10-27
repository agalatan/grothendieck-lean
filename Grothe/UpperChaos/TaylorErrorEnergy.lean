import Grothe.UpperChaos.ComparisonPieces
import Grothe.UpperChaos.ConcretePhaseMoments

/-!
# Taylor approximation error from one inner product

The exact phase moment supplies the total energy of a positive Taylor source.
Its distance to an approximant therefore needs only the approximant's squared
norm and one real inner product. A band on which the approximant vanishes is
bounded by this whole approximation error. Numerical inner-product enclosures
remain hypotheses; no integration certificate is asserted here.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The exact total approximation error, with the moment evaluated on the production phase. -/
theorem norm_hpow_sub_sq {j : ℕ} (hj : 0 < j) (c : Lp ℂ 2 mu2) :
    ‖(chargeFn_hpow phiBound j).memLp.toLp (hpow j) - c‖ ^ 2 =
      (phaseMomentValue j : ℝ) -
        2 * Complex.re ⟪c, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ +
        ‖c‖ ^ 2 := by
  rw [norm_sub_sq (𝕜 := ℂ), norm_hpow_toLp_sq_eq hj, integral_phiT_pow_even,
    inner_re_symm (𝕜 := ℂ) _ c]

/-- Bounds on the total moment, approximant norm and one inner product control the error. -/
theorem norm_hpow_sub_sq_le {j : ℕ} (hj : 0 < j) (c : Lp ℂ 2 mu2)
    {M C I : ℝ} (hM : (phaseMomentValue j : ℝ) ≤ M) (hC : ‖c‖ ^ 2 ≤ C)
    (hI : I ≤ Complex.re ⟪c, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ) :
    ‖(chargeFn_hpow phiBound j).memLp.toLp (hpow j) - c‖ ^ 2 ≤ M - 2 * I + C := by
  rw [norm_hpow_sub_sq hj]
  linarith

/-- An uncaptured band is bounded by the whole Taylor approximation error. -/
theorem norm_band_hpow_sq_le_of_inner {j : ℕ} (hj : 0 < j)
    (b : GrotheKernel.ComparisonBand) (c : Lp ℂ 2 mu2)
    (hc : bandProj b c = 0) {M C I : ℝ}
    (hM : (phaseMomentValue j : ℝ) ≤ M) (hC : ‖c‖ ^ 2 ≤ C)
    (hI : I ≤ Complex.re ⟪c, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ) :
    ‖bandProj b ((chargeFn_hpow phiBound j).memLp.toLp (hpow j))‖ ^ 2 ≤
      M - 2 * I + C := by
  have he : bandProj b ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - c) =
      bandProj b ((chargeFn_hpow phiBound j).memLp.toLp (hpow j)) := by
    rw [map_sub, hc, sub_zero]
  have hn := (modeSpace (bandModes b)).norm_starProjection_apply_le
    ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - c)
  change ‖bandProj b ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - c)‖ ≤ _ at hn
  rw [he] at hn
  exact (pow_le_pow_left₀ (norm_nonneg _) hn 2).trans (norm_hpow_sub_sq_le hj c hM hC hI)

end

end Grothe.UpperChaos
