import Grothe.UpperChaos.TaylorSecondIntegerGrade008Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade008Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade008Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade008Part00000 = 210249301483440351358412012846211706244752459649149062245470702143535283737004245653153846559173524187765329100800 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade008Part00064.size = 26 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade008Part00064 = 612062680801172810779409388092363175809864610507428460324256502319724730744952598040644644553264361046456401920 := by decide +kernel

theorem group_length : secondCenterIntegerGrade008Group000.size = 90 := by
  simp only [secondCenterIntegerGrade008Group000, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade008Group000 = 210861364164241524169191422234304069420562324259656490705794958645855008467749198251194491203726788548811785502720 := by
  simp only [secondCenterIntegerGrade008Group000, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade008Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade008Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade008Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
