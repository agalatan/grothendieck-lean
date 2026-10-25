import Grothe.Haagerup.Identity
import Grothe.Upper.ResolventTail
import Grothe.Haagerup.PowerCheck

/-!
# A hypothesis-free upper bound from finite-power cancellation

The degree-29 preprocessor has Wiener norm one. A finite polynomial
resolvent and a combined seed retain cancellation across the complete
infinite tail. All data and the 1,024-term head are checked outwards.
-/

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Grothe.HaagerupPower
open GrotheKernel Grothe.Upper Grothe.Upper.PowerTail Grothe.Upper.ResolventTail Polynomial Finset

noncomputable section
noncomputable def P : ℝ[X] := ofListQ pl
noncomputable def R : ℝ[X] := ofListQ rl

lemma norm_P : l1 P ≤ 1 :=
  (l1_ofListQ_le pl).trans (by norm_num [pl])

lemma degree_P : P.natDegree ≤ 14 := by
  have h := natDegree_ofListQ_le pl
  simpa [P,pl] using h

lemma norm_fourth : l1 (P^4) ≤ (ratio : ℝ) := by
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  apply power_norm_of_check pl 4 57 ratio _ hc.1.1.1.2
  exact lt_of_le_of_lt ((natDegree_pow_le).trans (Nat.mul_le_mul_left 4 degree_P)) (by norm_num)

lemma gamma_bound : haagG terms ≤ gamma := by
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  have h := hc.1.1.1.1
  simp only [haagCheck, Bool.and_eq_true, decide_eq_true_eq] at h
  have he : haagG terms = (haagList (terms+1)).getD terms 0 *
      (((terms+1)*(2*terms+1) : ℕ) : ℚ) := by
    rw [haagList_eq, List.getD_eq_getElem?_getD, List.getElem?_map,
      List.getElem?_range (Nat.lt_succ_self _)]
    simp [haagG]
  exact he ▸ h.2

lemma norm_defect : l1 (1-R*(1-X*P^2)) ≤ (defectCap : ℝ) := by
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  apply defect_of_check pl rl 158 defectCap _ hc.1.1.2
  change (1-R*(1-X*P^2)).natDegree < 158
  have hr : R.natDegree ≤ 128 := by
    simpa [R,rl] using natDegree_ofListQ_le rl
  have h1 : (X*P^2).natDegree ≤ 29 := by
    have h := natDegree_mul_le (p := (X : ℝ[X])) (q := P^2)
    have h2 := (natDegree_pow_le (p := P) (n := 2)).trans (Nat.mul_le_mul_left 2 degree_P)
    simp only [natDegree_X] at h
    omega
  have hd : (1-X*P^2).natDegree ≤ 29 :=
    (natDegree_sub_le _ _).trans (max_le (by simp) h1)
  have hp : (R*(1-X*P^2)).natDegree ≤ 157 :=
    natDegree_mul_le.trans (Nat.add_le_add hr hd)
  exact lt_of_le_of_lt ((natDegree_sub_le _ _).trans (max_le (by simp) hp)) (by norm_num)

lemma norm_seed : l1 (R*P^seedPower) ≤ (seedCap : ℝ) := by
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  apply seed_of_check pl rl seedPower 367 seedCap _ hc.1.2
  change (R*P^seedPower).natDegree < 367
  have hr : R.natDegree ≤ 128 := by
    simpa [R,rl] using natDegree_ofListQ_le rl
  have h2 := (natDegree_pow_le (p := P) (n := seedPower)).trans (Nat.mul_le_mul_left seedPower degree_P)
  have h3 := natDegree_mul_le (p := R) (q := P^seedPower)
  norm_num [seedPower] at h2 h3 ⊢
  omega

lemma R_succ_le (k : ℕ) : (haagR (k+1) : ℝ) ≤ haagR k := by
  rw [haagR]
  have hp : (0 : ℝ) < haagR k := by exact_mod_cast haagR_pos k
  have hn : (0 : ℝ) ≤ k := Nat.cast_nonneg k
  push_cast
  apply (div_le_iff₀ (by positivity : 0 < 4*((k : ℝ)+1)*((k : ℝ)+2))).2
  nlinarith [mul_nonneg hp.le hn]

