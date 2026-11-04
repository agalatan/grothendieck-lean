import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow251

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow251

theorem block2111_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 251 (250 + i.val) = some (values2111[i.val]'(by rw [values2111_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row251_lookup _).trans (OriginalRow227TriangleLookupRow251.block2111_lookup i)

theorem block2111_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 251 (250 + i.val) = (values2111[i.val]'(by rw [values2111_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2111_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow251.block2111_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow251.block2111_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow251
