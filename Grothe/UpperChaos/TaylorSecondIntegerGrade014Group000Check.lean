import Grothe.UpperChaos.TaylorSecondIntegerGrade014Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade014Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade014Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade014Part00000 = 78768908692306767011348426720859919891220330166788052042704908167658463806402093428414164081353343922338397159424 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade014Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade014Part00064 = 2127827652799406989344849091056469154531836916414741282006458790368061093121789476594920188926457006627007496192 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade014Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade014Part00128 = 745398705555482815361578454040457453359012347739360781278917369467236587169464301704223947750187630124100222976 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade014Part00192.size = 48 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade014Part00192 = 209759350958382072277435209686743215887399478744871084978975756997716326249640563482955509819044348752851632128 := by decide +kernel

theorem group_length : secondCenterIntegerGrade014Group000.size = 240 := by
  simp only [secondCenterIntegerGrade014Group000, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy secondCenterIntegerGrade014Group000 = 81851894401620038888332289475643589714998578909687025190969260084491477812942987770196263727849032907842356510720 := by
  simp only [secondCenterIntegerGrade014Group000, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade014Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade014Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade014Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
