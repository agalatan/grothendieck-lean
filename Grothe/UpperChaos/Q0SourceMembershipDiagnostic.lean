import Grothe.UpperChaos.Q0SourceExceptionIndex
import Lean.Elab.GuardMsgs

/-! Temporary isolated elaborator diagnostic for PR263. No production module
imports this file. Remove this diagnostic before requesting landing.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceMembershipDiagnostic

open Q0GaussOrdinalEquiv Q0SourceExceptionGeometry

noncomputable def diagnosticRegularNodes : Finset Address := by
  classical
  exact Finset.univ.filter fun a => ¬ exceptionalPanel a.1.val

-- Even an identity exposes the concrete enumeration through the hypothesis.
-- Check the expected failure without adding it to any production proof.
/-- error: maximum recursion depth has been reached -/
#guard_msgs (substring := true) in
example (a : Address) (ha : a ∈ diagnosticRegularNodes) :
    a ∈ diagnosticRegularNodes := by
  exact ha

end Grothe.UpperChaos.Q0SourceMembershipDiagnostic
