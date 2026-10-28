import Grothe.UpperChaos.TaylorSecondIntegerGrade010Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade010Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade010Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade010Part00000 = 77296511642246396459890031032543582800718899585977674276360920085364242831898625704893264759104851629615951642624 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade010Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade010Part00064 = 1531419530539710337054135072786362408408059058246744340569144880166042004684260981273978717678946634081180319744 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade010Part00128.size = 4 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade010Part00128 = 2127786775948356355270659660423284840205744162679707058866121461221069282877960935980103214998096265084928 := by decide +kernel

theorem group_length : secondCenterIntegerGrade010Group000.size = 132 := by
  simp only [secondCenterIntegerGrade010Group000, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade010Group000 = 78827933300572882745300521375989605632411798849968581296637123831651746057652169564128179456887013261793397047296 := by
  simp only [secondCenterIntegerGrade010Group000, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade010Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade010Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade010Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
