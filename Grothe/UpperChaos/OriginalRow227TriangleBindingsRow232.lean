import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow232

theorem block2088_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 232 (231 + i.val) = some (values2088[i.val]'(by rw [values2088_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row232_lookup _).trans (OriginalRow227TriangleLookupRow232.block2088_lookup i)

theorem block2088_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 232 (231 + i.val) = (values2088[i.val]'(by rw [values2088_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2088_lookup i)

theorem block2089_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 232 (263 + i.val) = some (values2089[i.val]'(by rw [values2089_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row232_lookup _).trans (OriginalRow227TriangleLookupRow232.block2089_lookup i)

theorem block2089_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 232 (263 + i.val) = (values2089[i.val]'(by rw [values2089_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2089_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232.block2088_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232.block2088_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232.block2089_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232.block2089_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232
