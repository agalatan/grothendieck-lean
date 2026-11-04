import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow221

theorem block2066_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 221 (220 + i.val) = some (values2066[i.val]'(by rw [values2066_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row221_lookup _).trans (OriginalRow227TriangleLookupRow221.block2066_lookup i)

theorem block2066_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 221 (220 + i.val) = (values2066[i.val]'(by rw [values2066_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2066_lookup i)

theorem block2067_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 221 (252 + i.val) = some (values2067[i.val]'(by rw [values2067_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row221_lookup _).trans (OriginalRow227TriangleLookupRow221.block2067_lookup i)

theorem block2067_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 221 (252 + i.val) = (values2067[i.val]'(by rw [values2067_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2067_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221.block2066_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221.block2066_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221.block2067_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221.block2067_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221
