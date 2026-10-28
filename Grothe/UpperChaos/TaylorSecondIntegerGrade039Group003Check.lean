import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade039Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade039Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade039Part01536 = 781858268264592654916156320436796194419889910022093138099665029286068151281998185776002060663124696208769024 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade039Part01600.size = 40 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade039Part01600 = 400490862266501743485238317059887080490701210488350078496310821328054616424169184837883723217679890327273472 := by decide +kernel

theorem group_length : secondCenterIntegerGrade039Group003.size = 104 := by
  simp only [secondCenterIntegerGrade039Group003, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade039Group003 = 1182349130531094398401394637496683274910591120510443216595975850614122767706167370613885783880804586536042496 := by
  simp only [secondCenterIntegerGrade039Group003, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade039Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
