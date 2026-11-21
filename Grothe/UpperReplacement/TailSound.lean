import Grothe.UpperReplacement.Production
import Grothe.UpperReplacement.CircleWideSound
import Grothe.UpperReplacement.TailFacts.Numerics
import Grothe.UpperReplacement.LinearTail

set_option warningAsError true

/-!
# Separate Hardy tails for the actual eighteen channels

Agent-ID: codex-a7c4. The finite rational checks are converted to analytic budgets for
the production GT response, the Gaussian phase response, and the two distinct cell responses.
The large cell head is truncated after composition, using its own Hardy estimate.
-/

namespace Grothe.UpperReplacement.TailSound

open MeasureTheory Finset Polynomial Upper UpperChaos GrotheKernel GrotheKernel.HardyArc
open Certificate Production TailInputs UpperChaos.HardyArcSound

noncomputable section

theorem channelAt_mem (i : Fin 18) : channelAt i ∈ channels :=
  List.get_mem _ _

theorem numerical (i : Fin 18) :
    1 < radius i ∧ radius i + 1 / 100000 ≤ 2 ∧ 0 ≤ budget i ∧ 0 ≤ tail i ∧
      budget i * (radius i)⁻¹ ^ 1006 ≤ tail i ^ 2 * (1 - (radius i)⁻¹ ^ 4) := by
  have h := TailFacts.numerics
  simp only [numericalChecks, Bool.and_eq_true, decide_eq_true_eq] at h
  have hi := List.all_eq_true.mp h.1.1 i (List.mem_finRange i)
  simpa only [decide_eq_true_eq] using hi

