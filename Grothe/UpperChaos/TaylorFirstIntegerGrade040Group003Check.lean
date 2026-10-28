import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade040Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade040Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade040Part01536 = 23134996494619998083136571356361854413404489043359012582366794321110913861471946394780620880843192512095977472 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade040Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade040Part01600 = 13097011301626810236149173023272169498994809118023010975653571888711996208754648508578895109909205906943377408 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade040Part01664.size = 58 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade040Part01664 = 50143672224459792497220945882928714484756792339716176170079170990307990102060662134648181553664278928715415552 := by decide +kernel

theorem group_length : firstCenterIntegerGrade040Group003.size = 186 := by
  simp only [firstCenterIntegerGrade040Group003, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade040Group003 = 86375680020706600816506690262562738397156090501098199728099537200130900172287257038007697544416677347754770432 := by
  simp only [firstCenterIntegerGrade040Group003, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade040Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
