import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow239

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow239

theorem block2099_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 239 (238 + i.val) = some (values2099[i.val]'(by rw [values2099_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row239_lookup _).trans (OriginalRow227TriangleLookupRow239.block2099_lookup i)

theorem block2099_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 239 (238 + i.val) = (values2099[i.val]'(by rw [values2099_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2099_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow239.block2099_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow239.block2099_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow239
