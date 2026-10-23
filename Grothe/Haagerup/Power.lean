import Grothe.Haagerup.Identity
import Grothe.Upper.PowerTail
import Grothe.Haagerup.PowerCheck

/-!
# A hypothesis-free upper bound from finite-power cancellation

The preprocessor has degree 13 and Wiener norm one, while its fourth power
has norm at most 0.998935. The full 2,000-term residual and the complete
weighted infinite tail are checked by outward integer arithmetic.
-/

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Grothe.HaagerupPower
open GrotheKernel Grothe.Upper Grothe.Upper.PowerTail Polynomial Finset

noncomputable section
noncomputable def P : ℝ[X] := ofListQ pl

lemma norm_P : l1 P ≤ 1 :=
  (l1_ofListQ_le pl).trans (by norm_num [pl])

lemma degree_P : P.natDegree ≤ 6 := by
  have h := natDegree_ofListQ_le pl
  simpa [P,pl] using h

lemma norm_fourth : l1 (P^4) ≤ (ratio : ℝ) := by
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  apply power_norm_of_check pl 4 25 ratio _ hc.1.2
  exact lt_of_le_of_lt ((natDegree_pow_le).trans (Nat.mul_le_mul_left 4 degree_P)) (by norm_num)

lemma gamma_bound : haagG terms ≤ gamma := by
  have hc := check
  simp only [checks, Bool.and_eq_true] at hc
  have h := hc.1.1
  simp only [haagCheck, Bool.and_eq_true, decide_eq_true_eq] at h
  have he : haagG terms = (haagList (terms+1)).getD terms 0 *
      (((terms+1)*(2*terms+1) : ℕ) : ℚ) := by
    rw [haagList_eq, List.getD_eq_getElem?_getD, List.getElem?_map,
      List.getElem?_range (Nat.lt_succ_self _)]
    simp [haagG]
  exact he ▸ h.2

lemma summable_R : Summable fun k => (haagR k : ℝ) := by
  have h : Summable fun i => (haagR (i+1) : ℝ) :=
    summable_of_sum_range_le (fun i => by exact_mod_cast (haagR_pos _).le)
      (sum_haagR_le 1 le_rfl)
  exact (summable_nat_add_iff 1).mp h

lemma R_telescope {K k : ℕ} (hK : 1 ≤ K) (hk : K ≤ k) {g : ℚ} (hg : haagG K ≤ g) :
    (haagR k : ℝ) ≤ (g : ℝ)/(2*(k : ℝ)*((k : ℝ)+1)) := by
  have hk0 : (0 : ℝ) < k := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one (hK.trans hk))
  have hr0 : (0 : ℝ) ≤ haagR k := by exact_mod_cast (haagR_pos k).le
  have h1 := (haagR_le K k hk).trans (div_le_div_of_nonneg_right hg (by positivity))
  have h1r : (haagR k : ℝ) ≤ (g : ℝ)/(((k : ℝ)+1)*(2*(k : ℝ)+1)) := by exact_mod_cast h1
  have hmul := (le_div_iff₀ (by positivity : 0 < ((k : ℝ)+1)*(2*(k : ℝ)+1))).mp h1r
  apply (le_div_iff₀ (by positivity : 0 < 2*(k : ℝ)*((k : ℝ)+1))).mpr
  nlinarith

lemma weighted_R_tail {K : ℕ} (hK : 1 ≤ K) {g q : ℚ} (hg : haagG K ≤ g)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) (N : ℕ) :
    weightedTail (fun k => (haagR k : ℝ)) (q : ℝ) K ≤
      (g : ℝ)/2*(q : ℝ)^(K/2)*telescope K (q : ℝ) N := by
  apply weighted_tail_bound _ summable_R (fun k => by exact_mod_cast (haagR_pos k).le)
    (q : ℝ) (g : ℝ) (by exact_mod_cast hq0) (by exact_mod_cast hq1) K _ _ N K le_rfl
  · intro k hk
    have h0 : 1 ≤ k := hK.trans hk
    have hG : (haagG k : ℝ) ≤ g := by exact_mod_cast ((haagG_antitone hk).trans hg)
    exact (Real.tsum_le_of_sum_range_le (fun i => by exact_mod_cast (haagR_pos _).le)
      (sum_haagR_le k h0)).trans (div_le_div_of_nonneg_right hG (by positivity))
  · intro k hk
    have h0 : (0 : ℝ) < k := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one (hK.trans hk))
    have h1 := R_telescope hK hk hg
    have h2 := R_telescope hK (show K ≤ k+1 by omega) hg
    push_cast at h2
    rw [show (k : ℝ)+1+1=(k : ℝ)+2 by ring] at h2
    have he : (g : ℝ)/(2*(k : ℝ)*((k : ℝ)+1)) +
        (g : ℝ)/(2*((k : ℝ)+1)*((k : ℝ)+2)) =
        (g : ℝ)/2*(1/(k : ℝ)-1/((k : ℝ)+2)) := by
      field_simp
      ring
    have h := add_le_add h1 h2
    rw [he] at h
    simpa only [Nat.cast_add, Nat.cast_ofNat] using h

