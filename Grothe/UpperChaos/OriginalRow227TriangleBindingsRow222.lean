import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow222

theorem block2068_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 222 (221 + i.val) = some (values2068[i.val]'(by rw [values2068_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row222_lookup _).trans (OriginalRow227TriangleLookupRow222.block2068_lookup i)

theorem block2068_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 222 (221 + i.val) = (values2068[i.val]'(by rw [values2068_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2068_lookup i)

theorem block2069_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 222 (253 + i.val) = some (values2069[i.val]'(by rw [values2069_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row222_lookup _).trans (OriginalRow227TriangleLookupRow222.block2069_lookup i)

theorem block2069_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 222 (253 + i.val) = (values2069[i.val]'(by rw [values2069_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2069_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222.block2068_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222.block2068_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222.block2069_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222.block2069_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222
