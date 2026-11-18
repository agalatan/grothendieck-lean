import Grothe.UpperQuad.TwistTail
import Grothe.UpperTightBudget

/-!
# Tight low-band and whole-source errors from the existing port facts

The public generic consumers accept arbitrary positive threshold denominators and explicit
quadrature radii. Their production specializations use the tighter panel totals, exact dyadic
table reserves, and recomputed whole-source radii from `UpperTightBudget`.
Every source function and center is the original production object.

Agent-ID: codex-c8a4. Refs #389.
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

lemma low_of_margin {x ρ ρL cap e : ℝ} (hx : x ≤ ρ + Real.sqrt e) (hρ : ρ ≤ ρL) (hcap : ρL ≤ cap)
    (he : e ≤ (cap - ρL) ^ 2) : x ≤ cap := by
  have : Real.sqrt e ≤ cap - ρL := Real.sqrt_le_iff.mpr ⟨by linarith, he⟩
  linarith

lemma quad_of_rem (j : ℕ) {ρ R : ℝ} (hρ : 0 ≤ ρ) (hR : 1 / 10 ^ 15 + ρ = R)
    (h : TwistRemainderHyp j ρ) : TwistQuadHyp j R :=
  hR ▸ twistQuadHyp_of_remainder j hρ h

end
end Grothe.UpperQuad

namespace Grothe.UpperQuad.TightTwist

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperQuad.PortFacts Grothe.Upper
open Grothe.UpperChaos.WholeCenterEnergies
open scoped InnerProductSpace

noncomputable section

/-- A whole-source error from port facts, center data, norm identities, and a scalar margin. -/
theorem whole_of_facts {j den : ℕ} {bounds : List ℕ} {ts : List PartialTable} {num eps : ℤ}
    (hF : FactsOf j bounds ts num den eps) (hden : 0 < den)
    {ρ : ℝ} (hρ : 0 ≤ ρ) (hQ : TwistQuadHyp j ρ)
    (a : ℕ → ℕ → ℕ → ℚ)
    (ha : ∀ q c d, q < (twistParams j).Q → c < q + 2 → d < q + 1 →
      (a q c d : ℝ) = centerR (centerInts j) (twistParams j).E q c d)
    {m E Cn R ρI : ℝ} (hm : ‖hpowL2 j‖ ^ 2 = m)
    (hE : ‖gradedHermite (twistParams j).Q a‖ ^ 2 = E)
    (hCn : ‖gradedHermite (twistParams j).Q a‖ ≤ Cn)
    (hρI : Cn * ρ ≤ ρI) (hR : 0 ≤ R)
    (hmargin : (m + E - R ^ 2) / 2 + ρI ≤ (num : ℝ) / den) :
    ‖hpowL2 j - gradedHermite (twistParams j).Q a‖ ≤ R :=
  whole_of_inner hm hE hCn hρ hρI hR
    (re_inner_ge_of_facts hF hden hρ hQ a ha) hmargin

set_option exponentiation.threshold 1100 in
/-- A low-band error from port facts and an explicit quadrature/table-excursion margin. -/
theorem low_of_facts {j den : ℕ} {bounds : List ℕ} {ts : List PartialTable} {num eps : ℤ}
    (hF : FactsOf j bounds ts num den eps) (hden : 0 < den)
    {ρ : ℝ} (hρ : 0 ≤ ρ) (hQ : TwistQuadHyp j ρ)
    (M : ℕ) (hM : qlow j ≤ M) (a : ℕ → ℕ → ℕ → ℚ)
    (ha : ∀ q c d, q < qlow j → c < q + 2 → d < q + 1 →
      (a q c d : ℝ) = centerR (centerInts j) (twistParams j).E q c d)
    (B : Set Idx2) [DecidablePred (· ∈ B)]
    (hB : ∀ i : GradedIdx (qlow j), gradedIdx i ∈ B)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * qlow j)
    (heps : 0 ≤ eps) {cap : ℝ} (hcap : ρ ≤ cap)
    (hmargin : (eps : ℝ) / 2 ^ 1024 ≤ (cap - ρ) ^ 2) :
    ‖projOn B (hpowL2 j - gradedHermite M a)‖ ≤ cap :=
  low_of_margin
    (by simpa [KOut] using band_le_of_facts hF hden hρ hQ M hM a ha B hB hdegree heps)
    le_rfl hcap hmargin

