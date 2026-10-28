import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part02048 = 73914817825733103565070424017701001840949768331472637169519853465196445515671583685226270545660268522925719552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part02112 = 102172807835356079436212404161182593156708684215641613217283101707576383557935153915463397650933813787041464320 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part02176 = 92008245492818706118919393508031491710285115868168659694918508545617948799944041223655880076718791552214761472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part02240 = 75884006489327258729953176977032234933161913059087890367879092997641164872787775902242451143793163966791811072 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part02304 = 56856827221034636931143750319435171285506701424779205799845945834374347293369522910851634906865249512268496896 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part02368 = 41789140447571298990728332028868873953759115643841663327263210262586484365125361908960454969389283095607246848 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part02432 = 30118576097338184630209871688331843293191307963498700334822234632514362533245404468839629884248325543828652032 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part02496 = 21248996539726318139961237026161473374734320410750976013406827795500840476649796028159259859903674604077449216 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group004.size = 512 := by
  simp only [firstCenterIntegerGrade064Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group004 = 493993417948905586542198589726744683548296926917241345924938775241007977414728640043398979037512570584755601408 := by
  simp only [firstCenterIntegerGrade064Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
