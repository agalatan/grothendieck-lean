import Grothe.UpperChaos.ProductionRetainedSource
import Grothe.UpperChaos.ProductionF0Head
import Grothe.UpperChaos.OriginalEnergyNoMass
import Grothe.UpperChaos.Q0NodeMassLedgerSharp
import Lean.Util.CollectAxioms

set_option warningAsError true

/-! Consume the actual F0-head approximation, actual frozen correction,
and certified rational smoothing in the existing original energy route.
The source-evaluator certificate and concrete energy-table comparison are
explicit open numerical inputs. Agent-ID: codex-7c2e. -/

open MeasureTheory Grothe.Upper
namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- Derive the actual finite smoothing-input norm from the F0 source
approximation and the actual frozen correction, for any error tolerance. -/
theorem retainedProduction_norm_of_raw_error {δ : ℝ}
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤ δ) :
    ‖gradedHermite 251 (retainedProductionCoeff a0)‖ ≤ (501 / 500 : ℝ) + δ := by
  have ha : ‖gradedHermite 251 a0‖ ≤ 1 + δ := by
    calc
      _ = ‖productionF0Head - (productionF0Head - gradedHermite 251 a0)‖ := by
        rw [sub_sub_cancel]
      _ ≤ ‖productionF0Head‖ + ‖productionF0Head - gradedHermite 251 a0‖ :=
        norm_sub_le _ _
      _ ≤ _ := add_le_add productionF0Head_norm hraw
  rw [retainedProduction_eq]
  have h := (norm_add_le (gradedHermite 251 a0) frozenCorrection).trans
    (add_le_add ha CenterNormBypass.correction_norm)
  linarith

/-- Any actual F0 source tolerance propagates through production smoothing.
No quadrature-mass or independent center-norm premise is needed here. -/
theorem retainedSmoothed_projected_error_of_raw {δ : ℝ}
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤ δ) :
    ‖projOn (energyHeadModes (headIdx 501))
      ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn) - retainedSmoothed a0)‖ ≤
      δ + (4 / 1000000000000000 : ℝ) * ((501 / 500 : ℝ) + δ) := by
  have hs := (selected_smoothing_residual_le a0).trans hraw
  have hn := retainedProduction_norm_of_raw_error a0 hraw
  exact (projected_response_error a0).trans
    (add_le_add hs (mul_le_mul_of_nonneg_left hn (by positivity)))

/-- Propagate arbitrary source, smoothing and same-output table allowances.
The projected error is an L2 norm; the conclusion is selected l1 ENERGY
error. This keeps the numerical ledger separate from the analytic argument. -/
theorem selected_energy_close_of_raw_error {δ Δ ε τ : ℝ}
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤ δ)
    (htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed a0) p - (energyTable p : ℝ)| ≤ ε)
    (hsmoothing : δ + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + δ) ≤ Δ)
    (hbudget : (2 * (501 / 500 : ℝ) + 3 * Δ) * Δ + ε ≤ τ) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ τ := by
  let X := (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
    (Xfun frozenCorrectionFn)
  let Y := retainedSmoothed a0
  let P := projOn (energyHeadModes (headIdx 501))
  have hsmoothing' : δ + (4 / 1000000000000000 : ℝ) *
      ((501 / 500 : ℝ) + δ) ≤ Δ := by
    simpa only [show (10 : ℝ) ^ 15 = 1000000000000000 by norm_num] using hsmoothing
  have hd : ‖P (X - Y)‖ ≤ Δ :=
    (retainedSmoothed_projected_error_of_raw a0 hraw).trans hsmoothing'
  have hX : ‖P X‖ ≤ (501 / 500 : ℝ) :=
    ((modeSpace (energyHeadModes (headIdx 501))).norm_starProjection_apply_le X).trans
      CenterNormBypass.response_norm
  have hd' : ‖P X - P Y‖ ≤ Δ := by simpa only [map_sub] using hd
  have hY : ‖P Y‖ ≤ (501 / 500 : ℝ) + Δ := by
    have hn := norm_sub_le (P X) (P X - P Y)
    simp only [sub_sub_cancel] at hn
    linarith
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501) X Y
    (fun p => (energyTable p : ℝ)) ((501 / 500 : ℝ) + Δ) Δ ε τ hY hd htable
  nlinarith only [hbudget]

