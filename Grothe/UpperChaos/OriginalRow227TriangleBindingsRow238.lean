import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow238

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow238

theorem block2098_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 238 (237 + i.val) = some (values2098[i.val]'(by rw [values2098_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row238_lookup _).trans (OriginalRow227TriangleLookupRow238.block2098_lookup i)

theorem block2098_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 238 (237 + i.val) = (values2098[i.val]'(by rw [values2098_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2098_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow238.block2098_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow238.block2098_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow238