lemma composed_tail : ∑' n, |compCoeff (cHi terms) P n| ≤ Real.pi/4*(tailCap : ℝ) := by
  have hq0 : (0 : ℝ) ≤ ratio := by norm_num [ratio]
  have hq1 : (ratio : ℝ) ≤ 1 := by norm_num [ratio]
  have hs : Summable fun k => |cHi terms k| *(ratio : ℝ)^(k/2) :=
    Summable.of_nonneg_of_le (fun _ => by positivity)
      (fun k => mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hq0 hq1)) (summable_cHi terms)
  have hid : (∑' k, |cHi terms k| *(ratio : ℝ)^(k/2)) =
      Real.pi/4*weightedTail (fun k => (haagR k : ℝ)) (ratio : ℝ) terms := by
    rw [← hs.sum_add_tsum_nat_add terms]
    have hz : ∑ k ∈ range terms, |cHi terms k| *(ratio : ℝ)^(k/2) = 0 := by
      apply sum_eq_zero
      intro k hk
      simp [cHi,mem_range.mp hk]
    rw [hz,zero_add]
    unfold weightedTail
    rw [← tsum_mul_left]
    apply tsum_congr
    intro k
    rw [cHi, ite_eq_right (show ¬ k+terms<terms by omega), abs_of_nonneg (haagCoeff_nonneg _)]
    unfold haagCoeff
    ring
  have htail := weighted_R_tail (show 1 ≤ terms by norm_num [terms]) gamma_bound
    (show 0 ≤ ratio by norm_num [ratio]) (show ratio ≤ 1 by norm_num [ratio]) 8192
  have hc := check
  simp only [checks,Bool.and_eq_true] at hc
  have hnum := tail_numeric_of_check terms 8192 ratio gamma tailCap hc.2
  calc
    _ ≤ ∑' k, |cHi terms k| *(ratio : ℝ)^(k/2) :=
      weighted_composition (summable_cHi terms) norm_P _
        (fun _ => pow_nonneg hq0 _) (fun _ => pow_le_one₀ hq0 hq1)
        (compTerm_power_bound norm_P hq0 norm_fourth)
    _ = _ := hid
    _ ≤ _ := mul_le_mul_of_nonneg_left (htail.trans hnum) (by positivity)

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
  have h := hc.1.1
  simp only [haagCheck,Bool.and_eq_true] at h
  have hfin := haag_le_of_check h.1
  have hpdef : ofListQ pl = P := rfl
  rw [hpdef] at hfin
  rw [residual_split _ (summable_abs_compCoeff (summable_cLo terms) norm_P) _ 25999]
  have hz : ∑' n, |compCoeff (cLo terms) P (n+(25999+1))| = 0 := by
    apply (tsum_congr fun n => ?_).trans tsum_zero
    rw [finite_identity,hornerP_eq,mul_sum,finsetSum_coeff]
    have hlen : (haagList terms).length = terms := by rw [haagList_eq]; simp
    rw [hlen,sum_eq_zero]
    · simp
    · intro k hk
      have hk' : k < 2000 := by simpa [terms] using mem_range.mp hk
      have he : P*(C (((haagList terms).getD k 0 : ℚ) : ℝ)*(X*P^2)^k) =
          C (((haagList terms).getD k 0 : ℚ) : ℝ)*compTerm P k := by
        rw [compTerm,mul_pow,← pow_mul]; ring
      rw [he,coeff_C_mul]
      have hz : (compTerm P k).coeff (n+26000) = 0 := by
        apply coeff_eq_zero_of_natDegree_lt
        unfold compTerm
        have h1 := natDegree_X_pow_le (R := ℝ) k
        have h2 : (P^(2*k+1)).natDegree ≤ (2*k+1)*6 :=
          natDegree_pow_le.trans (Nat.mul_le_mul_left _ degree_P)
        have h3 := natDegree_mul_le (p := (X : ℝ[X])^k) (q := P^(2*k+1))
        omega
      simp only [show n+(25999+1)=n+26000 by omega,hz,mul_zero]
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
    1404951/1000000 := by
  have hd : Real.pi/4*((headCap : ℝ)+tailCap) < Real.pi/4*(slope : ℝ) := by
    apply mul_lt_mul_of_pos_left _ (by positivity)
    norm_num [headCap,tailCap,slope]
  apply (div_lt_iff₀ (sub_pos.mpr hd)).mpr
  have hp := Real.pi_gt_d20
  norm_num [slope,headCap,tailCap]
  nlinarith

/-- The rational public endpoint, with no hypotheses. -/
theorem upper : IsGrothendieckBound (1404951/1000000) :=
  exact_upper.mono value_lt.le

end
end Grothe.HaagerupPower

namespace Grothe

/-- The public hypothesis-free upper bound for every finite complex matrix. -/
theorem haagerup_bound : IsGrothendieckBound (1404951/1000000) :=
  HaagerupPower.upper

end Grothe
