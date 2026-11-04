import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow245

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow245

theorem block2105_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 245 (244 + i.val) = some (values2105[i.val]'(by rw [values2105_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row245_lookup _).trans (OriginalRow227TriangleLookupRow245.block2105_lookup i)

theorem block2105_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 245 (244 + i.val) = (values2105[i.val]'(by rw [values2105_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2105_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow245.block2105_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow245.block2105_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow245
