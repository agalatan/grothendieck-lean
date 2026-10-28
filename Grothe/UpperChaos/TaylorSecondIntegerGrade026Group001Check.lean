import Grothe.UpperChaos.TaylorSecondIntegerGrade026Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade026Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade026Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade026Part00512 = 72851675544491809350350478194696245068588880035319702805882969609357127961956781885144008673941610488655773696 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade026Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade026Part00576 = 76887065132753930686115485893741922942081695922281174847828895762597905989964237763533350546986443562956095488 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade026Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade026Part00640 = 43719301691072302033820905187945034118944084860317426701318113863131444671863621157360971812274306425942966272 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade026Part00704.size = 52 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade026Part00704 = 31290218178723876340194503783630004655205698228155927750751879572981308094400315680651496820897248076088999936 := by decide +kernel

theorem group_length : secondCenterIntegerGrade026Group001.size = 244 := by
  simp only [secondCenterIntegerGrade026Group001, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy secondCenterIntegerGrade026Group001 = 224748260547041918410481373060013206784820359046074232105781858808067786718184956486689827854099608553643835392 := by
  simp only [secondCenterIntegerGrade026Group001, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade026Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade026Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade026Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
