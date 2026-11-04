import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow181

theorem block1917_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 181 (180 + i.val) = some (values1917[i.val]'(by rw [values1917_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row181_lookup _).trans (OriginalRow227TriangleLookupRow181.block1917_lookup i)

theorem block1917_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 181 (180 + i.val) = (values1917[i.val]'(by rw [values1917_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1917_lookup i)

theorem block1918_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 181 (212 + i.val) = some (values1918[i.val]'(by rw [values1918_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row181_lookup _).trans (OriginalRow227TriangleLookupRow181.block1918_lookup i)

theorem block1918_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 181 (212 + i.val) = (values1918[i.val]'(by rw [values1918_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1918_lookup i)

theorem block1919_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 181 (244 + i.val) = some (values1919[i.val]'(by rw [values1919_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row181_lookup _).trans (OriginalRow227TriangleLookupRow181.block1919_lookup i)

theorem block1919_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 181 (244 + i.val) = (values1919[i.val]'(by rw [values1919_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1919_lookup i)

theorem block1920_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 181 (276 + i.val) = some (values1920[i.val]'(by rw [values1920_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row181_lookup _).trans (OriginalRow227TriangleLookupRow181.block1920_lookup i)

theorem block1920_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 181 (276 + i.val) = (values1920[i.val]'(by rw [values1920_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1920_lookup i)

theorem block1921_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 181 (308 + i.val) = some (values1921[i.val]'(by rw [values1921_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row181_lookup _).trans (OriginalRow227TriangleLookupRow181.block1921_lookup i)

theorem block1921_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 181 (308 + i.val) = (values1921[i.val]'(by rw [values1921_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1921_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1917_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1917_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1918_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1918_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1919_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1919_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1920_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1920_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1921_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181.block1921_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181
