import Grothe.Upper.CompositeComparisonData
import Grothe.Upper.ComparisonMass

/-! Actual weighted masses for the seven composite-comparison pieces.
The existing finite source certificate is reused, with the full new table
discrepancy paid conservatively once per old high component.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
namespace Grothe.Upper.CompositeComparisonData
open Finset GrotheKernel
noncomputable section

theorem high_indices (g : Fin 3) :
    bandIndices (highBand g) = (highOld g).biUnion fun k => bandIndices (oldBand k) := by
  classical
  unfold bandIndices
  generalize headIdx 501 = S
  ext p
  simp only [mem_filter, mem_biUnion]
  constructor
  · rintro ⟨hp, hc⟩
    obtain ⟨k, hk, hc⟩ := (high_covered g p.1 p.2).mp hc
    exact ⟨k, hk, hp, hc⟩
  · rintro ⟨k, hk, hp, hc⟩
    exact ⟨hp, (high_covered g p.1 p.2).mpr ⟨k, hk, hc⟩⟩

theorem high_disjoint (g : Fin 3) :
    (↑(highOld g) : Set OldIndex).PairwiseDisjoint fun k => bandIndices (oldBand k) := by
  classical
  unfold bandIndices
  generalize headIdx 501 = S
  intro k hk l hl hne
  apply disjoint_left.mpr
  intro p hp hq
  have hs := comparison_group_separate k l
    ((high_old_group g k hk).trans (high_old_group g l hl).symm) hne
  rcases comparisonOverlap_separate (oldBand k) (oldBand l) p.1 p.2 hs with hz | hz
  · have hh := (mem_filter.mp hp).2
    rw [hz] at hh
    exact Bool.false_ne_true hh
  · have hh := (mem_filter.mp hq).2
    rw [hz] at hh
    exact Bool.false_ne_true hh

theorem actual_low_mass {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrorQ : ℝ))
    (g : Fin 4) :
    ∑ p ∈ bandIndices (lowBand g), comparisonWeight p ^ 2 * EX p ≤
      (lowRadiusQ g : ℝ) ^ 2 := by
  have hb : lowBand g ∈ comparisonBands := List.getElem_mem _
  have h := actual_band_mass_of_energy_error hclose hb
  have hd : (lowBand g).norm ^ 2 + energyErrorQ ≤ lowRadiusQ g ^ 2 := low_mass_budget g
  have he : (0 : ℝ) ≤ energyErrQ := by norm_num [energyErrQ]
  have hd' : ((lowBand g).norm : ℝ) ^ 2 + (energyErrorQ : ℝ) ≤
      (lowRadiusQ g : ℝ) ^ 2 := by
    exact_mod_cast hd
  linarith

theorem actual_high_mass {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrorQ : ℝ))
    (g : Fin 3) :
    ∑ p ∈ bandIndices (highBand g), comparisonWeight p ^ 2 * EX p ≤
      (highRadiusQ g : ℝ) ^ 2 := by
  classical
  rw [high_indices, sum_biUnion (high_disjoint g)]
  have h (k : OldIndex) (_hk : k ∈ highOld g) :
      ∑ p ∈ bandIndices (oldBand k), comparisonWeight p ^ 2 * EX p ≤
        ((oldBand k).norm : ℝ) ^ 2 + (energyErrorQ : ℝ) := by
    have hb : oldBand k ∈ comparisonBands := List.getElem_mem _
    have hm := actual_band_mass_of_energy_error hclose hb
    have he : (0 : ℝ) ≤ energyErrQ := by norm_num [energyErrQ]
    linarith
  have hsum := sum_le_sum h
  have hd : (∑ k ∈ highOld g, ((oldBand k).norm : ℝ) ^ 2) +
      ((highOld g).card : ℝ) * (energyErrorQ : ℝ) ≤ (highRadiusQ g : ℝ) ^ 2 := by
    exact_mod_cast high_mass_budget g
  exact hsum.trans (by simpa only [sum_add_distrib, sum_const, nsmul_eq_mul] using hd)

theorem actual_piece_mass {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrorQ : ℝ))
    (j : PieceIndex) :
    ∑ p ∈ bandIndices (band j), comparisonWeight p ^ 2 * EX p ≤ (radiusQ j : ℝ) ^ 2 := by
  fin_cases j
  · exact actual_low_mass hclose 0
  · exact actual_low_mass hclose 1
  · exact actual_high_mass hclose 0
  · exact actual_low_mass hclose 2
  · exact actual_high_mass hclose 1
  · exact actual_low_mass hclose 3
  · exact actual_high_mass hclose 2

end
end Grothe.Upper.CompositeComparisonData
