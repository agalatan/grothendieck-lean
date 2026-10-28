import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part02048 = 156108192442138654020880965694596269784501726379047711631574505207571828260901968074347036141641711618625634304 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part02112 = 47296386433908293752081839604192147837437075157639676470212987325483956554950652854232590830141672766289477632 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part02176 = 78429446939481970893679394540556713977458328047083373211144179683906770692581577771324120223881871711021301760 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part02240 = 101378500285195222690076554287597757288901780620506565979961932559027634550832975643941606930528378523144421376 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part02304 = 81679736034128036013905577526920312980795014423345246072006596960211630966174366202084899025209546560111640576 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part02368 = 65528675596802740082272861851010313515310936554452403509310553263869852318148809975233274593936072409446612992 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part02432 = 52214716542550417185606015663799883353680484613050547205644446840753718736511659885166679626754186095370436608 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part02496 = 41251595122827974539292864488504341977210106367099940126354177916483454495193342278144541289879573905516003328 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group004.size = 512 := by
  simp only [firstCenterIntegerGrade073Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group004 = 623887249397033309177796073657177740715295452162225464206209379757308846575295352684474748661973013589525528576 := by
  simp only [firstCenterIntegerGrade073Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
