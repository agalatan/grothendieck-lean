import Grothe.UpperChaos.TaylorFirstIntegerGrade033Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade033Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade033Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade033Part00000 = 676821909262851512109911509722804400837980858363549186717946776869429540851469908444618346172920579714938212188160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade033Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade033Part00064 = 383406285047106251539945094040103328483283846825986591983535951792245413566654019047992164871682601185804097159168 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade033Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade033Part00128 = 160310840899005269665059773409455741976765556464537543568851065158751067225627234173843276777804084697935292399616 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade033Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade033Part00192 = 383963542179300424869435610302099009419260722492439499583028434819492399850302796459302961360795959361254109216768 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade033Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade033Part00256 = 245186480084134694250205114741655818542305425810104010317972888820490383410428456383147302760407650579522873458688 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade033Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade033Part00320 = 94199641220148236703475862802594882961100334815756526593103631205203096745473024028872316842003158466764715589632 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade033Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade033Part00384 = 23422615047806706326494589880537685215484095230027374824056070817396658703275499269744844942593420989789959618560 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade033Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade033Part00448 = 16026122267215897907068558999321511351626713160962987604640155602004470691300074712132362912742945048164558700544 := by decide +kernel

theorem group_length : firstCenterIntegerGrade033Group000.size = 512 := by
  simp only [firstCenterIntegerGrade033Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade033Group000 = 1983337436007568993371596113898572378787807553163363721193134975085013031044531012519653576640950400044173818331136 := by
  simp only [firstCenterIntegerGrade033Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade033Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade033Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade033Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
