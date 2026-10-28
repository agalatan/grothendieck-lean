import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part06144 = 16399153464823005882683967091667800477612747667028267598272153681779010474549347589369631564785791539347456 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part06208 = 7876368326228466317162425329030140472070274994180184447894330506351662323893995388881359019178352399351808 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part06272.size = 48 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part06272 = 3211067852817183923927444519868626042066743450691804826532130092117459521622257314109838110506812939698176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group012.size = 176 := by
  simp only [firstCenterIntegerGrade078Group012, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade078Group012 = 27486589643868656123773836940566566991749766111900256872698614280248132320065600292360828694470956878397440 := by
  simp only [firstCenterIntegerGrade078Group012, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
