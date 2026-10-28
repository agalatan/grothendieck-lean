import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part01024 = 81301369985856997548559168260859041378933215606999737705485593499904743507175125305498454039430961819549696 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part01088 = 782544184409167394878207113593419753646540449094220902722967994354617402574357741549815187211066204228237131776 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part01152 = 596771805586159733373793847200874797410655922781393818631699162747693894142926989997685083706240157892145577984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part01216 = 208897580942222328593167073136738013749822501275161671185605027263632018335460961863484131313565982675712344064 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part01280 = 240533468343625095405416264212328197395688395955562478889757720624782331779791593532925702394726092202166976512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part01344 = 354866064413041567924249220924704312928739242749174317513516628937160801590395570485591892274723206970411581440 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part01408 = 93150375403871218224764228996401485184647599808961504810246515715871372909625503614505889787142208899136880640 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part01472 = 207616130746866083121117753434581413072410611937894159493596979284482418301567158801137950520625042146472230912 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group002.size = 512 := by
  simp only [firstCenterIntegerGrade090Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group002 = 2484460911214939278518264060667308832429883656817975852985095514521740144377632694970451335662128325976102273024 := by
  simp only [firstCenterIntegerGrade090Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
