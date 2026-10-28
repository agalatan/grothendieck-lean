import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part01536 = 624763624359274394874030235482184548866923181707394656705097452621895958271946942288526211269680402539917344768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part01600 = 477644837337134383813633301509823291901715905601311168074916405019474651109978312287863279574858184412828270592 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part01664 = 376848938957464797316451704930924580250954442956557162798536611470051308676067197207863727254288944380564733952 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part01728 = 305083911873035204704089267134425822263161030971548955427243430753180029799342996588315603837860520763934638080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part01792 = 256055236446876601296272957640290493820846055954708530135356625841272344715403485886286443545529496909882851328 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part01856 = 254707117657587793547586462692181494124482424036743579693277849146009590336410175060629873811699805958793330688 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part01920 = 231761398609062818358292104520224634918486785186802364080244293992807587511895242834339152547908187493362565120 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part01984 = 99888609576539814446661992912641852308705160371450187215394670792329183168066200920301705018792694652193472512 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group003.size = 512 := by
  simp only [firstCenterIntegerGrade058Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group003 = 2626753674816975808357018026822696718455274986786516604130067339637020653589110553074125996860618237111477207040 := by
  simp only [firstCenterIntegerGrade058Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
