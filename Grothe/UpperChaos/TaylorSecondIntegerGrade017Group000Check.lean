import Grothe.UpperChaos.TaylorSecondIntegerGrade017Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade017Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade017Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade017Part00000 = 35035240678085426340762221263620311784252481707344186014704033659588709227658754284966524410027618539040021676032 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade017Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade017Part00064 = 4016510609150369627908119961836169967362931244309027992324391043443812988409046639918120939960153775117336313856 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade017Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade017Part00128 = 1139965894428028735876780963653022456935290986373602298076897945557227371849432792532137298462479348103523598336 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade017Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade017Part00192 = 479804802298831822627343591535289117604619151161392324316891924564933824684611613522781050149042557815621681152 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade017Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade017Part00256 = 324922972986272945054812411450761133333186237499108271126475660290228333767086383777587593184373831242992320512 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade017Part00320.size = 22 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade017Part00320 = 24843471405661000848361863847908661791045803014863445583044112969475611489939630106612390340063960172261801984 := by decide +kernel

theorem group_length : secondCenterIntegerGrade017Group000.size = 342 := by
  simp only [secondCenterIntegerGrade017Group000, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy secondCenterIntegerGrade017Group000 = 41021288428354590473077640055943463121279555129702180346131734346414387357858871344823763682123732011491757391872 := by
  simp only [secondCenterIntegerGrade017Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade017Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade017Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade017Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
