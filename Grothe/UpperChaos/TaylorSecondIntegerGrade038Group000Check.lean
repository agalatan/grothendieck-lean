import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade038Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade038Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade038Part00000 = 1323430652369563674224303275854706596712375957182531184897756830608235698591333500535533851367143074156400082944 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade038Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade038Part00064 = 733052012790737931996583164133307588724526075673503915260962675737754608841928724178292820015261422058488201216 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade038Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade038Part00128 = 207919406178514323480733040230819732520921326447738385549586216738924087699989874809815295573635933686621798400 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade038Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade038Part00192 = 307402672476829087577979019388562267020931863490298762824461200050389206540461525490162103563666381214557667328 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade038Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade038Part00256 = 245882406564867532440438740262523730369790361171670334813273090284915775967002520250745203835037599189046394880 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade038Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade038Part00320 = 153715965953731795779700686040726785337097942271110994743572913723281563371172516567324993353530870099800489984 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade038Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade038Part00384 = 85937856365878486911062570607630012845911693950954003485248980860265838270143197491954000214103377998268858368 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade038Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade038Part00448 = 78808813019377469903358710317110067277791744355126816416742478173216317853539812917603595861865719289197101056 := by decide +kernel

theorem group_length : secondCenterIntegerGrade038Group000.size = 512 := by
  simp only [secondCenterIntegerGrade038Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade038Group000 = 3136149785719500302314159206835386780809346964542934397991604386176983097135571672241431863784244377692380594176 := by
  simp only [secondCenterIntegerGrade038Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade038Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
