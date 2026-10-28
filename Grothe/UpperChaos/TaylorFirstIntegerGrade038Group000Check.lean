import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade038Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade038Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade038Part00000 = 355867064669680902665668041646197840135100232340718403242235704449421242227983037786487449579257148454819671834624 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade038Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade038Part00064 = 372541528985162058693679449402285490244614097945350510552530140498258272896998132596540594100685118801407568248832 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade038Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade038Part00128 = 137393736070272216630770986617926292982306720353124822692212401497222691175391364606708729648836063725122324791296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade038Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade038Part00192 = 181270919056486489401143685116744798754934362358643348116821803758581206781674149505421932839611009257788885958656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade038Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade038Part00256 = 196354758659968416417449487947949553101077736725981891414458543383791395823254227409509360168088354967031518330880 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade038Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade038Part00320 = 99054570446230359820626420966393661528119728907162379057440090521950625806202141790860724641456151015590767624192 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade038Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade038Part00384 = 98726351628125841771978201501706202691959654557286774652627249871132358259948666510630664147535391131755184390144 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade038Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade038Part00448 = 25788378530619143185631965239034341079300931938439411557319596181486960933129996014745089191192545363804936994816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade038Group000.size = 512 := by
  simp only [firstCenterIntegerGrade038Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade038Group000 = 1466997308046545428586948238438238180517413465126707541285645530161844753904581716220904544316661782717320858173440 := by
  simp only [firstCenterIntegerGrade038Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade038Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
