import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow242

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow242

theorem block2102_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 242 (241 + i.val) = some (values2102[i.val]'(by rw [values2102_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row242_lookup _).trans (OriginalRow227TriangleLookupRow242.block2102_lookup i)

theorem block2102_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 242 (241 + i.val) = (values2102[i.val]'(by rw [values2102_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2102_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow242.block2102_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow242.block2102_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow242
