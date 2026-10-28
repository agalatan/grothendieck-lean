import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part03072 = 1548014330745130192776963377137279789010295807548644597750318305912156551410254898576405307965813580080611328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part03136 = 1231858753117654172764192245210254861910870220205303183745501289237597834997896581105401173960213961033908224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part03200 = 905624782299387990225305905996223548864042689193198864523375239081545499831014974076814409893281264188784640 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part03264 = 739572379314442108382957419655126783702515347943999189688256467990564896537104034037704667630488776152711168 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part03328 = 498746587427743983932964199886795544837962169300213615305535928344682113425786580996099154158305492424720384 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part03392 = 280406598415792188335755590189963028221841371842821601066629914419175142399586976556567548574423026235342848 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part03456 = 225497172875243527397343804743933158804387395037462094087287419141103803997264163383197113142508729457967104 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part03520 = 176993712772384129258881596294227624616219503042506579976222812353303009004164182804898864072155109345198080 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group006.size = 512 := by
  simp only [firstCenterIntegerGrade061Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group006 = 5606714316967778293074364139113804339968134504114149726143127376480128851603072391537088239397189938919243776 := by
  simp only [firstCenterIntegerGrade061Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
