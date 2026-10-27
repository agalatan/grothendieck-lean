import Grothe.HJM.Assembly
import Grothe.HJM.PrefixCheck5

/-!
# The head of the HJM mixture: slope and prefix from one interval check (HJM 6.1–6.12)

The mixture coefficients `q̂_n = Σ_r w_r k_{r,n}` for `n < 120` are enclosed from
* the scalar tables `headTable_r` (`mem_head1` … `mem_head5`: `(4/π) k_{r,n}`), times `w_r` and an enclosure of `π/4`;
* a table `K6` for the origin branch, given with a proof that it encloses `Origin.coeff n` (`K6mem`).

`headOK K6` checks that the enclosure of `q̂₀` lies above `slopeLower` and that the enclosures of `q̂₁, …, q̂₁₁₉`
have absolute sum at most `prefixUpper`; `head_of_check` turns an accepted check into the two head hypotheses of
`hjm_bound_of_head`, and `hjm_bound_of_tables` into the bound itself (with the origin tail as the one remaining
hypothesis).
-/

namespace Grothe.HJM

open Grothe.Upper GrotheKernel Finset

noncomputable section

/-- `π/4` between the 20-digit bounds `Real.pi_gt_d20`, `Real.pi_lt_d20`. -/
def piQuarterI : Ival :=
  ⟨ofRatLo (314159265358979323846 / 10 ^ 20 / 4), ofRatHi (314159265358979323847 / 10 ^ 20 / 4)⟩

lemma mem_piQuarter : mem (Real.pi / 4) piQuarterI := by
  have hD := D_pos
  constructor
  · refine (ofRatLo_le _).trans ?_
    have := Real.pi_gt_d20
    push_cast
    exact mul_le_mul_of_nonneg_right (by linarith) hD.le
  · refine le_trans ?_ (le_ofRatHi _)
    have := Real.pi_lt_d20
    push_cast
    exact mul_le_mul_of_nonneg_right (by linarith) hD.le

/-- The scalar tables. -/
def headTables : Fin 5 → List (Int × Int) := ![headTable1, headTable2, headTable3, headTable4, headTable5]

/-- The enclosure of `q̂_n` from the scalar tables and the origin table `K6`. -/
def qhatI (K6 : List Ival) (n : ℕ) : Ival :=
  addI (addI (addI (addI (addI
    (mulI (mulI (ofRatI (weights.getD 0 0)) piQuarterI) ((ofPairs headTable1).getD n zeroI))
    (mulI (mulI (ofRatI (weights.getD 1 0)) piQuarterI) ((ofPairs headTable2).getD n zeroI)))
    (mulI (mulI (ofRatI (weights.getD 2 0)) piQuarterI) ((ofPairs headTable3).getD n zeroI)))
    (mulI (mulI (ofRatI (weights.getD 3 0)) piQuarterI) ((ofPairs headTable4).getD n zeroI)))
    (mulI (mulI (ofRatI (weights.getD 4 0)) piQuarterI) ((ofPairs headTable5).getD n zeroI)))
    (mulI (ofRatI (weights.getD 5 0)) (K6.getD n zeroI))

/-- **The head check**: the slope and the prefix of the ledger. -/
def headOK (K6 : List Ival) : Bool :=
  decide (ofRatHi ScalarTailRefinement.slopeLower ≤ (qhatI K6 0).lo) &&
    decide (((List.range 119).map fun n => absUpper (qhatI K6 (n + 1))).sum ≤
      ofRatLo ScalarTailRefinement.prefixUpper)

lemma mem_branch {w : ℚ} {k : ℝ} {I : Ival} (hk : mem (k / (Real.pi / 4)) I) :
    mem ((w : ℝ) * k) (mulI (mulI (ofRatI w) piQuarterI) I) := by
  have h := mem_mul (mem_mul (mem_ofRatI w) mem_piQuarter) hk
  have e : (w : ℝ) * (Real.pi / 4) * (k / (Real.pi / 4)) = (w : ℝ) * k := by
    field_simp
  rwa [e] at h

/-- The enclosure contains `q̂_n`. -/
lemma mem_qhat {K6 : List Ival} (K6mem : ∀ n < 120, mem (Origin.coeff n) (K6.getD n zeroI))
    {n : ℕ} (hn : n < 120) : mem (qhat n) (qhatI K6 n) := by
  have e : qhat n = wt 0 * hc 0 n + wt 1 * hc 1 n + wt 2 * hc 2 n + wt 3 * hc 3 n + wt 4 * hc 4 n +
      wt 5 * hc 5 n := by
    simp only [qhat, Fin.sum_univ_six]
  rw [e]
  exact mem_add (mem_add (mem_add (mem_add (mem_add
    (mem_branch (mem_head1 hn)) (mem_branch (mem_head2 hn))) (mem_branch (mem_head3 hn)))
    (mem_branch (mem_head4 hn))) (mem_branch (mem_head5 hn))) (mem_mul (mem_ofRatI _) (K6mem n hn))

lemma list_sum_range (f : ℕ → ℤ) : ∀ k, ((List.range k).map f).sum = ∑ n ∈ range k, f n
  | 0 => by simp
  | k + 1 => by
    rw [List.range_succ, List.map_append, List.sum_append, list_sum_range f k, sum_range_succ]
    simp

lemma sum_absUpper_ge {K6 : List Ival} (K6mem : ∀ n < 120, mem (Origin.coeff n) (K6.getD n zeroI)) :
    (∑ n ∈ range 119, |qhat (n + 1)|) * D ≤
      ((((List.range 119).map fun n => absUpper (qhatI K6 (n + 1))).sum : ℤ) : ℝ) := by
  rw [list_sum_range, sum_mul]
  push_cast
  exact sum_le_sum fun n hn =>
    abs_le_absUpper (mem_qhat K6mem (by simp only [mem_range] at hn; omega))

/-- **The head from the check**: an accepted `headOK` gives the slope and prefix hypotheses. -/
theorem head_of_check {K6 : List Ival} (K6mem : ∀ n < 120, mem (Origin.coeff n) (K6.getD n zeroI))
    (h : headOK K6 = true) :
    (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0 ∧
      ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ) := by
  simp only [headOK, Bool.and_eq_true, decide_eq_true_eq] at h
  have hD := D_pos
  refine ⟨?_, ?_⟩
  · have hm := (mem_qhat K6mem (n := 0) (by norm_num)).1
    have h1 : (ScalarTailRefinement.slopeLower : ℝ) * D ≤ qhat 0 * D :=
      (le_ofRatHi _).trans ((Int.cast_le.2 h.1).trans hm)
    exact le_of_mul_le_mul_right h1 hD
  · have h1 := (sum_absUpper_ge K6mem).trans ((Int.cast_le.2 h.2).trans (ofRatLo_le _))
    exact le_of_mul_le_mul_right h1 hD

/-- **The HJM bound from the tables**: an origin table with an accepted head check, and the origin tail. -/
theorem hjm_bound_of_tables {K6 : List Ival} (K6mem : ∀ n < 120, mem (Origin.coeff n) (K6.getD n zeroI))
    (h : headOK K6 = true) (h6 : |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (originTailBudget : ℝ)) :
    IsGrothendieckBound (ScalarTailRefinement.reciprocalClaim : ℝ) :=
  hjm_bound_of_head (head_of_check K6mem h).1 (head_of_check K6mem h).2 h6

end

end Grothe.HJM
