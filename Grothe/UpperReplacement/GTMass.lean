import Grothe.UpperReplacement.GTInterface
import Grothe.Upper.ComparisonMass

/-!
# Unweighted reference energy in the seven comparison bands

Agent-ID: codex-a7c4. The finite table check includes the full table tolerance
in each band. The analytic estimate then applies to the actual reference energies.
-/

set_option warningAsError true

namespace Grothe.UpperReplacement.GTComparison

open Finset Grothe.Upper GrotheKernel

/-- Closed Boolean check for all seven unweighted band-mass ceilings. -/
def univMassCheck : Bool :=
  let rows := weightedRows energyRows (fun _ _ => 1)
  (List.finRange 7).all fun j =>
    decide (comparisonMass rows (threeBandBands j) + energyErrQ ≤ univThreeBandMassQ j ^ 2)

set_option maxHeartbeats 0 in
theorem mass_checked : univMassCheck = true := by
  native_decide

theorem univ_mass_check (hcheck : univMassCheck = true) (j : Fin 7) :
    comparisonMass (weightedRows energyRows (fun _ _ => 1)) (threeBandBands j) + energyErrQ ≤
      univThreeBandMassQ j ^ 2 := by
  have h := hcheck
  simp only [univMassCheck, List.all_eq_true, decide_eq_true_eq] at h
  exact h j (List.mem_finRange j)

noncomputable section

/-- Unweighted actual-`X` band mass bound from `univ_mass_check` and table accuracy. -/
theorem actual_univ_band_mass (hcheck : univMassCheck = true) {EX : ℕ × ℕ → ℝ}
    (hwithin : tabWithin 501 energyRows = true)
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (j : Fin 7) :
    ∑ p ∈ bandIndices (threeBandBands j), (1 : ℝ) ^ 2 * EX p ≤
      (univThreeBandMassQ j : ℝ) ^ 2 := by
  have hm : (∑ p ∈ bandIndices (threeBandBands j), (energyTable p : ℝ)) +
      (energyErrQ : ℝ) ≤ (univThreeBandMassQ j : ℝ) ^ 2 := by
    have h := univ_mass_check hcheck j
    rw [comparisonMass_weighted_sum hwithin] at h
    change (∑ p ∈ bandIndices (threeBandBands j), energyTable p * (1 : ℚ) ^ 2) +
      energyErrQ ≤ univThreeBandMassQ j ^ 2 at h
    simp only [one_pow, mul_one] at h
    simpa only [Rat.cast_add, Rat.cast_sum, Rat.cast_pow] using (Rat.cast_le (K := ℝ)).2 h
  have he : ∑ p ∈ bandIndices (threeBandBands j), |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) :=
    (sum_le_sum_of_subset_of_nonneg (bandIndices_subset _) fun _ _ _ => abs_nonneg _).trans hclose
  calc ∑ p ∈ bandIndices (threeBandBands j), (1 : ℝ) ^ 2 * EX p
      ≤ ∑ p ∈ bandIndices (threeBandBands j),
          ((energyTable p : ℝ) + |EX p - (energyTable p : ℝ)|) := by
        refine sum_le_sum fun p _ => ?_
        have ha := le_abs_self (EX p - (energyTable p : ℝ))
        linarith
    _ = (∑ p ∈ bandIndices (threeBandBands j), (energyTable p : ℝ)) +
        ∑ p ∈ bandIndices (threeBandBands j), |EX p - (energyTable p : ℝ)| := sum_add_distrib
    _ ≤ (∑ p ∈ bandIndices (threeBandBands j), (energyTable p : ℝ)) + (energyErrQ : ℝ) :=
        add_le_add le_rfl he
    _ ≤ (univThreeBandMassQ j : ℝ) ^ 2 := hm

end

end Grothe.UpperReplacement.GTComparison
