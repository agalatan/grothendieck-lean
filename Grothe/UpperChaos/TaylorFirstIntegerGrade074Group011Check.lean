import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part05632 = 3621749159063842350589345589344695921507858788452327229627531871332356125690578228308654183645177238781952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part05696.size = 4 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part05696 = 17683653347493360678398719232872220153402809674312376173866922429964024942128572418626097720796460875776 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group011.size = 68 := by
  simp only [firstCenterIntegerGrade074Group011, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade074Group011 = 3639432812411335711267744308577568141661261598126639605801398793762320150632706800727280281365973699657728 := by
  simp only [firstCenterIntegerGrade074Group011, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
