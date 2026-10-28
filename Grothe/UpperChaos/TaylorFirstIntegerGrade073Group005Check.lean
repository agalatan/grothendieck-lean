import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part02560 = 7236134593135915459030731311721298570985733774335835204721697251236401478378970896449517890888102082844295168 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part02624 = 25058089899976872794350534106026491697434887891045743790949709091809350854108312657307186503037508605976772608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part02688 = 25002901591051742239522118923058262250725362160313659972616230790326725107396396689831919852730251057242832896 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part02752 = 19106741757997743140387852908958953031664626949573739709891210526769071862099241131599717191332551496178860032 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part02816 = 14333132343819144337516344363054178805167233403841085060091998057679485036541492845432074089715484351071780864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part02880 = 10505553212973953118699864099712036043871025362949113610021404003900365634154333409323944076565087452701655040 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part02944 = 7514965929736144389770486196475559487469718698335388525950218303001347636759582932349379939754595877314887680 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part03008 = 323816345057611525172689724392383362731220588766941954846497468957306094466711586414129627681700398929805312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group005.size = 512 := by
  simp only [firstCenterIntegerGrade073Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group005 = 109081335673749127004450621633399163250049808829161507829088965493680053703905042148707869171705281322260889600 := by
  simp only [firstCenterIntegerGrade073Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
