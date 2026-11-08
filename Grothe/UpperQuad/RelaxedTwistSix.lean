import Grothe.UpperQuad.TwistSix
import Grothe.UpperQuad.RelaxedTwistMargins
import Grothe.UpperChaos.RelaxedThreeBandUpper

/-!
# The relaxed six bounds from the actual twisted soundness bridge

The full radii `relaxedQuadRadiusQ` feed both the low-band errors and the whole-source
inner-product estimates. The latter charge the radius times the proved center-norm cap.
The covered-panel hypotheses use `relaxedPanelRadiusQ`; the existing tail and root-gap
estimate supplies the remaining `10⁻¹⁵`. The final theorem retains the independent
energy-table closeness hypothesis.

Agent-ID: codex-2f3d. Refs #334, #332.
-/

namespace Grothe.UpperQuad.RelaxedTwist

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperQuad.PortFacts Grothe.Upper
open Grothe.UpperChaos.WholeCenterEnergies
open scoped InnerProductSpace

noncomputable section

/-- The first whole-source bound uses the full relaxed coefficient radius. -/
theorem hwholeFirst_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 1 bounds ts j1ThetaNum (10 ^ 20) j1Eps)
    (hQ : TwistQuadHyp 1 (relaxedQuadRadiusQ 0 : ℝ)) :
    ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ) := by
  have hI := re_inner_ge_of_facts hF (by norm_num) (by norm_num [relaxedQuadRadiusQ]) hQ
    firstCenterCoeff
    (fun q c d _ _ _ ↦ firstCenter_coeff q c d)
  have hm : (((phaseMoment2Q + firstEnergyQ - comparisonGroupRadiusQ 1 ^ 2) / 2 +
      (161 / 100000) * relaxedQuadRadiusQ 0 : ℚ) : ℝ) ≤
      ((j1ThetaNum / 10 ^ 20 : ℚ) : ℝ) := by
    exact_mod_cast first_whole_margin
  push_cast at hm hI
  rw [show (100000000000000000000 : ℝ) = 10 ^ 20 by norm_num] at hI
  exact whole_of_inner (ρI := (161 / 100000) * (relaxedQuadRadiusQ 0 : ℝ))
    norm_hpow_one_sq norm_firstCenter_sq_exact norm_firstCenter_le
    (by norm_num [relaxedQuadRadiusQ]) le_rfl (by norm_num [comparisonGroupRadiusQ]) hI hm

/-- The second whole-source bound uses the full relaxed coefficient radius. -/
theorem hwholeSecond_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 2 bounds ts j2ThetaNum (10 ^ 20) j2Eps)
    (hQ : TwistQuadHyp 2 (relaxedQuadRadiusQ 1 : ℝ)) :
    ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ) := by
  have hI := re_inner_ge_of_facts hF (by norm_num) (by norm_num [relaxedQuadRadiusQ]) hQ
    secondCenterCoeff
    (fun q c d _ _ _ ↦ secondCenter_coeff q c d)
  have hm : (((phaseMoment4Q + secondEnergyQ - (2 * comparisonGroupRadiusQ 2) ^ 2) / 2 +
      (3 / 125000) * relaxedQuadRadiusQ 1 : ℚ) : ℝ) ≤
      ((j2ThetaNum / 10 ^ 20 : ℚ) : ℝ) := by
    exact_mod_cast second_whole_margin
  push_cast at hm hI
  rw [show (100000000000000000000 : ℝ) = 10 ^ 20 by norm_num] at hI
  exact whole_of_inner (ρI := (3 / 125000) * (relaxedQuadRadiusQ 1 : ℝ))
    norm_hpow_two_sq norm_secondCenter_sq_exact norm_secondCenter_le
    (by norm_num [relaxedQuadRadiusQ]) le_rfl (by norm_num [comparisonGroupRadiusQ]) hI hm

/-- The third whole-source bound uses the full relaxed coefficient radius. -/
theorem hwholeThird_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 3 bounds ts j3ThetaNum (10 ^ 20) j3Eps)
    (hQ : TwistQuadHyp 3 (relaxedQuadRadiusQ 2 : ℝ)) :
    ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ) := by
  have hI := re_inner_ge_of_facts hF (by norm_num) (by norm_num [relaxedQuadRadiusQ]) hQ
    thirdCenterCoeff
    (fun q c d _ _ _ ↦ thirdCenter_coeff q c d)
  have hm : (((phaseMoment6Q + thirdEnergyQ - (6 * comparisonGroupRadiusQ 3) ^ 2) / 2 +
      (9 / 2500000) * relaxedQuadRadiusQ 2 : ℚ) : ℝ) ≤
      ((j3ThetaNum / 10 ^ 20 : ℚ) : ℝ) := by
    exact_mod_cast third_whole_margin
  push_cast at hm hI
  rw [show (100000000000000000000 : ℝ) = 10 ^ 20 by norm_num] at hI
  exact whole_of_inner (ρI := (9 / 2500000) * (relaxedQuadRadiusQ 2 : ℝ))
    norm_hpow_three_sq norm_thirdCenter_sq_exact norm_thirdCenter_le
    (by norm_num [relaxedQuadRadiusQ]) le_rfl (by norm_num [comparisonGroupRadiusQ]) hI hm

