-- Grothe/UpperChaos/HardyGaussianSound.lean
import Grothe.UpperChaos.HardyArcSound
import Grothe.UpperChaos.HardyArcCircle
import Grothe.UpperChaos.HardyGaussianCheck
import Grothe.UpperChaos.GaussianPair

/-!
# The fixed-amplitude Gaussian bound on the complete Hardy circle

The new finite check retains the same covariance, radius and Gaussian reference
measure. Its denominator is the exact Gaussian-amplitude integral.

Agent-ID: codex-9b17. Refs #380.
-/

namespace Grothe.UpperChaos.HardyGaussianSound

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper
open HardyArcSound HardyArcCover HardyArcCircle SchurMain SchurKernel Sym2R

noncomputable section

/-- Denominator of the squared fixed-amplitude Gaussian bound. -/
def denominator (R : Sym2C) (j : ℝ) : ℝ :=
  16 * j ^ 2 * ‖R.detIm‖ ^ 2 * (Z (Bj R j)).det *
    (GaussianAmplitude.shifted (T (Bj R j) R.Cmat) j).det *
    (GaussianAmplitude.shifted
      (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det

private lemma shifted_eq_add (A : Sym2R) (j : ℝ) :
    GaussianAmplitude.shifted A j = add A ⟨j, 0, j⟩ := by
  simp [GaussianAmplitude.shifted, add]

/-- The pointwise matrix gates and numerical bound needed by the analytic estimate. -/
def Bound (t : ℂ) : Prop :=
  (Z (Bj (Rt t) (jQ : ℝ))).PD ∧
    (T (Bj (Rt t) (jQ : ℝ)) (Rt t).Cmat).PD ∧
      1 / denominator (Rt t) (jQ : ℝ) ≤ 5 / 4

theorem box_sound {R : Sym2C} {RI : SC} {j : ℝ} {jI : Ival}
    (hR : memSC R RI) (hj : mem j jI)
    (hc : HardyGaussianCheck.boxOK jI RI = true) :
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧ 1 / denominator R j ≤ 5 / 4 := by
  rw [HardyGaussianCheck.boxOK_eq_spec] at hc
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨⟨⟨⟨hp1, hp2⟩, hZg⟩, hTg⟩, hcap⟩ := hc
  have hdp := memC_dpm hR false
  have hdm := memC_dpm hR true
  rw [sig_false] at hdp
  rw [sig_true] at hdm
  have hdp0 : dpm R 1 ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdp) hp1
    simp [h0] at this
  have hdm0 : dpm R (-1) ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdm) hp2
    simp [h0] at this
  have hGp := memSR_gpm hR hj false hp1
  have hGm := memSR_gpm hR hj true hp2
  rw [sig_false] at hGp
  rw [sig_true] at hGm
  have hZ : memSR (zR R j) (zOf jI RI) := memSR_smul mem_half (memSR_add hGp hGm)
  have hCr : memSR (crR R j) (crOf jI RI) :=
    memSR_smul mem_half (memSR_add hGp (memSR_smul mem_neg_one hGm))
  have hIp := memSC_invIm hR false hp1
  have hIm := memSC_invIm hR true hp2
  rw [sig_false] at hIp
  rw [sig_true] at hIm
  have hCi : memSR (ciR R) (ciOf RI) :=
    memSR_smul mem_half (memSR_add (memSR_im hIp) (memSR_smul mem_neg_one (memSR_im hIm)))
  have hZPD : (zR R j).PD := PD_of_gate hZ hZg
  have hZd : posI (zOf jI RI).det = true := by
    simp only [SR.PD, Bool.and_eq_true] at hZg
    exact hZg.2
  have hZi : memSR (smul (zR R j).det⁻¹ (zR R j).adj) (ziOf jI RI) :=
    memSR_smul (mem_invPosI (mem_det hZ) hZd) (memSR_adj hZ)
  have hP := memM2_mul (memM2_mul (memM2_ofS hGm) (memM2_ofS hZi)) (memM2_ofS hGp)
  rw [gpm_minus, gpm_plus] at hP
  obtain ⟨eA, eB, eD⟩ := prod_eq_T (zR R j) (crR R j) hZPD.2.ne'
  set Tr := add (zR R j)
    (smul (-1) (smul (zR R j).det⁻¹ (sand (crR R j) (zR R j).adj))) with hTr
  have hT : memSR Tr (tOf jI RI) := by
    refine ⟨?_, ?_, ?_⟩
    · rw [← eA]; exact hP.1
    · rw [← eB]; exact hP.2.1
    · rw [← eD]; exact hP.2.2.2
  have hTeq : T (Bj R j) R.Cmat = Tr := by
    simp only [T, Kr]
    rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0]
  set Er := smul (1 / 2)
    (add (sand (crR R j) (smul (zR R j).det⁻¹ (zR R j).adj))
      (sand (ciR R) (smul (zR R j).det⁻¹ (zR R j).adj))) with hEr
  have hE : memSR Er (eOf jI RI) :=
    memSR_smul mem_half (memSR_add (memSR_sand hCr hZi) (memSR_sand hCi hZi))
  have hEeq : E (Bj R j) R.Cmat = Er := by
    simp only [E, Kr, Ki, hEr, sand_smul]
    rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0, im_Cmat_eq hdp0 hdm0]
  have hJ : memSR (⟨j, 0, j⟩ : Sym2R) (⟨jI, zeroI, jI⟩ : SR) := ⟨hj, mem_zero, hj⟩
  have hTJ := memSR_add hT hJ
  have hTEJ := memSR_add (memSR_add hT (memSR_smul (mem_intI 2) hE)) hJ
  have hden : mem (denominator R j) (HardyGaussianCheck.denOf jI RI) := by
    have hm := mem_mul
      (mem_mul (mem_mul (mem_mul (mem_intI 16) (mem_mul hj hj))
        (mem_mul (mem_normSq hdp) (mem_normSq hdm))) (mem_det hZ))
      (mem_mul (mem_det hTJ) (mem_det hTEJ))
    rw [denominator, normSq_detIm]
    simpa only [HardyGaussianCheck.denOf, ndOf, shifted_eq_add, hTeq, hEeq,
      Z_Bj_eq hdp0 hdm0, sq, Int.cast_ofNat, mul_assoc] using hm
  have hcapR : (4 : ℝ) * D ≤ 5 * (HardyGaussianCheck.denOf jI RI).lo := by
    exact_mod_cast hcap
  have hD := D_pos
  have hdenLower : (4 / 5 : ℝ) ≤ denominator R j := by
    apply (mul_le_mul_iff_left₀ hD).mp
    nlinarith [hden.1]
  refine ⟨?_, ?_, ?_⟩
  · rw [Z_Bj_eq hdp0 hdm0]; exact hZPD
  · rw [hTeq]; exact PD_of_gate hT hTg
  · apply (div_le_iff₀ (by linarith : 0 < denominator R j)).2
    linarith

