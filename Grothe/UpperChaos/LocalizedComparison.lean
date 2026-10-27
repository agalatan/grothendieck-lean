import Grothe.UpperChaos.EnergyBlock
import Grothe.Upper.BandComparison
import Grothe.Upper.ComparisonMass
import Grothe.Upper.ComparisonOverlap

/-!+# The selected-head comparison from spectrally supported error pieces

The external Gaussian enclosures concern the component errors of the mixed
Taylor truncation, not the final near-linear kernel. Each component is split
at its certified degree bands and then smoothed. Smoothing preserves total
chaos degree and contracts L². These inputs are recorded as `ComparisonInputs`.
The finite energy masses, comparison inequality and final budget are proved.
-/
namespace Grothe.UpperChaos

set_option maxRecDepth 4096

open MeasureTheory Finset Grothe.Upper GrotheKernel

noncomputable section

abbrev ComparisonIndex := Fin comparisonBands.length

def comparisonBand (j : ComparisonIndex) : ComparisonBand := comparisonBands[j]

lemma comparisonBand_mem (j : ComparisonIndex) : comparisonBand j ∈ comparisonBands :=
  List.getElem_mem _

lemma sum_comparisonBand (f : ComparisonBand → ℝ) :
    (∑ j : ComparisonIndex, f (comparisonBand j)) = (comparisonBands.map f).sum := by
  change (∑ j : ComparisonIndex, f comparisonBands[j]) = _
  rw [← List.sum_ofFn]
  exact congrArg List.sum (List.ofFn_getElem_eq_map comparisonBands f)

lemma cast_list_sum (l : List ℚ) : ((l.sum : ℚ) : ℝ) = (l.map fun (q : ℚ) => (q : ℝ)).sum := by
  induction l with
  | nil => simp
  | cons q l ih => simp only [List.sum_cons, List.map_cons, Rat.cast_add, ih]

/-- The inherited Gaussian coefficient-error enclosures, with their spectral
supports retained. No head residual or near-linearity conclusion is assumed. -/
structure ComparisonInputs (G X : Lp ℂ 2 mu2) where
  piece : ComparisonIndex → Lp ℂ 2 mu2
  difference : G - X = ∑ j, piece j
  norm_le : ∀ j, ‖piece j‖ ≤ ((comparisonBand j).error : ℝ)
  support : ∀ (j : ComparisonIndex) (p : ℕ × ℕ),
    (comparisonBand j).contains p.1 p.2 = false → energy (piece j) p = 0

/-- Localizing the comparison charges only the selected head's weighted band masses.
The entire quadratic error is included once, even when the bands overlap. -/
theorem localized_comparison {G X : Lp ℂ 2 mu2} (h : ComparisonInputs G X)
    (hclose : ∑ p ∈ headIdx 501, |energy X p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p * |energy G p - energy X p| ≤ (compareQ : ℝ) := by
  classical
  generalize hS : headIdx 501 = S at hclose ⊢
  let a : ComparisonIndex → ℝ := fun j => ((comparisonBand j).norm : ℝ)
  let e : ComparisonIndex → ℝ := fun j => ((comparisonBand j).error : ℝ)
  have ha : ∀ j, 0 ≤ a j := fun j => by
    dsimp [a]
    exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).2.1
  have he : ∀ j, 0 ≤ e j := fun j => by
    dsimp [e]
    exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).1
  let overlap : ComparisonIndex → ComparisonIndex → Bool := fun j k =>
    comparisonOverlap (comparisonBand j) (comparisonBand k)
  let q : ℝ := ∑ j, ∑ k, if overlap j k then e j * e k else 0
  have hz (j : ComparisonIndex) (p : ℕ × ℕ)
      (hn : (comparisonBand j).contains p.1 p.2 = false) :
      energyBlock (h.piece j) p = 0 := by
    have hh : ‖energyBlock (h.piece j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (h.support j p hn)
    apply norm_eq_zero.mp
    nlinarith [norm_nonneg (energyBlock (h.piece j) p)]
  have hquad : ∑ p ∈ S, ‖energyBlock G p - energyBlock X p‖ ^ 2 ≤ q := by
    have hh := BandComparison.quadratic_sum_le_overlap S (univ : Finset ComparisonIndex)
      (fun j => energyBlock (h.piece j)) e overlap (fun j _ => he j)
      (fun j _ => by
        simp_rw [norm_energyBlock_sq]
        exact (energy_sum_le_norm_sq _ _).trans
          (pow_le_pow_left₀ (norm_nonneg _) (h.norm_le j) 2))
      (fun j _ k _ hjk p _ => by
        rcases comparisonOverlap_separate (comparisonBand j) (comparisonBand k) p.1 p.2 hjk
          with hj | hk
        · exact Or.inl (hz j p hj)
        · exact Or.inr (hz k p hk))
    simpa only [← energyBlock_sub, h.difference, energyBlock_sum, q] using hh
  have hc := BandComparison.weighted_compare S (univ : Finset ComparisonIndex) comparisonWeight
    (energyBlock X) (energyBlock G) (fun j => energyBlock (h.piece j))
    (fun j => bandIndices (comparisonBand j)) a e q
    (fun p _ => comparisonWeight_bounds p)
    (fun p _ => by rw [← energyBlock_sub, h.difference, energyBlock_sum])
    (fun j _ p hp hpb => by
      have hn : (comparisonBand j).contains p.1 p.2 = false := by
        simpa [bandIndices, hS, hp] using hpb
      exact hz j p hn)
    (fun j _ => ha j) (fun j _ => he j)
    (fun j _ => by
      have hh := actual_band_mass (by simpa only [hS] using hclose) (comparisonBand_mem j)
      have hi : S ∩ bandIndices (comparisonBand j) = bandIndices (comparisonBand j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hh)
    (fun j _ => by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _) (h.norm_le j) 2)) hquad
  simp_rw [norm_energyBlock_sq] at hc
  refine hc.trans ?_
  have hb := comparison_overlap_budget
  have hcross : ∑ j, a j * e j =
      (((comparisonBands.map fun b => b.norm * b.error).sum : ℚ) : ℝ) := by
    change (∑ j, ((comparisonBand j).norm : ℝ) * ((comparisonBand j).error : ℝ)) = _
    rw [sum_comparisonBand (fun b => (b.norm : ℝ) * (b.error : ℝ)), cast_list_sum]
    simp [List.map_map, Function.comp_def]
  have hsum : q = (comparisonQuadraticQ : ℝ) := by
    dsimp [q, e, overlap, comparisonQuadraticQ]
    simp_rw [sum_comparisonBand]
    rw [cast_list_sum]
    simp only [List.map_map, Function.comp_def]
    apply congrArg List.sum
    apply List.map_congr_left
    intro b hb
    rw [cast_list_sum]
    simp [List.map_map]
  rw [hcross, hsum]

  exact_mod_cast hb

end
end Grothe.UpperChaos
