import Grothe.UpperQuad.TwistTail

/-!
# The six band/whole hypotheses of `upper_of_three_low_three_whole`

From the port facts of the three powers (`FactsOf j bounds ts θ_j 10^20 eps_j`: the final fact, the
range facts, the degree check of the phase terms and the table flags) and the twisted
Gauss–Legendre remainder hypotheses `TwistQuadHyp j ρ_j` (`ρ_j = 10⁻¹¹, 10⁻¹⁰, 10⁻¹¹`):

* `hfirst_of_facts`, `hsecond_of_facts`, `hthird_of_facts`: the low-band errors;
* `hwholeFirst_of_facts`, `hwholeSecond_of_facts`, `hwholeThird_of_facts`: the whole errors;

in exactly the form of the hypotheses of
`Grothe.UpperChaos.ThreeBandEndpoint.upper_of_three_low_three_whole`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperQuad.PortFacts Grothe.Upper
open Grothe.UpperChaos.WholeCenterEnergies
open scoped InnerProductSpace

noncomputable section

/-! ### The centers as the kernel's dyadic arrays -/

lemma firstCenter_coeff (q c d : ℕ) :
    (firstCenterCoeff q c d : ℝ) = centerR (centerInts 1) (twistParams 1).E q c d := by
  simp only [firstCenterCoeff, firstCenterAt, centerR, centerInts, twistParams, ↓reduceIte,
    Array.getD_eq_getD_getElem?, gradedFlat, gradedFlatIndex]
  push_cast
  rfl

lemma secondCenter_coeff (q c d : ℕ) :
    (secondCenterCoeff q c d : ℝ) = centerR (centerInts 2) (twistParams 2).E q c d := by
  simp only [secondCenterCoeff, secondCenterAt, centerR, centerInts, twistParams,
    Array.getD_eq_getD_getElem?, gradedFlat, gradedFlatIndex]
  push_cast
  norm_num

lemma thirdCenter_coeff (q c d : ℕ) :
    (thirdCenterCoeff q c d : ℝ) = centerR (centerInts 3) (twistParams 3).E q c d := by
  simp only [thirdCenterCoeff, PackedDyadic.coeff, thirdCenterExponent, centerR, centerInts,
    twistParams, Array.getD_eq_getD_getElem?, gradedFlat]
  push_cast
  norm_num

/-! ### The whole errors -/

/-- From `Re⟨c, hpow j⟩ ≥ θ − ‖c‖ρ`, the norms and the margin, the whole error is at most `R`. -/
lemma whole_of_inner {F c : Lp ℂ 2 mu2} {m E θ R Cn ρ ρI : ℝ} (hF : ‖F‖ ^ 2 = m) (hc : ‖c‖ ^ 2 = E)
    (hCn : ‖c‖ ≤ Cn) (hρ : 0 ≤ ρ) (hρI : Cn * ρ ≤ ρI) (hR : 0 ≤ R)
    (hI : θ - ‖c‖ * ρ ≤ Complex.re ⟪c, F⟫_ℂ) (hm : (m + E - R ^ 2) / 2 + ρI ≤ θ) :
    ‖F - c‖ ≤ R := by
  have h1 : ‖F - c‖ ^ 2 = m - 2 * Complex.re ⟪c, F⟫_ℂ + E := by
    rw [norm_sub_sq (𝕜 := ℂ), hF, hc, inner_re_symm (𝕜 := ℂ)]
    rfl
  have h2 : ‖c‖ * ρ ≤ Cn * ρ := mul_le_mul_of_nonneg_right hCn hρ
  have h3 : ‖F - c‖ ^ 2 ≤ R ^ 2 := by rw [h1]; nlinarith
  exact (pow_le_pow_iff_left₀ (norm_nonneg _) hR (by norm_num)).mp h3

theorem hwholeFirst_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 1 bounds ts j1ThetaNum (10 ^ 20) j1Eps) (hQ : TwistQuadHyp 1 (1 / 10 ^ 11)) :
    ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ) := by
  have hI := re_inner_ge_of_facts hF (by norm_num) (by norm_num) hQ firstCenterCoeff
    (fun q c d _ _ _ => firstCenter_coeff q c d)
  have hm : (((phaseMoment2Q + firstEnergyQ - comparisonGroupRadiusQ 1 ^ 2) / 2 + 1 / 10 ^ 12 : ℚ) :
      ℝ) ≤ ((j1ThetaNum / 10 ^ 20 : ℚ) : ℝ) := by exact_mod_cast twist_j1_whole_margin
  push_cast at hm hI
  rw [show (100000000000000000000 : ℝ) = 10 ^ 20 by norm_num] at hI
  exact whole_of_inner (ρI := 1 / 10 ^ 12) norm_hpow_one_sq norm_firstCenter_sq_exact norm_firstCenter_le
    (by norm_num) (by norm_num) (by norm_num [comparisonGroupRadiusQ]) hI hm

