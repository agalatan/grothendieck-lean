import Grothe.Haagerup.Identity
import Grothe.Haagerup.CompleteMonotone
import Grothe.Upper.ResolventCompletion
import Grothe.Upper.ResolventCertificate
import Grothe.Upper.WeightedTail
import Grothe.Haagerup.CanonicalData

/-!
# The canonical resolvent upper bound, from explicit finite checks

This module proves the mathematical assembly independently of how the four
finite check hypotheses are discharged. The signed completion is combined
with the head before taking absolute values, and complete monotonicity bounds
the remaining infinite tail. A weighted polynomial norm bounds the unchecked
finite coefficients after a short interval prefix.
-/

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Grothe.HaagerupCanonical

open Polynomial Finset GrotheKernel Upper Upper.PowerTail Upper.ResolventTail
open Upper.FiniteDifference Upper.ResolventCompletion Upper.ResolventCertificate Upper.WeightedTail
open HaagerupPower

noncomputable section

def P : ℝ[X] := ofListQ pl
def R : ℝ[X] := ofListQ rl
def completed : ℝ[X] := completedPolynomial P R start (haagList start) differences

lemma norm_P : l1 P ≤ 1 :=
  (l1_ofListQ_le pl).trans (by norm_num [pl])

lemma degree_P : P.natDegree ≤ 20 := by
  simpa [P, pl] using natDegree_ofListQ_le pl

lemma degree_R : R.natDegree ≤ 64 := by
  simpa [R, rl] using natDegree_ofListQ_le rl

lemma degree_ratio : (X*P^2).natDegree ≤ 41 := by
  have h := natDegree_mul_le (p := (X : ℝ[X])) (q := P^2)
  have h2 := (natDegree_pow_le (p := P) (n := 2)).trans
    (Nat.mul_le_mul_left 2 degree_P)
  simp only [natDegree_X] at h
  omega

lemma norm_defect_of_check (hc : resolventNormOK pl rl defectCap = true) :
    l1 (1-R*(1-X*P^2)) ≤ (defectCap : ℝ) := by
  apply defect_of_check pl rl 106 defectCap _ hc
  change (1-R*(1-X*P^2)).natDegree < 106
  have hd : (1-X*P^2).natDegree ≤ 41 :=
    (natDegree_sub_le _ _).trans (max_le (by simp) degree_ratio)
  have hp : (R*(1-X*P^2)).natDegree ≤ 105 :=
    natDegree_mul_le.trans (Nat.add_le_add degree_R hd)
  exact lt_of_le_of_lt ((natDegree_sub_le _ _).trans (max_le (by simp) hp)) (by norm_num)

lemma norm_seed_of_check (hc : seedNormOK pl rl seedPower seedCap = true) :
    l1 (R*P^seedPower) ≤ (seedCap : ℝ) := by
  apply seed_of_check pl rl seedPower 405 seedCap _ hc
  change (R*P^seedPower).natDegree < 405
  have h2 := (natDegree_pow_le (p := P) (n := seedPower)).trans
    (Nat.mul_le_mul_left seedPower degree_P)
  have h3 := natDegree_mul_le (p := R) (q := P^seedPower)
  have hr := degree_R
  norm_num [seedPower] at h2 h3 ⊢
  omega

lemma norm_tail_seed (hc : seedNormOK pl rl seedPower seedCap = true) :
    l1 (R*compTerm P start) ≤ (1 : ℝ)/2 := by
  have hp : l1 (P^112) ≤ 1 :=
    (l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) norm_P)
  have hs : l1 ((R*P^seedPower)*P^112) ≤ (seedCap : ℝ) :=
    (l1_mul_le _ _).trans ((mul_le_mul (norm_seed_of_check hc) hp (l1_nonneg _)
      (by norm_num [seedCap])).trans_eq (mul_one _))
  have hid : R*compTerm P start = X^start*((R*P^seedPower)*P^112) := by
    unfold compTerm
    have he : 2*start+1 = seedPower+112 := by norm_num [start, seedPower]
    rw [he, pow_add]
    ring
  have hseed : l1 (R*compTerm P start) ≤ (seedCap : ℝ) := by
    rw [hid]
    exact (l1_mul_le _ _).trans ((mul_le_mul
      ((l1_pow_le _ _).trans (by simp)) hs (l1_nonneg _) zero_le_one).trans_eq (one_mul _))
  exact hseed.trans (by norm_num [seedCap])

