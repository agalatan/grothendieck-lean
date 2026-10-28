import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade047Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade047Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade047Part02048 = 13105462499906946207165461938076565220655091660669767271781546731058568808983172074559075258120047095260905472 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade047Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade047Part02112 = 5970166843020398162365243942490910265358038072348145412978932132261615694401802872491718733756246308534878208 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade047Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade047Part02176 = 4436403223915255175184621920612658774197473110658128109335075627048758479363714713531350671664645546004447232 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade047Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade047Part02240 = 8449238999583603455553342441346004946428585826649935787557590681444964115130712948329535042609800475670740992 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade047Part02304.size = 48 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade047Part02304 = 6072924937883118899233293163492902427252771359425655462614193922440883616665764988341984142441377097064644608 := by decide +kernel

theorem group_length : firstCenterIntegerGrade047Group004.size = 304 := by
  simp only [firstCenterIntegerGrade047Group004, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade047Group004 = 38034196504309321899501963406019041633891960029751632044267339094254790714545167597253663848592116522535616512 := by
  simp only [firstCenterIntegerGrade047Group004, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade047Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
