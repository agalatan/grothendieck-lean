import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part01536 = 420845583318608555315752855730617312522735628482586290738308116715231615819402917605373493311742891674788954112 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part01600 = 345602525371452310539332457707470641296640637129135830476945566263780671393998700978008743232375862796455247872 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part01664 = 25909167738684085816625587666355573330628613414700003608329864473222372071465444153045243952666198537293266944 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part01728 = 320691588577230792489228251074228949508541404969117059637544893957479857528944213708730780264562969208151867392 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part01792 = 272193438838644143675578005392637862075922341437470634049019699488700408538649823656674307037838744838880624640 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part01856 = 227530339411830453164051879134817957533865214291156618265166698651514285827966540718662754802333838152285814784 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part01920 = 317508818973892946915148846327317644908357291004766145405950870896338898450072321237292291938080384985595904 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part01984 = 187808212414853504717257809658527449303828293839708284792853002740685848750320859565223663465091572178922504192 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group003.size = 512 := by
  simp only [firstCenterIntegerGrade081Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group003 = 1800898364490277738664741995210983063217070490854879487713573793161511398829198572706956278358550157771763875840 := by
  simp only [firstCenterIntegerGrade081Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
