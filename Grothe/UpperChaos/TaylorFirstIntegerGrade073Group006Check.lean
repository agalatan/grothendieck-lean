import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part03072 = 4960685887376390612849929676235282169369878421521371369951748246727458611220354692857073764666721398553575424 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part03136 = 3656746205148868221629533020425390111659806882933131219437041268152658025616950203952485778704273766367625216 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part03200 = 2481664219712382146177088053268591205985012866009671058705445984967974207069607805943010640600026831927640064 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part03264 = 1633758432716453898372514143110775893606029144052994185429347828139999671924920170897631832670000566098722816 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part03328 = 1065430497299539875501523045334848030925397155822562352011122588524132702622996896426910522806736044087574528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part03392 = 722588979229172749878184359839193065574947225082664261064244166946089805603841720529919751188452330092625920 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part03456 = 28202955724980420438163991867532483548236978152826160221402364105797145492965910662524447161092200634253312 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part03520 = 497322921410043567903505380898373462741389938380022293369614964861445577419580724209145223271683303931904000 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group006.size = 512 := by
  simp only [firstCenterIntegerGrade073Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group006 = 15046400098617831492750441670979986423410698611955242900189967412425555746971218125478701961068986441693921280 := by
  simp only [firstCenterIntegerGrade073Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
