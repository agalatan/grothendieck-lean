import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow118

theorem block1482_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (117 + i.val) = some (values1482[i.val]'(by rw [values1482_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1482_lookup i)

theorem block1482_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (117 + i.val) = (values1482[i.val]'(by rw [values1482_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1482_lookup i)

theorem block1483_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (149 + i.val) = some (values1483[i.val]'(by rw [values1483_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1483_lookup i)

theorem block1483_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (149 + i.val) = (values1483[i.val]'(by rw [values1483_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1483_lookup i)

theorem block1484_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (181 + i.val) = some (values1484[i.val]'(by rw [values1484_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1484_lookup i)

theorem block1484_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (181 + i.val) = (values1484[i.val]'(by rw [values1484_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1484_lookup i)

theorem block1485_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (213 + i.val) = some (values1485[i.val]'(by rw [values1485_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1485_lookup i)

theorem block1485_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (213 + i.val) = (values1485[i.val]'(by rw [values1485_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1485_lookup i)

theorem block1486_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (245 + i.val) = some (values1486[i.val]'(by rw [values1486_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1486_lookup i)

theorem block1486_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (245 + i.val) = (values1486[i.val]'(by rw [values1486_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1486_lookup i)

theorem block1487_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (277 + i.val) = some (values1487[i.val]'(by rw [values1487_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1487_lookup i)

theorem block1487_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (277 + i.val) = (values1487[i.val]'(by rw [values1487_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1487_lookup i)

theorem block1488_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (309 + i.val) = some (values1488[i.val]'(by rw [values1488_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1488_lookup i)

theorem block1488_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (309 + i.val) = (values1488[i.val]'(by rw [values1488_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1488_lookup i)

theorem block1489_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 118 (341 + i.val) = some (values1489[i.val]'(by rw [values1489_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1489_lookup i)

theorem block1489_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 118 (341 + i.val) = (values1489[i.val]'(by rw [values1489_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1489_lookup i)

theorem block1490_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 118 (373 + i.val) = some (values1490[i.val]'(by rw [values1490_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row118_lookup _).trans (OriginalRow227TriangleLookupRow118.block1490_lookup i)

theorem block1490_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 118 (373 + i.val) = (values1490[i.val]'(by rw [values1490_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1490_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1482_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1482_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1483_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1483_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1484_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1484_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1485_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1485_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1486_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1486_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1487_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1487_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1488_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1488_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1489_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1489_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1490_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118.block1490_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118
