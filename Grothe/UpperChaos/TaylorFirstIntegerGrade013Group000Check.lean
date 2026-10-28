import Grothe.UpperChaos.TaylorFirstIntegerGrade013Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade013Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade013Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade013Part00000 = 22212336437328021188911518920845766515229607760095363046815587017554524664774113684459370175585620381836730559365120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade013Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade013Part00064 = 989594451295947900760069449372583599020590838722204108078780454599593618957790356793424444952260487396231835811840 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade013Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade013Part00128 = 19061169383096313588425683163254751744567792622291220108157465342185805892298204519882386190906283333918203576320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade013Part00192.size = 18 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade013Part00192 = 1118900372479445885352231009937334931123105926162426548926532290462772137568798656107787395137682165747196887040 := by decide +kernel

theorem group_length : firstCenterIntegerGrade013Group000.size = 210 := by
  simp only [firstCenterIntegerGrade013Group000, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade013Group000 = 23222110958379544849145366284391542200925889497366020801551451469786766861761771044428784794123924834732627795640320 := by
  simp only [firstCenterIntegerGrade013Group000, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade013Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade013Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade013Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
