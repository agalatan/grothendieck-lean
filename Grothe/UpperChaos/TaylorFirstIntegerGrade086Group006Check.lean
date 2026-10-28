import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part03072 = 17132125342767281569460786118926714358901645471654680003265949167836484640825125980080365397094932114453823488 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part03136 = 14109714336019130510102893274311560142961881382244051792088385728435704623567285567340921670252643114901569536 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part03200 = 11432381397061032805202876470038755721469128246012689151861277880737631447978894984344031502151271515005386752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part03264 = 3027561619467084440749483058935975823507462654478385801157728635673389199931056289728616783672453973934080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part03328 = 9122398337636649964454399165212170343868450255808627390784140210423044337061351385691713454552778001415667712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part03392 = 7174501726226754549840040251777086997381360592810217571121447345127882682037596050430522192627919347188236288 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part03456 = 992228658685344671571061048876884736727196827778692755261138642103191227343552235745350192708684832003063808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part03520 = 4575239653371756112833123325170407187697788050990095138410442796555923520545723067937004069764741040338632704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group006.size = 512 := by
  simp only [firstCenterIntegerGrade086Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group006 = 64541617013387417267905929137372515464830958289953532188593939499855535868559460327859637095936642419280314368 := by
  simp only [firstCenterIntegerGrade086Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
