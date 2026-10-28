import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part01536 = 578169674190704948993972827401632239271957354901973994779523870484354107884920688792500674439196309209565102080 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part01600 = 16453143054355790037959750456559493658836385744492085926875007815713087292519185023952413775868136389221548032 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part01664 = 497214037952628212218488251435172513845034741563986694703413991717523867480148567711123004619542459533439795200 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part01728 = 412704725629706049337365754658943136091305666268616737356876551434439088077999702903726217678654946686330208256 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part01792 = 337992406290306614224744241482329396613767097379539340738617094870522569935495079326286824763264464494459355136 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part01856 = 274172434896692170592452210913837679593701245992488355468570313472098965221352364420580900405949480745562013696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part01920 = 220844837642154802079685952042993017400356888038212897572199591646058233620335889662544124945258005587254312960 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part01984 = 1623705728541592964722570096158143466943809912023419871882132292940778030201512079496485201490946945286406144 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group003.size = 512 := by
  simp only [firstCenterIntegerGrade074Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group003 = 2339174965385090180449391558487625619941903189801333526417958553733650697542972989920210645829224749591118741504 := by
  simp only [firstCenterIntegerGrade074Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
