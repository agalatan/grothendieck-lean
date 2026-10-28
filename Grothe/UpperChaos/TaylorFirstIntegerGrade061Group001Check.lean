import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part00512 = 27574613806704128217892183123150022032776408316130694822375554669289959128244222342608107782000625037979852734464 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part00576 = 17813711477396881302362978020921936894309060074983086544410918725543457327338720353817343041891420368044516442112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part00640 = 11763270169479133271802635395130987670804610416202350128745370678130056721371974896956606926370625729916875833344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part00704 = 8819912635006995318243322651310228197108495253709439906881230272416060513947482881538380002833340895315774930944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part00768 = 7765127324296238875285299497404510032800744009725907791552301273854259235833881838364478548132828755485584785408 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part00832 = 7499304908707556276328536027724035731878433645608219379092420032926905332589616790731823469245755093954250932224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part00896 = 7322641374344710655311614667730927460095987994942565320927559263386494729550889783772872622853441396145051926528 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part00960 = 6926875817253257861780231297348803069719215998928930426074989344613561243285277633184817234286685708148971405312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group001.size = 512 := by
  simp only [firstCenterIntegerGrade061Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group001 = 95485457513188901779006800680721451089492955710231194320060344260160754232162066520974429627614722984990878990336 := by
  simp only [firstCenterIntegerGrade061Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
