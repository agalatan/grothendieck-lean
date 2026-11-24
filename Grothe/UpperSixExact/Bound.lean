import Grothe.UpperSixExact.Head
import Grothe.UpperSixExact.Contour
import Grothe.UpperSix.Haagerup.CellOverlap
import Grothe.UpperSix.Haagerup.TaylorHardySound
import Grothe.UpperSix.Haagerup.ContourChecks.Channel1
import Grothe.UpperSix.Haagerup.ContourChecks.Channel2
import Grothe.UpperSix.Haagerup.ContourChecks.Channel3
import Grothe.UpperSix.Haagerup.ContourChecks.Channel4
import Grothe.UpperSix.Haagerup.ContourChecks.Channel5

set_option warningAsError true

/-!
# Six-channel transfer after subtracting the certified linear energy

The channel realization, interval soundness and Gaussian contour estimates use the article
library by gemini-21d5. The head verifies the six linear floors, so the remaining Hardy
budget only pays for the nonlinear coefficients.

Agent-ID: codex-a7c4
-/

namespace Haagerup.SixChannelExact

open Finset Polynomial MeasureTheory
open HaagerupKernel HaagerupKernel.Cell HaagerupKernel.Hardy Haagerup.Data

private theorem tails_rat_ok :
    (List.finRange 6).all (fun p =>
      decide (((circleBudget p - linearFloor p ^ 2 * rhoQ p ^ 2) / rhoQ p ^ 4) *
        (rhoQ p)⁻¹ ^ 1002 ≤ tailCap p ^ 2 * (1 - (rhoQ p)⁻¹ ^ 4))) = true := by
  decide +kernel

/-! ### The six analytic kernels -/

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
    (((circleBudget p : ℝ) - (linearFloor p : ℝ) ^ 2 * (rhoQ p : ℝ) ^ 2) / (rhoQ p : ℝ) ^ 4) *
      (rhoQ p : ℝ)⁻¹ ^ 1002 ≤ (tailCap p : ℝ) ^ 2 * (1 - (rhoQ p : ℝ)⁻¹ ^ 4) := by
  have hall := List.all_eq_true.1 tails_rat_ok p (List.mem_finRange p)
  have q := (Rat.cast_le (K := ℝ)).2 (of_decide_eq_true hall)
  simpa only [Rat.cast_mul, Rat.cast_pow, Rat.cast_inv, Rat.cast_div, Rat.cast_sub, Rat.cast_one] using q

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
  | 0 => bivarKernel (ofListQ firstPolynomial) (ofListQ q0Q) (energy gSmoothedLp)
  | 1 => bivarKernel (ofListQ p1Q) (ofListQ q1Q) (energy gSmoothedLp)
  | 2 => bivarKernel (ofListQ p2Q) (ofListQ []) (energy (memLp_phase2.toLp phase2))
  | 3 => bivarKernel (ofListQ (r3Q.map (- ·))) (ofListQ r3Q) (energy gTigLp)
  | 4 => bivarKernel (ofListQ (r4Q.map (- ·))) (ofListQ r4Q) (energy gTigLp)
  | 5 => bivarKernel (ofListQ p5Q) (ofListQ q5Q) (energy gSmoothedLp)

private lemma hdQ : ctQ ^ 2 + stQ ^ 2 = 1 := by norm_num [ctQ, stQ]
private lemma heQ : seQ ^ 2 + ceQ ^ 2 = 1 := by norm_num [seQ, ceQ]

private lemma gSmoothedLp_eq_nat :
    gSmoothedLp = (memLp_smoothMap ((23187 : ℝ) / 24245) ((7084 : ℝ) / 24245)
      ((87841 : ℝ) / 98209) ((43920 : ℝ) / 98209)
      (measurable_cellFn tcellCreArr tcellCimArr) (norm_cellFn_le tcell_sos_ok)).toLp
      (smoothMap ((23187 : ℝ) / 24245) ((7084 : ℝ) / 24245)
        ((87841 : ℝ) / 98209) ((43920 : ℝ) / 98209) fTCell) := by
  have hct : (ctQ : ℝ) = (23187 : ℝ) / 24245 := by norm_num [ctQ]
  have hst : (stQ : ℝ) = (7084 : ℝ) / 24245 := by norm_num [stQ]
  have hse : (seQ : ℝ) = (87841 : ℝ) / 98209 := by norm_num [seQ]
  have hce : (ceQ : ℝ) = (43920 : ℝ) / 98209 := by norm_num [ceQ]
  refine toLp_congr_fn memLp_fSmoothed _ ?_
  unfold fSmoothed
  rw [hct, hst, hse, hce]

