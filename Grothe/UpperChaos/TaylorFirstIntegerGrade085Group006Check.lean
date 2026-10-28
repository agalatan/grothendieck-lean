import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part03072 = 14115805340627595238950097015993052906796886073077146060056309622612612133475231487695870159642277231756050432 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part03136 = 435391532536160954904602358785355228270217384623191102595220720027088743338174992571154831072915106188754944 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part03200 = 11717621598196088992351408970160243140166518891803193663228479179272483124588869544719220220944771143285342208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part03264 = 9321899101812735464089379182599404086483336314868446625505039151803595218364278602358896776211385092728160256 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part03328 = 1235122066760151830176627601700955054108042070588462343351202255550720357332572680194069272007075623119880192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part03392 = 6093168472216062717854122471344610322411196644121860075122528660218316380044448160236170325968852251119190016 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part03456 = 5684724265710410932910493074733280259968805017501268689203827100712340932843262074655764244686795346410471424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part03520 = 4345215487150567140507747739556736534726953259955387683044609774154098521615809453624019351372637842633129984 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group006.size = 512 := by
  simp only [firstCenterIntegerGrade085Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group006 = 52948947865009773271744478414873637532931955656538956242107216464351255411602646996055165181906709637240979456 := by
  simp only [firstCenterIntegerGrade085Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
