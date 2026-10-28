import Grothe.UpperChaos.TaylorSecondIntegerGrade033Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade033Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade033Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade033Part01024 = 5982723467080219897413601356322158328530976338935431035673597753345506448573013763379652307085750908370288640 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade033Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade033Part01088 = 4477601134990083136837994437568956821761189307710713320339523836472821946402276402095365280761236629602959360 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade033Part01152.size = 38 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade033Part01152 = 2670906195205846568623828595403751380849594083108834992149933703178520042982692510740706746453027780286218240 := by decide +kernel

theorem group_length : secondCenterIntegerGrade033Group002.size = 166 := by
  simp only [secondCenterIntegerGrade033Group002, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade033Group002 = 13131230797276149602875424389294866531141759729754979348163055292996848437957982676215724334300015318259466240 := by
  simp only [secondCenterIntegerGrade033Group002, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade033Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade033Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade033Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
