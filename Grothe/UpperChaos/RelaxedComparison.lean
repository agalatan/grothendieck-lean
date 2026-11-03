import Grothe.UpperChaos.LocalizedComparison
import Grothe.Upper.RelaxedComparisonData

/-! The original eighteen Gaussian error pieces with a relaxed selected
energy-table tolerance. The added 1/5000 is a weighted band-mass norm radius,
not a change to any Gaussian error radius or L2 source allowance.
Agent-ID: codex-7c2e. -/

namespace Grothe.UpperChaos

open MeasureTheory Finset Grothe.Upper GrotheKernel

noncomputable section

theorem localized_comparison_grouped_relaxed {G X : Lp ℂ 2 mu2} (h : ComparisonInputs G X)
    (hclose : ∑ p ∈ headIdx 501, |energy X p - (energyTable p : ℝ)| ≤ (RelaxedComparisonData.energyErrorQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p * |energy G p - energy X p| ≤
      (RelaxedComparisonData.comparisonCapQ : ℝ) := by
  classical
  generalize hS : headIdx 501 = S at hclose ⊢
  let a : ComparisonIndex → ℝ := fun j =>
    ((comparisonBand j).norm : ℝ) + (RelaxedComparisonData.radiusSlackQ : ℝ)
  let e : ComparisonIndex → ℝ := fun j => ((comparisonBand j).error : ℝ)
  let r : Fin 4 → ℝ := fun g => (comparisonGroupRadiusQ g : ℝ)
  have ha : ∀ j, 0 ≤ a j := fun j => by
    exact add_nonneg
      (by exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).2.1)
      (by exact_mod_cast RelaxedComparisonData.radiusSlack_nonneg)
  have he : ∀ j, 0 ≤ e j := fun j => by
    dsimp [e]
    exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).1
  have hz (j : ComparisonIndex) (p : ℕ × ℕ)
      (hn : (comparisonBand j).contains p.1 p.2 = false) :
      energyBlock (h.piece j) p = 0 := by
    have hh : ‖energyBlock (h.piece j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (h.support j p hn)
    apply norm_eq_zero.mp
    nlinarith [norm_nonneg (energyBlock (h.piece j) p)]
  have hradius (g : Fin 4) : 0 ≤ r g ∧
      ∑ j ∈ (univ : Finset ComparisonIndex).filter (fun j => comparisonGroup j = g),
        e j ^ 2 ≤ r g ^ 2 := by
    have hg := comparison_group_radii g
    constructor
    · change 0 ≤ (comparisonGroupRadiusQ g : ℝ)
      exact_mod_cast hg.1
    · change ∑ j ∈ (univ : Finset GroupedComparisonIndex).filter
          (fun j => comparisonGroup j = g), ((comparisonBands[j].error : ℝ) ^ 2) ≤
          (comparisonGroupRadiusQ g : ℝ) ^ 2
      have hq : ((∑ j : GroupedComparisonIndex,
          if comparisonGroup j = g then comparisonBands[j].error ^ 2 else 0 : ℚ) : ℝ) ≤
          ((comparisonGroupRadiusQ g ^ 2 : ℚ) : ℝ) := by exact_mod_cast hg.2
      rw [sum_filter]
      simpa only [Rat.cast_sum, Rat.cast_pow, apply_ite, Rat.cast_zero] using hq
  have hquad : ∑ p ∈ S, ‖energyBlock G p - energyBlock X p‖ ^ 2 ≤
      (∑ g : Fin 4, r g) ^ 2 := by
    have hh := BandComparison.quadratic_sum_le_grouped S (univ : Finset ComparisonIndex)
      (univ : Finset (Fin 4)) (fun j => energyBlock (h.piece j)) e comparisonGroup r
      (by simp) (fun j _ => he j)
      (fun j _ => by
        simp_rw [norm_energyBlock_sq]
        exact (energy_sum_le_norm_sq _ _).trans
          (pow_le_pow_left₀ (norm_nonneg _) (h.norm_le j) 2))
      (fun j _ k _ hgroup hne p _ => by
        have hs := comparison_group_separate j k hgroup hne
        rcases comparisonOverlap_separate (comparisonBand j) (comparisonBand k) p.1 p.2 hs
          with hj | hk
        · exact Or.inl (hz j p hj)
        · exact Or.inr (hz k p hk))
      (fun g _ => hradius g)
    simpa only [← energyBlock_sub, h.difference, energyBlock_sum] using hh
  have hc := BandComparison.weighted_compare S (univ : Finset ComparisonIndex) comparisonWeight
    (energyBlock X) (energyBlock G) (fun j => energyBlock (h.piece j))
    (fun j => bandIndices (comparisonBand j)) a e ((∑ g : Fin 4, r g) ^ 2)
    (fun p _ => comparisonWeight_bounds p)
    (fun p _ => by rw [← energyBlock_sub, h.difference, energyBlock_sum])
    (fun j _ p hp hpb => by
      have hn : (comparisonBand j).contains p.1 p.2 = false := by
        simpa [bandIndices, hS, hp] using hpb
      exact hz j p hn)
    (fun j _ => ha j) (fun j _ => he j)
    (fun j _ => by
      have hh := actual_band_mass_of_energy_error
        (by simpa only [hS] using hclose) (comparisonBand_mem j)
      have hn : 0 ≤ ((comparisonBand j).norm : ℝ) := by
        exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).2.1
      have hs : 0 ≤ (RelaxedComparisonData.radiusSlackQ : ℝ) := by
        exact_mod_cast RelaxedComparisonData.radiusSlack_nonneg
      have hd : (RelaxedComparisonData.energyErrorQ : ℝ) ≤
          (RelaxedComparisonData.radiusSlackQ : ℝ) ^ 2 := by
        exact_mod_cast RelaxedComparisonData.energy_le_radiusSlack_sq
      have hpaid : 0 ≤ (energyErrQ : ℝ) := by
        exact_mod_cast RelaxedComparisonData.original_energy_nonneg
      have hmass : ∑ p ∈ bandIndices (comparisonBand j),
          comparisonWeight p ^ 2 * energy X p ≤ a j ^ 2 := by
        dsimp [a]
        nlinarith [mul_nonneg hn hs]
      have hi : S ∩ bandIndices (comparisonBand j) = bandIndices (comparisonBand j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hmass)
    (fun j _ => by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _) (h.norm_le j) 2)) hquad
  simp_rw [norm_energyBlock_sq] at hc
  refine hc.trans ?_
  have hcross : ∑ j, a j * e j =
      (((comparisonBands.map fun b =>
        (b.norm + RelaxedComparisonData.radiusSlackQ) * b.error).sum : ℚ) : ℝ) := by
    change (∑ j, (((comparisonBand j).norm : ℝ) +
      (RelaxedComparisonData.radiusSlackQ : ℝ)) * ((comparisonBand j).error : ℝ)) = _
    rw [sum_comparisonBand (fun b =>
      ((b.norm : ℝ) + (RelaxedComparisonData.radiusSlackQ : ℝ)) * (b.error : ℝ)),
      cast_list_sum]
    simp only [List.map_map, Function.comp_def, Rat.cast_mul, Rat.cast_add]
  have hsum : (∑ g : Fin 4, r g) = ((∑ g : Fin 4, comparisonGroupRadiusQ g : ℚ) : ℝ) := by
    simp [r]
  rw [hcross, hsum]
  exact_mod_cast RelaxedComparisonData.comparison_budget

end
end Grothe.UpperChaos
