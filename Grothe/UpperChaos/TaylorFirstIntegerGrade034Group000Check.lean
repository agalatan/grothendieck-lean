import Grothe.UpperChaos.TaylorFirstIntegerGrade034Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade034Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade034Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade034Part00000 = 575246820403391713966103870325070939130096033723338159471141686934547055200973210506167055466635276655134827872256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade034Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade034Part00064 = 485585087182088979253207805687673486828993864406243328737438730466698029769577948919910905032051842439655488225280 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade034Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade034Part00128 = 111998500178138231013886751009575784774466889957068543057022703463206702918924134211020020649929963321765524406272 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade034Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade034Part00192 = 317608102599618988256548011462083445554718231680621328485370366073595832161424348285019692487286465982523217281024 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade034Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade034Part00256 = 221259881888493303044648839374445147066678348828478209182777105890782882894573822634190398163115068002165929803776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade034Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade034Part00320 = 91825514064761877630434753757270673213767683531806589707261142450941632391243584609968588368608201797789112336384 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade034Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade034Part00384 = 57146807712459603237264555832682160008876048297034404111652467476038203882298721987775678952990111148261603540992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade034Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade034Part00448 = 17723040827447949972386482213300202048336109222602678569137249707201534937779853562237539025042713363953852874752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade034Group000.size = 512 := by
  simp only [firstCenterIntegerGrade034Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade034Group000 = 1878393754856400646374481069662101838625933209647193241321801452463011874156795624716289878145659642711249556340736 := by
  simp only [firstCenterIntegerGrade034Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade034Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade034Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade034Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