theorem hwholeSecond_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 2 bounds ts j2ThetaNum (10 ^ 20) j2Eps) (hQ : TwistQuadHyp 2 (1 / 10 ^ 10)) :
    ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ) := by
  have hI := re_inner_ge_of_facts hF (by norm_num) (by norm_num) hQ secondCenterCoeff
    (fun q c d _ _ _ => secondCenter_coeff q c d)
  have hm : (((phaseMoment4Q + secondEnergyQ - (2 * comparisonGroupRadiusQ 2) ^ 2) / 2 +
      5 / 10 ^ 14 : ℚ) : ℝ) ≤ ((j2ThetaNum / 10 ^ 20 : ℚ) : ℝ) := by
    exact_mod_cast twist_j2_whole_margin
  push_cast at hm hI
  rw [show (100000000000000000000 : ℝ) = 10 ^ 20 by norm_num] at hI
  exact whole_of_inner (ρI := 5 / 10 ^ 14) norm_hpow_two_sq norm_secondCenter_sq_exact norm_secondCenter_le
    (by norm_num) (by norm_num) (by norm_num [comparisonGroupRadiusQ]) hI hm

theorem hwholeThird_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 3 bounds ts j3ThetaNum (10 ^ 20) j3Eps) (hQ : TwistQuadHyp 3 (1 / 10 ^ 11)) :
    ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ) := by
  have hI := re_inner_ge_of_facts hF (by norm_num) (by norm_num) hQ thirdCenterCoeff
    (fun q c d _ _ _ => thirdCenter_coeff q c d)
  have hm : (((phaseMoment6Q + thirdEnergyQ - (6 * comparisonGroupRadiusQ 3) ^ 2) / 2 +
      3 / 10 ^ 14 : ℚ) : ℝ) ≤ ((j3ThetaNum / 10 ^ 20 : ℚ) : ℝ) := by
    exact_mod_cast twist_j3_whole_margin
  push_cast at hm hI
  rw [show (100000000000000000000 : ℝ) = 10 ^ 20 by norm_num] at hI
  exact whole_of_inner (ρI := 3 / 10 ^ 14) norm_hpow_three_sq norm_thirdCenter_sq_exact norm_thirdCenter_le
    (by norm_num) (by norm_num) (by norm_num [comparisonGroupRadiusQ]) hI hm

/-! ### The low bands -/

lemma low_of_margin {x ρ ρL cap e : ℝ} (hx : x ≤ ρ + Real.sqrt e) (hρ : ρ ≤ ρL) (hcap : ρL ≤ cap)
    (he : e ≤ (cap - ρL) ^ 2) : x ≤ cap := by
  have : Real.sqrt e ≤ cap - ρL := Real.sqrt_le_iff.mpr ⟨by linarith, he⟩
  linarith

