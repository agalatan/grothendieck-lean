import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part03072 = 7094049631694985925963799918832027384807140069093299796156007089315832110037723798359730505169791401301377024 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part03136 = 5096617602741386262378606432314904513166915462396152832273981919570667261172197477078142745484056411240398848 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part03200 = 3588225125516044680813895048786011050167779100721513560976073219632986043553118487402321666646010612466843648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part03264 = 2487394518151608935869171277939125763256048827692803622607917887246570132523640570664220975033468541254762496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part03328 = 1557341334203841292331523859623083244658925610056890810954264490420421119233493497072334750127476588727500800 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part03392 = 139445590300121557015390137267594813973636338448784409618697729854702306122242383762202538461688831185780736 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part03456 = 1101090937712728936139762649561492328473993049813589405346680134821688960489855101148163743245620701676175360 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part03520 = 694023323720836960078626156302817059424852216681863951895729258509314338844418035589024939860534804854341632 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group006.size = 512 := by
  simp only [firstCenterIntegerGrade075Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group006 = 21758188064041554550590775480627056157929290674904898389829351729372182271976689351076141864028647892707180544 := by
  simp only [firstCenterIntegerGrade075Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
