import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part06144.size = 18 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part06144 = 1679965873192829166570362235123179994291154314344089137806413227033799036886918215009118280801733562073088 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group012.size = 18 := by
  simp only [firstCenterIntegerGrade077Group012, len0]

theorem group_energy : energy firstCenterIntegerGrade077Group012 = 1679965873192829166570362235123179994291154314344089137806413227033799036886918215009118280801733562073088 := by
  simp only [firstCenterIntegerGrade077Group012, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
