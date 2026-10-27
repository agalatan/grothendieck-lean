import Grothe.UpperChaos.FirstSecondCapturedTail

/-! Bound the smoothed concrete response using the certified norms of its finite
Taylor centers and the contractivity of Gaussian smoothing. -/
open MeasureTheory Finset Grothe.Upper
open scoped InnerProductSpace
namespace Grothe.UpperChaos.CenterNormBypass
noncomputable section
set_option maxRecDepth 4096

lemma first_disjoint (i : Idx2) (k l : Fin 6)
    (hk : i ∈ firstCenterBandModes k) (hl : i ∈ firstCenterBandModes l) : k = l := by
  have hinj : Function.Injective firstCapturedIndex := by decide +kernel
  have hpw : ∀ j, pw (firstCapturedIndex j) = 1 := by decide +kernel
  rw [firstCenterBandModes_eq_comparison] at hk hl
  change (comparisonBand (firstCapturedIndex k)).contains (bideg i).1 (bideg i).2 = true at hk
  change (comparisonBand (firstCapturedIndex l)).contains (bideg i).1 (bideg i).2 = true at hl
  apply hinj
  exact band_unique ((hpw k).trans (hpw l).symm) hk hl

lemma second_disjoint (i : Idx2) (k l : Fin 4)
    (hk : i ∈ secondCenterBandModes k) (hl : i ∈ secondCenterBandModes l) : k = l := by
  have hinj : Function.Injective secondCapturedIndex := by decide +kernel
  have hpw : ∀ j, pw (secondCapturedIndex j) = 2 := by decide +kernel
  rw [secondCenterBandModes_eq_comparison] at hk hl
  change (comparisonBand (secondCapturedIndex k)).contains (bideg i).1 (bideg i).2 = true at hk
  change (comparisonBand (secondCapturedIndex l)).contains (bideg i).1 (bideg i).2 = true at hl
  apply hinj
  exact band_unique ((hpw k).trans (hpw l).symm) hk hl

lemma first_decomposition :
    ∑ k : Fin 6, projOn (firstCenterBandModes k) firstCenter = firstCenter := by
  refine sum_projOn univ firstCenterBandModes firstCenter ?_ ?_
  · intro i hi
    change ⟪hvec2 i, gradedHermite 91 firstCenterCoeff⟫_ℂ ≠ 0 at hi
    rw [inner_hvec2_gradedHermite] at hi
    split_ifs at hi with hc
    · have hd : 0 < (bideg i).1 + (bideg i).2 ∧
          (bideg i).1 + (bideg i).2 ≤ 181 := by
        simp only [bideg]
        omega
      have hex : ∃ k : Fin 6, i ∈ firstCenterBandModes k := by
        by_cases h1 : (bideg i).1 + (bideg i).2 ≤ 51
        · refine ⟨0, ?_⟩; simpa [firstCenterBandModes, firstCenterBandLo, firstCenterBandHi] using ⟨hd.1, h1⟩
        by_cases h2 : (bideg i).1 + (bideg i).2 ≤ 101
        · refine ⟨1, ?_⟩; simp [firstCenterBandModes, firstCenterBandLo, firstCenterBandHi]; omega
        by_cases h3 : (bideg i).1 + (bideg i).2 ≤ 151
        · refine ⟨2, ?_⟩; simp [firstCenterBandModes, firstCenterBandLo, firstCenterBandHi]; omega
        by_cases h4 : (bideg i).1 + (bideg i).2 ≤ 161
        · refine ⟨3, ?_⟩; simp [firstCenterBandModes, firstCenterBandLo, firstCenterBandHi]; omega
        by_cases h5 : (bideg i).1 + (bideg i).2 ≤ 171
        · refine ⟨4, ?_⟩; simp [firstCenterBandModes, firstCenterBandLo, firstCenterBandHi]; omega
        · refine ⟨5, ?_⟩; simp [firstCenterBandModes, firstCenterBandLo, firstCenterBandHi]; omega
      obtain ⟨k, hk⟩ := hex
      exact ⟨k, ⟨mem_univ _, hk⟩, fun l hl => first_disjoint i l k hl.2 hk⟩
    · contradiction
  · intro i k _ l _ hk hl
    exact first_disjoint i k l hk hl

lemma second_decomposition :
    ∑ k : Fin 4, projOn (secondCenterBandModes k) secondCenter = secondCenter := by
  refine sum_projOn univ secondCenterBandModes secondCenter ?_ ?_
  · intro i hi
    change ⟪hvec2 i, gradedHermite 46 secondCenterCoeff⟫_ℂ ≠ 0 at hi
    rw [inner_hvec2_gradedHermite] at hi
    split_ifs at hi with hc
    · have hd : 0 < (bideg i).1 + (bideg i).2 ∧
          (bideg i).1 + (bideg i).2 ≤ 91 := by
        simp only [bideg]
        omega
      have hex : ∃ k : Fin 4, i ∈ secondCenterBandModes k := by
        by_cases h1 : (bideg i).1 + (bideg i).2 ≤ 51
        · refine ⟨0, ?_⟩; simpa [secondCenterBandModes, secondCenterBandLo, secondCenterBandHi] using ⟨hd.1, h1⟩
        by_cases h2 : (bideg i).1 + (bideg i).2 ≤ 71
        · refine ⟨1, ?_⟩; simp [secondCenterBandModes, secondCenterBandLo, secondCenterBandHi]; omega
        by_cases h3 : (bideg i).1 + (bideg i).2 ≤ 81
        · refine ⟨2, ?_⟩; simp [secondCenterBandModes, secondCenterBandLo, secondCenterBandHi]; omega
        · refine ⟨3, ?_⟩; simp [secondCenterBandModes, secondCenterBandLo, secondCenterBandHi]; omega
      obtain ⟨k, hk⟩ := hex
      exact ⟨k, ⟨mem_univ _, hk⟩, fun l hl => second_disjoint i l k hl.2 hk⟩
    · contradiction
  · intro i k _ l _ hk hl
    exact second_disjoint i k l hk hl

