import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group016Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group016Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part08192.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part08192 = 213630882155590387501293326535703298581008966781033071188157136425493082112646152222804438142976367001600 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part08256.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part08256 = 5208881984977663480630963889340934551743441750742646296960082769429030516056014623434987694993098776470528 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part08320.size = 52 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part08320 = 2308172609433461321311408136271386663742218733672763950901420489569118563628984188261124475829178771439616 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group016.size = 180 := by
  simp only [firstCenterIntegerGrade090Group016, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade090Group016 = 7730685476566715189443665352148024514066669451196443319049660395423642161797644963918916608965253914911744 := by
  simp only [firstCenterIntegerGrade090Group016, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group016Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group016Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group016Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
