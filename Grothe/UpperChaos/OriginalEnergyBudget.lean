import Grothe.UpperChaos.SelectedEnergyApprox

/-!
# Original upper endpoint: selected energy budget

The approximant, projected norm, projected L² error, table discrepancy,
and table mass are explicit inputs. The arithmetic allocation is tuned to the original
`energyErrQ`, not the later 5e-7 relaxation.
-/

open MeasureTheory Finset Grothe.Upper
namespace Grothe.UpperChaos
noncomputable section

/-- The original energy error follows from a selected response approximation
and an independent approximation-to-table discrepancy certificate. -/
theorem concrete_original_energy_close_of_selected_approx
    (Y : Lp ℂ 2 mu2)
    (hB : ‖projOn (energyHeadModes (headIdx 501)) Y‖ ≤ 1)
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (17 / 2500000000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (9 / 100000000000000 : ℝ)) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤
      (energyErrQ : ℝ) := by
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501)
    ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))
    Y (fun p => (energyTable p : ℝ)) 1 (17 / 2500000000000)
    (9 / 100000000000000) (energyErrQ : ℝ) hB hd htable
  norm_num [energyErrQ]

/-- The selected norm premise follows from the table discrepancy and an
independent bound on the total table mass. -/
theorem concrete_original_energy_close_of_table_mass
    (Y : Lp ℂ 2 mu2)
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (17 / 2500000000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (9 / 100000000000000 : ℝ))
    (hmass : (∑ p ∈ headIdx 501, (energyTable p : ℝ)) +
      (9 / 100000000000000 : ℝ) ≤ 1) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤
      (energyErrQ : ℝ) := by
  apply concrete_original_energy_close_of_selected_approx Y _ hd htable
  exact norm_energyHeadProjection_le_one_of_table (headIdx 501) Y
    (fun p => (energyTable p : ℝ)) (9 / 100000000000000) htable hmass


/-- A second original-budget allocation leaves more table-discrepancy
room if a sharper selected L² approximation can be proved. -/
theorem concrete_original_energy_close_of_refined_selected_approx
    (Y : Lp ℂ 2 mu2)
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (13 / 2000000000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (3 / 10000000000000 : ℝ))
    (hmass : (∑ p ∈ headIdx 501, (energyTable p : ℝ)) +
      (3 / 10000000000000 : ℝ) ≤ 1) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤
      (energyErrQ : ℝ) := by
  have hB := norm_energyHeadProjection_le_one_of_table (headIdx 501) Y
    (fun p => (energyTable p : ℝ)) (3 / 10000000000000) htable hmass
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501)
    ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))
    Y (fun p => (energyTable p : ℝ)) 1 (13 / 2000000000000)
    (3 / 10000000000000) (energyErrQ : ℝ) hB hd htable
  norm_num [energyErrQ]


/-- Original budget with tighter response approximation and more room for the
independent exact table comparison. All approximation inputs remain explicit. -/
theorem concrete_original_energy_close_of_banded_selected_approx
    (Y : Lp ℂ 2 mu2)
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (3 / 625000000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (3 / 1000000000000 : ℝ))
    (hmass : (∑ p ∈ headIdx 501, (energyTable p : ℝ)) +
      (3 / 1000000000000 : ℝ) ≤ 1) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤
      (energyErrQ : ℝ) := by
  have hB := norm_energyHeadProjection_le_one_of_table (headIdx 501) Y
    (fun p => (energyTable p : ℝ)) (3 / 1000000000000) htable hmass
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501)
    ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))
    Y (fun p => (energyTable p : ℝ)) 1 (3 / 625000000000)
    (3 / 1000000000000) (energyErrQ : ℝ) hB hd htable
  norm_num [energyErrQ]



/-- A slightly looser norm bound avoids needing a table-mass calculation for
an approximant whose norm can be certified directly. -/
theorem concrete_original_energy_close_of_bounded_approx
    (Y : Lp ℂ 2 mu2)
    (hB : ‖projOn (energyHeadModes (headIdx 501)) Y‖ ≤ (101 / 100 : ℝ))
    (hd : ‖projOn (energyHeadModes (headIdx 501))
      (((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) - Y)‖ ≤ (3 / 625000000000 : ℝ))
    (htable : (∑ p ∈ headIdx 501, |energy Y p - (energyTable p : ℝ)|) ≤
      (3 / 1000000000000 : ℝ)) :
    (∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)|) ≤
      (energyErrQ : ℝ) := by
  apply selectedEnergy_close_of_projected_l2_approx (headIdx 501)
    ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))
    Y (fun p => (energyTable p : ℝ)) (101 / 100) (3 / 625000000000)
    (3 / 1000000000000) (energyErrQ : ℝ) hB hd htable
  norm_num [energyErrQ]

end
end Grothe.UpperChaos
