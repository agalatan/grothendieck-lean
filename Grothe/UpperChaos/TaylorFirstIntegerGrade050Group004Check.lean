import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade050Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade050Part02048 = 5539374690634661915331163901465671449492184001279895471701898274573415022050448149218551485847829222464159744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade050Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade050Part02112 = 8245618111831683940409167484066138656490220070238122711454517763631045526347750258494108937985156725130395648 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade050Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade050Part02176 = 21158982148774276277714580622915959011164815712301579658992958607704536579956458770477563235736256451249700864 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade050Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade050Part02240 = 10302465139965622732980380819800441350008611408266394482962221015899247316835918271372647354836457687772823552 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade050Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade050Part02304 = 6428921591498353030743844458346990246839318657298885517774855294833890303361308352154515003134101133931315200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade050Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade050Part02368 = 4199955805285906665219182205758386666041791969300398293589414181795571758692781102788031029567558465414496256 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade050Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade050Part02432 = 5809675374748528175951585644018831220713955001316130907610566360228349351188481711103318905161481340019802112 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade050Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade050Part02496 = 2396213496666523015361759540069237010747665186157705430202004355439472578513069516493921524587352203181686784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade050Group004.size = 512 := by
  simp only [firstCenterIntegerGrade050Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade050Group004 = 64081206359405555753711664676441655611498562006159112474288435854105528436946216132102657476856193229164380160 := by
  simp only [firstCenterIntegerGrade050Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
