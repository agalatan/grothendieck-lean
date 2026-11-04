import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow130

theorem block1584_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (129 + i.val) = some (values1584[i.val]'(by rw [values1584_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1584_lookup i)

theorem block1584_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (129 + i.val) = (values1584[i.val]'(by rw [values1584_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1584_lookup i)

theorem block1585_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (161 + i.val) = some (values1585[i.val]'(by rw [values1585_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1585_lookup i)

theorem block1585_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (161 + i.val) = (values1585[i.val]'(by rw [values1585_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1585_lookup i)

theorem block1586_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (193 + i.val) = some (values1586[i.val]'(by rw [values1586_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1586_lookup i)

theorem block1586_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (193 + i.val) = (values1586[i.val]'(by rw [values1586_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1586_lookup i)

theorem block1587_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (225 + i.val) = some (values1587[i.val]'(by rw [values1587_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1587_lookup i)

theorem block1587_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (225 + i.val) = (values1587[i.val]'(by rw [values1587_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1587_lookup i)

theorem block1588_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (257 + i.val) = some (values1588[i.val]'(by rw [values1588_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1588_lookup i)

theorem block1588_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (257 + i.val) = (values1588[i.val]'(by rw [values1588_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1588_lookup i)

theorem block1589_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (289 + i.val) = some (values1589[i.val]'(by rw [values1589_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1589_lookup i)

theorem block1589_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (289 + i.val) = (values1589[i.val]'(by rw [values1589_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1589_lookup i)

theorem block1590_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 130 (321 + i.val) = some (values1590[i.val]'(by rw [values1590_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1590_lookup i)

theorem block1590_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 130 (321 + i.val) = (values1590[i.val]'(by rw [values1590_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1590_lookup i)

theorem block1591_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 130 (353 + i.val) = some (values1591[i.val]'(by rw [values1591_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row130_lookup _).trans (OriginalRow227TriangleLookupRow130.block1591_lookup i)

theorem block1591_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 130 (353 + i.val) = (values1591[i.val]'(by rw [values1591_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1591_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1584_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1584_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1585_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1585_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1586_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1586_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1587_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1587_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1588_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1588_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1589_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1589_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1590_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1590_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1591_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130.block1591_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130
