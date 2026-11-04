import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow243

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow243

theorem block2103_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 243 (242 + i.val) = some (values2103[i.val]'(by rw [values2103_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row243_lookup _).trans (OriginalRow227TriangleLookupRow243.block2103_lookup i)

theorem block2103_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 243 (242 + i.val) = (values2103[i.val]'(by rw [values2103_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2103_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow243.block2103_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow243.block2103_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow243
