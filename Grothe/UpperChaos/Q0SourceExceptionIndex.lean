import Grothe.UpperChaos.Q0GaussSourceAddress
import Mathlib.Tactic

/-! Original exception panels and node ordinals. This finite indexing layer
does not import selected-root or analytic integration proofs.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionGeometry

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv

def exceptionalPanel (i : ℕ) : Prop :=
  (146 ≤ i ∧ i ≤ 274) ∨ (557 ≤ i ∧ i ≤ 684) ∨ (964 ≤ i ∧ i ≤ 1087)

instance (i : ℕ) : Decidable (exceptionalPanel i) := by
  unfold exceptionalPanel
  infer_instance

def exceptionalOrdinal (n : ℕ) : Prop :=
  (3872 ≤ n ∧ n ≤ 4036) ∨ (10910 ≤ n ∧ n ≤ 11037) ∨
    (17321 ≤ n ∧ n ≤ 17444)

instance (n : ℕ) : Decidable (exceptionalOrdinal n) := by
  unfold exceptionalOrdinal
  infer_instance

theorem exceptionalOrdinal_iff_mem (n : ℕ) : exceptionalOrdinal n ↔
    n ∈ List.range' 3872 165 ++ List.range' 10910 128 ++ List.range' 17321 124 := by
  simp only [exceptionalOrdinal, List.mem_append, List.mem_range'_1]
  omega

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
/-- Every original rule index is checked, including panels of order greater
than one. Regular panels require no evaluation of their node ranges. -/
theorem exceptional_source_checked :
    (List.finRange sourcePanels.length).all (fun p =>
      if exceptionalPanel p.val then
        (List.range (sourcePanels.get p).order).all (fun j =>
          decide (exceptionalOrdinal ((sourcePanels.get p).offset + j)))
      else true) = true := by
  decide +kernel

/-- Every actual address on an exceptional panel is represented by a saved
exception ordinal. This is not a claim about a numerical coefficient. -/
theorem source_ordinal_exceptional (a : Address) (ha : exceptionalPanel a.1.val) :
    exceptionalOrdinal (fromAddress a).val := by
  have hp := (List.all_eq_true.mp exceptional_source_checked) a.1
    (List.mem_finRange a.1)
  rw [ite_eq_left ha] at hp
  have hj := (List.all_eq_true.mp hp) a.2.val (List.mem_range.mpr a.2.isLt)
  exact of_decide_eq_true hj

end Grothe.UpperChaos.Q0SourceExceptionGeometry