lemma norm_resolvent_ratio (hc : resolventNormOK pl rl defectCap = true) :
    l1 (R*(X*P^2)) ≤ 2 := by
  have hr : l1 (R-1) ≤ 2-(defectCap : ℝ) := by
    have hid : R-1 = X*ofListQ rl.tail := by
      change C ((1 : ℚ) : ℝ)+X*ofListQ rl.tail-1 = X*ofListQ rl.tail
      simp
    rw [hid]
    calc
      _ ≤ l1 X*l1 (ofListQ rl.tail) := l1_mul_le _ _
      _ = l1 (ofListQ rl.tail) := by rw [l1_X, one_mul]
      _ ≤ (((rl.tail.map fun q => |q|).sum : ℚ) : ℝ) := l1_ofListQ_le _
      _ ≤ 2-(defectCap : ℝ) := by norm_num [rl, defectCap]
  calc
    _ = l1 ((R-1)+(1-R*(1-X*P^2))) := congrArg l1 (by ring)
    _ ≤ l1 (R-1)+l1 (1-R*(1-X*P^2)) := l1_add_le _ _
    _ ≤ (2-(defectCap : ℝ))+defectCap := add_le_add hr (norm_defect_of_check hc)
    _ = 2 := by ring

lemma differences_length : differences.length = order := by simp [differences]

lemma differences_getD (j : ℕ) (hj : j < order) :
    differences.getD j 0 = iterDiff j haagR start := by
  unfold differences
  rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hj]
  rfl

lemma completion_eq :
    completion (fun k => (haagR k : ℝ)) (X*P^2) (compTerm P start) R start order =
      (R*compTerm P start)*hornerP (-(R*(X*P^2))) differences := by
  rw [completion, hornerP_eq, mul_sum, differences_length]
  apply sum_congr rfl
  intro j hj
  rw [differences_getD j (mem_range.mp hj), iterDiff_ratCast, smul_eq_C_mul]
  ring

private def scale : ℝ[X] := C (3/2 : ℝ)*X
private def scaledP : ℝ[X] := P.comp scale
private def scaledR : ℝ[X] := R.comp scale
private def ratio : ℝ[X] := scale*scaledP^2

private lemma l1_mul_bound {p q : ℝ[X]} {a b : ℝ} (hp : l1 p ≤ a) (hq : l1 q ≤ b) :
    l1 (p*q) ≤ a*b :=
  (l1_mul_le _ _).trans (mul_le_mul hp hq (l1_nonneg _) ((l1_nonneg _).trans hp))

private lemma l1_pow_bound {p : ℝ[X]} {a : ℝ} (hp : l1 p ≤ a) (n : ℕ) :
    l1 (p^n) ≤ a^n :=
  (l1_pow_le _ _).trans (pow_le_pow_left₀ (l1_nonneg _) hp n)

/-- A combined resolvent power can contain several copies of a short certified seed. -/
private lemma completion_seed_factor (p r : ℝ[X]) (K s j t : ℕ)
    (he : 2*K+1+2*j = s*(j+1)+t) :
    (-(r*(X*p^2)))^j*(r*compTerm p K) =
      (-1)^j*X^(K+j)*(r*p^s)^(j+1)*p^t := by
  unfold compTerm
  rw [neg_pow, mul_pow, mul_pow, ← pow_mul]
  have hp : p^(2*j)*p^(2*K+1) = (p^s)^(j+1)*p^t := by
    rw [← pow_add, ← pow_mul, ← pow_add]
    congr 1
    omega
  rw [mul_pow r (p^s) (j+1), pow_succ r j, pow_add X K j]
  calc
    _ = (-1)^j*(X^K*X^j)*(r^j*r)*(p^(2*j)*p^(2*K+1)) := by ring
    _ = _ := by rw [hp]; ring