theorem hardy (i : Fin 18) (hchecks : analyticChecks i = true) (J : ℕ) :
    ∑ k ∈ range J, channelSequence (channelAt i) k ^ 2 *
      (radius i : ℝ) ^ (2 * (2 * k + 1)) ≤ (budget i : ℝ) := by
  have hn := numerical i
  have hc := channelAt_mem i
  have hP := primary_l1 hc
  have hQ := auxiliary_l1 hc
  have hj : 0 < (channelAt i).schur := (parameters_checked _ hc).2.2.2.2.1
  have hr : radius i < radius i + 1 / 100000 := by linarith
  have hh := Bool.and_eq_true_iff.mp hchecks
  cases hk : (channelAt i).kind with
  | gt =>
    have hsm : smoothing i = CircleCheck.gtSmoothingM := by
      simp only [smoothing, hk, ↓reduceIte]
    have hsec : secondary (channelAt i) = (channelAt i).auxiliary := by
      simp only [secondary, hk]
    have hm : memSR ⟨m00, m01, m11⟩ CircleCheck.gtSmoothingM :=
      ⟨mem_m00, mem_m01, mem_m11⟩
    have hreal : ∀ t : ℝ, 0 < t → t < 1 →
        HasSum (fun k ↦ (channelSequence (channelAt i) k : ℂ) * (t : ℂ) ^ (2 * k + 1))
          (HholSymPair Tround Tround
            (covarianceCurve ⟨m00, m01, m11⟩
              (channelAt i).primary (channelAt i).auxiliary t)) := by
      intro t ht0 ht1
      simpa only [channelSequence, hk, GTComparison.actualEG,
        CircleWideSound.HholSymPair_self] using hreal_gt_channel phiBound hP hQ t ht0 ht1
    exact CircleWideSound.hardy_of_quarter_checks measurable_Tround measurable_Tround
      (norm_Tround_le phiBound) (norm_Tround_le phiBound) hm _ _
      hn.1 hr hj hn.2.2.1
      (by simpa only [hsm, hsec] using hh.1)
      (by simpa only [hsm, hsec] using hh.2)
      (channel_summable hc) hreal J
  | phase =>
    have hsm : smoothing i = CircleCheck.identityM := by
      simp only [smoothing, hk, reduceCtorEq, ↓reduceIte]
    have hsec : secondary (channelAt i) = [] := by
      simp only [secondary, hk]
    have hm : memSR ⟨1, 0, 1⟩ CircleCheck.identityM :=
      ⟨by simpa [CircleCheck.identityM] using mem_intI 1,
       by simpa [CircleCheck.identityM] using mem_zero,
       by simpa [CircleCheck.identityM] using mem_intI 1⟩
    have hreal : ∀ t : ℝ, 0 < t → t < 1 →
        HasSum (fun k ↦ (channelSequence (channelAt i) k : ℂ) * (t : ℂ) ^ (2 * k + 1))
          (HholSymPair phase2 phase2
            (covarianceCurve ⟨1, 0, 1⟩ (channelAt i).primary [] t)) := by
      intro t ht0 ht1
      have hpair : pairEnergy (memLp_phase2.toLp phase2) (memLp_phase2.toLp phase2) =
          energy (memLp_phase2.toLp phase2) := funext (CircleWideSound.pairEnergy_self _)
      have hnil : ofListQ [] = 0 := rfl
      simpa only [channelSequence, hk, hpair, hnil] using
        hreal_cell_pair measurable_phase2 measurable_phase2 norm_phase2_le norm_phase2_le
          (fun _ u hu ↦ phase2_rot2 hu u) (fun _ u hu ↦ phase2_rot2 hu u)
          memLp_phase2 memLp_phase2 (ql := []) hP (by simp [ofListQ, l1]) t ht0 ht1
    exact CircleWideSound.hardy_of_quarter_checks measurable_phase2 measurable_phase2
      norm_phase2_le norm_phase2_le hm _ _ hn.1 hr hj hn.2.2.1
      (by simpa only [hsm, hsec] using hh.1)
      (by simpa only [hsm, hsec] using hh.2)
      (channel_summable hc) hreal J
  | tiger =>
    have hsm : smoothing i = CircleCheck.identityM := by
      simp only [smoothing, hk, reduceCtorEq, ↓reduceIte]
    have hsec : secondary (channelAt i) = (channelAt i).primary := by
      simp only [secondary, hk]
    have hm : memSR ⟨1, 0, 1⟩ CircleCheck.identityM :=
      ⟨by simpa [CircleCheck.identityM] using mem_intI 1,
       by simpa [CircleCheck.identityM] using mem_zero,
       by simpa [CircleCheck.identityM] using mem_intI 1⟩
    have hreal : ∀ t : ℝ, 0 < t → t < 1 →
        HasSum (fun k ↦ (channelSequence (channelAt i) k : ℂ) * (t : ℂ) ^ (2 * k + 1))
          (HholSymPair leftResponse rightResponse
            (covarianceCurve ⟨1, 0, 1⟩ (channelAt i).primary (channelAt i).primary t)) := by
      intro t ht0 ht1
      simpa only [channelSequence, hk, leftVector, rightVector, leftResponse, rightResponse] using
        hreal_cell_pair
          (measurable_cellResponse leftTable (2 ^ 26) 128 64 6)
          (measurable_cellResponse rightTable (2 ^ 26) 128 64 6)
          (norm_cellResponse_le leftTable (2 ^ 26) 128 64 6)
          (norm_cellResponse_le rightTable (2 ^ 26) 128 64 6)
          (cellResponse_charge leftTable (2 ^ 26) 128 64 6)
          (cellResponse_charge rightTable (2 ^ 26) 128 64 6)
          (memLp_cellResponse leftTable (2 ^ 26) 128 64 6)
          (memLp_cellResponse rightTable (2 ^ 26) 128 64 6) hP hP t ht0 ht1
    exact CircleWideSound.hardy_of_quarter_checks
      (measurable_cellResponse leftTable (2 ^ 26) 128 64 6)
      (measurable_cellResponse rightTable (2 ^ 26) 128 64 6)
      (norm_cellResponse_le leftTable (2 ^ 26) 128 64 6)
      (norm_cellResponse_le rightTable (2 ^ 26) 128 64 6) hm _ _
      hn.1 hr hj hn.2.2.1
      (by simpa only [hsm, hsec] using hh.1)
      (by simpa only [hsm, hsec] using hh.2)
      (channel_summable hc) hreal J

theorem channel_tail (i : Fin 18) (hchecks : analyticChecks i = true) :
    ∑' n, |channelSequence (channelAt i) (n + 251)| ≤ (tail i : ℝ) :=
  CircleWideSound.tail_of_budget (numerical i).1 (hardy i hchecks)
    (numerical i).2.2.2.1 (numerical i).2.2.2.2

