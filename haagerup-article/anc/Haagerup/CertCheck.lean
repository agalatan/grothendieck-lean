import Haagerup.CellOverlap
import Haagerup.HeadCheck
import Haagerup.FastHeadSound
import Haagerup.TaylorHardySound
import Haagerup.ContourChecks.Channel0
import Haagerup.ContourChecks.Channel1
import Haagerup.ContourChecks.Channel2
import Haagerup.ContourChecks.Channel3
import Haagerup.ContourChecks.Channel4
import Haagerup.ContourChecks.Channel5

set_option warningAsError true

/-!
# 6-Channel Certificate Verification (`K_G^ℂ ≤ 1.40455741`)

Combines:
* Channels 0, 1, 5: rotated Ornstein–Uhlenbeck smoothed `64 × 64 × 36` cell map `T_cell`
  (`tcell_sos_ok`, `tcell_rows_ok`);
* Channel 2: Haagerup's 1D phase rounding map `phase2` (`haagCoeff`);
* Channels 3, 4: antisymmetric `(-R, R)` channels on the `64 × 64 × 36` cell map `f_tig`
  (`tig_sos_ok`, `tig_mu_ok`);

with kernel-verified `K = 251` Kronecker-packed head convolution (`head_sum_ok`, `FastHeadSound`)
and kernel-verified Taylor-model Hardy circle-mean tail bounds (`reg0_ok`–`reg5_ok`,
`mean0_ok`–`mean5_ok`, `TaylorHardySound`) via `convex_transfer_head`, establishing
`isBound_cert : Statement.IsBound (140455741 / 100000000 : ℝ)`.

Agent-ID: gemini-21d5, gemini-1aa9
-/

namespace Haagerup

open Finset Polynomial MeasureTheory
open HaagerupKernel HaagerupKernel.Cell Haagerup.Data

/-! ### 1. Rational certificate parameters -/

private theorem tails_rat_ok :
    (List.finRange 6).all (fun p =>
      decide (budgetQ p * (rhoQ p)⁻¹ ^ 1006 ≤ tailQ p ^ 2 * (1 - (rhoQ p)⁻¹ ^ 4))) = true := by
  decide +kernel

/-! ### 2. Analytic channel assembly and `isBound_cert` -/

noncomputable section

private lemma ofListQ_map_neg : ∀ l : List ℚ, ofListQ (l.map (- ·)) = -ofListQ l
  | [] => by simp [ofListQ]
  | a :: l => by
    simp only [List.map_cons, ofListQ, ofListQ_map_neg l, Rat.cast_neg, map_neg, mul_neg]
    ring

private lemma l1_ofListQ_le_one {l : List ℚ}
    (h : decide ((l.map fun q => |q|).sum ≤ 1) = true) :
    l1 (ofListQ l) ≤ 1 :=
  (l1_ofListQ_le l).trans (by simpa only [Rat.cast_one] using Rat.cast_le.2 (of_decide_eq_true h))

private lemma tail_cmp_of_fin (p : Fin 6) :
    (budgetQ p : ℝ) * (rhoQ p : ℝ)⁻¹ ^ (2 * (2 * 251 + 1)) ≤
      (tailQ p : ℝ) ^ 2 * (1 - (rhoQ p : ℝ)⁻¹ ^ 4) := by
  have hall := List.all_eq_true.1 tails_rat_ok p (List.mem_finRange p)
  have hq : ((budgetQ p * (rhoQ p)⁻¹ ^ 1006 : ℚ) : ℝ) ≤
      ((tailQ p ^ 2 * (1 - (rhoQ p)⁻¹ ^ 4) : ℚ) : ℝ) :=
    Rat.cast_le.2 (of_decide_eq_true hall)
  simpa only [show 2 * (2 * 251 + 1) = 1006 from rfl,
    Rat.cast_mul, Rat.cast_pow, Rat.cast_inv, Rat.cast_sub, Rat.cast_one] using hq

