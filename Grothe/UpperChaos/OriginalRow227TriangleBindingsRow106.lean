import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow106

theorem block1372_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (105 + i.val) = some (values1372[i.val]'(by rw [values1372_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1372_lookup i)

theorem block1372_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (105 + i.val) = (values1372[i.val]'(by rw [values1372_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1372_lookup i)

theorem block1373_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (137 + i.val) = some (values1373[i.val]'(by rw [values1373_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1373_lookup i)

theorem block1373_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (137 + i.val) = (values1373[i.val]'(by rw [values1373_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1373_lookup i)

theorem block1374_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (169 + i.val) = some (values1374[i.val]'(by rw [values1374_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1374_lookup i)

theorem block1374_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (169 + i.val) = (values1374[i.val]'(by rw [values1374_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1374_lookup i)

theorem block1375_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (201 + i.val) = some (values1375[i.val]'(by rw [values1375_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1375_lookup i)

theorem block1375_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (201 + i.val) = (values1375[i.val]'(by rw [values1375_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1375_lookup i)

theorem block1376_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (233 + i.val) = some (values1376[i.val]'(by rw [values1376_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1376_lookup i)

theorem block1376_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (233 + i.val) = (values1376[i.val]'(by rw [values1376_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1376_lookup i)

theorem block1377_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (265 + i.val) = some (values1377[i.val]'(by rw [values1377_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1377_lookup i)

theorem block1377_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (265 + i.val) = (values1377[i.val]'(by rw [values1377_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1377_lookup i)

theorem block1378_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (297 + i.val) = some (values1378[i.val]'(by rw [values1378_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1378_lookup i)

theorem block1378_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (297 + i.val) = (values1378[i.val]'(by rw [values1378_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1378_lookup i)

theorem block1379_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (329 + i.val) = some (values1379[i.val]'(by rw [values1379_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1379_lookup i)

theorem block1379_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (329 + i.val) = (values1379[i.val]'(by rw [values1379_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1379_lookup i)

theorem block1380_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 106 (361 + i.val) = some (values1380[i.val]'(by rw [values1380_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1380_lookup i)

theorem block1380_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 106 (361 + i.val) = (values1380[i.val]'(by rw [values1380_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1380_lookup i)

theorem block1381_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 106 (393 + i.val) = some (values1381[i.val]'(by rw [values1381_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row106_lookup _).trans (OriginalRow227TriangleLookupRow106.block1381_lookup i)

theorem block1381_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 106 (393 + i.val) = (values1381[i.val]'(by rw [values1381_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1381_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1372_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1372_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1373_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1373_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1374_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1374_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1375_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1375_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1376_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1376_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1377_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1377_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1378_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1378_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1379_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1379_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1380_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1380_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1381_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106.block1381_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106
