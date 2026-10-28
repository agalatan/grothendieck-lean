import Grothe.UpperChaos.TaylorSecondIntegerGrade037Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade037Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade037Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade037Part00000 = 1891766884570659767399419264134214596085883419353788738687422502545499197806240303754018733655441498096132947968 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade037Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade037Part00064 = 1126023647665201887619250263889011972355638553253264844696194474128556099706496895832543162437262404137076654080 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade037Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade037Part00128 = 368212716551278833796743125661159763675566431365030357693826894586616472071738675354095043910243686773294104576 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade037Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade037Part00192 = 445485837469968712034053898981519861677358129384130395147180869285069609387184255344649945092770058956032704512 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade037Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade037Part00256 = 339096641931737018417932021343311280044298672234300803175617778132873447910860031536211094087487960593958174720 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade037Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade037Part00320 = 116527262830868196984582402111530443306299394511175444932319632478251737550529450771248821980543575180091326464 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade037Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade037Part00384 = 132405969116951617158086217842229638756569164794176450865351803749738690683960503888009045887219439069198024704 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade037Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade037Part00448 = 89783173731597024023640731713741489696725850972867926351382637947949674939267104268265947830158634832747298816 := by decide +kernel

theorem group_length : secondCenterIntegerGrade037Group000.size = 512 := by
  simp only [secondCenterIntegerGrade037Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade037Group000 = 4509302133868263057433707925676719045598339615868734961549296592854554930056277220749041794881127257638531235840 := by
  simp only [secondCenterIntegerGrade037Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade037Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade037Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade037Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
