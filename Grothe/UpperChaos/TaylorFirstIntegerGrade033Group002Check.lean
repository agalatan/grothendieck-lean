import Grothe.UpperChaos.TaylorFirstIntegerGrade033Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade033Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade033Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade033Part01024 = 174003843146296167165956261629564020832951969425491595608782109510245133121555823872978555134903148624971038720 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade033Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade033Part01088 = 103500213766560023325513909898112578169124733952436802473699401207839355407530513070193276200581997296470720512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade033Part01152.size = 38 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade033Part01152 = 82893427227504837795662055742561985632147761073074461481904884208186478547645677176344516843915070227106234368 := by decide +kernel

theorem group_length : firstCenterIntegerGrade033Group002.size = 166 := by
  simp only [firstCenterIntegerGrade033Group002, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade033Group002 = 360397484140361028287132227270238584634224464451002859564386394926270967076732014119516348179400216148547993600 := by
  simp only [firstCenterIntegerGrade033Group002, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade033Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade033Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade033Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
