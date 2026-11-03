import Grothe.UpperChaos.LocalizedComparison

/-! Localized comparison with variable Gaussian piece errors and energy-table
tolerance. The eighteen original supports are retained, while the quadratic
term uses the sum of the supplied errors. No original error radius is reused
after a change to the Gaussian error family. Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset Grothe.Upper GrotheKernel

namespace Grothe.UpperChaos
noncomputable section

/-- The energy tolerance enlarges only the response band-mass norm radii.
The supplied piece errors are norms and may come from a different family
than the original fixed numerical allowances. -/
theorem localized_comparison_with_errors {G X : Lp ℂ 2 mu2}
    (piece : ComparisonIndex → Lp ℂ 2 mu2) (e : ComparisonIndex → ℝ)
    (hdifference : G - X = ∑ j, piece j)
    (hnorm : ∀ j, ‖piece j‖ ≤ e j)
    (hsupport : ∀ (j : ComparisonIndex) (p : ℕ × ℕ),
      (comparisonBand j).contains p.1 p.2 = false →
      energy (piece j) p = 0)
    {δ σ : ℝ}
    (hclose : ∑ p ∈ headIdx 501, |energy X p - (energyTable p : ℝ)| ≤ δ)
    (hσ : 0 ≤ σ) (hδ : δ ≤ σ ^ 2) :
    ∑ p ∈ headIdx 501, comparisonWeight p * |energy G p - energy X p| ≤
      2 * (∑ j, (((comparisonBand j).norm : ℝ) + σ) * e j) + (∑ j, e j) ^ 2 := by
  classical
  generalize hS : headIdx 501 = S at hclose ⊢
  let a : ComparisonIndex → ℝ := fun j => ((comparisonBand j).norm : ℝ) + σ
  have ha : ∀ j, 0 ≤ a j := fun j => add_nonneg
    (by exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).2.1) hσ
  have he : ∀ j, 0 ≤ e j := fun j => (norm_nonneg _).trans (hnorm j)
  have hz (j : ComparisonIndex) (p : ℕ × ℕ)
      (hn : (comparisonBand j).contains p.1 p.2 = false) :
      energyBlock (piece j) p = 0 := by
    have hh : ‖energyBlock (piece j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (hsupport j p hn)
    apply norm_eq_zero.mp
    nlinarith [norm_nonneg (energyBlock (piece j) p)]
  have hquad : ∑ p ∈ S, ‖energyBlock G p - energyBlock X p‖ ^ 2 ≤
      (∑ j, e j) ^ 2 := by
    have hh := BandComparison.quadratic_sum_le_overlap S (univ : Finset ComparisonIndex)
      (fun j => energyBlock (piece j)) e (fun _ _ => true)
      (fun j _ => he j)
      (fun j _ => by
        simp_rw [norm_energyBlock_sq]
        exact (energy_sum_le_norm_sq _ _).trans
          (pow_le_pow_left₀ (norm_nonneg _) (hnorm j) 2))
      (by intro _ _ _ _ hfalse; cases hfalse)
    simp only [ite_true] at hh
    have heq : (∑ j : ComparisonIndex, ∑ k : ComparisonIndex, e j * e k) =
        (∑ j, e j) ^ 2 := by
      rw [pow_two, sum_mul]
      simp_rw [mul_sum]
    rw [heq] at hh
    simpa only [← energyBlock_sub, hdifference, energyBlock_sum] using hh
  have hc := BandComparison.weighted_compare S (univ : Finset ComparisonIndex) comparisonWeight
    (energyBlock X) (energyBlock G) (fun j => energyBlock (piece j))
    (fun j => bandIndices (comparisonBand j)) a e ((∑ j, e j) ^ 2)
    (fun p _ => comparisonWeight_bounds p)
    (fun p _ => by rw [← energyBlock_sub, hdifference, energyBlock_sum])
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
      have hpaid : 0 ≤ (energyErrQ : ℝ) := by norm_num [energyErrQ]
      have hmass : ∑ p ∈ bandIndices (comparisonBand j),
          comparisonWeight p ^ 2 * energy X p ≤ a j ^ 2 := by
        dsimp [a]
        nlinarith [mul_nonneg hn hσ]
      have hi : S ∩ bandIndices (comparisonBand j) = bandIndices (comparisonBand j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hmass)
    (fun j _ => by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _) (hnorm j) 2)) hquad
  simpa only [norm_energyBlock_sq] using hc

end
end Grothe.UpperChaos