private lemma hp0 : l1 (ofListQ firstPolynomial) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)
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

private lemma hChan_mem (p : Fin 6) (n : ℕ) (hn : n < 251) :
    mem (hChan p n) ((headIntervals p).getD n zeroI) := by
  have hdR : ((23187 : ℝ) / 24245) ^ 2 + ((7084 : ℝ) / 24245) ^ 2 = 1 := by norm_num
  have heR : ((87841 : ℝ) / 98209) ^ 2 + ((43920 : ℝ) / 98209) ^ 2 = 1 := by norm_num
  fin_cases p
  · dsimp only [hChan, headIntervals]
    rw [gSmoothedLp_eq_nat]
    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [q0Q, ofListQ])
      (memB_ofListQ firstPolynomial 251) (memB_ofListQ q0Q 251) n hn
  · dsimp only [hChan, headIntervals]
    rw [gSmoothedLp_eq_nat]
    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [q1Q, ofListQ])
      (memB_ofListQ p1Q 251) (memB_ofListQ q1Q 251) n hn
  · dsimp only [hChan, headIntervals]
    have heq : bivarKernel (ofListQ p2Q) (ofListQ []) (energy (memLp_phase2.toLp phase2)) n =
        bivarKernel (ofListQ p2Q) 0 (onedTable haagCoeff) n :=
      (phase_bivarKernel_eq (ofListQ p2Q) n).trans
        (bivarKernel_oned_eq_head (ofListQ p2Q) 0 haagCoeff (Nat.lt_succ_self n)).symm
    rw [heq]
    exact mem_bivarT_oned (Q := 0) (memB_ofListQ p2Q 251) haagCoeff
      (fun _ hk => mem_haagMuList hk) n hn
  · dsimp only [hChan, headIntervals, gTigLp, memLp_fTig, fTig]
    rw [ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ r3Q) n]
    exact mem_bivarT_oned (Q := 0) (memB_ofListQ r3Q 251) (muTigOf tigCreArr tigCimArr)
      (fun _ hk => mem_muTigOf tig_mu_ok hk) n hn
  · dsimp only [hChan, headIntervals, gTigLp, memLp_fTig, fTig]
    rw [ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ r4Q) n]
    exact mem_bivarT_oned (Q := 0) (memB_ofListQ r4Q 251) (muTigOf tigCreArr tigCimArr)
      (fun _ hk => mem_muTigOf tig_mu_ok hk) n hn
  · dsimp only [hChan, headIntervals]
    rw [gSmoothedLp_eq_nat]
    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [q5Q, ofListQ])
      (memB_ofListQ p5Q 251) (memB_ofListQ q5Q 251) n hn

/-- The first certified interval supplies the amount that can be debited from a circle budget. -/
private theorem lower_of_interval {x : ℝ} {I : Ival} {q : ℚ}
    (hm : Haagerup.mem x I) (h : ofRatHi q ≤ I.lo) : (q : ℝ) ≤ x := by
  have hh : (ofRatHi q : ℝ) ≤ I.lo := by exact_mod_cast h
  have hd : (0 : ℝ) < (D : ℝ) := by norm_num [D]
  exact (mul_le_mul_iff_left₀ hd).mp ((Haagerup.le_ofRatHi q).trans (hh.trans hm.1))

/-- A lower bound for the first coefficient sharpens the Hardy estimate at any cutoff. -/
private theorem tail_after_linear (h : ℕ → ℝ) (r B L T : ℝ) (K : ℕ) (hr : 1 < r)
    (hL : 0 ≤ L) (h0 : L ≤ h 0) (hT : 0 ≤ T)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B)
    (hcmp : ((B - L ^ 2 * r ^ 2) / r ^ 4) * r⁻¹ ^ (2 * (2 * K + 1)) ≤
      T ^ 2 * (1 - r⁻¹ ^ 4)) :
    ∑' n, |h (n + (K + 1))| ≤ T := by
  simpa only [Nat.add_assoc] using hardy_tail (fun n => h (n + 1)) r hr _
    (hardy_budget_after_linear h r B L (zero_lt_one.trans hr) hL h0 hB) K T hT hcmp

