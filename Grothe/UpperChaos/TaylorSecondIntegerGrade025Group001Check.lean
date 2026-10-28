import Grothe.UpperChaos.TaylorSecondIntegerGrade025Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade025Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade025Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade025Part00512 = 72860021100029187780724107018202868284853596675060846939699197603249098658602630893690574445947144596921253888 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade025Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade025Part00576 = 85658185287794556108216184408670368121739307511752835142217563848298850908102055497366574201189094276330422272 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade025Part00640.size = 62 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade025Part00640 = 46348674394929761766503919518150861407191142760745456015055198734303706452503127157811308647970642959534129152 := by decide +kernel

theorem group_length : secondCenterIntegerGrade025Group001.size = 190 := by
  simp only [secondCenterIntegerGrade025Group001, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade025Group001 = 204866880782753505655444210945024097813784046947559138096971960185851656019207813548868457295106881832785805312 := by
  simp only [secondCenterIntegerGrade025Group001, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade025Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade025Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade025Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
