import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part02560 = 9751764572612663687744606047717564212981174682645596308180533011150210620284845424668951268161878765376372736 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part02624 = 6932092198843515366623736601828895232121486568597542587633763891045508413066197813025665761640764226765062144 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part02688 = 5058519639555032341408571579724849301442310071748547981826301968637602846075324186553809742933449242507739136 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part02752 = 3771880912084654911765544751149306384844302722526813680553068897341309673241142198425265844634671489717633024 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part02816 = 2902372165088733394342087752294678076563176124747512679021852634284424024481486898829292987629055341362151424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part02880 = 2362405903848384973704215403635317525101228217324781875297497327701315946662051379735977955590333378395635712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part02944 = 2040272287254975883915660574543908788070123144930729840340571756199178082176332182936421335427768934033522688 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part03008 = 1758713702557761528999865985963005013899090193496693420755848855237381234394082051021196888053183549194371072 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group005.size = 512 := by
  simp only [firstCenterIntegerGrade062Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group005 = 34578021381845722088504288696857524535022891726018218373609438341596930840381462135196581784071104927352487936 := by
  simp only [firstCenterIntegerGrade062Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
