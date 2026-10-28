import Grothe.UpperChaos.TaylorSecondIntegerGrade012Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade012Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade012Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade012Part00000 = 29051573129255693326929602291691190368037524166056502941668796736371793471048331933411296680524527120142879948800 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade012Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade012Part00064 = 2651174698003719468191490177983654835364766333970626579603100014606352302901098942394403632678147417880741806080 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade012Part00128.size = 54 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade012Part00128 = 549115013230784579575603310466893270716094739426321202558337632802515665068562561395161851460417765995775524864 := by decide +kernel

theorem group_length : secondCenterIntegerGrade012Group000.size = 182 := by
  simp only [secondCenterIntegerGrade012Group000, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade012Group000 = 32251862840490197374696695780141738474118385239453450723830234383780661439017993437200862164663092304019397279744 := by
  simp only [secondCenterIntegerGrade012Group000, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade012Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade012Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade012Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
