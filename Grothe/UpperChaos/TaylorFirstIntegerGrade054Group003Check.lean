import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part01536 = 349466444604619358995001333272321356745027957489399800039013696848042402679112138908331585817291272864466468864 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade054Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade054Part01600 = 324631006425284463090951499620081939370619546137887671446229530667728651350566099894067853244239650102376923136 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade054Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade054Part01664 = 283254100322864361290177694174096634614024731151706857404953820436033869596878862809079472787128429849828392960 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade054Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade054Part01728 = 317078779544606772143456452651075287552567433465662307887300563815666175075465636536875373599516416739783999488 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade054Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade054Part01792 = 208316456168063160551969742945422777869650892600849167593274158511595777305901662919921790313764980450899525632 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade054Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade054Part01856 = 87152704150357502333393594055932308998310221974216386693984168570793414696699089626834281375079736928402145280 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade054Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade054Part01920 = 64893367013232182376006578835268431022528774059670777215689131537538275734524624776052101251839621241539395584 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade054Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade054Part01984 = 52352592073045419649066602307649095463504452346841626792455890307149424511271098667122175951984577720063361024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group003.size = 512 := by
  simp only [firstCenterIntegerGrade054Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade054Group003 = 1687145450302073220430023497861847831636234009226234595072900960694547990950419214138284634340844685897360211968 := by
  simp only [firstCenterIntegerGrade054Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
