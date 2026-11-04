import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow117

theorem block1473_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (116 + i.val) = some (values1473[i.val]'(by rw [values1473_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1473_lookup i)

theorem block1473_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (116 + i.val) = (values1473[i.val]'(by rw [values1473_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1473_lookup i)

theorem block1474_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (148 + i.val) = some (values1474[i.val]'(by rw [values1474_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1474_lookup i)

theorem block1474_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (148 + i.val) = (values1474[i.val]'(by rw [values1474_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1474_lookup i)

theorem block1475_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (180 + i.val) = some (values1475[i.val]'(by rw [values1475_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1475_lookup i)

theorem block1475_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (180 + i.val) = (values1475[i.val]'(by rw [values1475_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1475_lookup i)

theorem block1476_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (212 + i.val) = some (values1476[i.val]'(by rw [values1476_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1476_lookup i)

theorem block1476_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (212 + i.val) = (values1476[i.val]'(by rw [values1476_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1476_lookup i)

theorem block1477_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (244 + i.val) = some (values1477[i.val]'(by rw [values1477_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1477_lookup i)

theorem block1477_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (244 + i.val) = (values1477[i.val]'(by rw [values1477_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1477_lookup i)

theorem block1478_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (276 + i.val) = some (values1478[i.val]'(by rw [values1478_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1478_lookup i)

theorem block1478_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (276 + i.val) = (values1478[i.val]'(by rw [values1478_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1478_lookup i)

theorem block1479_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (308 + i.val) = some (values1479[i.val]'(by rw [values1479_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1479_lookup i)

theorem block1479_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (308 + i.val) = (values1479[i.val]'(by rw [values1479_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1479_lookup i)

theorem block1480_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 117 (340 + i.val) = some (values1480[i.val]'(by rw [values1480_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1480_lookup i)

theorem block1480_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 117 (340 + i.val) = (values1480[i.val]'(by rw [values1480_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1480_lookup i)

theorem block1481_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 117 (372 + i.val) = some (values1481[i.val]'(by rw [values1481_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row117_lookup _).trans (OriginalRow227TriangleLookupRow117.block1481_lookup i)

theorem block1481_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 117 (372 + i.val) = (values1481[i.val]'(by rw [values1481_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1481_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1473_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1473_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1474_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1474_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1475_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1475_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1476_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1476_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1477_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1477_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1478_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1478_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1479_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1479_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1480_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1480_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1481_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117.block1481_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117
