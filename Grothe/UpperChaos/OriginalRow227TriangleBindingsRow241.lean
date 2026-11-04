import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow241

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow241

theorem block2101_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 241 (240 + i.val) = some (values2101[i.val]'(by rw [values2101_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row241_lookup _).trans (OriginalRow227TriangleLookupRow241.block2101_lookup i)

theorem block2101_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 241 (240 + i.val) = (values2101[i.val]'(by rw [values2101_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2101_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow241.block2101_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow241.block2101_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow241
