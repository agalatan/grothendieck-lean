import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part03584 = 9689594083598871436563892343292233645432485831181127797186199443550944241577333215191242204484262342688768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part03648 = 2399073904292232131897494443452142086426212887421347152011249409817336357572617030732400746655453475409756160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part03712 = 1713580759258831373650750675146584008362032125864131445065868708904972657693447451536575043993852298190127104 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part03776 = 1194376052858881615538414847754179921204284699342302519986851286551440073307012218822586883111179302264111104 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part03840 = 7413039754299323967625095896773833848271747663767912561404996385216933897915461904216678219124780885344256 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part03904 = 804348341029378905410186989272878414096116308196644382591254110994715689253673289577054402040429627310080000 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part03968 = 543038379138741610837513452921269149054017645705172595588141052374883826953183706054116213743433650351898624 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part04032 = 371494201021595319155596106364623633294702164066746908537546236641604711958167367006820113814013915546255360 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group007.size = 512 := by
  simp only [firstCenterIntegerGrade083Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group007 = 7043014271437559151894145503151743279931070064091294044139502001113721194877593858848961323781971312300261376 := by
  simp only [firstCenterIntegerGrade083Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
