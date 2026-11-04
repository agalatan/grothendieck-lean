import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow139

theorem block1656_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (138 + i.val) = some (values1656[i.val]'(by rw [values1656_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1656_lookup i)

theorem block1656_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (138 + i.val) = (values1656[i.val]'(by rw [values1656_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1656_lookup i)

theorem block1657_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (170 + i.val) = some (values1657[i.val]'(by rw [values1657_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1657_lookup i)

theorem block1657_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (170 + i.val) = (values1657[i.val]'(by rw [values1657_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1657_lookup i)

theorem block1658_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (202 + i.val) = some (values1658[i.val]'(by rw [values1658_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1658_lookup i)

theorem block1658_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (202 + i.val) = (values1658[i.val]'(by rw [values1658_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1658_lookup i)

theorem block1659_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (234 + i.val) = some (values1659[i.val]'(by rw [values1659_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1659_lookup i)

theorem block1659_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (234 + i.val) = (values1659[i.val]'(by rw [values1659_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1659_lookup i)

theorem block1660_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (266 + i.val) = some (values1660[i.val]'(by rw [values1660_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1660_lookup i)

theorem block1660_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (266 + i.val) = (values1660[i.val]'(by rw [values1660_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1660_lookup i)

theorem block1661_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (298 + i.val) = some (values1661[i.val]'(by rw [values1661_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1661_lookup i)

theorem block1661_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (298 + i.val) = (values1661[i.val]'(by rw [values1661_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1661_lookup i)

theorem block1662_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 139 (330 + i.val) = some (values1662[i.val]'(by rw [values1662_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1662_lookup i)

theorem block1662_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 139 (330 + i.val) = (values1662[i.val]'(by rw [values1662_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1662_lookup i)

theorem block1663_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 139 (362 + i.val) = some (values1663[i.val]'(by rw [values1663_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row139_lookup _).trans (OriginalRow227TriangleLookupRow139.block1663_lookup i)

theorem block1663_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 139 (362 + i.val) = (values1663[i.val]'(by rw [values1663_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1663_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1656_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1656_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1657_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1657_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1658_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1658_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1659_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1659_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1660_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1660_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1661_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1661_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1662_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1662_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1663_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139.block1663_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139