private lemma norm_completion_seed_initial
    (hseed : seedNormOK pl rl seedPower seedCap = true) (j : ℕ) (hj : j ≤ 7) :
    l1 ((-(R*(X*P^2)))^j*(R*compTerm P start)) ≤ (1/2 : ℝ)^(j+1) := by
  have hs : l1 (R*P^seedPower) ≤ (1 : ℝ)/2 :=
    (norm_seed_of_check hseed).trans (by norm_num [seedCap])
  have he : 2*start+1+2*j = seedPower*(j+1)+(112-15*j) := by
    norm_num [start, seedPower]
    omega
  rw [completion_seed_factor P R start seedPower j (112-15*j) he]
  have hu : l1 ((-1 : ℝ[X])^j*X^(start+j)) ≤ 1 := by
    have h := l1_mul_bound
      (l1_pow_bound (show l1 (-1 : ℝ[X]) ≤ 1 by simp [l1_neg]) j)
      (l1_pow_bound (show l1 (X : ℝ[X]) ≤ 1 by simp) (start+j))
    simpa using h
  have h := l1_mul_bound (l1_mul_bound hu (l1_pow_bound hs (j+1)))
    (l1_pow_bound norm_P (112-15*j))
  simpa using h

/-- Eight copies of the checked short seed control the first eight powers.
The remaining powers use the existing resolvent-ratio bound, without a new convolution. -/
lemma norm_completion_seed
    (hdef : resolventNormOK pl rl defectCap = true)
    (hseed : seedNormOK pl rl seedPower seedCap = true) (j : ℕ) (hj : j ≤ order) :
    l1 ((-(R*(X*P^2)))^j*(R*compTerm P start)) ≤
      if j = order then (1/32 : ℝ) else 1/2 := by
  have hj10 : j ≤ 10 := by simpa only [order] using hj
  by_cases hj7 : j ≤ 7
  · have hpow : (1/2 : ℝ)^(j+1) ≤ 1/2 := by
      rw [pow_succ]
      exact mul_le_of_le_one_left (by norm_num)
        (pow_le_one₀ (by norm_num) (by norm_num))
    have hne : j ≠ order := by norm_num [order]; omega
    simpa [hne] using (norm_completion_seed_initial hseed j hj7).trans hpow
  · have h7 := norm_completion_seed_initial hseed 7 (by norm_num)
    have hr : l1 (-(R*(X*P^2))) ≤ 2 := by
      simpa only [l1_neg] using norm_resolvent_ratio hdef
    have hid : (-(R*(X*P^2)))^j*(R*compTerm P start) =
        (-(R*(X*P^2)))^(j-7)*((-(R*(X*P^2)))^7*(R*compTerm P start)) := by
      symm
      rw [← mul_assoc, ← pow_add, Nat.sub_add_cancel (by omega : 7 ≤ j)]
    have h := l1_mul_bound (l1_pow_bound hr (j-7)) h7
    rw [← hid] at h
    have hj_cases : j = 8 ∨ j = 9 ∨ j = 10 := by omega
    rcases hj_cases with rfl | rfl | rfl <;> norm_num [order] at h ⊢ <;> linarith

private lemma l1_ofListQ_scaled_le (rho : ℚ) (hrho : 0 ≤ rho) (qs : List ℚ) :
    l1 ((ofListQ qs).comp (C (rho : ℝ)*X)) ≤ (majorantQ rho qs : ℝ) := by
  have hr : (0 : ℝ) ≤ rho := Rat.cast_nonneg.mpr hrho
  have hscale : l1 (C (rho : ℝ)*X) ≤ (rho : ℝ) := by
    apply (l1_mul_le _ _).trans_eq
    simp [l1_C, l1_X, abs_of_nonneg hr]
  induction qs with
  | nil => simp [ofListQ, majorantQ]
  | cons q qs ih =>
    simp only [ofListQ, add_comp, C_comp, mul_comp, X_comp, majorantQ,
      Rat.cast_add, Rat.cast_mul, Rat.cast_abs]
    exact (l1_add_le _ _).trans (add_le_add (by simp [l1_C]) (l1_mul_bound hscale ih))

