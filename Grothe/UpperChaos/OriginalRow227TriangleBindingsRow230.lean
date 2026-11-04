import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow230

theorem block2084_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 230 (229 + i.val) = some (values2084[i.val]'(by rw [values2084_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row230_lookup _).trans (OriginalRow227TriangleLookupRow230.block2084_lookup i)

theorem block2084_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 230 (229 + i.val) = (values2084[i.val]'(by rw [values2084_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2084_lookup i)

theorem block2085_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 230 (261 + i.val) = some (values2085[i.val]'(by rw [values2085_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row230_lookup _).trans (OriginalRow227TriangleLookupRow230.block2085_lookup i)

theorem block2085_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 230 (261 + i.val) = (values2085[i.val]'(by rw [values2085_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2085_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230.block2084_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230.block2084_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230.block2085_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230.block2085_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230
