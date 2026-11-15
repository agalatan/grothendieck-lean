-- Grothe/Upper/ImprovedHeadMass.lean
import Grothe.Upper.ImprovedHeadWeight
import Grothe.Upper.ImprovedHeadWeightFacts
import Grothe.UpperChaos.ThreeBandRegrouping

/-! Transfer the checked finite masses to the actual production energies.
The existing energy-table discrepancy is charged once. Low-band masses use
monotonicity of the refined costs. Agent-ID: codex-9b17. Refs #379. -/

set_option warningAsError true

namespace Grothe.Upper

open GrotheKernel Finset
open Grothe.UpperChaos.ThreeBandRegrouping

noncomputable section

/-- Any checked mass for the refined weights survives the original table error. -/
theorem actual_improved_band_mass {EX : ℕ × ℕ → ℝ}
    (hwithin : tabWithin 501 energyRows = true)
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (b : ComparisonBand) (A : ℚ)
    (hmass : comparisonMass (weightedRows energyRows improvedWeightQ) b + energyErrQ ≤ A ^ 2) :
    ∑ p ∈ bandIndices b, improvedWeight p ^ 2 * EX p ≤ (A : ℝ) ^ 2 := by
  have hm : (∑ p ∈ bandIndices b, (energyTable p : ℝ) * improvedWeight p ^ 2) +
      (energyErrQ : ℝ) ≤ (A : ℝ) ^ 2 := by
    rw [comparisonMass_weighted_sum hwithin] at hmass
    change (∑ p ∈ bandIndices b, tabVal energyRows p * improvedWeightQ p.1 p.2 ^ 2) +
      energyErrQ ≤ A ^ 2 at hmass
    change (∑ p ∈ bandIndices b, (tabVal energyRows p : ℝ) *
      (improvedWeightQ p.1 p.2 : ℝ) ^ 2) + (energyErrQ : ℝ) ≤ (A : ℝ) ^ 2
    generalize hS : bandIndices b = S at hmass ⊢
    exact_mod_cast hmass
  have he : ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) :=
    (sum_le_sum_of_subset_of_nonneg (bandIndices_subset b)
      (fun _ _ _ ↦ abs_nonneg _)).trans hclose
  have hw (p : ℕ × ℕ) : improvedWeight p ^ 2 ≤ 1 :=
    pow_le_one₀ (improvedWeight_bounds p).1 (improvedWeight_bounds p).2
  calc
    _ ≤ ∑ p ∈ bandIndices b, ((energyTable p : ℝ) * improvedWeight p ^ 2 +
        |EX p - (energyTable p : ℝ)|) := by
      apply sum_le_sum
      intro p _
      have ha := mul_le_mul_of_nonneg_right
        (le_abs_self (EX p - (energyTable p : ℝ))) (sq_nonneg (improvedWeight p))
      have hh := mul_le_of_le_one_right (abs_nonneg (EX p - (energyTable p : ℝ))) (hw p)
      nlinarith
    _ = (∑ p ∈ bandIndices b, (energyTable p : ℝ) * improvedWeight p ^ 2) +
        ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| := sum_add_distrib
    _ ≤ (∑ p ∈ bandIndices b, (energyTable p : ℝ) * improvedWeight p ^ 2) +
        (energyErrQ : ℝ) := add_le_add le_rfl he
    _ ≤ (A : ℝ) ^ 2 := hm

/-- The actual seven production masses use the refined coefficient costs. -/
theorem actual_improved_threeBand_mass (hf : OriginalFiniteChecks) {EX : ℕ × ℕ → ℝ}
    (hEX : ∀ p, 0 ≤ EX p)
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (j : Fin 7) :
    ∑ p ∈ bandIndices (threeBandBands j), improvedWeight p ^ 2 * EX p ≤
      (improvedThreeBandMassQ j : ℝ) ^ 2 := by
  by_cases hj : j = 2 ∨ j = 4 ∨ j = 6
  · have hb : ∀ n m, (improvedCheckBand j).contains n m =
        (threeBandBands j).contains n m := by
      rcases hj with rfl | rfl | rfl <;> intro n m <;> rfl
    have hm : comparisonMass (weightedRows energyRows improvedWeightQ) (improvedCheckBand j) =
        comparisonMass (weightedRows energyRows improvedWeightQ) (threeBandBands j) := by
      unfold comparisonMass
      simp_rw [hb]
    apply actual_improved_band_mass hf.within hclose (threeBandBands j)
      (improvedThreeBandMassQ j)
    simpa only [hm] using improved_high_mass_check j hj
  · have hj2 : j ≠ 2 := fun h ↦ hj (Or.inl h)
    have hj4 : j ≠ 4 := fun h ↦ hj (Or.inr (Or.inl h))
    have hj6 : j ≠ 6 := fun h ↦ hj (Or.inr (Or.inr h))
    calc
      _ ≤ ∑ p ∈ bandIndices (threeBandBands j), comparisonWeight p ^ 2 * EX p := by
        apply sum_le_sum
        intro p _
        exact mul_le_mul_of_nonneg_right
          (pow_le_pow_left₀ (improvedWeight_bounds p).1
            (improvedWeight_le_comparisonWeight p) 2) (hEX p)
      _ ≤ ((threeBandBands j).norm : ℝ) ^ 2 := actual_threeBand_mass hf hclose j
      _ = (improvedThreeBandMassQ j : ℝ) ^ 2 := by
        fin_cases j
        · rfl
        · rfl
        · exact (hj2 rfl).elim
        · rfl
        · exact (hj4 rfl).elim
        · rfl
        · exact (hj6 rfl).elim

end
end Grothe.Upper
