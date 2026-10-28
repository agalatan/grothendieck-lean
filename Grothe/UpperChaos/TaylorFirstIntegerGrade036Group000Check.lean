import Grothe.UpperChaos.TaylorFirstIntegerGrade036Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade036Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade036Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade036Part00000 = 470593814171246375901813940380763537979966104277394075136588651883514998861630071522396064108792964339646477631488 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade036Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade036Part00064 = 728369666071708257075737605947256240115381893262903463847289330790580117726302671563123698199450050917243199422464 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade036Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade036Part00128 = 249253164787971965622718233756453933709513647825046558122439251659250862721909162822933680321243420818702099021824 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade036Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade036Part00192 = 134970209830920282761857464320792530241733998622610598606871213706744231777605858821106840947491536472011834392576 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade036Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade036Part00256 = 277506996489398643234456065580319624213516701040699330145606014992658888646902497921706579268597793292074795139072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade036Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade036Part00320 = 161931673537503929728333005185174277573337452309134151264585288216697884714825581328767932896842050766182811697152 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade036Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade036Part00384 = 50581119100383883457561692136657474216908314756997389118615235600547697010012432258165724021691701857676420972544 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade036Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade036Part00448 = 32370557465692256416057798447740450997195236779178777455551474114252707601908764015492678282682335686624301547520 := by decide +kernel

theorem group_length : firstCenterIntegerGrade036Group000.size = 512 := by
  simp only [firstCenterIntegerGrade036Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade036Group000 = 2105577201454825594198535805755158069047553348873964343697546460964247389061097040253693198046791854150161939824640 := by
  simp only [firstCenterIntegerGrade036Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade036Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade036Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade036Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
