import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow100

theorem block1312_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (99 + i.val) = some (values1312[i.val]'(by rw [values1312_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1312_lookup i)

theorem block1312_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (99 + i.val) = (values1312[i.val]'(by rw [values1312_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1312_lookup i)

theorem block1313_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (131 + i.val) = some (values1313[i.val]'(by rw [values1313_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1313_lookup i)

theorem block1313_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (131 + i.val) = (values1313[i.val]'(by rw [values1313_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1313_lookup i)

theorem block1314_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (163 + i.val) = some (values1314[i.val]'(by rw [values1314_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1314_lookup i)

theorem block1314_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (163 + i.val) = (values1314[i.val]'(by rw [values1314_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1314_lookup i)

theorem block1315_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (195 + i.val) = some (values1315[i.val]'(by rw [values1315_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1315_lookup i)

theorem block1315_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (195 + i.val) = (values1315[i.val]'(by rw [values1315_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1315_lookup i)

theorem block1316_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (227 + i.val) = some (values1316[i.val]'(by rw [values1316_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1316_lookup i)

theorem block1316_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (227 + i.val) = (values1316[i.val]'(by rw [values1316_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1316_lookup i)

theorem block1317_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (259 + i.val) = some (values1317[i.val]'(by rw [values1317_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1317_lookup i)

theorem block1317_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (259 + i.val) = (values1317[i.val]'(by rw [values1317_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1317_lookup i)

theorem block1318_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (291 + i.val) = some (values1318[i.val]'(by rw [values1318_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1318_lookup i)

theorem block1318_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (291 + i.val) = (values1318[i.val]'(by rw [values1318_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1318_lookup i)

theorem block1319_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (323 + i.val) = some (values1319[i.val]'(by rw [values1319_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1319_lookup i)

theorem block1319_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (323 + i.val) = (values1319[i.val]'(by rw [values1319_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1319_lookup i)

theorem block1320_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 100 (355 + i.val) = some (values1320[i.val]'(by rw [values1320_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1320_lookup i)

theorem block1320_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 100 (355 + i.val) = (values1320[i.val]'(by rw [values1320_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1320_lookup i)

theorem block1321_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 100 (387 + i.val) = some (values1321[i.val]'(by rw [values1321_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row100_lookup _).trans (OriginalRow227TriangleLookupRow100.block1321_lookup i)

theorem block1321_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 100 (387 + i.val) = (values1321[i.val]'(by rw [values1321_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1321_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1312_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1312_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1313_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1313_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1314_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1314_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1315_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1315_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1316_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1316_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1317_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1317_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1318_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1318_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1319_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1319_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1320_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1320_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1321_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100.block1321_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100
