import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part00000 = 22794329964178894227859090490346350576181345036746245449527429165116313586729089727888183206469421260548278845440 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part00064 = 36668714318286136422985239325225227080742284632915309565314458673610478323332728890962837550756602580165006983168 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part00128 = 50476277065930044003371512965842750654096089454394980991823043685479730383307930465316108759728615279578922876928 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part00192 = 57974545042048662186736539795257396091556587007692432518702475928996829680512672929241247286762561690196741455872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part00256 = 58611032587247574555454076381405431302340439457686131281228883999599691384058146592857956182419773259000791957504 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part00320 = 53899732099044345106364659268224968401568242462348614479662540233153015951825521427492025410543594942048346570752 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part00384 = 45457565786187025414781098147166983836623537663502563260468101602682052389544682048000835502588666822143330222080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part00448 = 35264786532930426834243955467703562902056409315215762689907058284840969915253056418513677966429847077872386179072 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group000.size = 512 := by
  simp only [firstCenterIntegerGrade064Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group000 = 361146983395853108751796171841172670845164935030502040236633991573479081614563828500272871865699082911553805090816 := by
  simp only [firstCenterIntegerGrade064Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
