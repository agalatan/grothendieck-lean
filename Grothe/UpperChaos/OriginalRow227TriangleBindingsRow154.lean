import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow154

theorem block1762_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 154 (153 + i.val) = some (values1762[i.val]'(by rw [values1762_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1762_lookup i)

theorem block1762_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 154 (153 + i.val) = (values1762[i.val]'(by rw [values1762_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1762_lookup i)

theorem block1763_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 154 (185 + i.val) = some (values1763[i.val]'(by rw [values1763_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1763_lookup i)

theorem block1763_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 154 (185 + i.val) = (values1763[i.val]'(by rw [values1763_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1763_lookup i)

theorem block1764_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 154 (217 + i.val) = some (values1764[i.val]'(by rw [values1764_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1764_lookup i)

theorem block1764_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 154 (217 + i.val) = (values1764[i.val]'(by rw [values1764_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1764_lookup i)

theorem block1765_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 154 (249 + i.val) = some (values1765[i.val]'(by rw [values1765_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1765_lookup i)

theorem block1765_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 154 (249 + i.val) = (values1765[i.val]'(by rw [values1765_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1765_lookup i)

theorem block1766_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 154 (281 + i.val) = some (values1766[i.val]'(by rw [values1766_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1766_lookup i)

theorem block1766_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 154 (281 + i.val) = (values1766[i.val]'(by rw [values1766_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1766_lookup i)

theorem block1767_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 154 (313 + i.val) = some (values1767[i.val]'(by rw [values1767_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1767_lookup i)

theorem block1767_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 154 (313 + i.val) = (values1767[i.val]'(by rw [values1767_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1767_lookup i)

theorem block1768_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 154 (345 + i.val) = some (values1768[i.val]'(by rw [values1768_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row154_lookup _).trans (OriginalRow227TriangleLookupRow154.block1768_lookup i)

theorem block1768_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 154 (345 + i.val) = (values1768[i.val]'(by rw [values1768_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1768_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1762_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1762_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1763_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1763_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1764_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1764_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1765_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1765_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1766_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1766_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1767_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1767_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1768_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154.block1768_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154
