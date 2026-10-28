import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part06144 = 1955252943221696524364303421134223256972991391887474908231425820887912496528630662909761522403222919053312 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part06208 = 11538292148644978023025022218412701048707996585839966389544306609420899569033075197095879851677744856301568 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part06272 = 13592793385528514797440258431331137531601896332186884182586046449458225772581381674720360984671727321612288 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part06336 = 11013768730914235122101372101554888302170090385916101683531706047631882336621456858103912903252611843489792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part06400 = 2896020659127027504282487640022166589412287461662065605027990845518614103780129857983191474114749907599360 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part06464 = 17022789781133280801080791637622244240889773260775507097858526160134548369027766930974307307155004602712064 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part06528 = 23065086165096420644201692243340078535803665229374310106681185295628185830113866198069183966182686356144128 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part06592 = 15200985419957283238318323097421329126034578063363692941897069333425315647261358255945237410462096720658432 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group012.size = 512 := by
  simp only [firstCenterIntegerGrade081Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group012 = 96284989233623436654814250790838768631593278711006002915358256562105584124947665635801835419919844527570944 := by
  simp only [firstCenterIntegerGrade081Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
