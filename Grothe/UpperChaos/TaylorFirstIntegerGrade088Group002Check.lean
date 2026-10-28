import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part01024 = 842274713633716030682079349293433016214897167355752217102106293826645084908749956879189927877777760101125324800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part01088 = 7970485201956856662645740594971410751620274055625261560585273442917140159065748621811979385359747723730878464 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part01152 = 640198072945534075743091768351467345911987944456505554871333699431105162631101935914603628935825091466471931904 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part01216 = 488809308198182420464177046837888461976926875695017088807765474229592720066936074598867103673013761090999287808 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part01280 = 119414736077458439100669192838477917059346996861989379138273173749500911028478025646672100887474475515802288128 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part01344 = 274667604253129191368428038654239679726691321605125644881478073398982488142677291737168418471381901616619716608 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part01408 = 339159570909316074630094373365617971504190421870395272040796675758972207781343212038285160171183107213478592512 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part01472 = 283098596025774886510171915683874188968955807318790516945028451111387712337352768666000019553043313303465492480 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group002.size = 512 := by
  simp only [firstCenterIntegerGrade088Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group002 = 2995593087245067975161357425619969992114616809219200935347367114949103427055705014102598338955059158031693512704 := by
  simp only [firstCenterIntegerGrade088Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