lemma composed_tail : ∑' n, |compCoeff (cHi terms) P n| ≤ Real.pi/4*(tailCap : ℝ) := by
  have hdef : (defectCap : ℝ) < 1 := by norm_num [defectCap]
  have hq : (0 : ℝ) ≤ ratio := by norm_num [ratio]
  have hs := seed_power_bound P R norm_P hq norm_fourth seedPower terms
    (by norm_num [seedPower, terms]) norm_seed
  have ht := composition_tail_bound (fun k => (haagR k : ℝ)) P R terms
    (fun k => by exact_mod_cast (haagR_pos k).le) R_succ_le norm_P hdef norm_defect hs
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  have hn := tail_numeric_of_check terms seedPower ratio seedCap gamma defectCap tailCap hc.2
  have hg : (haagR terms : ℝ) ≤ (gamma : ℝ)/(((terms+1)*(2*terms+1) : ℕ) : ℝ) := by
    have h := gamma_bound
    unfold haagG at h
    apply (le_div_iff₀ (by positivity : (0 : ℝ) < ((terms+1)*(2*terms+1) : ℕ))).2
    push_cast
    exact_mod_cast h
  have hnonneg : 0 ≤ 2*((seedCap : ℝ)*(ratio : ℝ)^((2*terms+1-seedPower)/4))/(1-defectCap) := by
    apply div_nonneg
    · exact mul_nonneg (by norm_num) (mul_nonneg (by norm_num [seedCap]) (pow_nonneg hq _))
    · linarith
  have hbound : (haagR terms : ℝ)*
      (2*((seedCap : ℝ)*(ratio : ℝ)^((2*terms+1-seedPower)/4))/(1-defectCap)) ≤ tailCap := by
    have hmul := mul_le_mul_of_nonneg_right hg hnonneg
    have he : (gamma : ℝ)/(((terms+1)*(2*terms+1) : ℕ) : ℝ)*
        (2*((seedCap : ℝ)*(ratio : ℝ)^((2*terms+1-seedPower)/4))/(1-defectCap)) =
        (2*(seedCap : ℝ)*gamma / (((terms+1)*(2*terms+1) : ℕ) : ℝ) / (1-defectCap))*
        (ratio : ℝ)^((2*terms+1-seedPower)/4) := by ring
    exact hmul.trans (he.le.trans hn)
  have he (n : ℕ) : compCoeff (cHi terms) P n = Real.pi/4*
      compCoeff (fun k => if k < terms then 0 else (haagR k : ℝ)) P n := by
    unfold compCoeff
    rw [← tsum_mul_left]
    apply tsum_congr
    intro k
    unfold cHi haagCoeff
    dsimp only
    split_ifs <;> ring
  simp_rw [he, abs_mul, abs_of_nonneg (by positivity : 0 ≤ Real.pi/4)]
  rw [tsum_mul_left]
  exact mul_le_mul_of_nonneg_left (ht.trans hbound) (by positivity)

lemma finite_identity (n : ℕ) :
    compCoeff (cLo terms) P n = Real.pi/4*(P*hornerP (X*P^2) (haagList terms)).coeff n := by
  unfold compCoeff
  rw [tsum_eq_sum (s := range terms) fun k hk => by
    simp [cLo,show ¬k<terms from fun h => hk (mem_range.mpr h)]]
  rw [hornerP_eq,mul_sum,finsetSum_coeff,mul_sum]
  have hlen : (haagList terms).length = terms := by rw [haagList_eq]; simp
  rw [hlen]
  apply sum_congr rfl
  intro k hk
  have hget : (haagList terms).getD k 0 = haagR k := by
    rw [haagList_eq,List.getD_eq_getElem?_getD,List.getElem?_map,List.getElem?_range (mem_range.mp hk)]
    rfl
  rw [hget,show cLo terms k = haagCoeff k by simp [cLo,mem_range.mp hk],haagCoeff,compTerm]
  have he : P*(C ((haagR k : ℚ) : ℝ)*(X*P^2)^k) =
      C ((haagR k : ℚ) : ℝ)*(X^k*P^(2*k+1)) := by
    rw [mul_pow,← pow_mul]
    ring
  rw [he,coeff_C_mul]
  ring

