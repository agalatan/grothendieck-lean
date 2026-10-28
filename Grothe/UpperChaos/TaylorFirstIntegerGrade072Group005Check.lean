import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part02560 = 34497381148366507427081595991823672887694229357939639079936556859248670769849877835355303259321757942786555904 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part02624 = 26643177117548380036895635407324740024536776547434496210199339810292338884072622340644556278604579955030360064 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part02688 = 20228154849014783190727534154022328090894252638852910818118811704777094848028550992158933815722505445268520960 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part02752 = 14688313527680210111310491748441149578656157010542094476779856314569087719303146245849925777462079142055903232 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part02816 = 334068798730102055111755774555630134591675497998208120273110882395175291672992263729022446529896535480598528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part02880 = 10845635007700577552460090464552405658877179364977317789707532447956517244268156696620799750208862172647260160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part02944 = 7692872370852636791151461805590971869135430126483700927857127599605492563398074000034901274585486971482669056 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part03008 = 5375991582546902903095715659224601237049715604433562072019935652392090368461801933204980059910840750079737856 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group005.size = 512 := by
  simp only [firstCenterIntegerGrade072Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group005 = 120305594402440100067834281005535499481435416148661929494892271271236467689055222307598422662346008914831605760 := by
  simp only [firstCenterIntegerGrade072Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
