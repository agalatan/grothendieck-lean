import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part01024 = 5082922220030974851554963658631515516264277967419701005550216945367074270012592958351820026717498376280919244800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part01088 = 4688345817667938187172080727579046346671127371499694609364894504779963639304124344557230880333164585897959620608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part01152 = 4156957301388254826452641780832277188979335278736936836785345234132440715035172862159413158618666379715918430208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part01216 = 3559085333697136463637081252551510992355289864704610655740880427295503663499091388958301761024019163783431716864 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part01280 = 2956569564213684831346014502682314819270799430053112565245049558530145822984269272718408992863986421560122540032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part01344 = 2392709640038075621656364781457719812102020046813407883666893340563288145120069574440528138105411065538970386432 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part01408 = 1894011832933146424363264226247862981577588000878722355768240986037970943409832409486188437864853439770592804864 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part01472 = 1473441950980184854783143482795291290910525727868290904128125746323415404919433928025252667268104229315346956288 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group002.size = 512 := by
  simp only [firstCenterIntegerGrade063Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group002 = 26204043660949396060965554412777538948130963687974476816249646743029802604284586738697144062795703661863261700096 := by
  simp only [firstCenterIntegerGrade063Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
