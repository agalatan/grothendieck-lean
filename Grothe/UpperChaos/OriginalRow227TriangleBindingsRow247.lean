import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow247

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow247

theorem block2107_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 247 (246 + i.val) = some (values2107[i.val]'(by rw [values2107_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row247_lookup _).trans (OriginalRow227TriangleLookupRow247.block2107_lookup i)

theorem block2107_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 247 (246 + i.val) = (values2107[i.val]'(by rw [values2107_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2107_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow247.block2107_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow247.block2107_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow247
