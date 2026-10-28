import Grothe.UpperChaos.TaylorFirstIntegerGrade011Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade011Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade011Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade011Part00000 = 37995720673273723930024233488035003373258285666013274646703660384821389759176040724838376074357740865608146449596416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade011Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade011Part00064 = 321362757248140158360006283026331487306584215171152556390268316629940106773176766463670945727253479550742740074496 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade011Part00128.size = 28 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade011Part00128 = 3360844194580711081514106186792202235402662711985082018838012888390616191416920817951521560728140744498759073792 := by decide +kernel

theorem group_length : firstCenterIntegerGrade011Group000.size = 156 := by
  simp only [firstCenterIntegerGrade011Group000, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade011Group000 = 38320444274716444799465753877248127062800272543896412285112766714339720482140634412119998541645722485903387948744704 := by
  simp only [firstCenterIntegerGrade011Group000, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade011Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade011Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade011Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
