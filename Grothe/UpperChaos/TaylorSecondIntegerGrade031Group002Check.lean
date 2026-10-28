import Grothe.UpperChaos.TaylorSecondIntegerGrade031Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade031Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade031Part01024.size = 32 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade031Part01024 = 4328204584575273872653192990341186176165516955478044580354387800969173357844713500899686020681138754360967168 := by decide +kernel

theorem group_length : secondCenterIntegerGrade031Group002.size = 32 := by
  simp only [secondCenterIntegerGrade031Group002, len0]

theorem group_energy : energy secondCenterIntegerGrade031Group002 = 4328204584575273872653192990341186176165516955478044580354387800969173357844713500899686020681138754360967168 := by
  simp only [secondCenterIntegerGrade031Group002, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade031Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade031Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade031Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
