import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part05120 = 23107984784733818921046266477607381280819175819047901149576698717435098842349192162041869212413057935867904 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part05184 = 21995508648081992634478448731984993268725649488613642511342887578002183634369547323822064158990400193822720 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part05248 = 11206696692064914027803163237516687684685415258257278010597087586261273351501678555963235356112648474198016 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part05312 = 8910025248257484463743054868413297712553001088243050620276138616521117727654850707419755340883971538944000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part05376 = 16414483005534640501712860509990244916368177626709493925896622356589819839505996380404134816451650044035072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part05440 = 16715303180895929757529161942932084636871828353040246226153466088146992047455906047356932168557802438000640 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part05504 = 12568261419590628441029239960368864413751734414268852414732940462887326216863856523086765931434295676633088 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part05568 = 4700274800000835814645473776475819219799854699963535881217828954027176534357271684342611121366795252924416 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group010.size = 512 := by
  simp only [firstCenterIntegerGrade081Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group010 = 115618537779160244561987669505289373133574836748144000739793670359870988194058299384437368106210621554425856 := by
  simp only [firstCenterIntegerGrade081Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
