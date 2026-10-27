import Grothe.HJM.Prefix
import Grothe.Haagerup.ScalarTailRefinement

/-!
# The finite nonlinear tail of branch 5 (HJM eq. 6.19)

The phase coefficients below `67` composed with the branch-5 preprocessor `P` (degree `37`) give a polynomial
of degree at most `66 + 133·37 = 4987`, so its output modes `n ≥ 120` form a finite sum. By `finite_identity` that
sum is `(π/4)·Σ_{120 ≤ n < 4988} |[Xⁿ](P · Σ_{k<67} r_k (X P²)^k)|`, which `finite67_check` bounds by an outward
rounded interval evaluation of Horner's rule (`headI 4988 67 pl`, fixed point `D = 2^128`).

`finite67_bound` is the hypothesis `hfinite67 : finite67 ≤ finite67Upper` of
`Grothe.ScalarTailRefinement.refined_score_of_published_budgets` for the actual finite tail.

The margin is thin: the interval sum is `2.0292441256997182…e-7`, the cap `finite67Cap` below is the published
budget divided by `branch5Weight · π⁺/4` (with `π⁺ = 3.14159265358979323847`, `Real.pi_lt_d20`) rounded down to
25 digits, and the relative gap is `2.7e-17`, against an interval width of `3e-21` relative.
-/

set_option maxRecDepth 100000

namespace Grothe.HJM

open Grothe.Upper GrotheKernel Polynomial Finset

/-- The cap for the interval sum of the modes `120 ≤ n < 4988` (the budget over `branch5Weight · π⁺/4`). -/
def finite67Cap : ℚ := 2029244125699718229784867 / 10000000000000000000000000000000

/-- The finite computation: the outward-rounded coefficients of index `120 ≤ n < 4988` of
`P · Σ_{k<67} r_k (X P²)^k` have absolute sum at most `finite67Cap`. -/
def finite67OK : Bool :=
  decide (absSum ((headI 4988 67 ScalarTailRefinement.pl).drop 120) ≤ ofRatLo finite67Cap)

/-- **The finite computation** (by `native_decide`, a few seconds). -/
theorem finite67_check : finite67OK = true := by
  native_decide

