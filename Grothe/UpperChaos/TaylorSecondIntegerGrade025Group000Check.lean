import Grothe.UpperChaos.TaylorSecondIntegerGrade025Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade025Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade025Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade025Part00000 = 7691480018275046007998433073073272835285421254264560600296209943440298925868287714983292931944646903950332657664 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade025Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade025Part00064 = 2283500003259157003791822821487774832103679455659689553635820713450020156222785137441650500046709975636445757440 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade025Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade025Part00128 = 1439802244036907980910061523776520369908650943068833347360225036393011544371356128838469236559011915806340546560 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade025Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade025Part00192 = 694485631892391016508243477978164443822743582460784552140621343046944449798307572128131072731387206798067892224 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade025Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade025Part00256 = 649614744873173135503187978931513428279701119934140248316894372071420222137967012339787374528512815407258664960 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade025Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade025Part00320 = 377310434064903992926809821380025656123238055746534176948431638385073478928919115405269464492046795115369332736 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade025Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade025Part00384 = 206647795102851538195508300259034997580522914776672612382694914875438398226552159662826288710212519913009971200 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade025Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade025Part00448 = 160563319868399235507715314890443716556455165232079652451035285510031794690413093945266566059146285646648180736 := by decide +kernel

theorem group_length : secondCenterIntegerGrade025Group000.size = 512 := by
  simp only [secondCenterIntegerGrade025Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade025Group000 = 13503404191372829911341782311776750279660412491143294743531933247172238970244587934744693435071674418273473003520 := by
  simp only [secondCenterIntegerGrade025Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade025Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade025Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade025Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
