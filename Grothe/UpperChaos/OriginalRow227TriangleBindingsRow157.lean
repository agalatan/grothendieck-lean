import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow157

theorem block1782_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 157 (156 + i.val) = some (values1782[i.val]'(by rw [values1782_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row157_lookup _).trans (OriginalRow227TriangleLookupRow157.block1782_lookup i)

theorem block1782_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 157 (156 + i.val) = (values1782[i.val]'(by rw [values1782_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1782_lookup i)

theorem block1783_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 157 (188 + i.val) = some (values1783[i.val]'(by rw [values1783_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row157_lookup _).trans (OriginalRow227TriangleLookupRow157.block1783_lookup i)

theorem block1783_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 157 (188 + i.val) = (values1783[i.val]'(by rw [values1783_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1783_lookup i)

theorem block1784_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 157 (220 + i.val) = some (values1784[i.val]'(by rw [values1784_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row157_lookup _).trans (OriginalRow227TriangleLookupRow157.block1784_lookup i)

theorem block1784_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 157 (220 + i.val) = (values1784[i.val]'(by rw [values1784_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1784_lookup i)

theorem block1785_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 157 (252 + i.val) = some (values1785[i.val]'(by rw [values1785_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row157_lookup _).trans (OriginalRow227TriangleLookupRow157.block1785_lookup i)

theorem block1785_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 157 (252 + i.val) = (values1785[i.val]'(by rw [values1785_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1785_lookup i)

theorem block1786_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 157 (284 + i.val) = some (values1786[i.val]'(by rw [values1786_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row157_lookup _).trans (OriginalRow227TriangleLookupRow157.block1786_lookup i)

theorem block1786_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 157 (284 + i.val) = (values1786[i.val]'(by rw [values1786_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1786_lookup i)

theorem block1787_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 157 (316 + i.val) = some (values1787[i.val]'(by rw [values1787_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row157_lookup _).trans (OriginalRow227TriangleLookupRow157.block1787_lookup i)

theorem block1787_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 157 (316 + i.val) = (values1787[i.val]'(by rw [values1787_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1787_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1782_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1782_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1783_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1783_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1784_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1784_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1785_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1785_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1786_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1786_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1787_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157.block1787_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157
