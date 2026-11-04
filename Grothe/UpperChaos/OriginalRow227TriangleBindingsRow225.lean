import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow225

theorem block2074_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 225 (224 + i.val) = some (values2074[i.val]'(by rw [values2074_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row225_lookup _).trans (OriginalRow227TriangleLookupRow225.block2074_lookup i)

theorem block2074_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 225 (224 + i.val) = (values2074[i.val]'(by rw [values2074_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2074_lookup i)

theorem block2075_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 225 (256 + i.val) = some (values2075[i.val]'(by rw [values2075_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row225_lookup _).trans (OriginalRow227TriangleLookupRow225.block2075_lookup i)

theorem block2075_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 225 (256 + i.val) = (values2075[i.val]'(by rw [values2075_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2075_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225.block2074_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225.block2074_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225.block2075_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225.block2075_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225
