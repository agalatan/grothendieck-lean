import Grothe.UpperSix.Haagerup.CellOverlap
import Grothe.UpperSix.Haagerup.Data.TCellData
import Grothe.UpperSix.Haagerup.Data.TigerData
import Grothe.UpperSix.Haagerup.Data.OverlapData

set_option warningAsError true

/-!
# 6-Channel Certificate Verification (`K_G^ℂ ≤ 1.40457588`)

Combines:
* Channels 0, 1, 5: rotated Ornstein–Uhlenbeck smoothed `64 × 64 × 36` cell map `T_cell`
  (`tcell_sos_ok`, `tcell_rows_ok`);
* Channel 2: Haagerup's 1D phase rounding map `phase2` (`haagMuList 251`);
* Channels 3, 4: antisymmetric `(-R, R)` channels on the `64 × 64 × 36` cell map `f_tig`
  (`tig_sos_ok`, `tig_mu_ok`);

with `K = 251` exact interval head convolution (`bivarT`) and Hardy circle-mean tail bounds
(`regionOK`, `circleMeanOK`, `hardy_tail`) via `convex_transfer_ival`, establishing
`isBound_cert : Statement.IsBound (140457588 / 100000000 : ℝ)`.

Agent-ID: gemini-21d5
-/

namespace Haagerup

open Finset Polynomial MeasureTheory
open HaagerupKernel HaagerupKernel.Cell HaagerupKernel.Hardy Haagerup.Data

/-! ### 1. Rational certificate parameters -/

def d12Q : ℚ := 1000000000000
def d6Q : ℚ := 1000000

def ctQ : ℚ := 23187 / 24245
def stQ : ℚ := 7084 / 24245
def seQ : ℚ := 87841 / 98209
def ceQ : ℚ := 43920 / 98209

def wQ : Fin 6 → ℚ
  | 0 => 855656321685 / d12Q
  | 1 => 87304183672 / d12Q
  | 2 => 156229336 / d12Q
  | 3 => 117021055 / d12Q
  | 4 => 56415370682 / d12Q
  | 5 => 350873570 / d12Q

def p0Q : List ℚ := [991 / 1000, -9 / 1000]
def q0Q : List ℚ := [0, -1]

def p1Q : List ℚ := [99 / 100, -1 / 100]
def q1Q : List ℚ := [0, -1]

def p2Q : List ℚ := [
  91987193366 / d12Q, -494518221970 / d12Q, 403975324766 / d12Q, -99055436 / d12Q,
  0, 0, 0, -27080072 / d12Q, -217490491 / d12Q, -7730415 / d12Q,
  0, -10946266 / d12Q, 0, 475570792 / d12Q, 8681386426 / d12Q
]

def r3Q : List ℚ := [980543369477 / d12Q, -19456630523 / d12Q]
def r4Q : List ℚ := [930767036298 / d12Q, -69232963702 / d12Q]

def p5Q : List ℚ := [
  963782504048 / d12Q, -7609745775 / d12Q, 0, -26371854429 / d12Q,
  0, 0, 0, 0, 0, 0, 0, 0, 2235895748 / d12Q
]
def q5Q : List ℚ := [0, -1]

def rhoQ : Fin 6 → ℚ
  | 0 => 1037 / 1000
  | 1 => 1037 / 1000
  | 2 => 103 / 100
  | 3 => 207 / 200
  | 4 => 109 / 100
  | 5 => 1037 / 1000

def regRQ : Fin 6 → ℚ
  | 0 => 1038 / 1000
  | 1 => 4153 / 4000
  | 2 => 259 / 250
  | 3 => 259 / 250
  | 4 => 1091 / 1000
  | 5 => 4153 / 4000

def jCertQ : Fin 6 → ℚ
  | 0 => 1 / 4
  | 1 => 1 / 4
  | 2 => 1 / 5
  | 3 => 2 / 5
  | 4 => 2 / 5
  | 5 => 1 / 5

def budgetQ : Fin 6 → ℚ
  | 0 => 2528814 / d6Q
  | 1 => 2507841 / d6Q
  | 2 => 2919013 / d6Q
  | 3 => 1692090 / d6Q
  | 4 => 1658129 / d6Q
  | 5 => 3355048 / d6Q

def tailQ : Fin 6 → ℚ
  | 0 => 50024 / d12Q
  | 1 => 49816 / d12Q
  | 2 => 1785796 / d12Q
  | 3 => 110835 / d12Q
  | 4 => 3 / d12Q
  | 5 => 57619 / d12Q

def cCertQ : ℚ := 711974258589 / d12Q
def headCapCertQ : ℚ := 6157850 / d12Q
def deltaCertQ : ℚ := 621 / 100000000

