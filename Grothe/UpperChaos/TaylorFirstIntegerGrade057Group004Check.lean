import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part02048 = 69281548193774436457734217856311644144283768995815061093415718193762848426290377256310309727750978968947261440 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part02112 = 49051960233364431586882300696489043220353340912695120869432852135216208438261963797926926958325739171304439808 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part02176 = 41866144720133153377864418194957986471490734320934276545762914028044389309280550581365451104019865281220313088 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part02240 = 36227880504438954130495455018697666705620612637386208492991191130953722061615358147643337364337999580235825152 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part02304 = 22945275648845151765219085246414128527206512133859097327182075831736889921943187045211578988439787411544735744 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part02368 = 13573374051738892994432432201474805205146299179445230744984482106790851194027648841633074193329403870526308352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade057Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade057Part02432 = 10685779711982586866942788067574550030410679238825688007983403860353456846407985320605436312135671209770614784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade057Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade057Part02496 = 7991217104416697668651097732429446767442180245299535803263256584944612757006143582291906753281530293970272256 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group004.size = 512 := by
  simp only [firstCenterIntegerGrade057Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade057Group004 = 251623180168694304848221795014349271071954127664260218885015893871802978954833214572988021401620975787519770624 := by
  simp only [firstCenterIntegerGrade057Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
