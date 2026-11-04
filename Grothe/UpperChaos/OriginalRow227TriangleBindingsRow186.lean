import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow186

theorem block1942_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 186 (185 + i.val) = some (values1942[i.val]'(by rw [values1942_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row186_lookup _).trans (OriginalRow227TriangleLookupRow186.block1942_lookup i)

theorem block1942_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 186 (185 + i.val) = (values1942[i.val]'(by rw [values1942_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1942_lookup i)

theorem block1943_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 186 (217 + i.val) = some (values1943[i.val]'(by rw [values1943_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row186_lookup _).trans (OriginalRow227TriangleLookupRow186.block1943_lookup i)

theorem block1943_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 186 (217 + i.val) = (values1943[i.val]'(by rw [values1943_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1943_lookup i)

theorem block1944_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 186 (249 + i.val) = some (values1944[i.val]'(by rw [values1944_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row186_lookup _).trans (OriginalRow227TriangleLookupRow186.block1944_lookup i)

theorem block1944_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 186 (249 + i.val) = (values1944[i.val]'(by rw [values1944_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1944_lookup i)

theorem block1945_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 186 (281 + i.val) = some (values1945[i.val]'(by rw [values1945_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row186_lookup _).trans (OriginalRow227TriangleLookupRow186.block1945_lookup i)

theorem block1945_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 186 (281 + i.val) = (values1945[i.val]'(by rw [values1945_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1945_lookup i)

theorem block1946_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 186 (313 + i.val) = some (values1946[i.val]'(by rw [values1946_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row186_lookup _).trans (OriginalRow227TriangleLookupRow186.block1946_lookup i)

theorem block1946_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 186 (313 + i.val) = (values1946[i.val]'(by rw [values1946_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1946_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1942_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1942_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1943_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1943_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1944_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1944_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1945_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1945_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1946_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186.block1946_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186
