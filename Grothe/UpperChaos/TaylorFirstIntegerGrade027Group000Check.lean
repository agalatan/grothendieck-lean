import Grothe.UpperChaos.TaylorFirstIntegerGrade027Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade027Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade027Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade027Part00000 = 2399883518938621935258028228228045674341350348341848241205302827431125029939064731748109353757166692255043554377728 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade027Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade027Part00064 = 550976507253984681193071582088828376701960378945559447477038870800936963765327647446688113864556903731608179179520 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade027Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade027Part00128 = 684511345161379721308190982336099377695813729809118230578318221070026476407006986300188850132717939057883481112576 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade027Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade027Part00192 = 341800056140576584062124066608791759386118846654598868286616624331580214788150514871769933488123947183129799688192 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade027Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade027Part00256 = 45251344517859611045370119198865153162887932055081970495774663958945324551778336720318261892277399751808337838080 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade027Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade027Part00320 = 17918900272742563993958245037059999724084273038293961623022001592946739641639783179395526896960037121391920676864 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade027Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade027Part00384 = 8074052534013871779935553361304959546131617782760168191220486740802190220342898500916329878432145849018952450048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade027Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade027Part00448 = 4436784656413743817297860108538858133385465963687145823078260139679969810331883967245115246778634878708126580736 := by decide +kernel

theorem group_length : firstCenterIntegerGrade027Group000.size = 512 := by
  simp only [firstCenterIntegerGrade027Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade027Group000 = 4052852509475592712457976636967534158691732592590948033680371956066042909123642782734631485157013699828592351903744 := by
  simp only [firstCenterIntegerGrade027Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade027Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade027Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade027Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
