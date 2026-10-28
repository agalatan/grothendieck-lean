import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part03584 = 775436522590551406295725058039747344209521027468968049878359269459972502059513737472778267295074530428452864 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part03648 = 128105502543152257716174424818041933021001130082660043935768313286318199313593109824915882054145146569621504 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part03712 = 356355320827398816623151458436698969435208883158574592945463348774161672823818641161882714864995815428980736 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part03776 = 291019709401412177038438460801302739737673347516717560495374635458512234970392461776227085755393836664750080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part03840 = 200533565434321448633569054751775738667864614018536539880883625079802864748660675396888822713051391851495424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part03904 = 173267645226879147050452607742081430723000561267863948598026190875976007241429262808204093733391083159683072 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part03968 = 147612877125257033528326301665973796702733803101674249487490027058724883274756783960467836095650149632573440 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part04032 = 15731129353654422652616148738448441097096248762018883815272963785306527483123641698204231576992305698045952 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group007.size = 512 := by
  simp only [firstCenterIntegerGrade077Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group007 = 2088062272502626709538453514994070393594099615377013869036638373778774891915288314099568934088694259433603072 := by
  simp only [firstCenterIntegerGrade077Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