private lemma toLp_congr_fn {F₁ F₂ : ℂ × ℂ → ℂ} (h₁ : MemLp F₁ 2 mu2) (h₂ : MemLp F₂ 2 mu2)
    (heq : F₁ = F₂) : h₁.toLp F₁ = h₂.toLp F₂ := by
  subst heq; rfl

private def fTCell : ℂ × ℂ → ℂ := cellFn tcellCreArr tcellCimArr

private def fSmoothed : ℂ × ℂ → ℂ :=
  smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) fTCell

private lemma memLp_fSmoothed : MemLp fSmoothed 2 mu2 :=
  memLp_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)
    (measurable_cellFn tcellCreArr tcellCimArr) (norm_cellFn_le tcell_sos_ok)

private def gSmoothedLp : Lp ℂ 2 mu2 := memLp_fSmoothed.toLp fSmoothed

private def fTig : ℂ × ℂ → ℂ := cellFn tigCreArr tigCimArr

private lemma memLp_fTig : MemLp fTig 2 mu2 := memLp_cellFn tig_sos_ok

private def gTigLp : Lp ℂ 2 mu2 := memLp_fTig.toLp fTig

private def hChan : Fin 6 → ℕ → ℝ
  | 0 => bivarKernel (ofListQ p0Q) (ofListQ q0Q) (energy gSmoothedLp)
  | 1 => bivarKernel (ofListQ p1Q) (ofListQ q1Q) (energy gSmoothedLp)
  | 2 => bivarKernel (ofListQ p2Q) (ofListQ []) (energy (memLp_phase2.toLp phase2))
  | 3 => bivarKernel (ofListQ (r3Q.map (- ·))) (ofListQ r3Q) (energy gTigLp)
  | 4 => bivarKernel (ofListQ (r4Q.map (- ·))) (ofListQ r4Q) (energy gTigLp)
  | 5 => bivarKernel (ofListQ p5Q) (ofListQ q5Q) (energy gSmoothedLp)

private lemma hdQ : ctQ ^ 2 + stQ ^ 2 = 1 := by norm_num [ctQ, stQ]
private lemma heQ : seQ ^ 2 + ceQ ^ 2 = 1 := by norm_num [seQ, ceQ]

private lemma gSmoothedLp_eq_nat :
    gSmoothedLp = (memLp_smoothMap (((23187 : ℕ) : ℝ) / (24245 : ℕ)) (((7084 : ℕ) : ℝ) / (24245 : ℕ))
      (((87841 : ℕ) : ℝ) / (98209 : ℕ)) (((43920 : ℕ) : ℝ) / (98209 : ℕ))
      (measurable_cellFn tcellCreArr tcellCimArr) (norm_cellFn_le tcell_sos_ok)).toLp
      (smoothMap (((23187 : ℕ) : ℝ) / (24245 : ℕ)) (((7084 : ℕ) : ℝ) / (24245 : ℕ))
        (((87841 : ℕ) : ℝ) / (98209 : ℕ)) (((43920 : ℕ) : ℝ) / (98209 : ℕ))
        (cellFn tcellCreArr tcellCimArr)) := by
  have hct : (ctQ : ℝ) = ((23187 : ℕ) : ℝ) / (24245 : ℕ) := by norm_num [ctQ]
  have hst : (stQ : ℝ) = ((7084 : ℕ) : ℝ) / (24245 : ℕ) := by norm_num [stQ]
  have hse : (seQ : ℝ) = ((87841 : ℕ) : ℝ) / (98209 : ℕ) := by norm_num [seQ]
  have hce : (ceQ : ℝ) = ((43920 : ℕ) : ℝ) / (98209 : ℕ) := by norm_num [ceQ]
  refine toLp_congr_fn memLp_fSmoothed _ ?_
  unfold fSmoothed fTCell
  rw [hct, hst, hse, hce]

