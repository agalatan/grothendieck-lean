import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade045Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade045Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade045Part01024 = 2704169040710937306456826689484828181434245933382635188401199732559067059611447617287145281036992967785217785856 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade045Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade045Part01088 = 678831291219057278586183843680097492099113758199209254750082354350200739267043773462910672797172263206439092224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade045Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade045Part01152 = 485526760970832100939949778158975922368006962039830305223584926478439840991653696433482606177318129012437942272 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade045Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade045Part01216 = 573425846040606392103896769682449218952379500072963990451449389612645006636168712676176940096786525809450942464 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade045Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade045Part01280 = 169683627167404877392224155879007100309027643560090433112458761469717657297253966978426986657990209006035009536 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade045Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade045Part01344 = 168246274863946592202576422233005583424892057934066442434236615250138762607497985130950848556904951891955286016 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade045Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade045Part01408 = 252137998664012355982415720355134871331211315531890256179690055420209546470789516071855571045205196563516751872 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade045Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade045Part01472 = 114890396135583245792938083805473550415482038956668951162587560989337562458705231465822376845670090985164505088 := by decide +kernel

theorem group_length : firstCenterIntegerGrade045Group002.size = 512 := by
  simp only [firstCenterIntegerGrade045Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade045Group002 = 5146911235772380149457011463278971920334359209677354821715289396129756175340560499506771283214040334260217315328 := by
  simp only [firstCenterIntegerGrade045Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade045Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
