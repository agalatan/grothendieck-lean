import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part05632 = 16537055038164797189901658852073930595427727052538080016210839319475050658278618930794877035096233457221632 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part05696 = 7503774839120031786365455489436802447370970503489288805430754737344053416922035542686597507573217742553088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part05760 = 6564368400863172091389860394439168295679295941937886156309614925041266635023982415447152272770148325130240 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part05824 = 24397304545235000153759714510323476559226667788920913581676599296455513625995148734428538110718241895612416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part05888 = 27992156018951732076944469485578372452734373099345055231454513509744388290310355091860513345872385915486208 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part05952 = 17808158474252624706498695967898788486577782788816471183359904422913537595666404615347937393646633975021568 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part06016 = 8160107471489572523392405728655559366238820000534231682103032013810570175837006649715492924774910573674496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part06080 = 1631181150828019293220570242723129615420548573063629807233462572842597845269482714517088163571857046372352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group011.size = 512 := by
  simp only [firstCenterIntegerGrade077Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group011 = 110594105938904949821472830671129227818676185748645556463778720797626978243303034694798196754023628931072000 := by
  simp only [firstCenterIntegerGrade077Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
