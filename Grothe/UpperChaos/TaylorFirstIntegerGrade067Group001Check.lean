import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part00512 = 16332147981314964869239601799978653956700229357338707688927338844131071491600711332302670544404853032648911618048 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part00576 = 11570964155031554555616287776301224977051093225817619812372795410353003720840480268662713794334446144532972044288 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part00640 = 8005623729349254033026977469081831093435524222495809099950636810333680786026581794692594137757683026513136451584 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part00704 = 5469349323348266472356140018123604448526353877825537597426327224887990678651756139918776271473596650501632425984 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part00768 = 2995596481971637004679588172831171607087847504944646095030215836628180486815105092112665287176704779817800695808 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part00832 = 1603620878672574981086377634247823735323708783625612639344347536748784415089376782147857083750683418751200657408 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part00896 = 2603120456456414802453996508512716043068981398432820540068116191702555397086105063432924036862802145575717306368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part00960 = 2639050089790268529743650684070169846093240616553077847104116291197750163188552578062207594007301905405959995392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group001.size = 512 := by
  simp only [firstCenterIntegerGrade067Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group001 = 51219473095934935248202620063147195707286978987033831320223894145983017139298669051332408749768071103747331194880 := by
  simp only [firstCenterIntegerGrade067Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
