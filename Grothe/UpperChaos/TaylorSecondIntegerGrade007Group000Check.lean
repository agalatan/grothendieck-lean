import Grothe.UpperChaos.TaylorSecondIntegerGrade007Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade007Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade007Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade007Part00000 = 338424180471110910624226960395703701421734370586619776791766365459771852124375142576442619349039527469916398551040 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade007Part00064.size = 8 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade007Part00064 = 43868410562962132606628444209117760302699606995440507974000807036374493513896949529379199421805176924785344512 := by decide +kernel

theorem group_length : secondCenterIntegerGrade007Group000.size = 72 := by
  simp only [secondCenterIntegerGrade007Group000, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade007Group000 = 338468048881673872756833588839912819182037070193615217299740366266808226617889039525971998548461332646841183895552 := by
  simp only [secondCenterIntegerGrade007Group000, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade007Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade007Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade007Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
