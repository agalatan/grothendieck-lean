import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part01536 = 606468364376740228348624174526815637597504976767600118004570701134593308584067717584913642541953837878803955712 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part01600 = 534502419463464609032320386247307919237730445238492862193676700159325247526353550527243425504110764178351849472 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part01664 = 448929088991011203172789189024564344641572459936472462155192288164471973662307170682107118202407071126717988864 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part01728 = 372797527485090873488173844849783611755216506962875644085463137825794757500857215317497457727741542384237805568 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part01792 = 306403753441435972714573844204285119701640846956085835943089882823355807004159928887269089935361397605980438528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part01856 = 2869743108046198583079278575984553574500898245579630800945620962797106357229623828298146838292558198024962048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part01920 = 247247997869292376327515257237111339265591139126620102761397488742479928615842336620575998013393691649326972928 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part01984 = 202284350513839389911808127986027027232308219977057499852052256025378100123002445566720429133126443978775855104 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group003.size = 512 := by
  simp only [firstCenterIntegerGrade075Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group003 = 2721503245248920851578884102651879553006065493210784155796388075838196229373819989014625307896387307000219828224 := by
  simp only [firstCenterIntegerGrade075Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
