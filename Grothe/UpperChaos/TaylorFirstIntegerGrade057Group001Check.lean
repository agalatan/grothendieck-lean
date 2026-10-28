import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part00512 = 38026104785024248163242403910548956132247840920668782761127512042021657083785060876732533142768548776036322508800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part00576 = 27030376928981416701644695623586297497274332295390921261799962131110097674524313859801124536850969383917456457728 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part00640 = 19528733175792009583957449118594347397777825763487793505668318322211874523044679646662312381908381347252698873856 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part00704 = 16814965784281010477632979159231823216603259084606634193536268169473929607665538987678287724052546669457707106304 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part00768 = 22995889924517769514115094332501537992603369130400054308314873001359846814078675352470978371015455878130499059712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part00832 = 12516062442131511658151153061053147340401110680447636056213676693738874360234400562204646232468392085376538247168 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade057Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade057Part00896 = 10664977406539048099251708576605858232839008413198553441085656012342601744932717981829098081564989556597867937792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade057Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade057Part00960 = 8805671182858341770412663832012372594512855748814667719116557873571075233792903811033793622247183196874503880704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group001.size = 512 := by
  simp only [firstCenterIntegerGrade057Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade057Group001 = 156382781630125355968408147614134340404259602037015043246862824245829957042058291078412774092876466893643594072064 := by
  simp only [firstCenterIntegerGrade057Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