lemma finite_residual :
    |compCoeff (cLo terms) P 0-Real.pi/4*(slope : ℝ)| +
      ∑' n, |compCoeff (cLo terms) P (n+1)| ≤ Real.pi/4*(headCap : ℝ) := by
  have hc := check
  simp only [checks,Bool.and_eq_true] at hc
  have h := hc.1.1.1.1
  simp only [haagCheck,Bool.and_eq_true] at h
  have hfin := haag_le_of_check h.1
  have hpdef : ofListQ pl = P := rfl
  rw [hpdef] at hfin
  rw [residual_split _ (summable_abs_compCoeff (summable_cLo terms) norm_P) _ (cutoff-1)]
  have hz : ∑' n, |compCoeff (cLo terms) P (n+(cutoff-1+1))| = 0 := by
    apply (tsum_congr fun n => ?_).trans tsum_zero
    rw [finite_identity,hornerP_eq,mul_sum,finsetSum_coeff]
    have hlen : (haagList terms).length = terms := by rw [haagList_eq]; simp
    rw [hlen,sum_eq_zero]
    · simp
    · intro k hk
      have hk' : k < 1024 := by simpa [terms] using mem_range.mp hk
      have he : P*(C (((haagList terms).getD k 0 : ℚ) : ℝ)*(X*P^2)^k) =
          C (((haagList terms).getD k 0 : ℚ) : ℝ)*compTerm P k := by
        rw [compTerm,mul_pow,← pow_mul]; ring
      rw [he,coeff_C_mul]
      have hz : (compTerm P k).coeff (n+cutoff) = 0 := by
        apply coeff_eq_zero_of_natDegree_lt
        unfold compTerm
        have h1 := natDegree_X_pow_le (R := ℝ) k
        have h2 : (P^(2*k+1)).natDegree ≤ (2*k+1)*14 :=
          natDegree_pow_le.trans (Nat.mul_le_mul_left _ degree_P)
        have h3 := natDegree_mul_le (p := (X : ℝ[X])^k) (q := P^(2*k+1))
        norm_num [cutoff]
        omega
      simp only [show n+(cutoff-1+1)=n+cutoff by norm_num [cutoff],hz,mul_zero]
  rw [hz,add_zero]
  have he : ∀ n, |compCoeff (cLo terms) P n-if n=0 then Real.pi/4*(slope : ℝ) else 0| =
      Real.pi/4*|(P*hornerP (X*P^2) (haagList terms)).coeff n-if n=0 then (slope : ℝ) else 0| := by
    intro n
    rw [finite_identity]
    have hp : 0 ≤ Real.pi/4 := by positivity
    rw [← abs_of_nonneg hp,← abs_mul,abs_of_nonneg hp]
    congr 1
    split_ifs <;> ring
  simp only [he,← mul_sum]
  exact mul_le_mul_of_nonneg_left hfin (by positivity)

lemma residual : |compCoeff haagCoeff P 0-Real.pi/4*(slope : ℝ)| +
    ∑' n, |compCoeff haagCoeff P (n+1)| ≤ Real.pi/4*((headCap : ℝ)+tailCap) := by
  have hadd : ∀ n, compCoeff haagCoeff P n = compCoeff (cLo terms) P n+compCoeff (cHi terms) P n := by
    intro n
    rw [←compCoeff_add (summable_cLo _) (summable_cHi _) norm_P]
    apply congrArg (fun c => compCoeff c P n)
    funext k
    unfold cLo cHi
    split_ifs <;> ring
  have hd : Summable fun n => |compCoeff haagCoeff P n-compCoeff (cLo terms) P n| := by
    simpa only [hadd,add_sub_cancel_left] using summable_abs_compCoeff (summable_cHi terms) norm_P
  have h := residual_perturb' (compCoeff haagCoeff P) (compCoeff (cLo terms) P)
    (summable_abs_compCoeff (summable_cLo terms) norm_P) hd (Real.pi/4*(slope : ℝ))
  have ht : (∑' n, |compCoeff haagCoeff P n-compCoeff (cLo terms) P n|) ≤ Real.pi/4*(tailCap : ℝ) := by
    simpa only [hadd,add_sub_cancel_left] using composed_tail
  linarith [finite_residual]

/-- A bound on the complex Grothendieck constant with no analytic or numerical
hypotheses: the complete series and the Gaussian phase identity are proved. -/
theorem exact_upper : IsGrothendieckBound
    (1/(Real.pi/4*(slope : ℝ)-Real.pi/4*((headCap : ℝ)+tailCap))) := by
  apply transfer_comp summable_haagCoeff haagerup_dominated norm_P _ residual
  apply mul_lt_mul_of_pos_left _ (by positivity)
  norm_num [headCap,tailCap,slope]

lemma value_lt : (1/(Real.pi/4*(slope : ℝ)-Real.pi/4*((headCap : ℝ)+tailCap))) <
    1404909543/1000000000 := by
  have hd : Real.pi/4*((headCap : ℝ)+tailCap) < Real.pi/4*(slope : ℝ) := by
    apply mul_lt_mul_of_pos_left _ (by positivity)
    norm_num [headCap,tailCap,slope]
  apply (div_lt_iff₀ (sub_pos.mpr hd)).mpr
  have hp := Real.pi_gt_d20
  norm_num [slope,headCap,tailCap]
  nlinarith

/-- The rational public endpoint, with no hypotheses. -/
theorem upper : IsGrothendieckBound (1404909543/1000000000) :=
  exact_upper.mono value_lt.le

end
end Grothe.HaagerupPower

namespace Grothe

/-- The public hypothesis-free upper bound for every finite complex matrix. -/
theorem haagerup_bound : IsGrothendieckBound (1404909543/1000000000) :=
  HaagerupPower.upper

end Grothe