set_option exponentiation.threshold 1100 in
/-- The first low band uses the full radius and the finite-table excursion reserve. -/
theorem hfirst_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 1 bounds ts j1ThetaNum (10 ^ 20) j1Eps)
    (hQ : TwistQuadHyp 1 (relaxedQuadRadiusQ 0 : ℝ)) :
    ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (relaxedLowErrorQ 0 : ℝ) := by
  have h := band_le_of_facts hF (by norm_num) (by norm_num [relaxedQuadRadiusQ]) hQ 91
    (by decide) firstCenterCoeff
    (fun q c d _ _ _ ↦ firstCenter_coeff q c d) (firstCenterBandModes 0)
    (fun i ↦ by
      show _ < _ ∧ _ ≤ _
      rw [gradedIdx_total_degree]
      have := i.1.isLt
      simp only [firstCenterBandLo, firstCenterBandHi]
      change (i.1 : ℕ) < 26 at this
      omega)
    (fun i hi ↦ by
      have := hi.2
      simp only [firstCenterBandHi] at this
      change _ < 2 * 26
      omega)
    (by norm_num [j1Eps])
  have hm : ((j1Eps / 2 ^ 1024 : ℚ) : ℝ) ≤
      (((relaxedLowErrorQ 0 - relaxedQuadRadiusQ 0) ^ 2 : ℚ) : ℝ) := by
    exact_mod_cast first_low_margin
  push_cast at hm
  have h' : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤ _ := h
  exact low_of_margin (by simpa [KOut] using h') le_rfl
    (by norm_num [relaxedLowErrorQ, relaxedQuadRadiusQ]) hm

set_option exponentiation.threshold 1100 in
/-- The second low band uses the full radius and the finite-table excursion reserve. -/
theorem hsecond_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 2 bounds ts j2ThetaNum (10 ^ 20) j2Eps)
    (hQ : TwistQuadHyp 2 (relaxedQuadRadiusQ 1 : ℝ)) :
    ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (relaxedLowErrorQ 1 : ℝ) := by
  have h := band_le_of_facts hF (by norm_num) (by norm_num [relaxedQuadRadiusQ]) hQ 46
    (by decide) secondCenterCoeff
    (fun q c d _ _ _ ↦ secondCenter_coeff q c d) (secondCenterBandModes 0)
    (fun i ↦ by
      show _ < _ ∧ _ ≤ _
      rw [gradedIdx_total_degree]
      have := i.1.isLt
      simp only [secondCenterBandLo, secondCenterBandHi]
      change (i.1 : ℕ) < 26 at this
      omega)
    (fun i hi ↦ by
      have := hi.2
      simp only [secondCenterBandHi] at this
      change _ < 2 * 26
      omega)
    (by norm_num [j2Eps])
  have hm : ((j2Eps / 2 ^ 1024 : ℚ) : ℝ) ≤
      (((relaxedLowErrorQ 1 - relaxedQuadRadiusQ 1) ^ 2 : ℚ) : ℝ) := by
    exact_mod_cast second_low_margin
  push_cast at hm
  have h' : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤ _ := h
  exact low_of_margin (by simpa [KOut] using h') le_rfl
    (by norm_num [relaxedLowErrorQ, relaxedQuadRadiusQ]) hm

set_option exponentiation.threshold 1100 in
/-- The third low band uses the full radius and the finite-table excursion reserve. -/
theorem hthird_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 3 bounds ts j3ThetaNum (10 ^ 20) j3Eps)
    (hQ : TwistQuadHyp 3 (relaxedQuadRadiusQ 2 : ℝ)) :
    ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (relaxedLowErrorQ 2 : ℝ) := by
  have h := band_le_of_facts hF (by norm_num) (by norm_num [relaxedQuadRadiusQ]) hQ 26
    (by decide) thirdCenterCoeff
    (fun q c d _ _ _ ↦ thirdCenter_coeff q c d) (thirdCenterBandModes 0)
    (fun i ↦ by
      show _ < _ ∧ _ ≤ _
      rw [gradedIdx_total_degree]
      have := i.1.isLt
      simp only [thirdCenterBandLo, thirdCenterBandHi]
      change (i.1 : ℕ) < 6 at this
      omega)
    (fun i hi ↦ by
      have := hi.2
      simp only [thirdCenterBandHi] at this
      change _ < 2 * 6
      omega)
    (by norm_num [j3Eps])
  have hm : ((j3Eps / 2 ^ 1024 : ℚ) : ℝ) ≤
      (((relaxedLowErrorQ 2 - relaxedQuadRadiusQ 2) ^ 2 : ℚ) : ℝ) := by
    exact_mod_cast third_low_margin
  push_cast at hm
  have h' : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤ _ := h
  exact low_of_margin (by simpa [KOut] using h') le_rfl
    (by norm_num [relaxedLowErrorQ, relaxedQuadRadiusQ]) hm

/-- The existing tail and root-gap bound fills the reserved part of each full radius. -/
theorem quad_of_remainder (g : Fin 3)
    (h : TwistRemainderHyp (g.val + 1) (relaxedPanelRadiusQ g : ℝ)) :
    TwistQuadHyp (g.val + 1) (relaxedQuadRadiusQ g : ℝ) := by
  have hρ : 0 ≤ (relaxedPanelRadiusQ g : ℝ) := by
    exact_mod_cast (relaxedPanelRadiusQ_pos g).le
  have hsum : (1 / 10 ^ 15 : ℚ) + relaxedPanelRadiusQ g = relaxedQuadRadiusQ g := by
    rw [relaxedPanelRadiusQ]
    ring
  have hR : (1 / 10 ^ 15 : ℝ) + (relaxedPanelRadiusQ g : ℝ) =
      (relaxedQuadRadiusQ g : ℝ) := by
    have hc := congrArg (fun q : ℚ ↦ (q : ℝ)) hsum
    simpa only [Rat.cast_add, Rat.cast_div, Rat.cast_one, Rat.cast_pow, Rat.cast_ofNat] using hc
  exact quad_of_rem (g.val + 1) hρ hR h

/-- The three relaxed panel radii feed all six bounds without enlarging a whole-source radius. -/
theorem six_of_facts {b1 b2 b3 : List ℕ} {t1 t2 t3 : List PartialTable}
    (hF1 : FactsOf 1 b1 t1 j1ThetaNum (10 ^ 20) j1Eps)
    (hF2 : FactsOf 2 b2 t2 j2ThetaNum (10 ^ 20) j2Eps)
    (hF3 : FactsOf 3 b3 t3 j3ThetaNum (10 ^ 20) j3Eps)
    (hR1 : TwistRemainderHyp 1 (relaxedPanelRadiusQ 0 : ℝ))
    (hR2 : TwistRemainderHyp 2 (relaxedPanelRadiusQ 1 : ℝ))
    (hR3 : TwistRemainderHyp 3 (relaxedPanelRadiusQ 2 : ℝ)) :
    ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
        (relaxedLowErrorQ 0 : ℝ) ∧
      ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
        (relaxedLowErrorQ 1 : ℝ) ∧
      ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
        (relaxedLowErrorQ 2 : ℝ) ∧
      ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ) ∧
      ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ) ∧
      ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ) := by
  have hQ1 := quad_of_remainder 0 hR1
  have hQ2 := quad_of_remainder 1 hR2
  have hQ3 := quad_of_remainder 2 hR3
  exact ⟨hfirst_of_facts hF1 hQ1, hsecond_of_facts hF2 hQ2, hthird_of_facts hF3 hQ3,
    hwholeFirst_of_facts hF1 hQ1, hwholeSecond_of_facts hF2 hQ2, hwholeThird_of_facts hF3 hQ3⟩

