import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade042Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade042Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade042Part00512 = 48224768337878990509236680052649970363032818583989324534662384733161234071979451606214441224963749165410549760 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade042Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade042Part00576 = 19548727226386950447341860168760087762168147499834944829252289149136624072271041836787666009589526129224450048 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade042Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade042Part00640 = 30551187125480112403367200085013642395924861114263409279131213591223750762387509454220326342319353477977866240 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade042Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade042Part00704 = 13589402526241023218777464065102357101651044748931338867081390298786428100923218085308373681157566489243418624 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade042Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade042Part00768 = 11556994353762330443385974008890250916725694405576708035922767972081196406536224494959156283253349282373173248 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade042Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade042Part00832 = 8249435309966523124761036332333895793087070114252792492473501877556054836282958097438848250725119776205570048 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade042Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade042Part00896 = 9484282307552657042252822438394269359558255321914888450789807887576423248981394183387746395333779385858654208 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade042Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade042Part00960 = 5621221405703238895538440017217121161163278943268741432658857162664690589551574034037021682200193752356618240 := by decide +kernel

theorem group_length : secondCenterIntegerGrade042Group001.size = 512 := by
  simp only [secondCenterIntegerGrade042Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade042Group001 = 146826018592971826084661477168361594853311170732032147921972212672186402088913371792353579869542637458650300416 := by
  simp only [secondCenterIntegerGrade042Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade042Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
