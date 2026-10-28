import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part02048 = 112737168462278403352757450399199103959961798511187482505684840583401737421122901809649089242284075819068293120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part02112 = 129532399940168461446199403998157148028004882991465238995851746479741319322117221465870361952926610421161394176 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part02176 = 108465320737945762103888860333067433844418189192570705677009861518618056636906025857297630798825599580183199744 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part02240 = 12941652091602643846529722725132733223700546134824837318783812754979444249752246801616681969199529712418816 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part02304 = 90484736445205423075595702780198146138174056578142854791104726459975259263239961445665411332159191209379627008 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part02368 = 75183294970269546750890179319586852742480035148923810663473036588659386559858666516504756721143575572794834944 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part02432 = 61168330942820199712457045965274563444589820751332835478985919110880276944666829050671569806310966350766407680 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part02496 = 993359524047765528206407995994896367049959057323318677293498935399457153545786395134532469159181507935338496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group004.size = 512 := by
  simp only [firstCenterIntegerGrade087Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group004 = 578577552674827164613841580514203277257902442777081071626722413489430472745707144787594969004778399991001513984 := by
  simp only [firstCenterIntegerGrade087Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
