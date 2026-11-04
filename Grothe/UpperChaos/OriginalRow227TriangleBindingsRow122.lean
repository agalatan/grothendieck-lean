import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow122

theorem block1518_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (121 + i.val) = some (values1518[i.val]'(by rw [values1518_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1518_lookup i)

theorem block1518_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (121 + i.val) = (values1518[i.val]'(by rw [values1518_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1518_lookup i)

theorem block1519_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (153 + i.val) = some (values1519[i.val]'(by rw [values1519_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1519_lookup i)

theorem block1519_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (153 + i.val) = (values1519[i.val]'(by rw [values1519_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1519_lookup i)

theorem block1520_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (185 + i.val) = some (values1520[i.val]'(by rw [values1520_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1520_lookup i)

theorem block1520_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (185 + i.val) = (values1520[i.val]'(by rw [values1520_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1520_lookup i)

theorem block1521_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (217 + i.val) = some (values1521[i.val]'(by rw [values1521_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1521_lookup i)

theorem block1521_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (217 + i.val) = (values1521[i.val]'(by rw [values1521_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1521_lookup i)

theorem block1522_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (249 + i.val) = some (values1522[i.val]'(by rw [values1522_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1522_lookup i)

theorem block1522_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (249 + i.val) = (values1522[i.val]'(by rw [values1522_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1522_lookup i)

theorem block1523_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (281 + i.val) = some (values1523[i.val]'(by rw [values1523_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1523_lookup i)

theorem block1523_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (281 + i.val) = (values1523[i.val]'(by rw [values1523_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1523_lookup i)

theorem block1524_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (313 + i.val) = some (values1524[i.val]'(by rw [values1524_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1524_lookup i)

theorem block1524_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (313 + i.val) = (values1524[i.val]'(by rw [values1524_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1524_lookup i)

theorem block1525_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 122 (345 + i.val) = some (values1525[i.val]'(by rw [values1525_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1525_lookup i)

theorem block1525_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 122 (345 + i.val) = (values1525[i.val]'(by rw [values1525_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1525_lookup i)

theorem block1526_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 122 (377 + i.val) = some (values1526[i.val]'(by rw [values1526_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row122_lookup _).trans (OriginalRow227TriangleLookupRow122.block1526_lookup i)

theorem block1526_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 122 (377 + i.val) = (values1526[i.val]'(by rw [values1526_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1526_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1518_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1518_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1519_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1519_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1520_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1520_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1521_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1521_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1522_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1522_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1523_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1523_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1524_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1524_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1525_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1525_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1526_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122.block1526_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122