private lemma hChan_tail (p : Fin 6) :
    ∑' n, |hChan p (n + 251)| ≤ (tailCap p : ℝ) := by
  have hr1 : 1 < (rhoQ p : ℝ) := by fin_cases p <;> norm_num [rhoQ]
  have hT0 : 0 ≤ (tailCap p : ℝ) := by fin_cases p <;> norm_num [tailCap]
  have hL0 : 0 ≤ (linearFloor p : ℝ) := by fin_cases p <;> norm_num [linearFloor]
  have hchecked : ofRatHi (linearFloor p) ≤ ((headIntervals p).getD 0 zeroI).lo :=
    of_decide_eq_true (List.all_eq_true.1 (of_decide_eq_true head_and_floors_ok).2 p (List.mem_finRange p))
  have h0 := lower_of_interval (hChan_mem p 0 (by decide)) hchecked
  refine tail_after_linear (hChan p) (rhoQ p : ℝ) (circleBudget p : ℝ) (linearFloor p : ℝ)
    (tailCap p : ℝ) 250 hr1 hL0 h0 hT0 ?_ (tail_cmp_of_fin p)
  intro J
  fin_cases p
  · exact hardy_smoothed_channel hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp0 hq0 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [circleBudget, budgetQ, d6Q]) region_ok mean_ok J
  · exact hardy_smoothed_channel_tm hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp1 hq1 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [circleBudget, budgetQ, d6Q]) reg1_ok mean1_ok J
  · exact hardy_phase_channel_tm measurable_phase2 norm_phase2_le
      (fun _ u hc => phase2_rot2 hc u) memLp_phase2 hp2
      (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [circleBudget, budgetQ, d6Q]) reg2_ok mean2_ok J
  · exact hardy_anti_channel_tm (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hq3 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [circleBudget, budgetQ, d6Q]) reg3_ok mean3_ok J
  · exact hardy_anti_channel_tm (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hq4 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [circleBudget, budgetQ, d6Q]) reg4_ok mean4_ok J
  · exact hardy_smoothed_channel_tm hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp5 hq5 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ])
      (by norm_num [jCertQ]) (by norm_num [circleBudget, budgetQ, d6Q]) reg5_ok mean5_ok J

/-- Admissibility at the exact transfer endpoint. -/
private theorem transfer_bound : Statement.IsBound (1 / ((slope : ℝ) - (residual : ℝ))) := by
  have hw0 : ∀ p : Fin 6, 0 ≤ (wQ p : ℝ) := fun p => by fin_cases p <;> norm_num [wQ, d12Q]
  have hw1 : ∑ p : Fin 6, (wQ p : ℝ) = 1 := by
    rw [← Rat.cast_sum, show ∑ p : Fin 6, wQ p = 1 by decide +kernel, Rat.cast_one]
  have hδ : (headCap : ℝ) + ∑ p : Fin 6, (wQ p : ℝ) * (tailCap p : ℝ) ≤ (residual : ℝ) := by
    have hq : headCap + ∑ p : Fin 6, wQ p * tailCap p ≤ residual := by decide +kernel
    simpa only [Rat.cast_add, Rat.cast_sum, Rat.cast_mul] using (Rat.cast_le (K := ℝ)).2 hq
  have hδc : (residual : ℝ) < (slope : ℝ) := by norm_num [residual, slope]
  exact convex_transfer_ival (K := 250) hw0 hw1 hChan_summable hChan_dominated
      hChan_mem hChan_tail (of_decide_eq_true head_sum_ok) hδ hδc

/-- Admissibility for every finite complex matrix at the exact rational endpoint. -/
theorem isBound_exact :
    Statement.IsBound ((10 : ℝ) ^ 27 / 711968557929438692542239077) := by
  have hv : 1 / ((slope : ℝ) - (residual : ℝ)) = (10 : ℝ) ^ 27 / 711968557929438692542239077 := by
    norm_num [slope, residual]
  rw [← hv]
  exact transfer_bound

end

end Haagerup.SixChannelExact
