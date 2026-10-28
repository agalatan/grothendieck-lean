import Grothe.UpperChaos.TaylorFirstIntegerGrade017Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade017Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade017Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade017Part00000 = 6848581937588975116983131295019389581932605056703785876624385457246125844273063609865911923064037766815162405224448 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade017Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade017Part00064 = 2307860345858339397755761651470264197979744975299225833413368285142188801688018456785103639178585794689609253257216 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade017Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade017Part00128 = 60783774348647987230844350257465186756501133467193922228139442778584442874599445350575088999628893550627220619264 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade017Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade017Part00192 = 8102597752851020650501004469914629982040426164624126772328538075383513595683591020641919334064533509210281869312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade017Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade017Part00256 = 4120237170995567611820177659891637824411103641547496045366400245446013855689116336459625146077505208239796518912 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade017Part00320.size = 22 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade017Part00320 = 1149698521270032292651376177991881088790366570681355807465442525177043896599703216899277414062112043471162310656 := by decide +kernel

theorem group_length : firstCenterIntegerGrade017Group000.size = 342 := by
  simp only [firstCenterIntegerGrade017Group000, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade017Group000 = 9230598591241079122524709855054917115564093061847058610891053566012905660183653922575591473136456605816320119799808 := by
  simp only [firstCenterIntegerGrade017Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade017Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade017Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade017Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