lemma sum_absUpper_le_absSum (L : List Ival) (N : ℕ) :
    ∑ n ∈ range N, (absUpper (L.getD n zeroI) : ℝ) ≤ (absSum L : ℝ) := by
  have hz : absUpper zeroI = 0 := by simp [absUpper, zeroI]
  have key : ∀ (L : List Ival) (N : ℕ),
      ∑ n ∈ range N, absUpper (L.getD n zeroI) ≤ (L.map absUpper).sum := by
    intro L
    induction L with
    | nil => intro N; simp [hz]
    | cons a l ih =>
      intro N
      cases N with
      | zero =>
        simp only [Finset.range_zero, Finset.sum_empty, List.map_cons, List.sum_cons]
        exact add_nonneg (le_max_right _ _) (List.sum_nonneg fun x hx => by
          obtain ⟨y, _, rfl⟩ := List.mem_map.1 hx
          exact le_max_right _ _)
      | succ N =>
        rw [Finset.sum_range_succ']
        simpa [add_comm] using ih N
  exact_mod_cast key L N

/-- `absSum (L.drop k)` bounds `D · Σ_{n<N} |p_{n+k}|` when `L` encloses the first `N + k` coefficients of `p`. -/
lemma absSum_drop_le {N k : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB (N + k) p L) :
    (∑ n ∈ range N, |p.coeff (n + k)|) * D ≤ (absSum (L.drop k) : ℝ) := by
  refine le_trans ?_ (sum_absUpper_le_absSum _ N)
  rw [Finset.sum_mul]
  refine Finset.sum_le_sum fun n hn => ?_
  have hget : (L.drop k).getD n zeroI = L.getD (n + k) zeroI := by
    rw [List.getD_eq_getElem?_getD, List.getElem?_drop, List.getD_eq_getElem?_getD, Nat.add_comm]
  rw [hget]
  exact abs_le_absUpper (h (n + k) (by simp at hn; omega))

/-- The output modes from `4988` on vanish: `X^k P^{2k+1}` has degree `≤ 75k + 37 ≤ 4987` for `k < 67`. -/
lemma compCoeff_cLo67_eq_zero {n : ℕ} (hn : 4988 ≤ n) :
    compCoeff (cLo 67) ScalarTailRefinement.P n = 0 := by
  unfold compCoeff
  refine (tsum_congr fun k => ?_).trans tsum_zero
  by_cases hk : k < 67
  · rw [coeff_compTerm_eq_zero ScalarTailRefinement.degree_P (by omega), mul_zero]
  · simp [cLo, hk]

/-- **The finite tail of branch 5** (HJM eq. 6.19): the weighted output modes `n ≥ 120` of the phase coefficients
below `67` composed with the branch-5 preprocessor stay within the published budget `finite67Upper`. -/
theorem finite67_bound :
    (ScalarTailRefinement.branch5Weight : ℝ) *
        ∑' n, |compCoeff (cLo 67) ScalarTailRefinement.P (n + 120)| ≤
      (ScalarTailRefinement.finite67Upper : ℝ) := by
  have htsum : ∑' n, |compCoeff (cLo 67) ScalarTailRefinement.P (n + 120)| =
      ∑ n ∈ range 4868, |compCoeff (cLo 67) ScalarTailRefinement.P (n + 120)| :=
    tsum_eq_sum fun n hn => by
      rw [compCoeff_cLo67_eq_zero (by simp at hn; omega), abs_zero]
  have hs := absSum_drop_le (N := 4868) (k := 120)
    (memB_headI 4988 67 ScalarTailRefinement.pl)
  have hc : (absSum ((headI 4988 67 ScalarTailRefinement.pl).drop 120) : ℝ) ≤
      (finite67Cap : ℝ) * D := by
    have h := finite67_check
    simp only [finite67OK, decide_eq_true_eq] at h
    exact (Int.cast_le.mpr h).trans (ofRatLo_le _)
  have hsum : ∑ n ∈ range 4868, |(ofListQ ScalarTailRefinement.pl *
      hornerP (X * ofListQ ScalarTailRefinement.pl ^ 2) (haagList 67)).coeff (n + 120)| ≤
      (finite67Cap : ℝ) :=
    le_of_mul_le_mul_right (hs.trans hc) D_pos
  have hpi : |Real.pi / 4| ≤ (314159265358979323847 / 10 ^ 20 : ℝ) / 4 := by
    rw [abs_of_pos (by positivity)]
    linarith [Real.pi_lt_d20]
  rw [htsum]
  simp_rw [finite_identity, abs_mul, ← mul_sum]
  calc (ScalarTailRefinement.branch5Weight : ℝ) * (|Real.pi / 4| * ∑ n ∈ range 4868,
          |(ScalarTailRefinement.P * hornerP (X * ScalarTailRefinement.P ^ 2) (haagList 67)).coeff
            (n + 120)|)
      ≤ (ScalarTailRefinement.branch5Weight : ℝ) *
          ((314159265358979323847 / 10 ^ 20 : ℝ) / 4 * (finite67Cap : ℝ)) := by
        refine mul_le_mul_of_nonneg_left (mul_le_mul hpi hsum (sum_nonneg fun _ _ => abs_nonneg _)
          (by positivity)) (by norm_num [ScalarTailRefinement.branch5Weight])
    _ ≤ (ScalarTailRefinement.finite67Upper : ℝ) := by
        norm_num [ScalarTailRefinement.branch5Weight, finite67Cap, ScalarTailRefinement.finite67Upper]

lemma scalarTail_P_eq : ScalarTailRefinement.P = P 4 := by
  have h : ScalarTailRefinement.pl = pList5 := by
    norm_num [ScalarTailRefinement.pl, pList5]
  simp [ScalarTailRefinement.P, P, pLists, h]

/-- `finite67_bound` for the branch-5 preprocessor `P 4` of the HJM mixture. -/
theorem finite67_bound_P4 :
    (ScalarTailRefinement.branch5Weight : ℝ) * ∑' n, |compCoeff (cLo 67) (P 4) (n + 120)| ≤
      (ScalarTailRefinement.finite67Upper : ℝ) := by
  rw [← scalarTail_P_eq]
  exact finite67_bound

lemma branch5Weight_nonneg : (0 : ℝ) ≤ ScalarTailRefinement.branch5Weight := by
  have : (0 : ℚ) ≤ ScalarTailRefinement.branch5Weight := by
    unfold ScalarTailRefinement.branch5Weight; positivity
  exact_mod_cast this

/-- The tail from mode `N` splits into the phase coefficients below and from `K`. -/
lemma tail_split {Q : ℝ[X]} (hQ : l1 Q ≤ 1) (K N : ℕ) :
    ∑' n, |compCoeff haagCoeff Q (n + N)| ≤
      ∑' n, |compCoeff (cLo K) Q (n + N)| + ∑' n, |compCoeff (cHi K) Q (n + N)| := by
  have hsplit (n : ℕ) : |compCoeff haagCoeff Q n| ≤ |compCoeff (cLo K) Q n| + |compCoeff (cHi K) Q n| := by
    have e : compCoeff haagCoeff Q n = compCoeff (cLo K) Q n + compCoeff (cHi K) Q n := by
      rw [← compCoeff_add (summable_cLo _) (summable_cHi _) hQ]
      exact congrArg (fun c => compCoeff c Q n) (funext fun k => by unfold cLo cHi; split_ifs <;> ring)
    rw [e]; exact abs_add_le _ _
  have hlo : Summable fun n => |compCoeff (cLo K) Q (n + N)| :=
    (summable_nat_add_iff N).2 (summable_abs_compCoeff (summable_cLo _) hQ)
  have hhi : Summable fun n => |compCoeff (cHi K) Q (n + N)| :=
    (summable_nat_add_iff N).2 (summable_abs_compCoeff (summable_cHi K) hQ)
  have hk : Summable fun n => |compCoeff haagCoeff Q (n + N)| :=
    (summable_nat_add_iff N).2 (summable_abs_compCoeff summable_haagCoeff hQ)
  rw [← hlo.tsum_add hhi]
  exact Summable.tsum_le_tsum (fun n => hsplit (n + N)) hk (hlo.add hhi)

/-- A tail of a nonnegative series is at most the whole series. -/
lemma tail_le_whole {Q : ℝ[X]} (hQ : l1 Q ≤ 1) (K N : ℕ) :
    ∑' n, |compCoeff (cHi K) Q (n + N)| ≤ ∑' n, |compCoeff (cHi K) Q n| := by
  have hhi' := summable_abs_compCoeff (summable_cHi K) hQ
  rw [← hhi'.sum_add_tsum_nat_add N]
  exact le_add_of_nonneg_left (Finset.sum_nonneg fun _ _ => abs_nonneg _)

/-- The outer part beyond mode 120 is within the reserve. -/
lemma outer_tail :
    (ScalarTailRefinement.branch5Weight : ℝ) * ∑' n, |compCoeff (cHi 67) ScalarTailRefinement.P (n + 120)| ≤
      (ScalarTailRefinement.outerReserve : ℝ) :=
  (mul_le_mul_of_nonneg_left (tail_le_whole ScalarTailRefinement.norm_P 67 120) branch5Weight_nonneg).trans
    (ScalarTailRefinement.branch5_outer_bound ScalarTailRefinement.outer_composition_bound)

/-- **The whole branch-5 tail beyond mode 120** (HJM 6.14–6.19): the phase coefficients below 67 give
`finite67Upper` (`finite67_bound`), those from 67 on the reserve `outerReserve` (`ScalarTailRefinement`). -/
theorem branch5_tail :
    (ScalarTailRefinement.branch5Weight : ℝ) * ∑' n, |compCoeff haagCoeff (P 4) (n + 120)| ≤
      (ScalarTailRefinement.finite67Upper : ℝ) + (ScalarTailRefinement.outerReserve : ℝ) := by
  rw [← scalarTail_P_eq]
  refine (mul_le_mul_of_nonneg_left (tail_split ScalarTailRefinement.norm_P 67 120)
    branch5Weight_nonneg).trans ?_
  rw [mul_add]
  exact add_le_add finite67_bound outer_tail

end Grothe.HJM
