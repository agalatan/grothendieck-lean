import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow231

theorem block2086_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 231 (230 + i.val) = some (values2086[i.val]'(by rw [values2086_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row231_lookup _).trans (OriginalRow227TriangleLookupRow231.block2086_lookup i)

theorem block2086_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 231 (230 + i.val) = (values2086[i.val]'(by rw [values2086_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2086_lookup i)

theorem block2087_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 231 (262 + i.val) = some (values2087[i.val]'(by rw [values2087_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row231_lookup _).trans (OriginalRow227TriangleLookupRow231.block2087_lookup i)

theorem block2087_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 231 (262 + i.val) = (values2087[i.val]'(by rw [values2087_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2087_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231.block2086_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231.block2086_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231.block2087_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231.block2087_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231