lemma first_norm : ‖firstCenter‖ ≤ (174 / 100000 : ℝ) := by
  rw [← first_decomposition]
  refine (norm_sum_le _ _).trans ?_
  calc
    _ ≤ ∑ k : Fin 6, (firstCenterBandUpperQ k : ℝ) :=
      sum_le_sum fun k _ => firstCenterBand_norm_upper k
    _ ≤ (174 / 100000 : ℝ) := by
      norm_num [Fin.sum_univ_succ, firstCenterBandUpperQ]

lemma second_norm : ‖secondCenter‖ ≤ (3 / 100000 : ℝ) := by
  rw [← second_decomposition]
  refine (norm_sum_le _ _).trans ?_
  calc
    _ ≤ ∑ k : Fin 4, (secondCenterBandUpperQ k : ℝ) :=
      sum_le_sum fun k _ => secondCenterBand_norm_upper k
    _ ≤ (3 / 100000 : ℝ) := by
      norm_num [Fin.sum_univ_succ, secondCenterBandUpperQ]

lemma third_norm : ‖thirdCenter‖ ≤ (1 / 100000 : ℝ) := by
  have hs : (thirdCenterEnergyQ : ℝ) ≤ (1 / 100000 : ℝ) ^ 2 := by
    norm_num [thirdCenterEnergyQ]
  nlinarith [norm_thirdCenter_sq, norm_nonneg thirdCenter]

lemma correction_norm : ‖frozenCorrection‖ ≤ (1 / 500 : ℝ) := by
  have heq : frozenCorrection = firstCenter + ((1 / 2 : ℚ) : ℂ) • secondCenter +
      ((1 / 6 : ℚ) : ℂ) • thirdCenter - roundingDifference := by
    unfold roundingDifference
    abel
  rw [heq]
  have h := norm_sub_le
    (firstCenter + ((1 / 2 : ℚ) : ℂ) • secondCenter +
      ((1 / 6 : ℚ) : ℂ) • thirdCenter) roundingDifference
  have h1 := norm_add_le (firstCenter + ((1 / 2 : ℚ) : ℂ) • secondCenter)
    (((1 / 6 : ℚ) : ℂ) • thirdCenter)
  have h2 := norm_add_le firstCenter (((1 / 2 : ℚ) : ℂ) • secondCenter)
  simp only [norm_smul] at h h1 h2
  norm_num at h1 h2
  linarith [first_norm, second_norm, third_norm, norm_roundingDifference_le]

/-- Pointwise F0 boundedness via the existing j=0 phase-moment inequality. -/
lemma base_norm : ‖(chargeFn_F0 phiBound).memLp.toLp F0‖ ≤ 1 := by
  have hs := norm_hpow_toLp_sq_le 0
  have he : (chargeFn_hpow phiBound 0).memLp.toLp (hpow 0) =
      (chargeFn_F0 phiBound).memLp.toLp F0 := by
    apply (MemLp.toLp_eq_toLp_iff _ _).mpr
    exact Filter.Eventually.of_forall (fun u => by simp [hpow])
  simp only [Nat.mul_zero, pow_zero, integral_const, probReal_univ, one_smul] at hs
  rw [he] at hs
  nlinarith [norm_nonneg ((chargeFn_F0 phiBound).memLp.toLp F0)]

lemma response_norm :
    ‖(memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)‖ ≤
      (501 / 500 : ℝ) := by
  have hx : (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn) =
      smoothOp ((chargeFn_F0 phiBound).memLp.toLp F0 + frozenCorrection) := by
    have hadd : (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).memLp.toLp
        (fun u => F0 u + frozenCorrectionFn u) =
        (chargeFn_F0 phiBound).memLp.toLp F0 + frozenCorrection := by
      change ((chargeFn_F0 phiBound).memLp.add chargeFn_frozenCorrectionFn.memLp).toLp
        (F0 + frozenCorrectionFn) = _
      rw [MemLp.toLp_add, toLp_frozenCorrectionFn]
    have h := (smoothOp_toLp' (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).meas
      (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).memLp).symm
    change (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn) =
      smoothOp ((chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).memLp.toLp
        (fun u => F0 u + frozenCorrectionFn u)) at h
    rw [hadd] at h
    exact h
  rw [hx]
  have hn := norm_smoothOp_le ((chargeFn_F0 phiBound).memLp.toLp F0 + frozenCorrection)
  have ha := norm_add_le ((chargeFn_F0 phiBound).memLp.toLp F0) frozenCorrection
  linarith [base_norm, correction_norm]


end
end Grothe.UpperChaos.CenterNormBypass
