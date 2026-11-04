import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow228

theorem block2080_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 228 (227 + i.val) = some (values2080[i.val]'(by rw [values2080_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row228_lookup _).trans (OriginalRow227TriangleLookupRow228.block2080_lookup i)

theorem block2080_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 228 (227 + i.val) = (values2080[i.val]'(by rw [values2080_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2080_lookup i)

theorem block2081_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 228 (259 + i.val) = some (values2081[i.val]'(by rw [values2081_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row228_lookup _).trans (OriginalRow227TriangleLookupRow228.block2081_lookup i)

theorem block2081_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 228 (259 + i.val) = (values2081[i.val]'(by rw [values2081_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2081_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228.block2080_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228.block2080_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228.block2081_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228.block2081_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228
