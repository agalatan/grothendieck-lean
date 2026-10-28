import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade040Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade040Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade040Part01536 = 836214090009946029704786506154551645879925251195169388341444664828741026201956246492962847219696790883270656 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade040Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade040Part01600 = 305800147880909481366134346118845320454842406981390491567069655089296000037352245575324854341041780141588480 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade040Part01664.size = 58 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade040Part01664 = 601445191358451845717900033062834032571738163713374242520894902700017441616328706188330827980321085074702336 := by decide +kernel

theorem group_length : secondCenterIntegerGrade040Group003.size = 186 := by
  simp only [secondCenterIntegerGrade040Group003, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade040Group003 = 1743459429249307356788820885336230998906505821889934122429409222618054467855637198256618529541059656099561472 := by
  simp only [secondCenterIntegerGrade040Group003, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade040Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
