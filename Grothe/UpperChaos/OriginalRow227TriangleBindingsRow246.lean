import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow246

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow246

theorem block2106_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 246 (245 + i.val) = some (values2106[i.val]'(by rw [values2106_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row246_lookup _).trans (OriginalRow227TriangleLookupRow246.block2106_lookup i)

theorem block2106_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 246 (245 + i.val) = (values2106[i.val]'(by rw [values2106_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2106_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow246.block2106_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow246.block2106_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow246
