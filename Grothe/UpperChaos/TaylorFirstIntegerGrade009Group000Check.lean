import Grothe.UpperChaos.TaylorFirstIntegerGrade009Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade009Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade009Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade009Part00000 = 40813137305619830513628510665026520670143605266293094336030092327769606573237724443714661121636127267278435815260160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade009Part00064.size = 46 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade009Part00064 = 46654705088427004565943792384764970372754341913431137579176891031059752011899056501286360252938211843389280747520 := by decide +kernel

theorem group_length : firstCenterIntegerGrade009Group000.size = 110 := by
  simp only [firstCenterIntegerGrade009Group000, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade009Group000 = 40859792010708257518194454457411285640516359608206525473609269218800666325249623500215947481889065479121825096007680 := by
  simp only [firstCenterIntegerGrade009Group000, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade009Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade009Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade009Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
