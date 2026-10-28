import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part04096 = 43199389363350611648168897910301331347387621864764468170167245792107267027915217140705842534307795348488192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part04160 = 19508407023412708898223050395726539635385610583216136144948298618277299377488831475173592533657600602931200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part04224 = 11336541922689936916014882734220171003554148021952112581282373009721122803959413780982326038028706813837312 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part04288.size = 2 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part04288 = 7691793393347796989622761249790700735603784849126826310690279163053930773682285952766188302869975919493120 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group008.size = 194 := by
  simp only [firstCenterIntegerGrade064Group008, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade064Group008 = 81736131702801054452029592290038742721931165319059543207088196583159619983045748349627949408864078684749824 := by
  simp only [firstCenterIntegerGrade064Group008, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