/-- A small weighted norm for the fixed preprocessor. -/
lemma norm_scaledP : l1 (P.comp (C (3/2 : ℝ)*X)) ≤ 21/20 := by
  have h := l1_ofListQ_scaled_le (3/2) (by norm_num) pl
  change l1 ((ofListQ pl).comp (C (3/2 : ℝ)*X)) ≤ 21/20
  norm_num [majorantQ, pl] at h ⊢
  exact h.trans (by norm_num)

/-- A small weighted norm for the fixed approximate inverse. -/
lemma norm_scaledR : l1 (R.comp (C (3/2 : ℝ)*X)) ≤ 9 := by
  have h := l1_ofListQ_scaled_le (3/2) (by norm_num) rl
  change l1 ((ofListQ rl).comp (C (3/2 : ℝ)*X)) ≤ 9
  norm_num [majorantQ, rl] at h ⊢
  exact h.trans (by norm_num)

private lemma norm_scale : l1 scale ≤ 3/2 := by
  exact (l1_mul_le _ _).trans_eq (by norm_num [l1_C, l1_X])

private lemma norm_ratio : l1 ratio ≤ 5/3 :=
  (l1_mul_bound norm_scale (l1_pow_bound norm_scaledP 2)).trans (by norm_num)

private lemma norm_negative_resolvent_ratio : l1 (-(scaledR*ratio)) ≤ 15 := by
  rw [l1_neg]
  exact (l1_mul_bound norm_scaledR norm_ratio).trans (by norm_num)

private lemma hornerP_comp (Y S : ℝ[X]) (rs : List ℚ) :
    (hornerP Y rs).comp S = hornerP (Y.comp S) rs := by
  induction rs with
  | nil => simp [hornerP]
  | cons r rs ih => simp only [hornerP, add_comp, C_comp, mul_comp, ih]

private lemma horner_norm_bound (Y : ℝ[X]) (rs : List ℚ) {a : ℚ}
    (hY : l1 Y ≤ (a : ℝ)) :
    l1 (hornerP Y rs) ≤ (majorantQ a rs : ℝ) := by
  induction rs with
  | nil => simp [hornerP, majorantQ]
  | cons r rs ih =>
    simp only [hornerP, majorantQ, Rat.cast_add, Rat.cast_mul, Rat.cast_abs]
    exact (l1_add_le _ _).trans (add_le_add (by simp [l1_C]) (l1_mul_bound hY ih))

/-- Coefficient-weighted Horner bounds control all unchecked coefficients. -/
lemma weighted_completed_bound (hcoeff : weightedBudget ≤ 10^13) :
    l1 ((completed-C (HaagerupPower.slope : ℝ)).comp (C (3/2 : ℝ)*X)) ≤ 10^13 := by
  have hterm : compTerm P start = P*(X*P^2)^start := by
    simpa [compTerm] using compTerm_geometric P 0 start
  have hshape : (completed-C (HaagerupPower.slope : ℝ)).comp scale =
      scaledP*hornerP ratio (haagList start) +
      (scaledR*(scaledP*ratio^start))*hornerP (-(scaledR*ratio)) differences -
      C (HaagerupPower.slope : ℝ) := by
    simp only [completed, completedPolynomial, hterm, sub_comp, add_comp, mul_comp,
      pow_comp, X_comp, C_comp, neg_comp, hornerP_comp, scaledP, scaledR, ratio]
  have hh := l1_mul_bound norm_scaledP
    (horner_norm_bound ratio (haagList start) (a := 5/3) (by simpa only [Rat.cast_div, Rat.cast_ofNat] using norm_ratio))
  have ht := l1_mul_bound norm_scaledR (l1_mul_bound norm_scaledP (l1_pow_bound norm_ratio start))
  have hc := l1_mul_bound ht
    (horner_norm_bound (-(scaledR*ratio)) differences (a := 15)
      (by simpa only [Rat.cast_ofNat] using norm_negative_resolvent_ratio))
  have hs : l1 (C (HaagerupPower.slope : ℝ)) ≤ 1 := by norm_num [l1_C, HaagerupPower.slope]
  change l1 ((completed-C (HaagerupPower.slope : ℝ)).comp scale) ≤ 10^13
  rw [hshape]
  apply (l1_sub_le _ _).trans
  apply (add_le_add ((l1_add_le _ _).trans (add_le_add hh hc)) hs).trans
  have h : (weightedBudget : ℝ) ≤ ((10^13 : ℚ) : ℝ) := Rat.cast_le.mpr hcoeff
  simpa only [weightedBudget, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
    Rat.cast_pow, Rat.cast_ofNat, Rat.cast_one] using h

