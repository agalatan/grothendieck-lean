import Grothe.UpperReplacement.Production
import Grothe.UpperReplacement.HeadWitnessFacts
import Grothe.UpperReplacement.HeadWitnessSound

set_option warningAsError true

/-!
# The signed finite polynomial of the eighteen-channel mixture

Agent-ID: codex-a7c4. The residue witnesses enclose the cell response grades.
The closed head check sums all eighteen signed polynomials before taking absolute values.
-/

namespace Grothe.UpperReplacement.MixtureHead

open Finset Polynomial Upper GrotheKernel Production

noncomputable section

private theorem bounds_of_witnesses {groups : Array (Array (Array Ival))}
    (hgroups : ∀ g < 8, HeadWitness.groupOK (g * 8) (groups[g]?.getD #[]) = true)
    (hhead : HeadCompute.headOK 251 energyRows (HeadWitness.savedGrades groups) RootData.piI
      (711964618746086 / 10 ^ 15) (873503595 / 10 ^ 15) = true) :
    (711964618746086 / 10 ^ 15 : ℝ) ≤ mixturePolynomial.coeff 0 ∧
      ∑ j ∈ range 250, |mixturePolynomial.coeff (j + 1)| ≤ (873503595 / 10 ^ 15 : ℝ) := by
  have hgrades : List.Forall₂ mem
      ((List.range 126).map (gradeEnergy leftVector rightVector))
      (HeadWitness.savedGrades groups).toList := HeadWitness.savedGrades_enclose hgroups
  have hm := mixture_polynomial_enclosure
    (HeadWitness.savedGrades_size groups) hgrades RootData.mem_piI
  have hh := Bool.and_eq_true_iff.mp hhead
  have hb := HeadCompute.bounds_of_head_check hm
    (of_decide_eq_true hh.1) (of_decide_eq_true hh.2)
  simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using hb

/-- The finite signed mixture polynomial has the certified linear floor and nonlinear mass. -/
theorem signed_head :
    (711964618746086 / 10 ^ 15 : ℝ) ≤ mixturePolynomial.coeff 0 ∧
      ∑ j ∈ range 250, |mixturePolynomial.coeff (j + 1)| ≤ (873503595 / 10 ^ 15 : ℝ) :=
  bounds_of_witnesses (groups := HeadWitnessFacts.groups)
    (fun g hg ↦ HeadWitnessFacts.all_groups ⟨g, hg⟩) HeadWitnessFacts.head_checked

end

end Grothe.UpperReplacement.MixtureHead