def headICert : Fin 6 → List Ival
  | 0 => bivarT 251 tcellRows (p0Q.map ofRatI) (q0Q.map ofRatI) 501 167
  | 1 => bivarT 251 tcellRows (p1Q.map ofRatI) (q1Q.map ofRatI) 501 167
  | 2 => bivarT 251 (onedRowsI 251 (haagMuList 251)) (p2Q.map ofRatI) [] 503 0
  | 3 => bivarT 251 (onedRowsI 251 tigMuList) (r3Q.map ofRatI) [] 503 0
  | 4 => bivarT 251 (onedRowsI 251 tigMuList) (r4Q.map ofRatI) [] 503 0
  | 5 => bivarT 251 tcellRows (p5Q.map ofRatI) (q5Q.map ofRatI) 501 167

/-! ### 2. Native computational gates (`regionOK`, `circleMeanOK`, `tail_cmp`, `head_ok`) -/

set_option maxRecDepth 10000 in
private theorem reg0_ok : regionOK (smoothedRData ctQ stQ seQ p0Q q0Q) (regRQ 0) = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem reg1_ok : regionOK (smoothedRData ctQ stQ seQ p1Q q1Q) (regRQ 1) = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem reg2_ok : regionOK (unsmoothedRData p2Q []) (regRQ 2) = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem reg3_ok : regionOK (unsmoothedRData (r3Q.map (- ·)) r3Q) (regRQ 3) = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem reg4_ok : regionOK (unsmoothedRData (r4Q.map (- ·)) r4Q) (regRQ 4) = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem reg5_ok : regionOK (smoothedRData ctQ stQ seQ p5Q q5Q) (regRQ 5) = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem mean0_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ p0Q q0Q) (rhoQ 0) (jCertQ 0) (budgetQ 0) 16 = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem mean1_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ p1Q q1Q) (rhoQ 1) (jCertQ 1) (budgetQ 1) 16 = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem mean2_ok :
    circleMeanOK (unsmoothedRData p2Q []) (rhoQ 2) (jCertQ 2) (budgetQ 2) 16 = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem mean3_ok :
    circleMeanOK (unsmoothedRData (r3Q.map (- ·)) r3Q) (rhoQ 3) (jCertQ 3) (budgetQ 3) 12 = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem mean4_ok :
    circleMeanOK (unsmoothedRData (r4Q.map (- ·)) r4Q) (rhoQ 4) (jCertQ 4) (budgetQ 4) 12 = true := by
  native_decide

set_option maxRecDepth 10000 in
private theorem mean5_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ p5Q q5Q) (rhoQ 5) (jCertQ 5) (budgetQ 5) 16 = true := by
  native_decide

private theorem tails_rat_ok :
    (List.finRange 6).all (fun p =>
      decide (budgetQ p * (rhoQ p)⁻¹ ^ 1006 ≤ tailQ p ^ 2 * (1 - (rhoQ p)⁻¹ ^ 4))) = true := by
  decide +kernel

set_option maxRecDepth 10000 in
private theorem head_sum_ok :
    decide (absSum (addL (sumL ((List.finRange 6).map fun p =>
      (headICert p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI cCertQ)]) ≤
      ofRatLo headCapCertQ) = true := by
  native_decide

/-! ### 3. Analytic channel assembly and `isBound_cert` -/

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
    mem (hChan p n) ((headICert p).getD n zeroI) := by
  have hdR : ((23187 : ℝ) / 24245) ^ 2 + ((7084 : ℝ) / 24245) ^ 2 = 1 := by norm_num
  have heR : ((87841 : ℝ) / 98209) ^ 2 + ((43920 : ℝ) / 98209) ^ 2 = 1 := by norm_num
  fin_cases p
  · dsimp only [hChan, headICert]
    rw [gSmoothedLp_eq_nat]
    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [q0Q, ofListQ])
      (memB_ofListQ p0Q 251) (memB_ofListQ q0Q 251) n hn
  · dsimp only [hChan, headICert]
    rw [gSmoothedLp_eq_nat]
    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [q1Q, ofListQ])
      (memB_ofListQ p1Q 251) (memB_ofListQ q1Q 251) n hn
  · dsimp only [hChan, headICert]
    have heq : bivarKernel (ofListQ p2Q) (ofListQ []) (energy (memLp_phase2.toLp phase2)) n =
        bivarKernel (ofListQ p2Q) 0 (onedTable haagCoeff) n :=
      (phase_bivarKernel_eq (ofListQ p2Q) n).trans
        (bivarKernel_oned_eq_head (ofListQ p2Q) 0 haagCoeff (Nat.lt_succ_self n)).symm
    rw [heq]
    exact mem_bivarT_oned (Q := 0) (memB_ofListQ p2Q 251) haagCoeff
      (fun _ hk => mem_haagMuList hk) n hn
  · dsimp only [hChan, headICert, gTigLp, memLp_fTig, fTig]
    rw [ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ r3Q) n]
    exact mem_bivarT_oned (Q := 0) (memB_ofListQ r3Q 251) (muTigOf tigCreArr tigCimArr)
      (fun _ hk => mem_muTigOf tig_mu_ok hk) n hn
  · dsimp only [hChan, headICert, gTigLp, memLp_fTig, fTig]
    rw [ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ r4Q) n]
    exact mem_bivarT_oned (Q := 0) (memB_ofListQ r4Q 251) (muTigOf tigCreArr tigCimArr)
      (fun _ hk => mem_muTigOf tig_mu_ok hk) n hn
  · dsimp only [hChan, headICert]
    rw [gSmoothedLp_eq_nat]
    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [q5Q, ofListQ])
      (memB_ofListQ p5Q 251) (memB_ofListQ q5Q 251) n hn

