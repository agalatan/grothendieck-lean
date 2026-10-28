import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part02560 = 51166715688442228544128065262003946678847336362341863415713258312481098409516279828066767849867343245963427840 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part02624 = 42006660574061771034659652052048853933547313242849535819151571653381388562114040637206359469296995065671974912 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part02688 = 66935970329879362825467633289019676898159313095545965460226810621864972619973385595806004691099189449326592 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part02752 = 34441441002853441646866128071935807340885786149003383666173406811332370070969484040752785391113321387067965440 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part02816 = 28464587685662967619432782927835342272899497218242470648854131529858265210039005694315850692687652331892768768 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part02880 = 23611626747896776818347404171717443195739263772019237211315981414868517629222238901102363329654808914450972672 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part02944 = 15304527543711395830154076703903798504320960686863053449780621702203530147670898014820086227087370135535616 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part03008 = 19709649010828791760708733610706063587820307097970566828433361296516196186221481221341886364402834936329928704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group005.size = 512 := by
  simp only [firstCenterIntegerGrade087Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group005 = 199482921207619568182798387806240380485141984116209466608551718450761904570850174606396639187941142440961900544 := by
  simp only [firstCenterIntegerGrade087Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