/-- The checked prefix and its weighted polynomial tail recover the full head budget. -/
lemma completed_norm_of_check
    (hcoeff : weightedBudget ≤ 10^13)
    (hc : completedHeadOK cutoff start pl rl (haagList start) differences
      HaagerupPower.slope prefixCap = true) :
    l1 (completed-C (HaagerupPower.slope : ℝ)) ≤ (headCap : ℝ) := by
  have hp : (∑ n ∈ range cutoff, |(completed-C (HaagerupPower.slope : ℝ)).coeff n|) ≤
      (prefixCap : ℝ) :=
    completedPrefix_le_of_check cutoff start pl rl (haagList start) differences
      HaagerupPower.slope prefixCap (by rw [haagList_eq]; simp) hc
  have h := l1_le_prefix_add_weighted_tail (completed-C (HaagerupPower.slope : ℝ))
    (3/2) cutoff (by norm_num)
  have ht : l1 ((completed-C (HaagerupPower.slope : ℝ)).comp (C (3/2 : ℝ)*X)) /
      (3/2 : ℝ)^cutoff ≤ 1/10000000000000000 := by
    apply (div_le_div_of_nonneg_right (weighted_completed_bound hcoeff) (by positivity)).trans
    norm_num [cutoff]
  exact h.trans ((add_le_add hp ht).trans (by norm_num [prefixCap, headCap]))

lemma remainder_bound (hcoeff : remainderBudget ≤ remainderCap) :
    (2 : ℝ)/(1-defectCap)*
      ((1/32 : ℝ)*iterDiff order (fun k => (haagR k : ℝ)) start +
        (defectCap : ℝ)*(1/2)*∑ j ∈ range order, iterDiff j (fun k => (haagR k : ℝ)) start)
      ≤ (remainderCap : ℝ) := by
  have h : (remainderBudget : ℝ) ≤ (remainderCap : ℝ) := Rat.cast_le.mpr hcoeff
  have he : (remainderBudget : ℝ) =
      ((1/16 : ℝ)*iterDiff order (fun k => (haagR k : ℝ)) start +
        (defectCap : ℝ)*∑ j ∈ range order, iterDiff j (fun k => (haagR k : ℝ)) start) /
        (1-defectCap) := by
    simp only [remainderBudget, Rat.cast_div, Rat.cast_add, Rat.cast_mul,
      Rat.cast_ofNat, Rat.cast_sub, Rat.cast_one, Rat.cast_sum, iterDiff_ratCast]
  rw [he] at h
  convert h using 1; ring

