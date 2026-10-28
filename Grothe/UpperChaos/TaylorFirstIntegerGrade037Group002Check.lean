import Grothe.UpperChaos.TaylorFirstIntegerGrade037Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade037Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade037Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade037Part01024 = 266939049267978713000091270197644381570474765980242027817952308780573891726983027622051531494857920991708839936 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade037Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade037Part01088 = 317089250438712249761465255972491565804442968931356376572868190582788537502532966392425607857271313362117984256 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade037Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade037Part01152 = 205137012463220959587998110746122356805141970476784470589188533946303749226844771648693693487382071572214841344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade037Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade037Part01216 = 84382494690227745572891559542454973392365778793486155527589224765034646089564902695305224000958089629192421376 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade037Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade037Part01280 = 61083327750011635315898770660340568577355944165832727638720997305306236252844572544185836040816605625891946496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade037Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade037Part01344 = 52625510623212403521487862191224249661908658436711820315401830094491839356459965154986763118947059802533003264 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade037Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade037Part01408 = 27171417566521341823091053125385298593897844625567761591907588917078769165690267696089809941231912345638273024 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade037Part01472.size = 10 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade037Part01472 = 61329481611995041234307040223934440807303329753896548789737352047644338050234622474678211261035419901169238016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade037Group002.size = 458 := by
  simp only [firstCenterIntegerGrade037Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade037Group002 = 1075757544411880089817230922659597835212891261163877888843366026439222007371155096228416677202500393230466547712 := by
  simp only [firstCenterIntegerGrade037Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade037Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade037Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade037Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
