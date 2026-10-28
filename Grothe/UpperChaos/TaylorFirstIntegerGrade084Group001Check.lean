import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part00512 = 2550369434062298928771467994293096658189083715197609226357250711177404252952574600868691749271374749877768552448 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part00576 = 2369086955464482737899994044761666570093616432921960590147950232638777720137704578184589109814181189669120638976 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part00640 = 2178755044734006457736059943530346213063777323371071585334241278432422006404133733532245996000797387828676788224 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part00704 = 513577571806577025269664574105161995583939691597154786830091643618186092725454166864512648933922232561618124800 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part00768 = 1474324445491601943544360546206813002176578402667704481455513637775212470448989165470738146751749654336382173184 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part00832 = 1695355405832723850677368016281160247322458714134694735066801732484051078155034106196958677615317022456133189632 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part00896 = 1342197714812526118598921092723498522879403394845490386960773392115844479647425523630964280461527498675386843136 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part00960 = 459619797463821486961692788782207779696568897177764861029981535997337943482592190331549085935348815867622195200 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group001.size = 512 := by
  simp only [firstCenterIntegerGrade084Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group001 = 12583286369668038549459529000683950989005426571913450653182604164239236043953908065080249694784218551272708505600 := by
  simp only [firstCenterIntegerGrade084Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
