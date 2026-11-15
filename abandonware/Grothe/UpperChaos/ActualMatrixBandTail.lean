import Grothe.UpperChaos.ActualMatrixCutoffTail
import Grothe.UpperChaos.BandProj

/-!
# Actual comparison-band coordinate tails

Agent-ID: codex-2ca4.

The output restriction is the existing `bandModes`, hence the same total
Hermite degree used by `bandProj`. A finite upper endpoint is required:
`ComparisonBand.hi = 0` means an unbounded band and is deliberately excluded.
This supplies the band-index part of the coordinate-tail estimate. A numerical
source-norm certificate and the operator-norm conversion remain separate.
-/

namespace Grothe.UpperChaos.ActualMatrixBandTail

open ActualMatrixCutoffTail ActualTaylorFiniteCoefficients
open ActualSourceNormEvaluation OriginalHSParameterGates

noncomputable section

theorem outputDegree_eq_bideg (m : Idx2) :
    outputDegree m = (bideg m).1 + (bideg m).2 := by
  simp [outputDegree, bideg, Nat.add_assoc]

/-- Membership in the actual finite comparison band bounds its total degree. -/
theorem outputDegree_le_of_mem_bandModes (b : GrotheKernel.ComparisonBand)
    (hhi : b.hi ≠ 0) (m : Idx2) (hm : m ∈ bandModes b) :
    outputDegree m ≤ b.hi := by
  simp [bandModes, GrotheKernel.ComparisonBand.contains, hhi] at hm
  rw [outputDegree_eq_bideg]
  exact hm.2

def bandExcludedEnergyTerm (g : Gate) (b : GrotheKernel.ComparisonBand)
    (mn : Idx2 × Idx2) : ℝ :=
  if mn.1 ∈ bandModes b ∧ g.cutoff < coordinateExponent mn.2 g.coordinate then
    ‖matrixEntry g.power mn.1 mn.2‖ ^ 2
  else 0

theorem bandExcludedEnergyTerm_nonneg (g : Gate) (b : GrotheKernel.ComparisonBand)
    (mn : Idx2 × Idx2) : 0 ≤ bandExcludedEnergyTerm g b mn := by
  unfold bandExcludedEnergyTerm
  split
  · exact sq_nonneg _
  · exact le_rfl

theorem bandExcludedEnergyTerm_le (g : Gate) (b : GrotheKernel.ComparisonBand)
    (hhi : b.hi ≠ 0) (hD : b.hi ≤ g.degree) (mn : Idx2 × Idx2) :
    bandExcludedEnergyTerm g b mn ≤ excludedEnergyTerm g mn := by
  by_cases h : mn.1 ∈ bandModes b ∧ g.cutoff < coordinateExponent mn.2 g.coordinate
  · have hm : outputDegree mn.1 ≤ g.degree :=
      (outputDegree_le_of_mem_bandModes b hhi mn.1 h.1).trans hD
    simp only [bandExcludedEnergyTerm, ite_eq_left h, excludedEnergyTerm,
      ite_eq_left (And.intro hm h.2)]
    exact le_rfl
  · simpa only [bandExcludedEnergyTerm, ite_eq_right h] using excludedEnergyTerm_nonneg g mn

/-- Actual finite-band matrix energy obeys the same coordinate-tail budget. -/
theorem finite_bandExcludedEnergy_le (g : Gate) (hg : gateOK g = true)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ g.degree)
    (s : Finset (Idx2 × Idx2)) :
    (∑ mn ∈ s, bandExcludedEnergyTerm g b mn) ≤
      (sourceNormValue g).re / cutoffWeight g := by
  exact (Finset.sum_le_sum fun mn _ => bandExcludedEnergyTerm_le g b hhi hD mn).trans
    (finite_excludedEnergy_le g hg s)

theorem summable_bandExcludedEnergyTerm (g : Gate) (hg : gateOK g = true)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ g.degree) :
    Summable (bandExcludedEnergyTerm g b) := by
  exact summable_of_sum_le (bandExcludedEnergyTerm_nonneg g b)
    (finite_bandExcludedEnergy_le g hg b hhi hD)

theorem tsum_bandExcludedEnergy_le (g : Gate) (hg : gateOK g = true)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ g.degree) :
    (∑' mn : Idx2 × Idx2, bandExcludedEnergyTerm g b mn) ≤
      (sourceNormValue g).re / cutoffWeight g := by
  exact Real.tsum_le_of_sum_le (bandExcludedEnergyTerm_nonneg g b)
    (finite_bandExcludedEnergy_le g hg b hhi hD)

end
end Grothe.UpperChaos.ActualMatrixBandTail
