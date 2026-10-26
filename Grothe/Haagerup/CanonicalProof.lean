import Grothe.Haagerup.Identity
import Grothe.Haagerup.CompleteMonotone
import Grothe.Upper.ResolventCompletion
import Grothe.Upper.ResolventCertificate
import Grothe.Haagerup.CanonicalData

/-!
# The canonical resolvent upper bound, from explicit finite checks

This module proves the mathematical assembly independently of how the four
finite check hypotheses are discharged. The signed completion is combined
with the head before taking absolute values, and complete monotonicity bounds
the remaining infinite tail.
-/

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Grothe.HaagerupCanonical

open Polynomial Finset GrotheKernel Upper Upper.PowerTail Upper.ResolventTail
open Upper.FiniteDifference Upper.ResolventCompletion Upper.ResolventCertificate
open HaagerupPower

noncomputable section

def P : ℝ[X] := ofListQ pl
def R : ℝ[X] := ofListQ rl
def completed : ℝ[X] := completedPolynomial P R start (haagList start) differences

lemma norm_P : l1 P ≤ 1 :=
  (l1_ofListQ_le pl).trans (by norm_num [pl])

lemma degree_P : P.natDegree ≤ 14 := by
  simpa [P, pl] using natDegree_ofListQ_le pl

lemma degree_R : R.natDegree ≤ 64 := by
  simpa [R, rl] using natDegree_ofListQ_le rl

lemma degree_ratio : (X*P^2).natDegree ≤ 29 := by
  have h := natDegree_mul_le (p := (X : ℝ[X])) (q := P^2)
  have h2 := (natDegree_pow_le (p := P) (n := 2)).trans
    (Nat.mul_le_mul_left 2 degree_P)
  simp only [natDegree_X] at h
  omega

lemma norm_defect_of_check (hc : resolventNormOK pl rl defectCap = true) :
    l1 (1-R*(1-X*P^2)) ≤ (defectCap : ℝ) := by
  apply defect_of_check pl rl 94 defectCap _ hc
  change (1-R*(1-X*P^2)).natDegree < 94
  have hd : (1-X*P^2).natDegree ≤ 29 :=
    (natDegree_sub_le _ _).trans (max_le (by simp) degree_ratio)
  have hp : (R*(1-X*P^2)).natDegree ≤ 93 :=
    natDegree_mul_le.trans (Nat.add_le_add degree_R hd)
  exact lt_of_le_of_lt ((natDegree_sub_le _ _).trans (max_le (by simp) hp)) (by norm_num)

lemma norm_seed_of_check (hc : seedNormOK pl rl seedPower seedCap = true) :
    l1 (R*P^seedPower) ≤ (seedCap : ℝ) := by
  apply seed_of_check pl rl seedPower 303 seedCap _ hc
  change (R*P^seedPower).natDegree < 303
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

lemma degree_completed : (completed-C (HaagerupPower.slope : ℝ)).natDegree < cutoff := by
  have ht : (compTerm P start).natDegree ≤ 1870 := by
    unfold compTerm
    have h1 := natDegree_X_pow_le (R := ℝ) start
    have h2 := (natDegree_pow_le (p := P) (n := 2*start+1)).trans
      (Nat.mul_le_mul_left _ degree_P)
    have h3 := natDegree_mul_le (p := (X : ℝ[X])^start) (q := P^(2*start+1))
    norm_num [start] at h1 h2 h3 ⊢
    omega
  have hrt : (R*compTerm P start).natDegree ≤ 1934 :=
    natDegree_mul_le.trans (Nat.add_le_add degree_R ht)
  have hra : (-(R*(X*P^2))).natDegree ≤ 93 := by
    rw [natDegree_neg]
    exact natDegree_mul_le.trans (Nat.add_le_add degree_R degree_ratio)
  have hh : (hornerP (X*P^2) (haagList start)).natDegree ≤ 1856 := by
    have h := (natDegree_hornerP_le (X*P^2) (haagList start)).trans
      (Nat.mul_le_mul_left _ degree_ratio)
    simpa [haagList_eq, start] using h
  have hc : (hornerP (-(R*(X*P^2))) differences).natDegree ≤ 558 := by
    have h := (natDegree_hornerP_le (-(R*(X*P^2))) differences).trans
      (Nat.mul_le_mul_left _ hra)
    simpa [differences_length, order] using h
  have hhead : (P*hornerP (X*P^2) (haagList start)).natDegree ≤ 1870 :=
    natDegree_mul_le.trans (Nat.add_le_add degree_P hh)
  have hcorr : ((R*compTerm P start)*hornerP (-(R*(X*P^2))) differences).natDegree ≤ 2492 :=
    natDegree_mul_le.trans (Nat.add_le_add hrt hc)
  have hfull : completed.natDegree ≤ 2492 := by
    unfold completed completedPolynomial
    exact (natDegree_add_le _ _).trans (max_le (hhead.trans (by norm_num)) hcorr)
  exact lt_of_le_of_lt ((natDegree_sub_le _ _).trans (max_le hfull (by simp)))
    (by norm_num [cutoff])

