import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow233

theorem block2090_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 233 (232 + i.val) = some (values2090[i.val]'(by rw [values2090_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row233_lookup _).trans (OriginalRow227TriangleLookupRow233.block2090_lookup i)

theorem block2090_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 233 (232 + i.val) = (values2090[i.val]'(by rw [values2090_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2090_lookup i)

theorem block2091_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 233 (264 + i.val) = some (values2091[i.val]'(by rw [values2091_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row233_lookup _).trans (OriginalRow227TriangleLookupRow233.block2091_lookup i)

theorem block2091_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 233 (264 + i.val) = (values2091[i.val]'(by rw [values2091_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2091_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233.block2090_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233.block2090_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233.block2091_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233.block2091_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233
