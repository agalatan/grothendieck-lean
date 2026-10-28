import Grothe.UpperChaos.TaylorFirstIntegerGrade016Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade016Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade016Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade016Part00000 = 8156403319638243552683690469180946508877138914896439727688678888900021257037313782928735920482152293623664352428032 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade016Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade016Part00064 = 2292408494511411839122866308391107999327553948801619235801328855448914106440522167471733227756002375972535599628288 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade016Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade016Part00128 = 47561812912450348510159680345631704362451864828973452746381914721575828151680438881869580057383692007086883864576 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade016Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade016Part00192 = 7452453096885060995019028590549261539032084976563628979779715157945821426291006717466913269896411684024682020864 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade016Part00256.size = 50 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade016Part00256 = 3067976945153076349005326835890541089770332960253425089617798426842666472051635675417190715284802844515800973312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade016Group000.size = 306 := by
  simp only [firstCenterIntegerGrade016Group000, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade016Group000 = 10506894057104143877660740813344126015195947146463849470305787172655299679527859031675222832280719576131827318915072 := by
  simp only [firstCenterIntegerGrade016Group000, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade016Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade016Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade016Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
