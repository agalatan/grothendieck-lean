import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part03072 = 6867474746710878227735339105394910383636715906717505955144656951136451313466316794171593837563719851716902912 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part03136 = 3289467621169759686023420374164620969016876702183807313312753030380678236590962254730396947820209542122176512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part03200 = 1685923249033851329351623038810568870218628821598077849154438323937971332936773477588241650604568826796310528 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part03264 = 3536265430381717793828625060519863993963689431692419687358554367433058040391919664049141937588321516620087296 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part03328 = 2477750478192190241420955110859548065513681072270027481507695214228638839538517850631390394635480980921516032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part03392 = 1708506240668517597609057351588941620153328532349163897740090104007810157139572997505076245222754147681435648 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part03456 = 1145996126081939477609981264257858813913718439633717671118981346402971558898386599825534710957347008457736192 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part03520 = 31273944658359769310798933324301631430444896855668651126749559322920561291395370805433529143729208906743808 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group006.size = 512 := by
  simp only [firstCenterIntegerGrade076Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group006 = 20742657836897214122889800238920614347847083803300388506463918896850500040253845009306809253536131083222908928 := by
  simp only [firstCenterIntegerGrade076Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