/-- The smoothing-vector norm follows from the actual F0 source norm and
its approximation error. It does not follow from quadrature node mass. -/
theorem retainedProduction_norm_le
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤
      (Q0NodeMassLedgerSharp.rawUpper : ℝ)) :
    ‖gradedHermite 251 (retainedProductionCoeff a0)‖ ≤ (26 / 25 : ℝ) := by
  have h := retainedProduction_norm_of_raw_error a0 hraw
  have hcap : (Q0NodeMassLedgerSharp.rawUpper : ℝ) < 48 / 10^13 := by
    have hc : (Q0NodeMassLedgerSharp.rawUpper : ℝ) < ((48 / 10 ^ 13 : ℚ) : ℝ) :=
      Rat.cast_lt.mpr Q0NodeMassLedgerSharp.rawUpper_lt_cap
    simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using hc
  linarith

/-- The checked raw ledger plus the separately controlled smoothing reserve
fits the original full-head approximation budget. -/
theorem retainedSmoothed_projected_error
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤
      (Q0NodeMassLedgerSharp.rawUpper : ℝ)) :
    ‖projOn (energyHeadModes (headIdx 501))
      ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn) - retainedSmoothed a0)‖ ≤
      (3 / 625000000000 : ℝ) := by
  have hraw' := (selected_smoothing_residual_le a0).trans hraw
  have hnorm : ‖gradedHermite 251 (retainedProductionCoeff a0)‖ ≤
      (Q0NodeMassLedgerSharp.normUpper : ℝ) := by
    simpa only [Q0NodeMassLedgerSharp.normUpper, Rat.cast_div, Rat.cast_ofNat] using
      retainedProduction_norm_le a0 hraw
  have h := Q0NodeMassLedgerSharp.real_error_lt_cap hraw' hnorm
    (le_refl ((4 / 10^15 : ℝ) * ‖gradedHermite 251 (retainedProductionCoeff a0)‖))
  apply (projected_response_error a0).trans
  convert h.le using 1 <;> norm_num

/-- Use the existing original-energy theorem for this actual source and
operator. The unproved numerical inputs stay at the evaluator and table
boundaries; no matrix-identification or smoothing premise is assumed. -/
theorem original_energy_of_retained_source
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤
      (Q0NodeMassLedgerSharp.rawUpper : ℝ))
    (htable : (∑ p ∈ headIdx 501,
      |energy (retainedSmoothed a0) p - (energyTable p : ℝ)|) ≤
        (3 / 1000000000000 : ℝ)) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤ (energyErrQ : ℝ) := by
  exact CenterNormBypass.original_energy_without_table_mass (retainedSmoothed a0)
    (retainedSmoothed_projected_error a0 hraw) htable

end
end Grothe.UpperChaos.FixedChaosSmoothing

/-! Imported production proof dependencies are audited explicitly.
The existing phi/rounding leaves below are not a Gaussian error certificate. -/
run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1, `Grothe.UpperChaos.firstCenter_band_energy_check._native.native_decide.ax_1_1, `Grothe.UpperChaos.secondCenter_band_energy_check._native.native_decide.ax_1_1, `Grothe.UpperChaos.rounding_energy_check._native.native_decide.ax_1_1]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.retainedProduction_norm_of_raw_error, ``Grothe.UpperChaos.FixedChaosSmoothing.retainedSmoothed_projected_error_of_raw, ``Grothe.UpperChaos.FixedChaosSmoothing.selected_energy_close_of_raw_error, ``Grothe.UpperChaos.FixedChaosSmoothing.retainedProduction_norm_le, ``Grothe.UpperChaos.FixedChaosSmoothing.retainedSmoothed_projected_error, ``Grothe.UpperChaos.FixedChaosSmoothing.original_energy_of_retained_source] do
    let dependencies ← Lean.collectAxioms target
    Lean.logInfo m!"Production source audit {target}: {dependencies}"
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected axioms in {target}: {unexpected}"
