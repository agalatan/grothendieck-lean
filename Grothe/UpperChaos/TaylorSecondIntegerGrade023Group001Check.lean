import Grothe.UpperChaos.TaylorSecondIntegerGrade023Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade023Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade023Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade023Part00512 = 123497205703878931354812946380912589495205946417723679700545489146886821969181401057744776266771922366427561984 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade023Part00576.size = 24 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade023Part00576 = 15518420056919924307745793550786408842992331975308017603132945790184753466488501502350812638558754450643615744 := by decide +kernel

theorem group_length : secondCenterIntegerGrade023Group001.size = 88 := by
  simp only [secondCenterIntegerGrade023Group001, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade023Group001 = 139015625760798855662558739931698998338198278393031697303678434937071575435669902560095588905330676817071177728 := by
  simp only [secondCenterIntegerGrade023Group001, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade023Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade023Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade023Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
