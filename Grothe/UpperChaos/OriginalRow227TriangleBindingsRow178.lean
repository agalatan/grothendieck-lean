import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow178

theorem block1902_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 178 (177 + i.val) = some (values1902[i.val]'(by rw [values1902_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row178_lookup _).trans (OriginalRow227TriangleLookupRow178.block1902_lookup i)

theorem block1902_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 178 (177 + i.val) = (values1902[i.val]'(by rw [values1902_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1902_lookup i)

theorem block1903_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 178 (209 + i.val) = some (values1903[i.val]'(by rw [values1903_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row178_lookup _).trans (OriginalRow227TriangleLookupRow178.block1903_lookup i)

theorem block1903_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 178 (209 + i.val) = (values1903[i.val]'(by rw [values1903_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1903_lookup i)

theorem block1904_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 178 (241 + i.val) = some (values1904[i.val]'(by rw [values1904_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row178_lookup _).trans (OriginalRow227TriangleLookupRow178.block1904_lookup i)

theorem block1904_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 178 (241 + i.val) = (values1904[i.val]'(by rw [values1904_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1904_lookup i)

theorem block1905_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 178 (273 + i.val) = some (values1905[i.val]'(by rw [values1905_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row178_lookup _).trans (OriginalRow227TriangleLookupRow178.block1905_lookup i)

theorem block1905_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 178 (273 + i.val) = (values1905[i.val]'(by rw [values1905_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1905_lookup i)

theorem block1906_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 178 (305 + i.val) = some (values1906[i.val]'(by rw [values1906_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row178_lookup _).trans (OriginalRow227TriangleLookupRow178.block1906_lookup i)

theorem block1906_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 178 (305 + i.val) = (values1906[i.val]'(by rw [values1906_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1906_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1902_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1902_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1903_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1903_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1904_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1904_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1905_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1905_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1906_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178.block1906_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178
