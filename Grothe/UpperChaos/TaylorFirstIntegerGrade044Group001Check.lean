import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade044Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade044Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade044Part00512 = 51135479728620942923263250202972504295861579217919513249705194860500608585660289938407964012791879754024340160512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade044Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade044Part00576 = 51473814614982502602563777883369865279087404067414208492763748790708886304387624697050214114634553478846848434176 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade044Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade044Part00640 = 61214978460591328710748342149950339340513455753653839811701423785692389350581489713595875285651491372028739452928 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade044Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade044Part00704 = 21779188640876184506965130609993720258330981679978163460053990010097790979772877321371968343662682322584830214144 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade044Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade044Part00768 = 24363286445213534479180119674019131730386169670964866103451054301235886403519206249730087055153314934054428082176 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade044Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade044Part00832 = 6000374560860916100478227861694965642863397462859839866546551043698757622509800512509376291481942946500646535168 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade044Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade044Part00896 = 4068852583686552899811777799783685893907201622855109672309449785406348501670665930322545204156285855441883234304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade044Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade044Part00960 = 2560999524010282480935178300299247466662767354158655360528187207503680384813301561579900018197843971671710498816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade044Group001.size = 512 := by
  simp only [firstCenterIntegerGrade044Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade044Group001 = 222596974558842244703945804482083459907612956829804196017059599784844348132915255924567930325729994635153426612224 := by
  simp only [firstCenterIntegerGrade044Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade044Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
