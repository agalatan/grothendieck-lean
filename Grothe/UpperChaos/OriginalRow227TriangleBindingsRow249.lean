import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow249

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow249

theorem block2109_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 249 (248 + i.val) = some (values2109[i.val]'(by rw [values2109_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row249_lookup _).trans (OriginalRow227TriangleLookupRow249.block2109_lookup i)

theorem block2109_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 249 (248 + i.val) = (values2109[i.val]'(by rw [values2109_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2109_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow249.block2109_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow249.block2109_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow249
