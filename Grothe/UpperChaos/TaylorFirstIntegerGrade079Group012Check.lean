import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part06144 = 19721302528672912019104864308378792224928054925141563196973336890884581545533560695484100963408636220014592 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part06208 = 25339794149203043741657168732335754190927975367460454486762970634668468192222260287417173699321425517608960 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part06272 = 16434667353684351222448553549552806287665026778066895736884011062000131422451170815290344206145375677972480 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part06336 = 7631856466428512878361930594458556749163816360440516332814495576871572689101854225534254432730822123454464 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part06400 = 2132404561113166961112394179996533404032333649747806999372923241367303633194292845883122185116388111155200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part06464.size = 16 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part06464 = 985662605900111347261800659601318307672257611673325077991112311931365893480897321453522177233302736338944 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group012.size = 336 := by
  simp only [firstCenterIntegerGrade079Group012, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade079Group012 = 72245687665002098169946712024323761164389464692530561830798849717723423375984036191062517663955950386544640 := by
  simp only [firstCenterIntegerGrade079Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
