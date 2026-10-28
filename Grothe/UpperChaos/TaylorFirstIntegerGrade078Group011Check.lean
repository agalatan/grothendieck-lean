import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part05632 = 15632136754144452774088084533489362510525166870861790793022993324172591567576747809369536364434034744360960 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part05696 = 12520179478974929825200155551244292619821875591539111958529935725932431841985187611327925822137132885475328 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part05760 = 2493941698726967706401018341435005046516170064767826034640804538415706213633904712134639345546651863351296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part05824 = 15259874288579926074039562276846119850962142641654843181003512794755866345585662863511260348585432768839680 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part05888 = 12739088111141719992625943914625840925309170605470721453382788294667517424907292756666511315567631986065408 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part05952 = 23353823769598177688002427663660757150251266332007371514009182754218887377040827550202568063235342817296384 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part06016 = 26694521462790618175173708289216104211984992255167893093840167515699968620311757588275876588014409682518016 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part06080 = 722091310429767369258456035259572580953928909604008320966658317155888189973895273436434804248088175181824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group011.size = 512 := by
  simp only [firstCenterIntegerGrade078Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group011 = 109415656874386559604789356605777054896324713271073566349396043265018857581015276164924752651768724923088896 := by
  simp only [firstCenterIntegerGrade078Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
