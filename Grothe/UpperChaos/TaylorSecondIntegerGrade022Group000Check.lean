import Grothe.UpperChaos.TaylorSecondIntegerGrade022Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade022Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade022Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade022Part00000 = 13219982047829097472508087609262012017923552303964558950171142111329784328250677576124119732301033445921378009088 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade022Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade022Part00064 = 3305610245144707256154441789288309791104449130009030146248716548180182126479618422803744453477377038192480354304 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade022Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade022Part00128 = 1043869380821034665328667457547693170001521792581256351883413451597462645570629456571017116298840984150698098688 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade022Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade022Part00192 = 946885528941131954630396667334633667942353034854390509736777624688955861423735517969498921522372976644257218560 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade022Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade022Part00256 = 488610524417106709450301577547707134939134003056604894495301079101299738829516366707571496957393097318077562880 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade022Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade022Part00320 = 317529250373369433659860097008572078088920627509082197323341512173228834568873565346013525929794728413355835392 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade022Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade022Part00384 = 167058026001966899390804668251182676932824600547048609400361029050319961679275077656575096522340888766096343040 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade022Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade022Part00448 = 146537977282839693003507147098548554445029444665143994915031890623851329928152550154638614675301559933345988608 := by decide +kernel

theorem group_length : secondCenterIntegerGrade022Group000.size = 512 := by
  simp only [secondCenterIntegerGrade022Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade022Group000 = 19636082980811254084126067013338659091377784937187115654174085246745084826730478533333178957684454719339689410560 := by
  simp only [secondCenterIntegerGrade022Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade022Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade022Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade022Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