/-- The first whole-source error with its tight quadrature and scalar budgets. -/
theorem hwholeFirst_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 1 bounds ts j1ThetaNum (10 ^ 20) j1Eps)
    (hQ : TwistQuadHyp 1 (tightQuadRadiusQ 0 : ℝ)) :
    ‖firstTaylorL2 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ) :=
  whole_of_facts hF (by norm_num) (by norm_num [tightQuadRadiusQ]) hQ firstCenterCoeff
    (fun q c d _ _ _ ↦ firstCenter_coeff q c d)
    norm_hpow_one_sq norm_firstCenter_sq_exact norm_firstCenter_le
    (ρI := (161 / 100000) * (tightQuadRadiusQ 0 : ℝ)) le_rfl
    (by norm_num [tightScaledRQ]) (by
      have hm := (Rat.cast_le (K := ℝ)).mpr tight_first_whole_margin
      push_cast at hm
      norm_num only [Nat.cast_pow, Nat.cast_ofNat] at hm ⊢
      simpa only [firstEnergyQ, Rat.cast_sum] using hm)

/-- The second whole-source error, before division by its Taylor factorial. -/
theorem hwholeSecond_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 2 bounds ts j2ThetaNum (10 ^ 20) j2Eps)
    (hQ : TwistQuadHyp 2 (tightQuadRadiusQ 1 : ℝ)) :
    ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ) :=
  whole_of_facts hF (by norm_num) (by norm_num [tightQuadRadiusQ]) hQ secondCenterCoeff
    (fun q c d _ _ _ ↦ secondCenter_coeff q c d)
    norm_hpow_two_sq norm_secondCenter_sq_exact norm_secondCenter_le
    (ρI := (3 / 125000) * (tightQuadRadiusQ 1 : ℝ)) le_rfl
    (by norm_num [tightScaledRQ]) (by
      have hm := (Rat.cast_le (K := ℝ)).mpr tight_second_whole_margin
      push_cast at hm
      norm_num only [Nat.cast_pow, Nat.cast_ofNat] at hm ⊢
      simpa only [secondEnergyQ, Rat.cast_sum] using hm)

/-- The third whole-source error, before division by its Taylor factorial. -/
theorem hwholeThird_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 3 bounds ts j3ThetaNum (10 ^ 20) j3Eps)
    (hQ : TwistQuadHyp 3 (tightQuadRadiusQ 2 : ℝ)) :
    ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ) :=
  whole_of_facts hF (by norm_num) (by norm_num [tightQuadRadiusQ]) hQ thirdCenterCoeff
    (fun q c d _ _ _ ↦ thirdCenter_coeff q c d)
    norm_hpow_three_sq norm_thirdCenter_sq_exact norm_thirdCenter_le
    (ρI := (9 / 2500000) * (tightQuadRadiusQ 2 : ℝ)) le_rfl
    (by norm_num [tightScaledRQ]) (by
      have hm := (Rat.cast_le (K := ℝ)).mpr tight_third_whole_margin
      push_cast at hm
      norm_num only [Nat.cast_pow, Nat.cast_ofNat] at hm ⊢
      simpa only [thirdEnergyQ] using hm)

set_option exponentiation.threshold 1100 in
/-- The first low-band error uses the tight radius and its exact dyadic table reserve. -/
theorem hfirst_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 1 bounds ts j1ThetaNum (10 ^ 20) j1Eps)
    (hQ : TwistQuadHyp 1 (tightQuadRadiusQ 0 : ℝ)) :
    ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (tightLowErrorQ 0 : ℝ) :=
  low_of_facts hF (by norm_num) (by norm_num [tightQuadRadiusQ]) hQ 91 (by decide)
    firstCenterCoeff (fun q c d _ _ _ ↦ firstCenter_coeff q c d) (firstCenterBandModes 0)
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
    (by norm_num [tightLowErrorQ, tightQuadRadiusQ, tightLowReserveQ])
    (by exact_mod_cast tight_first_low_margin)

