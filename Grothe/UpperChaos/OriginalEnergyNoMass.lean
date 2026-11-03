import Grothe.UpperChaos.CenterNormBypass
import Grothe.UpperChaos.SelectedEnergyApprox

/-! Derive the original energy budget from selected-mode approximation and
explicit table agreement, using the concrete response norm. -/
open MeasureTheory Finset Grothe.Upper
open scoped InnerProductSpace
namespace Grothe.UpperChaos.CenterNormBypass
noncomputable section

/-- Once the analytic response bound is established, no table-mass premise is
needed. The projected approximation and its table fit remain explicit. -/
theorem original_energy_without_table_mass
    (Y : Lp ℂ 2 mu2)
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (3 / 625000000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (3 / 1000000000000 : ℝ)) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤ (energyErrQ : ℝ) := by
  let X := (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)
  let P := projOn (energyHeadModes (headIdx 501))
  have hX : ‖P X‖ ≤ (501 / 500 : ℝ) := by
    have h := (modeSpace (energyHeadModes (headIdx 501))).norm_starProjection_apply_le X
    change ‖P X‖ ≤ ‖X‖ at h
    exact h.trans response_norm
  have hd' : ‖P X - P Y‖ ≤ (3 / 625000000000 : ℝ) := by
    simpa only [map_sub] using hd
  have hB : ‖P Y‖ ≤ (501 / 500 : ℝ) + 3 / 625000000000 := by
    have h := norm_sub_le (P X) (P X - P Y)
    simp only [sub_sub_cancel] at h
    linarith
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501) X Y
    (fun p => (energyTable p : ℝ))
    ((501 / 500 : ℝ) + 3 / 625000000000) (3 / 625000000000)
    (3 / 1000000000000) (energyErrQ : ℝ) hB hd htable
  norm_num [energyErrQ]


end
end Grothe.UpperChaos.CenterNormBypass
