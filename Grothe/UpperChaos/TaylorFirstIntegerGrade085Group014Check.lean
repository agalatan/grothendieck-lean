import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part07168 = 19273765650370536138741994305238567203353539133005290537950162008778546397824025748305507571056172360269824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part07232 = 2876060434696494168516834515608870106375390344365007881579778976389353558690075315496004015134607795027968 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part07296.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part07296 = 10214077928699295665685833182323410380474689083209978679530256229021256203840286059595894776926846396137472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part07360.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part07360 = 6300247634439326544707472584699190363012928185081197887764841089287620643611449764336776578064259739549696 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part07424.size = 58 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part07424 = 2634230437970749120123068975071496571131985616474118333903768468592769391999603959332647059115504186687488 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group014.size = 314 := by
  simp only [firstCenterIntegerGrade085Group014, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade085Group014 = 41298382086176401637775203562941534624348532362135593320728806772069546195965440847066830000297390477672448 := by
  simp only [firstCenterIntegerGrade085Group014, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
