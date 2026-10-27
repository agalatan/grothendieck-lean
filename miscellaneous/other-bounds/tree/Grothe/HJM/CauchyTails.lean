import Grothe.HJM.CauchyGateCheck
import Grothe.HJM.CauchyTail

/-!
# The Cauchy tails of the four scalar branches (HJM 6.21–6.26)

With HJM's Cauchy radii `R = 6/5, 111/100, 111/100, 111/100` and the gate checks on slightly larger discs, each
branch tail beyond mode 120 is at most `T(R) = 10 R^{−241} / (1 − R^{−2})` (`tail1` … `tail4`), and the weighted
sum is exactly HJM's `Σ_r |w_r| T(R_r) = cauchyBudget < 1.01718·10⁻¹¹` (`weighted_tails`, HJM 6.26).
-/

namespace Grothe.HJM.Cauchy

open Grothe.Upper

/-- The Cauchy tail bound `10 R^{−241} / (1 − R^{−2})`. -/
def tailQ (R : ℚ) : ℚ := 10 * R⁻¹ ^ 241 / (1 - R⁻¹ ^ 2)

lemma tail_of (pl : List ℚ) (hP : l1 (ofListQ pl) ≤ 1) (R R₁ : ℚ) (h1 : 1 < R) (hRR : R < R₁)
    (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true) :
    ∑' n, |compCoeff haagCoeff (ofListQ pl) (n + 120)| ≤ (tailQ R : ℝ) := by
  have hR1 : (1 : ℝ) < R := by exact_mod_cast h1
  have := cauchy_tail hP (by linarith : (1 : ℚ) < R₁) hR h hR1 (by exact_mod_cast hRR) 120
  simpa [tailQ] using this

theorem tail1 : ∑' n, |compCoeff haagCoeff (P 0) (n + 120)| ≤ (tailQ (6 / 5) : ℝ) :=
  tail_of pList1 (l1_P 0) _ _ (by norm_num) (by norm_num [gateR]) (by norm_num [gateR]) gate_check1

theorem tail2 : ∑' n, |compCoeff haagCoeff (P 1) (n + 120)| ≤ (tailQ (111 / 100) : ℝ) :=
  tail_of pList2 (l1_P 1) _ _ (by norm_num) (by norm_num [gateR]) (by norm_num [gateR]) gate_check2

theorem tail3 : ∑' n, |compCoeff haagCoeff (P 2) (n + 120)| ≤ (tailQ (111 / 100) : ℝ) :=
  tail_of pList3 (l1_P 2) _ _ (by norm_num) (by norm_num [gateR]) (by norm_num [gateR]) gate_check3

theorem tail4 : ∑' n, |compCoeff haagCoeff (P 3) (n + 120)| ≤ (tailQ (111 / 100) : ℝ) :=
  tail_of pList4 (l1_P 3) _ _ (by norm_num) (by norm_num [gateR]) (by norm_num [gateR]) gate_check4

/-- HJM's weighted Cauchy budget `Σ_r |w_r| T(R_r)` (eq. 6.26), exactly. -/
def cauchyBudget : ℚ :=
  |weights.getD 0 0| * tailQ (6 / 5) + |weights.getD 1 0| * tailQ (111 / 100) +
    |weights.getD 2 0| * tailQ (111 / 100) + |weights.getD 3 0| * tailQ (111 / 100)

lemma cauchyBudget_lt : cauchyBudget < 101718 / 10 ^ 16 := by decide +kernel

/-- **The weighted Cauchy tails of branches 1–4** (HJM 6.26): exactly HJM's budget. -/
theorem weighted_tails :
    |((weights.getD 0 0 : ℚ) : ℝ)| * ∑' n, |compCoeff haagCoeff (P 0) (n + 120)| +
      |((weights.getD 1 0 : ℚ) : ℝ)| * ∑' n, |compCoeff haagCoeff (P 1) (n + 120)| +
      |((weights.getD 2 0 : ℚ) : ℝ)| * ∑' n, |compCoeff haagCoeff (P 2) (n + 120)| +
      |((weights.getD 3 0 : ℚ) : ℝ)| * ∑' n, |compCoeff haagCoeff (P 3) (n + 120)| ≤ (cauchyBudget : ℝ) := by
  unfold cauchyBudget
  push_cast
  gcongr
  · exact tail1
  · exact tail2
  · exact tail3
  · exact tail4

end Grothe.HJM.Cauchy
