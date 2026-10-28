import Grothe.UpperChaos.TaylorFirstIntegerGrade010Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade010Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade010Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade010Part00000 = 41397000603636270484955422496145621025734775427349306210917080598625451190540749702766661176142390491118602303832064 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade010Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade010Part00064 = 177001564124687014744413075710380827983950407640122682740025052541859511656680071141160015314491560373188663705600 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade010Part00128.size = 4 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade010Part00128 = 449294735910852220737523788891301260262755697544086953745158129745361303329690523255740081287678273152480182272 := by decide +kernel

theorem group_length : firstCenterIntegerGrade010Group000.size = 132 := by
  simp only [firstCenterIntegerGrade010Group000, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade010Group000 = 41574451462496868351920573095644893154978988590686972980610850809297056063500759464431076931538169729764943447719936 := by
  simp only [firstCenterIntegerGrade010Group000, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade010Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade010Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade010Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
