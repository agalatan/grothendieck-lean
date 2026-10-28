import Grothe.UpperChaos.ThirdArrayGrades
import Grothe.UpperChaos.ThirdCenterEnergyConditional
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Source-bound exact third-center size and energy, with strict transitive
dependency checks. These finite identities do not establish Gaussian error estimates
or close the other endpoint obligations. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.ThirdCenterKernelEnergy

/-- The direct authoritative integer source contains exactly 6,552 values. -/
theorem size_check : thirdCenterInts.size = 6552 := by
  rw [ThirdIntegerSourceBinding.source_array]
  simp only [List.size_toArray, ThirdIntegerSourceBinding.allValues,
    ThirdIntegerSourceBinding.source_values, List.length_append,
    ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, ThirdGradeLengths.len12, ThirdGradeLengths.len13, ThirdGradeLengths.len14, ThirdGradeLengths.len15, ThirdGradeLengths.len16, ThirdGradeLengths.len17, ThirdGradeLengths.len18, ThirdGradeLengths.len19, ThirdGradeLengths.len20, ThirdGradeLengths.len21, ThirdGradeLengths.len22, ThirdGradeLengths.len23, ThirdGradeLengths.len24, ThirdGradeLengths.len25, Nat.reduceAdd]

/-- The actual complete third-center energy proposition; all 26 source-grade
sums and the source-array binding are discharged by checked imports. -/
theorem energy_check :
    (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), thirdCenterCoeff q c d ^ 2) = thirdCenterEnergyQ ∧
    ∀ k : Fin 4,
      (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          if gradedMode q c d ∈ thirdCenterBandModes k then thirdCenterCoeff q c d ^ 2 else 0) =
        thirdCenterBandEnergyQ k :=
  ThirdCenterEnergyConditional.energy_check_of_grade_sums ThirdArrayGrades.all_grade_sums

open Lean Elab Command
run_cmd do
  for target in #[``size_check, ``energy_check] do
    let axs ← Lean.collectAxioms target
    logInfo m!"Audit {target}: {axs}"
    for ax in axs do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
end Grothe.UpperChaos.ThirdCenterKernelEnergy
