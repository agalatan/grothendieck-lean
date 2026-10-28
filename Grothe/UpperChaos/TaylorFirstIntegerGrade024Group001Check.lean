import Grothe.UpperChaos.TaylorFirstIntegerGrade024Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade024Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade024Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade024Part00512 = 1561683695674087464716400885129935041783529467071858335622248334423199178003674164996400758372577342802840518656 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade024Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade024Part00576 = 580116122253557228200102582703757983784829597945432614142636510310834591560604077705442879743878642409039462400 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade024Part00640.size = 10 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade024Part00640 = 133321704633814947916175169518114556913640898776260403578481635279585908440459079455499190248827938791336443904 := by decide +kernel

theorem group_length : firstCenterIntegerGrade024Group001.size = 138 := by
  simp only [firstCenterIntegerGrade024Group001, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade024Group001 = 2275121522561459640832678637351807582481999963793551353343366480013619678004737322157342828365283924003216424960 := by
  simp only [firstCenterIntegerGrade024Group001, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade024Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade024Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade024Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
