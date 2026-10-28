import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part01536 = 529936424750350462382700342663428249415781626089243027254814405802217740417354613475094414847136533541338218496 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part01600 = 356455011770384231566133566732940307994961912053700232945506988913711521767621942820929618178659292822854696960 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part01664 = 298436315738527610625173090754209720347961407917561763726899961319251543446834994289021506032886992181053620224 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part01728 = 251998188407883693275386869399781024915398453624432134231762680811852773654690809646333208896563435993982566400 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part01792 = 209789680374083269599338043609276783680659325165584404681947825988404021589630430237144973112419837411604824064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part01856 = 169347930042568180388494430245694601755504343627314504927344107885683605082955090866303845440588559252507852800 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade057Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade057Part01920 = 131078950029854534462119033912985469647396403579400321374741931621728779558768350084705028374472549056999587840 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade057Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade057Part01984 = 97017606448766624574970706678256594726416278983045687895013026872638178767823490353064606184527844342600040448 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group003.size = 512 := by
  simp only [firstCenterIntegerGrade057Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade057Group003 = 2044060107562418606874316083996572752484079751040282077038030929215488164285679721772597201067255044602941407232 := by
  simp only [firstCenterIntegerGrade057Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
