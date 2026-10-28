import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade047Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade047Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade047Part01024 = 5119363148124785594275385604358289630006441758765393889441075740692775040287497071287545789107845190827173216256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade047Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade047Part01088 = 1555607621685817497259657131163863155125490511711091173782284516988183744810435505625212475464499183821864828928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade047Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade047Part01152 = 1124623885720651277446663193193146616571909497592479869320152760779353516710181678908589772648271320931587063808 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade047Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade047Part01216 = 1449192175651940819022240449009078769960464177911512832701125579766445696849247535330775089940923019549223157760 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade047Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade047Part01280 = 440033503359827717914315870773051070283043538118060381803253803165262917646500606689887892719717618015354748928 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade047Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade047Part01344 = 290580832930130680922499213437472460215871509184987093910602022254196153662086574561029703476499473752421040128 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade047Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade047Part01408 = 287570501893424098534648421840770854749483927290447080197706713712523176606087607797931996821670085814441213952 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade047Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade047Part01472 = 172850012632408383923269870932331476462070633676291761160037903338113653279431323864686058223290817542340214784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade047Group002.size = 512 := by
  simp only [firstCenterIntegerGrade047Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade047Group002 = 10439821681998986069298679754708004033374775554250264082316239040696853899851467904065658778402716710254405484544 := by
  simp only [firstCenterIntegerGrade047Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade047Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
