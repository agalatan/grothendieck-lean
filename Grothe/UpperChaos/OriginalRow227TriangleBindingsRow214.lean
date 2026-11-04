import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow214

theorem block2046_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 214 (213 + i.val) = some (values2046[i.val]'(by rw [values2046_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row214_lookup _).trans (OriginalRow227TriangleLookupRow214.block2046_lookup i)

theorem block2046_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 214 (213 + i.val) = (values2046[i.val]'(by rw [values2046_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2046_lookup i)

theorem block2047_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 214 (245 + i.val) = some (values2047[i.val]'(by rw [values2047_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row214_lookup _).trans (OriginalRow227TriangleLookupRow214.block2047_lookup i)

theorem block2047_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 214 (245 + i.val) = (values2047[i.val]'(by rw [values2047_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2047_lookup i)

theorem block2048_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 214 (277 + i.val) = some (values2048[i.val]'(by rw [values2048_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row214_lookup _).trans (OriginalRow227TriangleLookupRow214.block2048_lookup i)

theorem block2048_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 214 (277 + i.val) = (values2048[i.val]'(by rw [values2048_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2048_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214.block2046_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214.block2046_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214.block2047_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214.block2047_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214.block2048_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214.block2048_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214
