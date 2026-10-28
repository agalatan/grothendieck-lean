import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part03072 = 1455585907323805800016167125566313647779343412567615920407693202386475049366754516960861770363438590242848768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part03136 = 1220023573682081289344868878824577565273731155046237458159407368308254448393420950572689651327734684263120896 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part03200 = 1014245768047498886004316212246968851377291786551161733763987834675591585907458220480785157733765239200022528 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part03264 = 913394540838113579065180098192598806637985370389394366760585118566286558047743293250616842837565769617768448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part03328 = 861143020448753294827634578969127012620766131602021634960789930762044079577993231560900535255118620986966016 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part03392 = 733182771603190227312597135022614941613996538760914539924438806701304366569663406754123026034137006312783872 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part03456 = 567241346374856585610040675899403694512665238616765124417248756282121829215336938542354729189246135556898816 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part03520 = 418872344669757428322846739048847442158828144654888427660677617021166001317710311565845219614581500290269184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group006.size = 512 := by
  simp only [firstCenterIntegerGrade065Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group006 = 7183689272988057090503651443770451961974607778188999206054828634703243918396080869688176932355587546470678528 := by
  simp only [firstCenterIntegerGrade065Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
