import Grothe.UpperChaos.TaylorFirstIntegerGrade023Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade023Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade023Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade023Part00512 = 1340305235585135675537912624178034640358824748180195614448710945301757902084564202790246468525129868178471518208 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade023Part00576.size = 24 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade023Part00576 = 171974183995893318918367349406808902437105702976194748009979591189781304408062101999675977314369044386097922048 := by decide +kernel

theorem group_length : firstCenterIntegerGrade023Group001.size = 88 := by
  simp only [firstCenterIntegerGrade023Group001, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade023Group001 = 1512279419581028994456279973584843542795930451156390362458690536491539206492626304789922445839498912564569440256 := by
  simp only [firstCenterIntegerGrade023Group001, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade023Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade023Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade023Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
