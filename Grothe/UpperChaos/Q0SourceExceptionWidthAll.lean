import Grothe.UpperChaos.Q0SourceExceptionWidthCheck0
import Grothe.UpperChaos.Q0SourceExceptionWidthCheck1
import Grothe.UpperChaos.Q0SourceExceptionWidthCheck2
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact total width of all three whole-panel exceptions.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionWidthAll

open Grothe.UpperChaos.Q0SourceExceptionWidth

theorem total_width_lt : totalWidth < (8 : ℚ) / 10^16 := by
  have h0 := Q0SourceExceptionWidthCheck0.checked
  have h1 := Q0SourceExceptionWidthCheck1.checked
  have h2 := Q0SourceExceptionWidthCheck2.checked
  unfold totalWidth
  linarith

end Grothe.UpperChaos.Q0SourceExceptionWidthAll

open Lean Elab Command
run_cmd do
  let dependencies ← Lean.collectAxioms
    ``Grothe.UpperChaos.Q0SourceExceptionWidthAll.total_width_lt
  for dependency in dependencies do
    unless (#[`propext, `Classical.choice, `Quot.sound] : Array Name).contains dependency do
      throwError m!"source exception width uses unexpected axiom {dependency}"
