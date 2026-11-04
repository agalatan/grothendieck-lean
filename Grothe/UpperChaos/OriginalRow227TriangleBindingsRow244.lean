import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow244

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow244

theorem block2104_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 244 (243 + i.val) = some (values2104[i.val]'(by rw [values2104_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row244_lookup _).trans (OriginalRow227TriangleLookupRow244.block2104_lookup i)

theorem block2104_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 244 (243 + i.val) = (values2104[i.val]'(by rw [values2104_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2104_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow244.block2104_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow244.block2104_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow244
