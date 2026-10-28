import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part02048 = 69781372597010971605765009591260647301358540041512375146990270590850780862070840190453676094561756539141488640 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part02112 = 49295631998622986219519147186692670814170996310227535783471773386928435615519937306037265443539820120236883968 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part02176 = 34766722623004884616320648824103403726149909449385455967287107442353715111027316309553307718699533885115465728 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part02240 = 25308562586687377691155679422734640733386331067941345021833832638397441615103534618565989321345750477200949248 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part02304 = 19382791569615176515264036500371243886507216998192663366916192810390918382703921173588790493809657671554433024 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part02368 = 15308216805390378980779166180653814597078683624325419877797487444594418350386140992367003405689501245394386944 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part02432 = 12027523114196470988262862274459701067686780146172855585162389923789670564501306585190246351067955502619033600 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part02496 = 9446089042218555504341890280542674645275639255618942440781203226948204039981621039382512935787600234523131904 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group004.size = 512 := by
  simp only [firstCenterIntegerGrade058Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group004 = 235316910336746802121408440260818796771614096893376593190240257464253584541294618215138791764501575675785773056 := by
  simp only [firstCenterIntegerGrade058Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
