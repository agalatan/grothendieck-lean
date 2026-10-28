import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part04608 = 78342557772069995601454872250097996265604069588310297939975084230797993418582330596405782793595598860713984 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part04672 = 1993423605178832340691915647264560451460702490772530696891089162165257172787844042207502859879127434919936 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part04736 = 63929319770447338445898004856169791936473259011198052594729361782441627104364050531653473164130395340406784 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part04800 = 52756184421585663320186754260297093382582504413941795221680081333764849559437091279325913139918000881664000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part04864 = 22855549186836583427401827964109545808107637730250645017788846482955226984231926180919259442376508958572544 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part04928 = 23506608413209419028275155475371610264183755998893727973691970797629853767031053524245438006447657380216832 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part04992 = 42746905114111575594617254278493524136431632944912325921584704497329304330725982793384734283996789144027136 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part05056 = 40236007874326602522615401538688348758660485346873629525563584691594815675375821521940592012675844426170368 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group009.size = 512 := by
  simp only [firstCenterIntegerGrade086Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group009 = 326366556157766010281141186270492471003504047525153004891904722978678928012536100470082695703019922426691584 := by
  simp only [firstCenterIntegerGrade086Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
