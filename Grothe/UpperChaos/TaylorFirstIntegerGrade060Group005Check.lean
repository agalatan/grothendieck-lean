import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part02560 = 7396786153296292618131235969961354995107699399974734824360615801779663322282998997368441017662088041719660544 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part02624 = 5741126024396388646960755719994832369540124245014696086080123463896757510774337332145100443758038788566155264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part02688 = 4586364525192656536661157753212866703177197049995920737268652282408934207739743879678130384607282138215088128 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part02752 = 3899660067671143934637194237407884761440403998602183040930831804475872242004715134279403760703721273003343872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part02816 = 3255486222554547926260490635812535952762747074649348820680005588481853434224186033712411079387268399572713472 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part02880 = 2555119757611571975715121470295204877141459297067166823156235963602070461251376582329390437269840334459764736 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part02944 = 2035828207152555002022238701061489628328991710712755836191107731741885857395892260234219281140578892499648512 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part03008 = 1660786647502472330954410692770557735195852543241367861786059871091862567075492766527365004825822384594354176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group005.size = 512 := by
  simp only [firstCenterIntegerGrade060Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group005 = 31131157605377628971342605180516727022694475319258174030453632507478899602748742986274461409354640252630728704 := by
  simp only [firstCenterIntegerGrade060Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
