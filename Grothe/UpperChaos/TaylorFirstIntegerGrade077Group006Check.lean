import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part03072 = 9007191404402589688268524003304475018619111010611785612455457711304706341949151737805972830929963761149149184 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part03136 = 6655332757197524400697535423296507697403564533939051991767500587326167100007493274818397105817424043100340224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part03200 = 4841434068615022103062596178304451310268658109883110448592419500195981484821842126508180518939424438114844672 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part03264 = 3467987324517739154061293224262664546338704445777211655104581897130049427581104702123987296875420337242636288 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part03328 = 14361378917232901647730329341560808015050786532084472741252917003344761063099902886501172511385527194222592 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part03392 = 2439725748779013502188191866089321049306807449742319257486908526422611739105348651656058516738919121356324864 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part03456 = 1710838384829495849087330781569639653437777138858735228520611230599976457503467516659439097685086569706291200 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part03520 = 1173238657804367472202974556374031765845220011313672548833931378136390102253411488988537946250943209932849152 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group006.size = 512 := by
  simp only [firstCenterIntegerGrade077Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group006 = 29310109725062985071216176362542651849234893486657971215502663748119227414284919401447074485748567007796658176 := by
  simp only [firstCenterIntegerGrade077Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
