import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part02560 = 5535665090098018095469978320461069440623808894052576066904069356263091402914284648527467533479044514660220928 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part02624 = 4031684821907085769577988334635497057384664751824759939651796654278927036920733863104986384223426417990303744 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part02688 = 3361053237163456244169059257323266288080474422146718594615141928994654072524912213322772557836563816709619712 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part02752 = 2795565330681047100103362422743968639525585954306776062474899132282302074954734430522064276720641328675815424 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part02816 = 2671405494728951606459516624115062539032881094490130992346485759429482999713519378543746274741438019406921728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part02880 = 2213921720088089499625201218859518893488516947107418671282889412973403165562542179660923738928145855668027392 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade057Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade057Part02944 = 1905725204895275912070238280996992562745736174677803838953420422203471392096581191864053345873175065856573440 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade057Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade057Part03008 = 1482946734994487270929154360583159855951551857013289485089480736590334443210676836362219012048334455633346560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group005.size = 512 := by
  simp only [firstCenterIntegerGrade057Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade057Group005 = 23997967634556411498404498819718535276833220095619473651318183403015666587897984741908233123850769474600828928 := by
  simp only [firstCenterIntegerGrade057Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
