import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow229

theorem block2082_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 229 (228 + i.val) = some (values2082[i.val]'(by rw [values2082_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row229_lookup _).trans (OriginalRow227TriangleLookupRow229.block2082_lookup i)

theorem block2082_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 229 (228 + i.val) = (values2082[i.val]'(by rw [values2082_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2082_lookup i)

theorem block2083_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 229 (260 + i.val) = some (values2083[i.val]'(by rw [values2083_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row229_lookup _).trans (OriginalRow227TriangleLookupRow229.block2083_lookup i)

theorem block2083_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 229 (260 + i.val) = (values2083[i.val]'(by rw [values2083_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2083_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229.block2082_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229.block2082_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229.block2083_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229.block2083_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229
