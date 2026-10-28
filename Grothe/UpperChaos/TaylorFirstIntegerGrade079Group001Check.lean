import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part00512 = 4245681989422997653473061959589089365016882792388557944602715576422550338149740844170857453820175129060376051712 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part00576 = 15401196668212750961709630483244033599833218860718545235267876397503622589922526349439065611272920016418242560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part00640 = 3618308286767020604557256512444490160403239381858362090079177145993528214264042646622431056207306848559890956288 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part00704 = 2932188488146402097933034819413856032311476074548816662109086899508554022005880302384731792110775549009632165888 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part00768 = 2342855611538225465265941819049827724579569350379538007711643251675317141097753111066952727503413018523219263488 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part00832 = 1637552831650100660765786383590568459369864281492069126566339603271048391393687521913002090478089477467152580608 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part00896 = 198227523342794662839029508569118599300909643041168421033525612261686097976695315012529045922216670206682464256 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part00960 = 1379428134622785600899428730788228391193934597830899696555113494100044095679527079485860607711295169819637186560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group001.size = 512 := by
  simp only [firstCenterIntegerGrade079Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group001 = 16369644062158539496695249363928422765775709340400130493892869459630231923157249347005803839364544782663008911360 := by
  simp only [firstCenterIntegerGrade079Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
