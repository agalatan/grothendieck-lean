import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part02048 = 158627197206643467003594606569665829185295213807303671659210835230311970049426498458613519243364481454667988992 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part02112 = 124956986182250937556126519228875107884093910025449040986496672822063458112156669640829672118495678262226714624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part02176 = 26889285044510007328061501231462683017762407967910421248522993826945672399906208316623508120966347586596241408 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part02240 = 71582923093906207693138849522630280500088432612511975318947544034845947834858930390671899947656111350542761984 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part02304 = 77078475063372176870243256042796491777307087203796427477932138360525535103900616744591448118599824894714707968 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part02368 = 59664701066886020912736791489773218858688379889951755738151377671223627908349136627269959672352547379257278464 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part02432 = 45334389164589173382866855009495550379520340718517361806331927563410783075420624171485696627572997921064353792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part02496 = 33733519277725787669344566221393719735421569708191294840874972265292086739966256790673601848934218238057775104 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group004.size = 512 := by
  simp only [firstCenterIntegerGrade068Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group004 = 597867476099883778416112945316092881338177341933631949076468461774619081223984941140759305697942207087127822336 := by
  simp only [firstCenterIntegerGrade068Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
