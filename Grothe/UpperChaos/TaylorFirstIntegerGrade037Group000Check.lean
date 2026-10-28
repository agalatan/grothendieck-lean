import Grothe.UpperChaos.TaylorFirstIntegerGrade037Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade037Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade037Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade037Part00000 = 408772575196557066687751770701281173059598570489397493788351061771197313329661847237229426323393980466264497192960 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade037Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade037Part00064 = 604040763144464960405951935094346565412415931168936047605413503649670847416534620109640760983207129416790299377664 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade037Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade037Part00128 = 185347203169320218561877294098103276709232392650818748555004887611731573969919259343563225859469101205878579658752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade037Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade037Part00192 = 186685009222480193487051110528294891497173071336349236403769228867311346045820075346902597458043666032227396878336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade037Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade037Part00256 = 243858248309423054798014969484165338950109539698634899683876523294905455362010943312265342500792900199057947885568 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade037Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade037Part00320 = 134791668870656519145481938427197569762755765423633241346398054228736164271815179583624160808082794844711775371264 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade037Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade037Part00384 = 62779772258818294744547555116260358567457268540569446542652209842704498473509360493247847216532180182723656155136 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade037Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade037Part00448 = 37398251431455245965835180194870819295918160667689797307597601522177048848038081943583882572765756597258025959424 := by decide +kernel

theorem group_length : firstCenterIntegerGrade037Group000.size = 512 := by
  simp only [firstCenterIntegerGrade037Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade037Group000 = 1863673491603175553796511753644519993254660699976028911233063070788434247717309367370057243722287508944912178479104 := by
  simp only [firstCenterIntegerGrade037Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade037Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade037Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade037Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