theorem cell_truncation_tail (hchecks : analyticChecks 15 = true) :
    ∑' n, |channelSequence (channelAt 15) (n + 126)| ≤ (cellTruncationTail : ℝ) := by
  have h := TailFacts.numerics
  simp only [numericalChecks, Bool.and_eq_true, decide_eq_true_eq] at h
  have hb := hardy 15 hchecks
  have hr : radius 15 = 109 / 100 := rfl
  have hB : budget 15 = 2 := rfl
  rw [hr, hB] at hb
  apply CircleWideSound.tail_of_budget (rho := 109 / 100) (B := 2) (by norm_num)
    hb h.2.1 h.2.2

/-- The embedded phase has first energy π/4. -/
theorem phase_first_lower : (LinearTail.phaseFirst : ℝ) ≤
    energy (memLp_phase2.toLp phase2) (1, 0) := by
  have h : energy (memLp_phase2.toLp phase2) (1, 0) = Real.pi / 4 := by
    simpa [haagCoeff, haagR] using energy_phase2_odd_zero 0
  rw [h]
  simp only [LinearTail.phaseFirst, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat]
  linarith [Real.pi_gt_d20]

private theorem channel_linear_lower
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ))
    (i : Fin 18) (ht : (channelAt i).kind ≠ .tiger) :
    (LinearTail.linearLower i : ℝ) ≤ channelSequence (channelAt i) 0 := by
  have hP : (0 : ℝ) ≤ ((channelAt i).primary.getD 0 0 : ℚ) :=
    Rat.cast_nonneg.mpr (LinearTail.estimates_checked i).1
  cases hk : (channelAt i).kind with
  | gt =>
    have he : GTComparison.univGTHeadErrQ ≤ (1494118 / 10 ^ 12 : ℚ) := by decide +kernel
    have hε : (GTComparison.univGTHeadErrQ : ℝ) ≤ 1494118 / 10 ^ 12 := by
      simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using (Rat.cast_le (K := ℝ)).2 he
    have hμ := LinearTail.first_energy_lower (N := 501) (by decide) hGT hε
    simp only [channelSequence, LinearTail.linearLower, hk, Rat.cast_mul]
    rw [LinearTail.bivar_zero _ _ (auxiliary_zero (channelAt_mem i) hk) GTComparison.actualEG
      (energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hu ↦ GT_rot2 hu u)), coeff_ofListQ]
    exact mul_le_mul_of_nonneg_right hμ hP
  | phase =>
    simp only [channelSequence, LinearTail.linearLower, hk, Rat.cast_mul]
    rw [LinearTail.bivar_zero _ _ (by simp) _
      (energy_eq_zero_of_even memLp_phase2 (fun _ u hu ↦ phase2_rot2 hu u)), coeff_ofListQ]
    exact mul_le_mul_of_nonneg_right phase_first_lower hP
  | tiger => exact (ht hk).elim

/-- Deduct the squared linear coefficient on every GT or phase channel. -/
theorem channel_tail_ceiling
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ))
    (i : Fin 18) (hchecks : analyticChecks i = true) :
    ∑' n, |channelSequence (channelAt i) (n + 251)| ≤ (LinearTail.ceiling i : ℝ) := by
  obtain ⟨_, hL, hT, hnum, hcell⟩ := LinearTail.estimates_checked i
  by_cases ht : (channelAt i).kind = .tiger
  · rw [hcell ht]
    exact channel_tail i hchecks
  · apply channel_tail_after_linear (K := 250) (by exact_mod_cast (numerical i).1)
      (Rat.cast_nonneg.mpr hL) (channel_linear_lower hGT i ht) (hardy i hchecks)
      (Rat.cast_nonneg.mpr hT)
    simpa only [Rat.cast_div, Rat.cast_sub, Rat.cast_mul, Rat.cast_pow, Rat.cast_inv,
      Rat.cast_one, Rat.cast_ofNat] using (Rat.cast_le (K := ℝ)).2 hnum

end

end Grothe.UpperReplacement.TailSound
