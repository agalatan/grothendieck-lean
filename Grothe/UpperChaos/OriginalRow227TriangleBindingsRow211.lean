import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow211

theorem block2037_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 211 (210 + i.val) = some (values2037[i.val]'(by rw [values2037_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row211_lookup _).trans (OriginalRow227TriangleLookupRow211.block2037_lookup i)

theorem block2037_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 211 (210 + i.val) = (values2037[i.val]'(by rw [values2037_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2037_lookup i)

theorem block2038_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 211 (242 + i.val) = some (values2038[i.val]'(by rw [values2038_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row211_lookup _).trans (OriginalRow227TriangleLookupRow211.block2038_lookup i)

theorem block2038_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 211 (242 + i.val) = (values2038[i.val]'(by rw [values2038_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2038_lookup i)

theorem block2039_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 211 (274 + i.val) = some (values2039[i.val]'(by rw [values2039_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row211_lookup _).trans (OriginalRow227TriangleLookupRow211.block2039_lookup i)

theorem block2039_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 211 (274 + i.val) = (values2039[i.val]'(by rw [values2039_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2039_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211.block2037_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211.block2037_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211.block2038_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211.block2038_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211.block2039_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211.block2039_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211
