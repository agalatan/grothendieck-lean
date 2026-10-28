import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part01024 = 259684675291097048873271669802157355889114514355365059255756609603940984951596748666345594551351623095389519872 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part01088 = 758384621243723574702579624531423945242611729117330782148428426297663902262899134768846608640730338294675537920 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part01152 = 911667529180233009352417412459171471619180375527857168651174694953833345334063131463956136018900962910597545984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part01216 = 854033506667391905824947158263896980740842775150267477725372635073421772582279107926756191741595816683817140224 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part01280 = 801602857388060317346297781907305147654313908764462807378797083304490371960348059350832007668915168783611461632 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part01344 = 665482819776269715340703746777872092465994180804377882021155361152031301338358190587227869444194576070541836288 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part01408 = 71941572829426056218779155811904550341423248597551057850001144025643087616663187030192174484095909830311542784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part01472 = 654544096791222368989033579640336242254007607521406529697913886206719270078499168787906910005566003088306733056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group002.size = 512 := by
  simp only [firstCenterIntegerGrade076Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group002 = 4977341679167423996648030129194067786207488339838618764728599840617744036124706728582063492555350398757251317760 := by
  simp only [firstCenterIntegerGrade076Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
