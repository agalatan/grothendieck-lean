import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part05632 = 7592854983018912394708546494132512504111507173452631859085039884569079623782665291940412024343904640827392 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part05696 = 14121516762880977272762626137330449602903968562750424783860888787788012923780392765500162350567131604582400 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part05760 = 12930992810570923609798078651851308104092432921326306198619148049525810254042382436723892803350603600232448 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part05824 = 2775504724046523758542343099195728409842965324481939787816261080523430612709796398467924325779513330892800 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part05888 = 10527327371564958908837419516494976169182291286183758503421170240901559838110703358312161334834794239885312 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part05952 = 13066109569021327741606430849256590259210303251689941545369776572506719634130806972019017423817443349889024 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part06016 = 10765458460683467140328163804177464467780714921503193442031658239544027703843623106760578175225659721252864 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part06080 = 2613991087935914290793003538722848253795996467409594950138853998087055921374320890894242452063952738189312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group011.size = 512 := by
  simp only [firstCenterIntegerGrade086Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group011 = 74393755769723005117376612091161877770920179908797791070342796853445696511774691220618390889983003225751552 := by
  simp only [firstCenterIntegerGrade086Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