set_option exponentiation.threshold 1100 in
theorem hfirst_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 1 bounds ts j1ThetaNum (10 ^ 20) j1Eps) (hQ : TwistQuadHyp 1 (1 / 10 ^ 11)) :
    ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ 0 : ℝ) := by
  have h := band_le_of_facts hF (by norm_num) (by norm_num) hQ 91 (by decide) firstCenterCoeff
    (fun q c d _ _ _ => firstCenter_coeff q c d) (firstCenterBandModes 0)
    (fun i => by
      show _ < _ ∧ _ ≤ _
      rw [gradedIdx_total_degree]
      have := i.1.isLt
      simp only [firstCenterBandLo, firstCenterBandHi]
      change (i.1 : ℕ) < 26 at this
      omega)
    (fun i hi => by
      have := hi.2
      simp only [firstCenterBandHi] at this
      change _ < 2 * 26
      omega)
    (by norm_num [j1Eps])
  have hm : ((j1Eps / 2 ^ 1024 : ℚ) : ℝ) ≤
      ((((firstCapturedErrorQ 0 - 1 / 10 ^ 11) ^ 2 : ℚ)) : ℝ) := by
    exact_mod_cast twist_j1_low_margin
  push_cast at hm
  have h' : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤ _ := h
  exact low_of_margin (by simpa [KOut] using h') le_rfl (by norm_num [firstCapturedErrorQ]) hm

set_option exponentiation.threshold 1100 in
theorem hsecond_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 2 bounds ts j2ThetaNum (10 ^ 20) j2Eps) (hQ : TwistQuadHyp 2 (1 / 10 ^ 10)) :
    ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ 0 : ℝ) := by
  have h := band_le_of_facts hF (by norm_num) (by norm_num) hQ 46 (by decide) secondCenterCoeff
    (fun q c d _ _ _ => secondCenter_coeff q c d) (secondCenterBandModes 0)
    (fun i => by
      show _ < _ ∧ _ ≤ _
      rw [gradedIdx_total_degree]
      have := i.1.isLt
      simp only [secondCenterBandLo, secondCenterBandHi]
      change (i.1 : ℕ) < 26 at this
      omega)
    (fun i hi => by
      have := hi.2
      simp only [secondCenterBandHi] at this
      change _ < 2 * 26
      omega)
    (by norm_num [j2Eps])
  have hm : ((j2Eps / 2 ^ 1024 : ℚ) : ℝ) ≤
      ((((secondCapturedErrorQ 0 - 1 / 10 ^ 10) ^ 2 : ℚ)) : ℝ) := by
    exact_mod_cast twist_j2_low_margin
  push_cast at hm
  have h' : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤ _ := h
  exact low_of_margin (by simpa [KOut] using h') le_rfl (by norm_num [secondCapturedErrorQ]) hm

set_option exponentiation.threshold 1100 in
theorem hthird_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 3 bounds ts j3ThetaNum (10 ^ 20) j3Eps) (hQ : TwistQuadHyp 3 (1 / 10 ^ 11)) :
    ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ 0 : ℝ) := by
  have h := band_le_of_facts hF (by norm_num) (by norm_num) hQ 26 (by decide) thirdCenterCoeff
    (fun q c d _ _ _ => thirdCenter_coeff q c d) (thirdCenterBandModes 0)
    (fun i => by
      show _ < _ ∧ _ ≤ _
      rw [gradedIdx_total_degree]
      have := i.1.isLt
      simp only [thirdCenterBandLo, thirdCenterBandHi]
      change (i.1 : ℕ) < 6 at this
      omega)
    (fun i hi => by
      have := hi.2
      simp only [thirdCenterBandHi] at this
      change _ < 2 * 6
      omega)
    (by norm_num [j3Eps])
  have hm : ((j3Eps / 2 ^ 1024 : ℚ) : ℝ) ≤
      ((((thirdCapturedErrorQ 0 - 1 / 10 ^ 11) ^ 2 : ℚ)) : ℝ) := by
    exact_mod_cast twist_j3_low_margin
  push_cast at hm
  have h' : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤ _ := h
  exact low_of_margin (by simpa [KOut] using h') le_rfl (by norm_num [thirdCapturedErrorQ]) hm

/-! ### The six hypotheses from the covered-set remainders

`TwistRemainderHyp j ρ` (the Gauss–Legendre remainders on the panels; the tail and the gaps are
proved, `norm_twistTail_sq_le`) with `ρ = 10⁻¹¹ − 10⁻¹⁵` (`j = 1, 3`) and `10⁻¹⁰ − 10⁻¹⁵` (`j = 2`).
-/

lemma quad_of_rem (j : ℕ) {ρ R : ℝ} (hρ : 0 ≤ ρ) (hR : 1 / 10 ^ 15 + ρ = R)
    (h : TwistRemainderHyp j ρ) : TwistQuadHyp j R := by
  rw [← hR]; exact twistQuadHyp_of_remainder j hρ h

/-- **The six hypotheses of `upper_of_three_low_three_whole`**, from the port facts of the three
powers and the three covered-set remainder hypotheses. -/
theorem six_of_facts {b1 b2 b3 : List ℕ} {t1 t2 t3 : List PartialTable}
    (hF1 : FactsOf 1 b1 t1 j1ThetaNum (10 ^ 20) j1Eps)
    (hF2 : FactsOf 2 b2 t2 j2ThetaNum (10 ^ 20) j2Eps)
    (hF3 : FactsOf 3 b3 t3 j3ThetaNum (10 ^ 20) j3Eps)
    (hR1 : TwistRemainderHyp 1 (9999 / 10 ^ 15)) (hR2 : TwistRemainderHyp 2 (99999 / 10 ^ 15))
    (hR3 : TwistRemainderHyp 3 (9999 / 10 ^ 15)) :
    ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
        (firstCapturedErrorQ 0 : ℝ) ∧
      ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
        (secondCapturedErrorQ 0 : ℝ) ∧
      ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
        (thirdCapturedErrorQ 0 : ℝ) ∧
      ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ) ∧
      ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ) ∧
      ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ) := by
  have hQ1 := quad_of_rem 1 (by norm_num) (by norm_num) hR1 (R := 1 / 10 ^ 11)
  have hQ2 := quad_of_rem 2 (by norm_num) (by norm_num) hR2 (R := 1 / 10 ^ 10)
  have hQ3 := quad_of_rem 3 (by norm_num) (by norm_num) hR3 (R := 1 / 10 ^ 11)
  exact ⟨hfirst_of_facts hF1 hQ1, hsecond_of_facts hF2 hQ2, hthird_of_facts hF3 hQ3,
    hwholeFirst_of_facts hF1 hQ1, hwholeSecond_of_facts hF2 hQ2, hwholeThird_of_facts hF3 hQ3⟩

end

end Grothe.UpperQuad
