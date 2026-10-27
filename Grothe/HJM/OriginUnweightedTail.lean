import Grothe.HJM.OriginSymmetricTailBudget

/-!
# Origin tail from unweighted Gaussian residuals

Agent-ID: codex-aa04. The unweighted residual
suffix bounds are explicit hypotheses, not claimed numerical theorems.
The phase-phase contribution vanishes before absolute values; the phase
suffix is bounded by the existing Wallis theorem.
-/

open MeasureTheory Finset Grothe.LowerAnalytic

namespace Grothe.HJM.Origin

noncomputable section

/-- Square-summable actual residual coefficients, in the original grading. -/
def leftUnweightedTail (N : ℕ) : ℝ :=
  ∑' j : ℕ, ‖chargeOneCoeff fResidualLp (j + N)‖ ^ 2

def rightUnweightedTail (N : ℕ) : ℝ :=
  ∑' j : ℕ, ‖chargeOneCoeff gResidualLp (j + N)‖ ^ 2

/-- One conditional unweighted criterion. No weighted number-operator
energy is used; both full infinite residual suffixes remain hypotheses. -/
theorem coeff_tail_at_120_le_of_unweighted_residual_caps
    (hL : leftUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2)
    (hR : rightUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2) :
    (∑' j : ℕ, |coeff (j + 120)|) ≤ (19761 / 100000000 : ℝ) := by
  apply (coeff_tail_summable 120).tsum_le_of_sum_le
  intro s
  let x : ℕ → ℝ := fun j => ‖chargeOneCoeff fResidualLp (j + 120)‖
  let y : ℕ → ℝ := fun j => ‖chargeOneCoeff gResidualLp (j + 120)‖
  let z : ℕ → ℝ := fun j => ‖chargeOneCoeff Grothe.Haag.phaseLp (j + 120)‖
  have hsL : Summable (fun j : ℕ => ‖chargeOneCoeff fResidualLp (j + 120)‖ ^ 2) :=
    (summable_nat_add_iff 120).mpr (chargeOneCoeff_summable_sq fResidualLp)
  have hsR : Summable (fun j : ℕ => ‖chargeOneCoeff gResidualLp (j + 120)‖ ^ 2) :=
    (summable_nat_add_iff 120).mpr (chargeOneCoeff_summable_sq gResidualLp)
  have hLsum : ∑ j ∈ s, x j ^ 2 ≤ (21 / 10000 : ℝ) ^ 2 := by
    exact (hsL.sum_le_tsum s (fun j _ => sq_nonneg _)).trans hL
  have hRsum : ∑ j ∈ s, y j ^ 2 ≤ (21 / 10000 : ℝ) ^ 2 := by
    exact (hsR.sum_le_tsum s (fun j _ => sq_nonneg _)).trans hR
  have hsH : Summable (fun j : ℕ => haagCoeff (j + 120)) :=
    (summable_nat_add_iff 120).mpr summable_haagCoeff.of_abs
  have hphase : ∑ j ∈ s, z j ^ 2 ≤ (1 / 480 : ℝ) := by
    calc
      _ = ∑ j ∈ s, haagCoeff (j + 120) := by
        apply Finset.sum_congr rfl
        intro j _
        exact phase_chargeOneCoeff_energy (j + 120)
      _ ≤ ∑' j : ℕ, haagCoeff (j + 120) :=
        hsH.sum_le_tsum s (fun j _ => haagCoeff_nonneg _)
      _ = ∑' j : ℕ, haagCoeff (120 + j) := by
        congr 1
        funext j
        rw [Nat.add_comm]
      _ ≤ 1 / (4 * (120 : ℝ)) := HaagerupWallis.tail_le_one_div_four 120 (by norm_num)
      _ = 1 / 480 := by norm_num
  have hphaseRoot : Real.sqrt (∑ j ∈ s, z j ^ 2) ≤ (23 / 500 : ℝ) := by
    have hsmall : Real.sqrt (1 / 480 : ℝ) ≤ (23 / 500 : ℝ) := by
      apply Real.sqrt_le_iff.mpr
      norm_num
    exact (Real.sqrt_le_sqrt hphase).trans hsmall
  have hLroot : Real.sqrt (∑ j ∈ s, x j ^ 2) ≤ (21 / 10000 : ℝ) := by
    simpa only [Real.sqrt_sq (show (0 : ℝ) ≤ 21 / 10000 by norm_num)] using
      Real.sqrt_le_sqrt hLsum
  have hRroot : Real.sqrt (∑ j ∈ s, y j ^ 2) ≤ (21 / 10000 : ℝ) := by
    simpa only [Real.sqrt_sq (show (0 : ℝ) ≤ 21 / 10000 by norm_num)] using
      Real.sqrt_le_sqrt hRsum
  calc
    _ ≤ ∑ j ∈ s, (z j * x j + z j * y j + x j * y j) :=
      sum_le_sum fun j _ => coeff_le_residual_products (j + 120)
    _ = (∑ j ∈ s, z j * x j) + (∑ j ∈ s, z j * y j) +
        ∑ j ∈ s, x j * y j := by simp only [sum_add_distrib]
    _ ≤ Real.sqrt (∑ j ∈ s, z j ^ 2) * Real.sqrt (∑ j ∈ s, x j ^ 2) +
        Real.sqrt (∑ j ∈ s, z j ^ 2) * Real.sqrt (∑ j ∈ s, y j ^ 2) +
        Real.sqrt (∑ j ∈ s, x j ^ 2) * Real.sqrt (∑ j ∈ s, y j ^ 2) :=
      add_le_add (add_le_add (Real.sum_mul_le_sqrt_mul_sqrt s z x)
        (Real.sum_mul_le_sqrt_mul_sqrt s z y)) (Real.sum_mul_le_sqrt_mul_sqrt s x y)
    _ ≤ (23 / 500 : ℝ) * (21 / 10000) + (23 / 500) * (21 / 10000) +
        (21 / 10000) * (21 / 10000) := by
      exact add_le_add (add_le_add
        (mul_le_mul hphaseRoot hLroot (Real.sqrt_nonneg _) (by norm_num))
        (mul_le_mul hphaseRoot hRroot (Real.sqrt_nonneg _) (by norm_num)))
        (mul_le_mul hLroot hRroot (Real.sqrt_nonneg _) (by norm_num))
    _ = 19761 / 100000000 := by norm_num

end
end Grothe.HJM.Origin

namespace Grothe.HJM

noncomputable section

/-- Existing origin-tail ledger follows conditionally from the two
unweighted residual suffix bounds. -/
theorem origin_tail_of_unweighted_residual_caps
    (hL : Origin.leftUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2)
    (hR : Origin.rightUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2) :
    |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (originTailBudget : ℝ) := by
  have hcap : (∑' j : ℕ, |Origin.coeff (j + 120)|) ≤
      (19761 / 100000000 : ℝ) :=
    Origin.coeff_tail_at_120_le_of_unweighted_residual_caps hL hR
  have hbudgetQ : (397752354801503847 / 10 ^ 21 : ℚ) *
      (19761 / 100000000) ≤ originTailBudget := by
    have hwt : (0 : ℚ) ≤ 397752354801503847 / 10 ^ 21 := by norm_num
    have hcap : (19761 / 100000000 : ℚ) ≤ 2613 / 10000000 := by norm_num
    exact (mul_le_mul_of_nonneg_left hcap hwt).trans origin_symmetric_tail_cap_lt_budget.le
  have hbudget : (((397752354801503847 / 10 ^ 21 : ℚ) *
      (19761 / 100000000) : ℚ) : ℝ) ≤ (originTailBudget : ℝ) :=
    Rat.cast_le.mpr hbudgetQ
  change |wt 5| * (∑' j : ℕ, |Origin.coeff (j + 120)|) ≤ (originTailBudget : ℝ)
  rw [wt_five]
  have h := mul_le_mul_of_nonneg_left hcap
    (show (0 : ℝ) ≤ ((397752354801503847 / 10 ^ 21 : ℚ) : ℝ) by norm_num)
  norm_num only [Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] at h hbudget ⊢
  exact h.trans hbudget

end
end Grothe.HJM
