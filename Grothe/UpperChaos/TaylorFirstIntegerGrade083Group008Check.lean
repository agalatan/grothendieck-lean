import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part04096 = 23625624618549846077401676032975643589735450893744208591889248235583178819917854339826742424250174196940800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part04160 = 242137801470627029441787081046598761389543990319416492047770148959743147004463297409160149898794626084503552 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part04224 = 190779595633372877776069509951653568550560968800183864537167928641697975684155915801458084192559507454296064 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part04288 = 132494517817045714758530683061171498130619891614475909621221537275620988564195438867912889352214267727708160 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part04352 = 16940185056312856103810481130273879068548935868157843810924476035962392513818208974109629107605579654758400 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part04416 = 73188830763573070187943738825900003746946072419195219056254079095902902634727169022634487697071897116147712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part04480 = 64236533100717917002964270759796058832935664853766679298580468471681136436415335851143778811303338019127296 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part04544 = 56551616786023072580917831568523028141014653927196680679743185460616715114185725824488726501488951709138944 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group008.size = 512 := by
  simp only [firstCenterIntegerGrade083Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group008 = 799954705246222383929425272376892441449905628696136897643551072176808436771878946090734487985288341962620928 := by
  simp only [firstCenterIntegerGrade083Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