lemma completed_tail_bound
    (hdef : resolventNormOK pl rl defectCap = true)
    (hseed : seedNormOK pl rl seedPower seedCap = true)
    (hcoeff : weightedBudget ≤ 10^13 ∧ remainderBudget ≤ remainderCap) :
    ∑' n, |compCoeff (fun k => if k < start then 0 else (haagR k : ℝ)) P n -
      ((R*compTerm P start)*hornerP (-(R*(X*P^2))) differences).coeff n| ≤
      (remainderCap : ℝ) := by
  have budget_eq (m : ℕ) (w : ℕ → ℝ) (eta : ℝ) :
      (2/(1-eta))*((if m = m then (1/32 : ℝ) else 1/2)*w m +
        eta*∑ j ∈ range m, (if j = m then (1/32 : ℝ) else 1/2)*w j) =
      (2/(1-eta))*((1/32 : ℝ)*w m + eta*(1/2)*∑ j ∈ range m, w j) := by
    have hs : (∑ j ∈ range m, (if j = m then (1/32 : ℝ) else 1/2)*w j) =
        (1/2 : ℝ)*∑ j ∈ range m, w j := by
      rw [mul_sum]
      apply sum_congr rfl
      intro j hj
      rw [ite_eq_right (Nat.ne_of_lt (mem_range.mp hj))]
    rw [hs, ite_eq_left rfl]
    ring
  have h := composition_completion_bound_of_seeds (fun k => (haagR k : ℝ)) P R start order
    HaagerupCompleteMonotone.haagR_completelyMonotone
    (fun j => if j = order then (1/32 : ℝ) else 1/2) norm_P
    (by norm_num [defectCap] : (defectCap : ℝ) < 1) (norm_defect_of_check hdef)
    (norm_completion_seed hdef hseed)
  rw [completion_eq] at h
  exact (h.trans_eq (budget_eq order
    (fun j => iterDiff j (fun k => (haagR k : ℝ)) start) defectCap)).trans
      (remainder_bound hcoeff.2)

lemma finite_identity (n : ℕ) :
    compCoeff (cLo start) P n = Real.pi/4*(P*hornerP (X*P^2) (haagList start)).coeff n := by
  unfold compCoeff
  rw [tsum_eq_sum (s := range start) fun k hk => by
    simp [cLo, show ¬k<start from fun h => hk (mem_range.mpr h)]]
  rw [hornerP_eq, mul_sum, finsetSum_coeff, mul_sum]
  have hlen : (haagList start).length = start := by rw [haagList_eq]; simp
  rw [hlen]
  apply sum_congr rfl
  intro k hk
  have hget : (haagList start).getD k 0 = haagR k := by
    rw [haagList_eq, List.getD_eq_getElem?_getD, List.getElem?_map,
      List.getElem?_range (mem_range.mp hk)]
    rfl
  rw [hget, show cLo start k = haagCoeff k by simp [cLo, mem_range.mp hk], haagCoeff, compTerm]
  have he : P*(C ((haagR k : ℚ) : ℝ)*(X*P^2)^k) =
      C ((haagR k : ℚ) : ℝ)*(X^k*P^(2*k+1)) := by
    rw [mul_pow, ← pow_mul]
    ring
  rw [he, coeff_C_mul]
  ring

lemma completed_error_identity (n : ℕ) :
    compCoeff haagCoeff P n - Real.pi/4*completed.coeff n = Real.pi/4*
      (compCoeff (fun k => if k < start then 0 else (haagR k : ℝ)) P n -
        ((R*compTerm P start)*hornerP (-(R*(X*P^2))) differences).coeff n) := by
  have hadd : compCoeff haagCoeff P n = compCoeff (cLo start) P n+compCoeff (cHi start) P n := by
    rw [← compCoeff_add (summable_cLo _) (summable_cHi _) norm_P]
    apply congrArg (fun c => compCoeff c P n)
    funext k
    unfold cLo cHi
    split_ifs <;> ring
  have hhi : compCoeff (cHi start) P n = Real.pi/4*
      compCoeff (fun k => if k < start then 0 else (haagR k : ℝ)) P n := by
    unfold compCoeff
    rw [← tsum_mul_left]
    apply tsum_congr
    intro k
    unfold cHi haagCoeff
    dsimp only
    split_ifs <;> ring
  rw [hadd, finite_identity, hhi]
  simp only [completed, completedPolynomial, coeff_add]
  ring