lemma completed_norm_of_check
    (hc : completedHeadOK cutoff start pl rl (haagList start) differences HaagerupPower.slope headCap = true) :
    l1 (completed-C (HaagerupPower.slope : ℝ)) ≤ (headCap : ℝ) :=
  completedHead_le_of_check cutoff start pl rl (haagList start) differences HaagerupPower.slope headCap
    (by rw [haagList_eq]; simp) degree_completed hc

lemma remainder_bound
    (hcoeff : haagR start ≤ 1/10000 ∧ iterDiff order haagR start ≤ 37/10000000000000) :
    (2*(1/2 : ℝ)/(1-defectCap))*
      ((2 : ℝ)^order*iterDiff order (fun k => (haagR k : ℝ)) start +
        (defectCap : ℝ)*∑ j ∈ range order, (2 : ℝ)^j*iterDiff j (fun k => (haagR k : ℝ)) start)
      ≤ (remainderCap : ℝ) := by
  have h0 : (haagR start : ℝ) ≤ 1/10000 := by
    have h : (haagR start : ℝ) ≤ ((1/10000 : ℚ) : ℝ) := Rat.cast_le.mpr hcoeff.1
    simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using h
  have hm : iterDiff order (fun k => (haagR k : ℝ)) start ≤ 37/10000000000000 := by
    rw [iterDiff_ratCast]
    have h : (iterDiff order haagR start : ℝ) ≤ ((37/10000000000000 : ℚ) : ℝ) :=
      Rat.cast_le.mpr hcoeff.2
    simpa only [Rat.cast_div, Rat.cast_ofNat] using h
  have hj (j : ℕ) : iterDiff j (fun k => (haagR k : ℝ)) start ≤ 1/10000 :=
    (HaagerupCompleteMonotone.haagR_completelyMonotone.iterDiff_le_self j start).trans h0
  have hsum : (∑ j ∈ range order, (2 : ℝ)^j*iterDiff j (fun k => (haagR k : ℝ)) start) ≤
      63/10000 := by
    calc
      _ ≤ ∑ j ∈ range order, (2 : ℝ)^j*(1/10000) :=
        sum_le_sum fun j _ => mul_le_mul_of_nonneg_left (hj j) (by positivity)
      _ = _ := by norm_num [order, sum_range_succ]
  have hmain := add_le_add (mul_le_mul_of_nonneg_left hm (by positivity : 0 ≤ (2 : ℝ)^order))
    (mul_le_mul_of_nonneg_left hsum (by norm_num [defectCap] : (0 : ℝ) ≤ defectCap))
  have h := mul_le_mul_of_nonneg_left hmain
    (by norm_num [defectCap] : (0 : ℝ) ≤ 2*(1/2 : ℝ)/(1-defectCap))
  exact h.trans (by norm_num [order, defectCap, remainderCap])

lemma completed_tail_bound
    (hdef : resolventNormOK pl rl defectCap = true)
    (hseed : seedNormOK pl rl seedPower seedCap = true)
    (hcoeff : haagR start ≤ 1/10000 ∧ iterDiff order haagR start ≤ 37/10000000000000) :
    ∑' n, |compCoeff (fun k => if k < start then 0 else (haagR k : ℝ)) P n -
      ((R*compTerm P start)*hornerP (-(R*(X*P^2))) differences).coeff n| ≤
      (remainderCap : ℝ) := by
  have h := composition_completion_bound (fun k => (haagR k : ℝ)) P R start order
    HaagerupCompleteMonotone.haagR_completelyMonotone
    HaagerupCompleteMonotone.tendsto_haagR_zero norm_P
    (by norm_num [defectCap] : (defectCap : ℝ) < 1) (norm_defect_of_check hdef)
    (norm_tail_seed hseed) (norm_resolvent_ratio hdef)
  rw [completion_eq] at h
  exact h.trans (remainder_bound hcoeff)

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
    (hcoeff : haagR start ≤ 1/10000 ∧ iterDiff order haagR start ≤ 37/10000000000000)
    (hhead : completedHeadOK cutoff start pl rl (haagList start) differences HaagerupPower.slope headCap = true) :
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
      _ ≤ _ := mul_le_mul_of_nonneg_left (completed_norm_of_check hhead) (by positivity)
  have h := residual_perturb' (compCoeff haagCoeff P) Q.coeff hg hd (Real.pi/4*(HaagerupPower.slope : ℝ))
  nlinarith [hpoly, herr]

/-- The canonical upper bound, conditional only on its four finite kernel checks. -/
theorem upper_of_checks
    (hdef : resolventNormOK pl rl defectCap = true)
    (hseed : seedNormOK pl rl seedPower seedCap = true)
    (hcoeff : haagR start ≤ 1/10000 ∧ iterDiff order haagR start ≤ 37/10000000000000)
    (hhead : completedHeadOK cutoff start pl rl (haagList start) differences HaagerupPower.slope headCap = true) :
    IsGrothendieckBound (1404909140/1000000000) := by
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
