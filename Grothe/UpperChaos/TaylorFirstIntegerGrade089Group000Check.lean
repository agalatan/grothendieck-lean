import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part00000 = 1437272410312069500873331567298568672884844623648189620979231367151386627960157249213412028404121434741805154304 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part00064 = 1397787841181838191927592142552828160092631594631906578478716647754440906501797949459788899331043860705673232384 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part00128 = 1645031853120577284079249592354476797325895957853262806108964984490316836467643414615583058594265353925565911040 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part00192 = 77014011121775050118504021798683171745414945268979533587811886184825231192403574385573954251518157531113324544 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part00256 = 1736206187511684615991515480367966804313265390866921473638837912742819847793159743155272887662295794099763019776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part00320 = 1727647131864658959253315010573022544298179517286861016243953929348333652047848926062786219327166485551516745728 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part00384 = 4878231908168004464284631186371328602227639357331215287236979942864588685428254406473351712889961686499328 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part00448 = 1716678095656604753968592717359810331483516148406866170971754745802718578939060840993916359759263815383438589952 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group000.size = 512 := by
  simp only [firstCenterIntegerGrade089Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group000 = 9737642409001116524216564816936542853472350405602344531224558710454784545490757126140739880681387791900562477056 := by
  simp only [firstCenterIntegerGrade089Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