lemma residual_of_checks
    (hdef : resolventNormOK pl rl defectCap = true)
    (hseed : seedNormOK pl rl seedPower seedCap = true)
    (hcoeff : weightedBudget ≤ 10^13 ∧ remainderBudget ≤ remainderCap)
    (hhead : completedHeadOK cutoff start pl rl (haagList start) differences HaagerupPower.slope prefixCap = true) :
    |compCoeff haagCoeff P 0-Real.pi/4*(HaagerupPower.slope : ℝ)| +
      ∑' n, |compCoeff haagCoeff P (n+1)| ≤ Real.pi/4*((headCap : ℝ)+remainderCap) := by
  let Q : ℝ[X] := C (Real.pi/4)*completed
  have hQ (n : ℕ) : Q.coeff n = Real.pi/4*completed.coeff n := coeff_C_mul _
  have hg : Summable fun n => |Q.coeff n| := summable_abs_coeff Q
  have hd : Summable fun n => |compCoeff haagCoeff P n-Q.coeff n| := by
    exact ((summable_abs_compCoeff summable_haagCoeff norm_P).of_abs.sub hg.of_abs).abs
  have herr : (∑' n, |compCoeff haagCoeff P n-Q.coeff n|) ≤ Real.pi/4*(remainderCap : ℝ) := by
    simp_rw [hQ, completed_error_identity, abs_mul,
      abs_of_nonneg (by positivity : 0 ≤ Real.pi/4)]
    rw [tsum_mul_left]
    exact mul_le_mul_of_nonneg_left (completed_tail_bound hdef hseed hcoeff) (by positivity)
  have hpoly : |Q.coeff 0-Real.pi/4*(HaagerupPower.slope : ℝ)| + ∑' n, |Q.coeff (n+1)| ≤
      Real.pi/4*(headCap : ℝ) := by
    rw [polynomial_residual_eq_l1]
    have he : Q-C (Real.pi/4*(HaagerupPower.slope : ℝ)) = C (Real.pi/4)*(completed-C (HaagerupPower.slope : ℝ)) := by
      dsimp [Q]
      rw [map_mul]
      ring
    rw [he]
    calc
      _ ≤ l1 (C (Real.pi/4))*l1 (completed-C (HaagerupPower.slope : ℝ)) := l1_mul_le _ _
      _ = Real.pi/4*l1 (completed-C (HaagerupPower.slope : ℝ)) := by
        rw [l1_C, abs_of_nonneg (by positivity : 0 ≤ Real.pi/4)]
      _ ≤ _ := mul_le_mul_of_nonneg_left (completed_norm_of_check hcoeff.1 hhead) (by positivity)
  have h := residual_perturb' (compCoeff haagCoeff P) Q.coeff hg hd (Real.pi/4*(HaagerupPower.slope : ℝ))
  nlinarith [hpoly, herr]

/-- The canonical upper bound, conditional only on its four finite kernel checks. -/
theorem upper_of_checks
    (hdef : resolventNormOK pl rl defectCap = true)
    (hseed : seedNormOK pl rl seedPower seedCap = true)
    (hcoeff : weightedBudget ≤ 10^13 ∧ remainderBudget ≤ remainderCap)
    (hhead : completedHeadOK cutoff start pl rl (haagList start) differences HaagerupPower.slope prefixCap = true) :
    IsGrothendieckBound (1404909132791/1000000000000) := by
  have he : IsGrothendieckBound
      (1/(Real.pi/4*(HaagerupPower.slope : ℝ)-Real.pi/4*((headCap : ℝ)+remainderCap))) := by
    apply transfer_comp summable_haagCoeff haagerup_dominated norm_P _
      (residual_of_checks hdef hseed hcoeff hhead)
    apply mul_lt_mul_of_pos_left _ (by positivity)
    norm_num [headCap, remainderCap, HaagerupPower.slope]
  apply he.mono
  have hd : Real.pi/4*((headCap : ℝ)+remainderCap) < Real.pi/4*(HaagerupPower.slope : ℝ) := by
    apply mul_lt_mul_of_pos_left _ (by positivity)
    norm_num [headCap, remainderCap, HaagerupPower.slope]
  apply le_of_lt
  apply (div_lt_iff₀ (sub_pos.mpr hd)).mpr
  have hp := Real.pi_gt_d20
  norm_num [HaagerupPower.slope, headCap, remainderCap]
  nlinarith

end
end Grothe.HaagerupCanonical
