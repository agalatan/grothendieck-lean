import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part03072 = 1490507276916302833894202216995192232207138176959237093143521882443890552641684579142815637655646530535686144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part03136 = 1271659138556663770161476163107032851076947536533742570583676609147483286734765052625444864584679509379252224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part03200 = 1055369024234728197035091249829446769272734430168373892335718754147611974812889802731844898158337968262086656 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part03264 = 797373707151316361647529546721111886989416139509784953337970365294394124453262512931594973930812314103054336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part03328 = 578632294148475399723940336451619128560388843094453861856713917224646256914504729958157043528971634792726528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part03392 = 504401748485559599100675428168234192176119618659796224513501301573917391626637920549310151551582838907207680 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part03456 = 254425778533523886169616685530946087014184205708768244596164408742601646965814643002083816082367662115520512 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part03520 = 157690520674859128064366439216580157373413814358674309940463565115983371553303145742901293989165933923401728 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group006.size = 512 := by
  simp only [firstCenterIntegerGrade062Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group006 = 6110059488701429175796898066020163304670342764992831150307730803690528605702862386684152679481564392018935808 := by
  simp only [firstCenterIntegerGrade062Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
