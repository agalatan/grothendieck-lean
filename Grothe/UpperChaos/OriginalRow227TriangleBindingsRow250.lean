import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow250

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow250

theorem block2110_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 250 (249 + i.val) = some (values2110[i.val]'(by rw [values2110_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row250_lookup _).trans (OriginalRow227TriangleLookupRow250.block2110_lookup i)

theorem block2110_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 250 (249 + i.val) = (values2110[i.val]'(by rw [values2110_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2110_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow250.block2110_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow250.block2110_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow250
