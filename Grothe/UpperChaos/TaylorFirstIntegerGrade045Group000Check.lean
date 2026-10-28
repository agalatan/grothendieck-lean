import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade045Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade045Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade045Part00000 = 462977453830755508311924528959439384581213617710920367039343738175753624002543944848072619216060217508101984616448 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade045Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade045Part00064 = 476127855987506775609257868101132710755341472928648338670250457470610134659118619816573441702077643285729890009088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade045Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade045Part00128 = 1104691420897471651971275972203121213199122006524719344788254796689672428065873535140964417134319057062531795255296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade045Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade045Part00192 = 600991257266392999748423090309026614203742255578518095955507483594761594384954555589583066156741194069496221925376 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade045Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade045Part00256 = 564920100570909254736350568675430716494252926061565454608145938672868242794067787072522708316780618641509512642560 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade045Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade045Part00320 = 745765545367639092013048781366509103434865494542677758999947532992131263688286424536778057174757038304085128773632 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade045Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade045Part00384 = 182326805638399364632312440204447553807596722194035612563377516243088905818792256284998981352980257817642737336320 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade045Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade045Part00448 = 124297157987549831014491509880985589213579798611584575907672312848961257955614145291890561235560837726779775909888 := by decide +kernel

theorem group_length : firstCenterIntegerGrade045Group000.size = 512 := by
  simp only [firstCenterIntegerGrade045Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade045Group000 = 4262097597546624478037084759700092885689714294152669548532499776687847451369251268581383852289276864415877046468608 := by
  simp only [firstCenterIntegerGrade045Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade045Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
