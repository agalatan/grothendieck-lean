import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow240

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow240

theorem block2100_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 240 (239 + i.val) = some (values2100[i.val]'(by rw [values2100_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row240_lookup _).trans (OriginalRow227TriangleLookupRow240.block2100_lookup i)

theorem block2100_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 240 (239 + i.val) = (values2100[i.val]'(by rw [values2100_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2100_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow240.block2100_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow240.block2100_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow240
