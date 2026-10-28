import Grothe.UpperChaos.TaylorSecondIntegerGrade032Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade032Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade032Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade032Part01024 = 6171644597487411977127748468972147408815350448738027145385916792470022682442992214559151733847467806672551936 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade032Part01088.size = 34 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade032Part01088 = 3452431975899588979061929756051392377171632643428502882004589393913793725032072575273724392334600244469694464 := by decide +kernel

theorem group_length : secondCenterIntegerGrade032Group002.size = 98 := by
  simp only [secondCenterIntegerGrade032Group002, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade032Group002 = 9624076573387000956189678225023539785986983092166530027390506186383816407475064789832876126182068051142246400 := by
  simp only [secondCenterIntegerGrade032Group002, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade032Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade032Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade032Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
