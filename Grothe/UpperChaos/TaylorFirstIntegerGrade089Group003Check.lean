import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part01536 = 264513120529224464444439553856485574708717849899856182733328314558614897425990705841439990407399921801465167872 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part01600 = 264578697497884148244470714494793595419894662149896099247184844522899232896293821844694777534124667024453926912 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part01664 = 33887631992483869087636244028207032246872071843889852377588968432490022340254733460879290985433321212487925760 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part01728 = 208586382835396594366733500045379841207086395425837251578530443783479498135433488619080135356326942426248773632 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part01792 = 217620840375512590976508694136607766078163859400811317153017380297579069594168076068305777584574914375085719552 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part01856 = 190303050166382121791011202121057947320881459619870722705561884066201630575866584797796458410862142051332390912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part01920 = 352423970811825817082876833455370237711992936281499902476428824167227119220156095418141363409105616667410432 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part01984 = 163528048692045928964544856258529963093251113588263206611672257028440980840830447208930171710789687809249640448 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group003.size = 512 := by
  simp only [firstCenterIntegerGrade089Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group003 = 1343370196059741543692427641774517090312579404864706132309360521513872558928058013936544743352920702316990955520 := by
  simp only [firstCenterIntegerGrade089Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
