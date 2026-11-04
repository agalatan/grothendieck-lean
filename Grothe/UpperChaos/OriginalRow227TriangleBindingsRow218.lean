import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow218

theorem block2058_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 218 (217 + i.val) = some (values2058[i.val]'(by rw [values2058_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row218_lookup _).trans (OriginalRow227TriangleLookupRow218.block2058_lookup i)

theorem block2058_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 218 (217 + i.val) = (values2058[i.val]'(by rw [values2058_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2058_lookup i)

theorem block2059_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 218 (249 + i.val) = some (values2059[i.val]'(by rw [values2059_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row218_lookup _).trans (OriginalRow227TriangleLookupRow218.block2059_lookup i)

theorem block2059_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 218 (249 + i.val) = (values2059[i.val]'(by rw [values2059_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2059_lookup i)

theorem block2060_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 218 (281 + i.val) = some (values2060[i.val]'(by rw [values2060_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row218_lookup _).trans (OriginalRow227TriangleLookupRow218.block2060_lookup i)

theorem block2060_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 218 (281 + i.val) = (values2060[i.val]'(by rw [values2060_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2060_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218.block2058_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218.block2058_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218.block2059_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218.block2059_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218.block2060_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218.block2060_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218
