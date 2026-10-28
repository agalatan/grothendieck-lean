import Grothe.UpperChaos.TaylorFirstIntegerGrade015Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade015Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade015Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade015Part00000 = 11260576329015637528717459748720508047556565001944370356866750065996518642424820947284029987944217292654687113183232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade015Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade015Part00064 = 2235551853807708794387051283152735016911256782017460006667332340621675883344931964913477600516096798450056691712000 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade015Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade015Part00128 = 50759012450857333362985259280942384859995546701657050710522056281454615715171028448408383463217382029764016996352 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade015Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade015Part00192 = 6538686273585016501478993899234547835880311215771278371716668082636387588411480057199444171038708417633649164288 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade015Part00256.size = 16 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade015Part00256 = 640707239773889623556834859525128438666076433558252600741420043990773498914400240209264957197084469892822859776 := by decide +kernel

theorem group_length : firstCenterIntegerGrade015Group000.size = 272 := by
  simp only [firstCenterIntegerGrade015Group000, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade015Group000 = 13554066588787562562592532119912945125602363718312816945217062551026276302572249820943324681051767266022034293915648 := by
  simp only [firstCenterIntegerGrade015Group000, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade015Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade015Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade015Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
