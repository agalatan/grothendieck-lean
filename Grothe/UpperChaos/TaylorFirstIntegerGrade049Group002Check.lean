import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade049Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade049Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade049Part01024 = 1924173864924813680645861637998243884282053037308608178095214600301558503310293450571293215454731946324849065984 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade049Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade049Part01088 = 1478985477563534548427736314757809608689136663596833192596378686873785855416279589422973387328824775297432813568 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade049Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade049Part01152 = 1223513453698358355573044210018896962629522065936638138605001998710763779654677179617278445657286388173112344576 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade049Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade049Part01216 = 1776354350845124332367807322918398184407659174428310604275334945539368298289220121308166680625465454123691278336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade049Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade049Part01280 = 731951979560935538386380857369000863323462459874527939425522519778314959773663043778503920501182282819539304448 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade049Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade049Part01344 = 583447037820520436488396566275142612092061059011204142099830439690037210144997272514846220926119380245207318528 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade049Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade049Part01408 = 440844193301745927750528841958635071088612360858782992044569122462617390339405366585956035871164791741111861248 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade049Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade049Part01472 = 502014952411706400063442540864275886444044495696207396066776318582136292470235922192457467674929984463672705024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade049Group002.size = 512 := by
  simp only [firstCenterIntegerGrade049Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade049Group002 = 8661285310126739219703198292160403072956551316711112583208628631938582289398771945991475374039705003188616691712 := by
  simp only [firstCenterIntegerGrade049Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade049Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
