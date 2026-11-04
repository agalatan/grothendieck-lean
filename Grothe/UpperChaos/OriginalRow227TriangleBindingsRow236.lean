import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow236

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow236

theorem block2096_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 236 (235 + i.val) = some (values2096[i.val]'(by rw [values2096_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row236_lookup _).trans (OriginalRow227TriangleLookupRow236.block2096_lookup i)

theorem block2096_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 236 (235 + i.val) = (values2096[i.val]'(by rw [values2096_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2096_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow236.block2096_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow236.block2096_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow236
