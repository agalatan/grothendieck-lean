import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow226

theorem block2076_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 226 (225 + i.val) = some (values2076[i.val]'(by rw [values2076_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row226_lookup _).trans (OriginalRow227TriangleLookupRow226.block2076_lookup i)

theorem block2076_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 226 (225 + i.val) = (values2076[i.val]'(by rw [values2076_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2076_lookup i)

theorem block2077_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 226 (257 + i.val) = some (values2077[i.val]'(by rw [values2077_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row226_lookup _).trans (OriginalRow227TriangleLookupRow226.block2077_lookup i)

theorem block2077_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 226 (257 + i.val) = (values2077[i.val]'(by rw [values2077_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2077_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226.block2076_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226.block2076_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226.block2077_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226.block2077_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226
