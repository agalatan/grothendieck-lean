import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow223

theorem block2070_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 223 (222 + i.val) = some (values2070[i.val]'(by rw [values2070_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row223_lookup _).trans (OriginalRow227TriangleLookupRow223.block2070_lookup i)

theorem block2070_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 223 (222 + i.val) = (values2070[i.val]'(by rw [values2070_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2070_lookup i)

theorem block2071_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 223 (254 + i.val) = some (values2071[i.val]'(by rw [values2071_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row223_lookup _).trans (OriginalRow227TriangleLookupRow223.block2071_lookup i)

theorem block2071_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 223 (254 + i.val) = (values2071[i.val]'(by rw [values2071_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2071_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223.block2070_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223.block2070_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223.block2071_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223.block2071_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223
