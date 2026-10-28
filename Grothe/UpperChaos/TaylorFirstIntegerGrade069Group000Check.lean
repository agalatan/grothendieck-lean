import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part00000 = 15477502422160052640707022737150204736827823102567789660522105765912306307227685703468408559733338090755095265280 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part00064 = 19111965936142933256467022612411011641773152573092130757842418841026333615170124476378244292910913088048441851904 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part00128 = 23646911153707919647456091877574039708434225676101508033207410978670654257563234595289003901446896744951690821632 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part00192 = 25049441936357654301645697548034598913782145499498448271446273681445117845263424168692290159544691828425108750336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part00256 = 24810313365331040604691846737055435426145288714480302989853542415964225351951276336942020511132842523376496934912 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part00320 = 22820249492465142132710509000896399958586581447830245885877425413058595508244137846410880292876908996425286680576 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part00384 = 19591408362194970257190803362676882410856413816535957579168255938645884607284382293826363571275242532390221905920 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part00448 = 15918911287221574345122378905802143440963031946459800425911746701017334272268773538212435567353547291331181674496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group000.size = 512 := by
  simp only [firstCenterIntegerGrade069Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group000 = 166426703955581287185991372781600716237368662776566183603829179735740451764973038959219646856274381095703523885056 := by
  simp only [firstCenterIntegerGrade069Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