theorem leaf_sound {neg : Bool} {lo hi : ℤ} {τ : ℝ}
    (hτ : mem τ ⟨lo, hi⟩) (hc : HardyGaussianCheck.leafOK neg lo hi = true) :
    Bound (chartPt (rhoQ : ℝ) neg τ) := by
  simp only [HardyGaussianCheck.leafOK, Bool.and_eq_true] at hc
  exact box_sound (memSC_Rbox (memC_circleBox (mem_ofRatI rhoQ) hτ hc.1 neg))
    (mem_ofRatI jQ) hc.2

theorem cover_sound (neg : Bool) (depth : ℕ) (lo hi : ℤ) {τ : ℝ}
    (hτ : mem τ ⟨lo, hi⟩) (hc : HardyGaussianCheck.coverOK neg depth lo hi = true) :
    Bound (chartPt (rhoQ : ℝ) neg τ) := by
  induction depth generalizing lo hi with
  | zero => exact leaf_sound hτ hc
  | succ depth ih =>
    simp only [HardyGaussianCheck.coverOK, Bool.or_eq_true, Bool.and_eq_true] at hc
    rcases hc with hc | ⟨hl, hr⟩
    · exact leaf_sound hτ hc
    · by_cases hm : τ * D ≤ (((lo + hi) / 2 : ℤ) : ℝ)
      · exact ih lo ((lo + hi) / 2) ⟨hτ.1, hm⟩ hl
      · exact ih ((lo + hi) / 2) hi ⟨(le_of_not_ge hm), hτ.2⟩ hr

end

end Grothe.UpperChaos.HardyGaussianSound
