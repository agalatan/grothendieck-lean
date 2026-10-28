import Grothe.UpperChaos.TaylorSecondIntegerGrade030Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade030Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade030Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade030Part00000 = 2473122677439477939390350537460560681367389069785793516849431266616931586038198678832353254929512826088059830272 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade030Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade030Part00064 = 1558038241402502491394241021131360633829632667032587532990965887388112908970667570918276792552701706793136422912 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade030Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade030Part00128 = 762536515391958701729004569397274308384982467674708399851015875379894823416700487870337846988572479949589446656 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade030Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade030Part00192 = 405142744063748271380554088228061967917946734422751639706619612954328158787211781059278356198859998109565452288 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade030Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade030Part00256 = 277858071363484090646475865223900730044769508205585223944878528463013331254950337786006428207803768834613051392 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade030Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade030Part00320 = 231522975406139893876608866291764223271305266505478766041080410982193197076758892911411670527020201308604858368 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade030Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade030Part00384 = 312543263507228024922272904660156737627103338391399319548787976290462309506490079115055854615420399768314052608 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade030Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade030Part00448 = 113253047658765091424627230289798534416562351397228439714157022292624821452879433915498825475823451459375071232 := by decide +kernel

theorem group_length : secondCenterIntegerGrade030Group000.size = 512 := by
  simp only [secondCenterIntegerGrade030Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade030Group000 = 6134017536233304504764135082682877816859691403415532838646936580367561136503857262408219029495714832311258185728 := by
  simp only [secondCenterIntegerGrade030Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade030Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade030Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade030Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
