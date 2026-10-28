import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part06656 = 10036470503036331736313238827850775632619980847432968991373981340402685200686309277236763803524369433493504 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part06720 = 2043173024843639314197748412512098666498581189678745163772763013496608225414556246598054266700454856491008 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part06784 = 9980159686918677020534694400655452388483225352062286052734131222587708979351682581368030506617326234763264 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part06848 = 9389376322739044139148280950372329244934491712923853639150153134592747055408623821519992552132095160352768 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part06912 = 16812572613228202060971057540362737579591943940640360068017385373397924257197374200938665397914505763094528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part06976 = 1317880899877617997050191641887550058682264949814640246333398756282825505096843024952328989790282606182400 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part07040 = 18859278938434432395563606812195403337472138763347119579616792558492603084091362525698315570118494536073216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part07104 = 13563578040804140844105962984453134487610509765919679834706991827891405710190660279802335622201107843907584 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group013.size = 512 := by
  simp only [firstCenterIntegerGrade084Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group013 = 82002490029882085507884781570289481395893136521819653575705597227144508017437411958114486708998636434358272 := by
  simp only [firstCenterIntegerGrade084Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
