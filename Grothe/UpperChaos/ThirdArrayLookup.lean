import Grothe.UpperChaos.PackedDyadic
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Source-array lookup from a complete integer prefix, grade and suffix.
The source-array equality and exact offsets remain explicit. -/
namespace Grothe.UpperChaos.ThirdArrayLookup

theorem middle_get (pre mid suffix : List ℤ) (k : ℕ) (hk : k < mid.length) :
    ((pre ++ mid ++ suffix).toArray)[pre.length + k]?.getD 0 = mid[k]?.getD 0 := by
  simp only [List.getElem?_toArray, List.append_assoc]
  rw [List.getElem?_append_right (Nat.le_add_right _ _), Nat.add_sub_cancel_left]
  rw [List.getElem?_append_left hk]

open Lean Elab Command
run_cmd do
  let target := ``middle_get
  let axs ← Lean.collectAxioms target
  logInfo m!"Audit {target}: {axs}"
  for ax in axs do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"unexpected axiom {ax}"
end Grothe.UpperChaos.ThirdArrayLookup
