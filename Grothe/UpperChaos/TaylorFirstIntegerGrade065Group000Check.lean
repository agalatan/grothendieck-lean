import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part00000 = 20484169648699227971870633867070745297025329764408150728836384974660018674409132185024460293775434734756406755328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part00064 = 31728939809776913984405063802702678928957466197040991446040592710891198597046386819333610972778072315334364233728 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part00128 = 43776539037899055976649119403881784370086647787357906482252342153379651914046520213549258760165238086698058907648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part00192 = 49460613032200813476769370878232483402084587054082341716824798215711828315638519151198390451910633733055922044928 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part00256 = 49674796793914830630474232762988611540512671816037254595802208054580233786596573334266625713653544747488382025728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part00320 = 45599758044813935108793962807600786320647540459191753754206452593251455765408087997248449818760822211412207075328 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part00384 = 38592039264634790582673310904519669237665428445861299901143579783119242145269821406009329842929457747391359746048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part00448 = 30105452325929326548842695344033550716968047170959411023814963183069285149495003599638613231280559700340685930496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group000.size = 512 := by
  simp only [firstCenterIntegerGrade065Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group000 = 309422307957868894280478389771030309813947718694939109648921321668662914347910044706268739085253763276477386719232 := by
  simp only [firstCenterIntegerGrade065Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
