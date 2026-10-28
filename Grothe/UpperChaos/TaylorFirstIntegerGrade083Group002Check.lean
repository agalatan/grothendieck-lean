import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part01024 = 178370084276095726371368633704156699507412134349356575382249406042885360522179849063879911536905721952369377280 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part01088 = 820416275996919832328711851089804673659665262063852526564612886378577065662510753962783361199768044951650172928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part01152 = 635936321787134766627135461039365420978180610573872771290502918748394876958268799833569915160105116254383112192 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part01216 = 444352683340127234582026127275451036973962448015274670359359244014097626453746312375860406079042324933768118272 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part01280 = 82252538676530699026032097595412794183897971626972026550622273032057178002416247119132347945371015233935507456 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part01344 = 469169865187564666353265803255513287804734923785854902113775802563018259645861309870682715041217890600691433472 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part01408 = 433206341603563759666554563222652391258258815889649069535795372893939661031225971627112658139759127019177115648 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part01472 = 380394846378442414781938232713081817398087793876824399910957873844093560624570440854074363914803999466193944576 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group002.size = 512 := by
  simp only [firstCenterIntegerGrade083Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group002 = 3444098957246379099737032769895438121764199960181656941707875777517063588900779684707095679016973240412168781824 := by
  simp only [firstCenterIntegerGrade083Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
