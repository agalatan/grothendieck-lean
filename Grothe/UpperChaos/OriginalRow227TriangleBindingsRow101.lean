import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow101

theorem block1322_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (100 + i.val) = some (values1322[i.val]'(by rw [values1322_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1322_lookup i)

theorem block1322_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (100 + i.val) = (values1322[i.val]'(by rw [values1322_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1322_lookup i)

theorem block1323_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (132 + i.val) = some (values1323[i.val]'(by rw [values1323_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1323_lookup i)

theorem block1323_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (132 + i.val) = (values1323[i.val]'(by rw [values1323_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1323_lookup i)

theorem block1324_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (164 + i.val) = some (values1324[i.val]'(by rw [values1324_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1324_lookup i)

theorem block1324_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (164 + i.val) = (values1324[i.val]'(by rw [values1324_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1324_lookup i)

theorem block1325_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (196 + i.val) = some (values1325[i.val]'(by rw [values1325_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1325_lookup i)

theorem block1325_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (196 + i.val) = (values1325[i.val]'(by rw [values1325_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1325_lookup i)

theorem block1326_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (228 + i.val) = some (values1326[i.val]'(by rw [values1326_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1326_lookup i)

theorem block1326_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (228 + i.val) = (values1326[i.val]'(by rw [values1326_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1326_lookup i)

theorem block1327_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (260 + i.val) = some (values1327[i.val]'(by rw [values1327_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1327_lookup i)

theorem block1327_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (260 + i.val) = (values1327[i.val]'(by rw [values1327_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1327_lookup i)

theorem block1328_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (292 + i.val) = some (values1328[i.val]'(by rw [values1328_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1328_lookup i)

theorem block1328_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (292 + i.val) = (values1328[i.val]'(by rw [values1328_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1328_lookup i)

theorem block1329_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (324 + i.val) = some (values1329[i.val]'(by rw [values1329_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1329_lookup i)

theorem block1329_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (324 + i.val) = (values1329[i.val]'(by rw [values1329_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1329_lookup i)

theorem block1330_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 101 (356 + i.val) = some (values1330[i.val]'(by rw [values1330_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1330_lookup i)

theorem block1330_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 101 (356 + i.val) = (values1330[i.val]'(by rw [values1330_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1330_lookup i)

theorem block1331_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 101 (388 + i.val) = some (values1331[i.val]'(by rw [values1331_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row101_lookup _).trans (OriginalRow227TriangleLookupRow101.block1331_lookup i)

theorem block1331_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 101 (388 + i.val) = (values1331[i.val]'(by rw [values1331_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1331_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1322_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1322_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1323_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1323_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1324_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1324_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1325_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1325_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1326_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1326_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1327_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1327_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1328_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1328_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1329_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1329_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1330_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1330_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1331_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101.block1331_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101