private lemma hp0 : l1 (ofListQ p0Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hq0 : l1 (ofListQ q0Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hp1 : l1 (ofListQ p1Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hq1 : l1 (ofListQ q1Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hp2 : l1 (ofListQ p2Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hq_nil : l1 (ofListQ []) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hp3 : l1 (ofListQ (r3Q.map (- ·))) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hq3 : l1 (ofListQ r3Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hp4 : l1 (ofListQ (r4Q.map (- ·))) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hq4 : l1 (ofListQ r4Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hp5 : l1 (ofListQ p5Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
private lemma hq5 : l1 (ofListQ q5Q) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)

private lemma sparsePoly_p0 : sparsePoly p0Sparse d0Sparse = ofListQ p0Q := by
  simp only [sparsePoly, p0Sparse, d0Sparse, ofListQ, p0Q, List.map, List.sum_cons, List.sum_nil,
    ← Polynomial.C_mul_X_pow_eq_monomial, Rat.cast_div, Rat.cast_neg, Rat.cast_ofNat, Int.cast_neg,
    Int.cast_ofNat, Nat.cast_ofNat]
  ring

private lemma sparsePoly_p1 : sparsePoly p1Sparse d1Sparse = ofListQ p1Q := by
  simp only [sparsePoly, p1Sparse, d1Sparse, ofListQ, p1Q, List.map, List.sum_cons, List.sum_nil,
    ← Polynomial.C_mul_X_pow_eq_monomial, Rat.cast_div, Rat.cast_neg, Rat.cast_ofNat, Rat.cast_one,
    Int.cast_neg, Int.cast_ofNat, Int.cast_one, Nat.cast_ofNat]
  ring

private lemma sparsePoly_p2 : sparsePoly p2Sparse d12Sparse = ofListQ p2Q := by
  simp only [sparsePoly, p2Sparse, d12Sparse, ofListQ, p2Q, d12Q, List.map, List.sum_cons,
    List.sum_nil, ← Polynomial.C_mul_X_pow_eq_monomial, Rat.cast_div, Rat.cast_neg, Rat.cast_ofNat,
    Rat.cast_zero, Int.cast_neg, Int.cast_ofNat, Nat.cast_ofNat, map_zero]
  ring

private lemma sparsePoly_r3 : sparsePoly r3Sparse d12Sparse = ofListQ r3Q := by
  simp only [sparsePoly, r3Sparse, d12Sparse, ofListQ, r3Q, d12Q, List.map, List.sum_cons,
    List.sum_nil, ← Polynomial.C_mul_X_pow_eq_monomial, Rat.cast_div, Rat.cast_neg, Rat.cast_ofNat,
    Int.cast_neg, Int.cast_ofNat, Nat.cast_ofNat]
  ring

private lemma sparsePoly_r4 : sparsePoly r4Sparse d12Sparse = ofListQ r4Q := by
  simp only [sparsePoly, r4Sparse, d12Sparse, ofListQ, r4Q, d12Q, List.map, List.sum_cons,
    List.sum_nil, ← Polynomial.C_mul_X_pow_eq_monomial, Rat.cast_div, Rat.cast_neg, Rat.cast_ofNat,
    Int.cast_neg, Int.cast_ofNat, Nat.cast_ofNat]
  ring

private lemma sparsePoly_p5 : sparsePoly p5Sparse d12Sparse = ofListQ p5Q := by
  simp only [sparsePoly, p5Sparse, d12Sparse, ofListQ, p5Q, d12Q, List.map, List.sum_cons,
    List.sum_nil, ← Polynomial.C_mul_X_pow_eq_monomial, Rat.cast_div, Rat.cast_neg, Rat.cast_ofNat,
    Rat.cast_zero, Int.cast_neg, Int.cast_ofNat, Nat.cast_ofNat, map_zero]
  ring

private lemma ofListQ_q0 : ofListQ q0Q = -Polynomial.X := by simp [q0Q, ofListQ]
private lemma ofListQ_q1 : ofListQ q1Q = -Polynomial.X := by simp [q1Q, ofListQ]
private lemma ofListQ_q5 : ofListQ q5Q = -Polynomial.X := by simp [q5Q, ofListQ]

private lemma hChan_summable (p : Fin 6) : Summable fun n => |hChan p n| := by
  fin_cases p
  · exact summable_abs_bivarKernel _ _ hp0 hq0 _ (summable_abs_energy gSmoothedLp)
  · exact summable_abs_bivarKernel _ _ hp1 hq1 _ (summable_abs_energy gSmoothedLp)
  · exact summable_abs_bivarKernel _ _ hp2 hq_nil _ (summable_abs_energy (memLp_phase2.toLp phase2))
  · exact summable_abs_bivarKernel _ _ hp3 hq3 _ (summable_abs_energy gTigLp)
  · exact summable_abs_bivarKernel _ _ hp4 hq4 _ (summable_abs_energy gTigLp)
  · exact summable_abs_bivarKernel _ _ hp5 hq5 _ (summable_abs_energy gSmoothedLp)

private lemma hChan_dominated (p : Fin 6) : DominatedKernel (radialKernel (hChan p)) := by
  have hsm_m := measurable_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)
    (measurable_cellFn tcellCreArr tcellCimArr)
  have hsm_1 := norm_smoothMap_le (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)
    (norm_cellFn_le tcell_sos_ok)
  have hsm_rot : ∀ c x, ‖c‖ = 1 → fSmoothed (rot2 c x) = c * fSmoothed x :=
    fun c x hc => smoothMap_rot2 (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)
      (fun _ v hc' => cellFn_rot2 tcellCreArr tcellCimArr hc' v) hc x
  fin_cases p
  · exact (rounding_diskKernel hsm_m hsm_1 hsm_rot memLp_fSmoothed hp0 hq0).dominated
  · exact (rounding_diskKernel hsm_m hsm_1 hsm_rot memLp_fSmoothed hp1 hq1).dominated
  · exact (rounding_diskKernel measurable_phase2 norm_phase2_le
      (fun _ u hc => phase2_rot2 hc u) memLp_phase2 hp2 hq_nil).dominated
  · exact (rounding_diskKernel (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hp3 hq3).dominated
  · exact (rounding_diskKernel (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hp4 hq4).dominated
  · exact (rounding_diskKernel hsm_m hsm_1 hsm_rot memLp_fSmoothed hp5 hq5).dominated

private lemma hHead_res :
    ∑ n ∈ range 251, |(∑ p : Fin 6, (wQ p : ℝ) * hChan p n) -
      (if n = 0 then (cCertQ : ℝ) else 0)| ≤ (headCapCertQ : ℝ) := by
  have hdR : ((23187 : ℝ) / 24245) ^ 2 + ((7084 : ℝ) / 24245) ^ 2 = 1 := by norm_num
  have heR : ((87841 : ℝ) / 98209) ^ 2 + ((43920 : ℝ) / 98209) ^ 2 = 1 := by norm_num
  obtain ⟨hpar, _, _, _, hrow⟩ := smoothedRowsCheck_table_sound tcell_sos_ok hdR heR tcell_rows_ok
  rw [← gSmoothedLp_eq_nat] at hpar hrow
  have hc_eq : ((cCertNum : ℝ) / (d12Sparse : ℝ)) = (cCertQ : ℝ) := by
    norm_num [cCertNum, d12Sparse, cCertQ, d12Q]
  have hcap_eq : ((headCapNum : ℝ) / (d12Sparse : ℝ)) = (headCapCertQ : ℝ) := by
    norm_num [headCapNum, d12Sparse, headCapCertQ, d12Q]
  rw [← hc_eq, ← hcap_eq]
  refine head_residual_of_fastHeadOK head_sum_ok hpar
    (fun r hr e he => ((hrow r hr).2 e he).2)
    (fun k hk => mem_muTigOf tig_mu_ok hk)
    ⟨by norm_num [wQ, w0Sparse, d12Sparse, d12Q],
     by norm_num [wQ, w1Sparse, d12Sparse, d12Q],
     by norm_num [wQ, w2Sparse, d12Sparse, d12Q],
     by norm_num [wQ, w3Sparse, d12Sparse, d12Q],
     by norm_num [wQ, w4Sparse, d12Sparse, d12Q],
     by norm_num [wQ, w5Sparse, d12Sparse, d12Q]⟩
    (fun n _ => by dsimp only [hChan]; rw [sparsePoly_p0, ofListQ_q0])
    (fun n _ => by dsimp only [hChan]; rw [sparsePoly_p1, ofListQ_q1])
    (fun n _ => by
      dsimp only [hChan]
      rw [sparsePoly_p2, show ofListQ [] = 0 from rfl]
      exact (phase_bivarKernel_eq (ofListQ p2Q) n).trans
        (bivarKernel_oned_eq_head (ofListQ p2Q) 0 haagCoeff (Nat.lt_succ_self n)).symm)
    (fun n _ => by
      dsimp only [hChan, gTigLp, memLp_fTig, fTig]
      rw [sparsePoly_r3, ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ r3Q) n])
    (fun n _ => by
      dsimp only [hChan, gTigLp, memLp_fTig, fTig]
      rw [sparsePoly_r4, ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ r4Q) n])
    (fun n _ => by dsimp only [hChan]; rw [sparsePoly_p5, ofListQ_q5])

private lemma hChan_tail (p : Fin 6) :
    ∑' n, |hChan p (n + 251)| ≤ (tailQ p : ℝ) := by
  have hr1 : 1 < (rhoQ p : ℝ) := by fin_cases p <;> norm_num [rhoQ]
  have hT0 : 0 ≤ (tailQ p : ℝ) := by fin_cases p <;> norm_num [tailQ, d12Q]
  refine hardy_tail (hChan p) (rhoQ p : ℝ) hr1 (budgetQ p : ℝ) ?_ 251 (tailQ p : ℝ) hT0
    (tail_cmp_of_fin p)
  intro J
  fin_cases p
  · exact hardy_smoothed_channel_tm hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp0 hq0 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg0_ok mean0_ok J
  · exact hardy_smoothed_channel_tm hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp1 hq1 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg1_ok mean1_ok J
  · exact hardy_phase_channel_tm measurable_phase2 norm_phase2_le
      (fun _ u hc => phase2_rot2 hc u) memLp_phase2 hp2
      (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg2_ok mean2_ok J
  · exact hardy_anti_channel_tm (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hq3 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg3_ok mean3_ok J
  · exact hardy_anti_channel_tm (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hq4 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg4_ok mean4_ok J
  · exact hardy_smoothed_channel_tm hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp5 hq5 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg5_ok mean5_ok J

/-- **Certified upper bound**: `K_G^ℂ ≤ 1.40455741`. -/
theorem isBound_cert : Statement.IsBound (140455741 / 100000000 : ℝ) := by
  have hw0 : ∀ p : Fin 6, 0 ≤ (wQ p : ℝ) := fun p => by fin_cases p <;> norm_num [wQ, d12Q]
  have hw1 : ∑ p : Fin 6, (wQ p : ℝ) = 1 := by
    rw [← Rat.cast_sum, show ∑ p : Fin 6, wQ p = 1 by decide +kernel, Rat.cast_one]
  have hδ : (headCapCertQ : ℝ) + ∑ p : Fin 6, (wQ p : ℝ) * (tailQ p : ℝ) ≤ (deltaCertQ : ℝ) := by
    have hq : headCapCertQ + ∑ p : Fin 6, wQ p * tailQ p ≤ deltaCertQ := by decide +kernel
    simpa only [Rat.cast_add, Rat.cast_sum, Rat.cast_mul] using (Rat.cast_le (K := ℝ)).2 hq
  have hδc : (deltaCertQ : ℝ) < (cCertQ : ℝ) := by norm_num [deltaCertQ, cCertQ, d12Q]
  have hB : Statement.IsBound (1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ))) :=
    convex_transfer_head (K := 250) hw0 hw1 hChan_summable hChan_dominated
      hHead_res hChan_tail hδ hδc
  have hle : 1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ)) ≤ (140455741 / 100000000 : ℝ) := by
    norm_num [cCertQ, deltaCertQ, d12Q]
  exact fun m n A => (hB m n A).trans (mul_le_mul_of_nonneg_right hle (Real.sSup_nonneg fun r ⟨_, _, _, _, hr⟩ => hr ▸ norm_nonneg _))

end

end Haagerup
