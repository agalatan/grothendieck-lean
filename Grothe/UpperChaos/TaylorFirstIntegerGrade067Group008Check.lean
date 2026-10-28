import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part04096 = 32360998967091938706096980573463441825354108319634726807883098855688612784992100646146635424549476723851264 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part04160 = 38343367762076170192646080692201953349918630307676219319900457206261465666173212775853460091557624523259904 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part04224 = 34394188980003357025508249421587497596852847965466959325264536848237153208128339516510790553607919366045696 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part04288 = 29551691434430731704676124614081028670642602886305225745968615477900170850578091688857652489271729704665088 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part04352 = 48578335986316453924142886250053807183246967873804946516974261540601250029691900415714981325724599982227456 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part04416 = 49104931504000168540145486240299963918954283185194254364094712643821921818655280717648699633627741969973248 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part04480 = 16306140426885585806100363016232027492436328564913410531518400338872753485881350314071444666665390724612096 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part04544 = 20065426731370733401634217796096460578055393165129022807592781694182410456071188418496631727778480552673280 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group008.size = 512 := by
  simp only [firstCenterIntegerGrade067Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group008 = 268705081792175139300950388604016180615461162268124765419196864605565738300171464493300295912782963547308032 := by
  simp only [firstCenterIntegerGrade067Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