private lemma hChan_tail (p : Fin 6) :
    ∑' n, |hChan p (n + 251)| ≤ (tailQ p : ℝ) := by
  have hr1 : 1 < (rhoQ p : ℝ) := by fin_cases p <;> norm_num [rhoQ]
  have hT0 : 0 ≤ (tailQ p : ℝ) := by fin_cases p <;> norm_num [tailQ, d12Q]
  refine hardy_tail (hChan p) (rhoQ p : ℝ) hr1 (budgetQ p : ℝ) ?_ 251 (tailQ p : ℝ) hT0
    (tail_cmp_of_fin p)
  intro J
  fin_cases p
  · exact hardy_smoothed_channel hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp0 hq0 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg0_ok mean0_ok J
  · exact hardy_smoothed_channel hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp1 hq1 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg1_ok mean1_ok J
  · exact hardy_unsmoothed_channel measurable_phase2 norm_phase2_le
      (fun _ u hc => phase2_rot2 hc u) memLp_phase2 hp2 hq_nil
      (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg2_ok mean2_ok J
  · exact hardy_unsmoothed_channel (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hp3 hq3 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg3_ok mean3_ok J
  · exact hardy_unsmoothed_channel (measurable_cellFn tigCreArr tigCimArr)
      (norm_cellFn_le tig_sos_ok) (fun _ u hc => cellFn_rot2 tigCreArr tigCimArr hc u)
      memLp_fTig hp4 hq4 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg4_ok mean4_ok J
  · exact hardy_smoothed_channel hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)
      (norm_cellFn_le tcell_sos_ok) (fun _ v hc => cellFn_rot2 tcellCreArr tcellCimArr hc v)
      hp5 hq5 (by norm_num [rhoQ]) (by norm_num [rhoQ, regRQ]) (by norm_num [regRQ])
      (by norm_num [jCertQ]) (by norm_num [budgetQ, d6Q]) reg5_ok mean5_ok J

/-- **Certified upper bound**: `K_G^ℂ ≤ 1.40457588`. -/
theorem isBound_cert : Statement.IsBound (140457588 / 100000000 : ℝ) := by
  have hw0 : ∀ p : Fin 6, 0 ≤ (wQ p : ℝ) := fun p => by fin_cases p <;> norm_num [wQ, d12Q]
  have hw1 : ∑ p : Fin 6, (wQ p : ℝ) = 1 := by
    rw [← Rat.cast_sum, show ∑ p : Fin 6, wQ p = 1 by decide +kernel, Rat.cast_one]
  have hδ : (headCapCertQ : ℝ) + ∑ p : Fin 6, (wQ p : ℝ) * (tailQ p : ℝ) ≤ (deltaCertQ : ℝ) := by
    have hq : headCapCertQ + ∑ p : Fin 6, wQ p * tailQ p ≤ deltaCertQ := by decide +kernel
    simpa only [Rat.cast_add, Rat.cast_sum, Rat.cast_mul] using (Rat.cast_le (K := ℝ)).2 hq
  have hδc : (deltaCertQ : ℝ) < (cCertQ : ℝ) := by norm_num [deltaCertQ, cCertQ, d12Q]
  have hB : Statement.IsBound (1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ))) :=
    convex_transfer_ival (K := 250) hw0 hw1 hChan_summable hChan_dominated
      hChan_mem hChan_tail (of_decide_eq_true head_sum_ok) hδ hδc
  have hle : 1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ)) ≤ (140457588 / 100000000 : ℝ) := by
    norm_num [cCertQ, deltaCertQ, d12Q]
  exact fun m n A => (hB m n A).trans (mul_le_mul_of_nonneg_right hle (Real.sSup_nonneg fun r ⟨_, _, _, _, hr⟩ => hr ▸ norm_nonneg _))

end

end Haagerup
