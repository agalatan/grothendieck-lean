import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow132

theorem block1600_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (131 + i.val) = some (values1600[i.val]'(by rw [values1600_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1600_lookup i)

theorem block1600_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (131 + i.val) = (values1600[i.val]'(by rw [values1600_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1600_lookup i)

theorem block1601_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (163 + i.val) = some (values1601[i.val]'(by rw [values1601_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1601_lookup i)

theorem block1601_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (163 + i.val) = (values1601[i.val]'(by rw [values1601_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1601_lookup i)

theorem block1602_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (195 + i.val) = some (values1602[i.val]'(by rw [values1602_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1602_lookup i)

theorem block1602_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (195 + i.val) = (values1602[i.val]'(by rw [values1602_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1602_lookup i)

theorem block1603_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (227 + i.val) = some (values1603[i.val]'(by rw [values1603_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1603_lookup i)

theorem block1603_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (227 + i.val) = (values1603[i.val]'(by rw [values1603_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1603_lookup i)

theorem block1604_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (259 + i.val) = some (values1604[i.val]'(by rw [values1604_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1604_lookup i)

theorem block1604_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (259 + i.val) = (values1604[i.val]'(by rw [values1604_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1604_lookup i)

theorem block1605_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (291 + i.val) = some (values1605[i.val]'(by rw [values1605_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1605_lookup i)

theorem block1605_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (291 + i.val) = (values1605[i.val]'(by rw [values1605_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1605_lookup i)

theorem block1606_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 132 (323 + i.val) = some (values1606[i.val]'(by rw [values1606_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1606_lookup i)

theorem block1606_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 132 (323 + i.val) = (values1606[i.val]'(by rw [values1606_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1606_lookup i)

theorem block1607_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 132 (355 + i.val) = some (values1607[i.val]'(by rw [values1607_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row132_lookup _).trans (OriginalRow227TriangleLookupRow132.block1607_lookup i)

theorem block1607_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 132 (355 + i.val) = (values1607[i.val]'(by rw [values1607_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1607_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1600_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1600_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1601_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1601_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1602_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1602_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1603_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1603_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1604_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1604_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1605_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1605_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1606_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1606_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1607_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132.block1607_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132