/-- The actual port facts and relaxed remainders reduce the upper target to energy closeness. -/
theorem upper_target_of_facts {b1 b2 b3 : List ℕ} {t1 t2 t3 : List PartialTable}
    (hF1 : FactsOf 1 b1 t1 j1ThetaNum (10 ^ 20) j1Eps)
    (hF2 : FactsOf 2 b2 t2 j2ThetaNum (10 ^ 20) j2Eps)
    (hF3 : FactsOf 3 b3 t3 j3ThetaNum (10 ^ 20) j3Eps)
    (hR1 : TwistRemainderHyp 1 (relaxedPanelRadiusQ 0 : ℝ))
    (hR2 : TwistRemainderHyp 2 (relaxedPanelRadiusQ 1 : ℝ))
    (hR3 : TwistRemainderHyp 3 (relaxedPanelRadiusQ 2 : ℝ))
    (hclose : ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    Grothe.Statement.UpperTarget := by
  obtain ⟨hfirst, hsecond, hthird, hwholeFirst, hwholeSecond, hwholeThird⟩ :=
    six_of_facts hF1 hF2 hF3 hR1 hR2 hR3
  exact Grothe.Statement.upper_target_of_relaxed_inputs
    hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird hclose

end

end Grothe.UpperQuad.RelaxedTwist