set_option exponentiation.threshold 1100 in
/-- The second low-band error uses the tight radius and its exact dyadic table reserve. -/
theorem hsecond_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 2 bounds ts j2ThetaNum (10 ^ 20) j2Eps)
    (hQ : TwistQuadHyp 2 (tightQuadRadiusQ 1 : ℝ)) :
    ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (tightLowErrorQ 1 : ℝ) :=
  low_of_facts hF (by norm_num) (by norm_num [tightQuadRadiusQ]) hQ 46 (by decide)
    secondCenterCoeff (fun q c d _ _ _ ↦ secondCenter_coeff q c d) (secondCenterBandModes 0)
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
    (by norm_num [tightLowErrorQ, tightQuadRadiusQ, tightLowReserveQ])
    (by exact_mod_cast tight_second_low_margin)

set_option exponentiation.threshold 1100 in
/-- The third low-band error uses the tight radius and its exact dyadic table reserve. -/
theorem hthird_of_facts {bounds : List ℕ} {ts : List PartialTable}
    (hF : FactsOf 3 bounds ts j3ThetaNum (10 ^ 20) j3Eps)
    (hQ : TwistQuadHyp 3 (tightQuadRadiusQ 2 : ℝ)) :
    ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (tightLowErrorQ 2 : ℝ) :=
  low_of_facts hF (by norm_num) (by norm_num [tightQuadRadiusQ]) hQ 26 (by decide)
    thirdCenterCoeff (fun q c d _ _ _ ↦ thirdCenter_coeff q c d) (thirdCenterBandModes 0)
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
    (by norm_num [tightLowErrorQ, tightQuadRadiusQ, tightLowReserveQ])
    (by exact_mod_cast tight_third_low_margin)

/-- Add the existing tail and root-gap reserve to the tighter covered-panel radius. -/
theorem quad_of_remainder (g : Fin 3)
    (h : TwistRemainderHyp (g.val + 1) (tightPanelRadiusQ g : ℝ)) :
    TwistQuadHyp (g.val + 1) (tightQuadRadiusQ g : ℝ) := by
  have hρ : 0 ≤ (tightPanelRadiusQ g : ℝ) := by
    exact_mod_cast (tightPanelRadiusQ_pos g).le
  have hR : (1 / 10 ^ 15 : ℝ) + (tightPanelRadiusQ g : ℝ) =
      (tightQuadRadiusQ g : ℝ) := by
    simp only [tightPanelRadiusQ, Rat.cast_sub, Rat.cast_div, Rat.cast_one,
      Rat.cast_pow, Rat.cast_ofNat]
    ring
  exact quad_of_rem (g.val + 1) hρ hR h

/-- The six tight analytic errors from the unchanged finite facts and tighter remainders. -/
theorem six_of_facts {b1 b2 b3 : List ℕ} {t1 t2 t3 : List PartialTable}
    (hF1 : FactsOf 1 b1 t1 j1ThetaNum (10 ^ 20) j1Eps)
    (hF2 : FactsOf 2 b2 t2 j2ThetaNum (10 ^ 20) j2Eps)
    (hF3 : FactsOf 3 b3 t3 j3ThetaNum (10 ^ 20) j3Eps)
    (hR1 : TwistRemainderHyp 1 (tightPanelRadiusQ 0 : ℝ))
    (hR2 : TwistRemainderHyp 2 (tightPanelRadiusQ 1 : ℝ))
    (hR3 : TwistRemainderHyp 3 (tightPanelRadiusQ 2 : ℝ)) :
    ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
        (tightLowErrorQ 0 : ℝ) ∧
      ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
        (tightLowErrorQ 1 : ℝ) ∧
      ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
        (tightLowErrorQ 2 : ℝ) ∧
      ‖firstTaylorL2 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ) ∧
      ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ) ∧
      ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ) := by
  have hQ1 := quad_of_remainder 0 hR1
  have hQ2 := quad_of_remainder 1 hR2
  have hQ3 := quad_of_remainder 2 hR3
  exact ⟨hfirst_of_facts hF1 hQ1, hsecond_of_facts hF2 hQ2, hthird_of_facts hF3 hQ3,
    hwholeFirst_of_facts hF1 hQ1, hwholeSecond_of_facts hF2 hQ2, hwholeThird_of_facts hF3 hQ3⟩

end

end Grothe.UpperQuad.TightTwist
