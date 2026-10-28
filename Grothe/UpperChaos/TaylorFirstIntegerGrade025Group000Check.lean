import Grothe.UpperChaos.TaylorFirstIntegerGrade025Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade025Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade025Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade025Part00000 = 2715583005385468900199503713956345890912191972175215204103053542143245861321950600834794980165095559805092480679936 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade025Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade025Part00064 = 403617868289502659304929522677857193386494143231234884970384092907335731589140091042320116213339771664111023161344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade025Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade025Part00128 = 1130949765356780440517081594767324336387323522648859831501364200705611161880099212516706897017859406631077916180480 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade025Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade025Part00192 = 136876781345181086800157786598251476293031919955817588117180385395482363560453551048286090883024772759112856371200 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade025Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade025Part00256 = 21516545403971746539731625470531834666499917105310755419471811212271865434717617819563671217837044957673408167936 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade025Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade025Part00320 = 10849820725193083840611271349429589606685694914076429462839403443300990781492627321227748507876012968271144812544 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade025Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade025Part00384 = 4499469119281681518730563022616128084031908077962029170378942383041336949528004783596289294022500497836050743296 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade025Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade025Part00448 = 3291960940453132708157693297513110665112828141498516119200250210484222418515285883670496100412413766531140288512 := by decide +kernel

theorem group_length : firstCenterIntegerGrade025Group000.size = 512 := by
  simp only [firstCenterIntegerGrade025Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade025Group000 = 4427185216565832731428903771139869560001371906249975238863872628400773533935896991250166289399467483049706020405248 := by
  simp only [firstCenterIntegerGrade025Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade025Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade025Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade025Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
