import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part02048 = 148089907352497508569910636757010162680228210201273387100065133493671406318898479098964362368437933891097985024 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part02112 = 32962411093101105141819157447873933037947484554852556770422813864706834464110131139260597807923606976940998656 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part02176 = 83007712710637248686574405543574242499303770924389223170796696917855528502659552630737384470428424865975369728 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part02240 = 89058364631944963206471288083725591325917089725148825663030570951493952159792491221177769103259862205462478848 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part02304 = 67867931709022336207031339451814241160543251820862862089064458805457600423161293506992667599431479220370407424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part02368 = 50890722833746586988494408870405524214957120741844578611063587116610143512064022980048585496634205909574221824 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part02432 = 37564087263220233283087193466894820082418684805274998819391863346792795446680192076778822954055926973378592768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part02496 = 27309952415065110979398514510132796952384665749265370383642283787084466439533115405265734476028346290271158272 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group004.size = 512 := by
  simp only [firstCenterIntegerGrade066Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group004 = 536751090009235093062786944131431311953700278522911802607477408283672727266899278059225924276199786333071212544 := by
  simp only [firstCenterIntegerGrade066Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
