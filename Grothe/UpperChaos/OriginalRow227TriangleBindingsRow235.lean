import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow235

theorem block2094_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 235 (234 + i.val) = some (values2094[i.val]'(by rw [values2094_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row235_lookup _).trans (OriginalRow227TriangleLookupRow235.block2094_lookup i)

theorem block2094_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 235 (234 + i.val) = (values2094[i.val]'(by rw [values2094_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2094_lookup i)

theorem block2095_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 235 (266 + i.val) = some (values2095[i.val]'(by rw [values2095_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row235_lookup _).trans (OriginalRow227TriangleLookupRow235.block2095_lookup i)

theorem block2095_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 235 (266 + i.val) = (values2095[i.val]'(by rw [values2095_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2095_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235.block2094_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235.block2094_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235.block2095_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235.block2095_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235
