import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow098

theorem block1292_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (97 + i.val) = some (values1292[i.val]'(by rw [values1292_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1292_lookup i)

theorem block1292_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (97 + i.val) = (values1292[i.val]'(by rw [values1292_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1292_lookup i)

theorem block1293_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (129 + i.val) = some (values1293[i.val]'(by rw [values1293_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1293_lookup i)

theorem block1293_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (129 + i.val) = (values1293[i.val]'(by rw [values1293_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1293_lookup i)

theorem block1294_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (161 + i.val) = some (values1294[i.val]'(by rw [values1294_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1294_lookup i)

theorem block1294_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (161 + i.val) = (values1294[i.val]'(by rw [values1294_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1294_lookup i)

theorem block1295_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (193 + i.val) = some (values1295[i.val]'(by rw [values1295_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1295_lookup i)

theorem block1295_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (193 + i.val) = (values1295[i.val]'(by rw [values1295_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1295_lookup i)

theorem block1296_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (225 + i.val) = some (values1296[i.val]'(by rw [values1296_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1296_lookup i)

theorem block1296_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (225 + i.val) = (values1296[i.val]'(by rw [values1296_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1296_lookup i)

theorem block1297_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (257 + i.val) = some (values1297[i.val]'(by rw [values1297_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1297_lookup i)

theorem block1297_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (257 + i.val) = (values1297[i.val]'(by rw [values1297_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1297_lookup i)

theorem block1298_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (289 + i.val) = some (values1298[i.val]'(by rw [values1298_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1298_lookup i)

theorem block1298_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (289 + i.val) = (values1298[i.val]'(by rw [values1298_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1298_lookup i)

theorem block1299_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (321 + i.val) = some (values1299[i.val]'(by rw [values1299_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1299_lookup i)

theorem block1299_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (321 + i.val) = (values1299[i.val]'(by rw [values1299_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1299_lookup i)

theorem block1300_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 98 (353 + i.val) = some (values1300[i.val]'(by rw [values1300_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1300_lookup i)

theorem block1300_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 98 (353 + i.val) = (values1300[i.val]'(by rw [values1300_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1300_lookup i)

theorem block1301_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 98 (385 + i.val) = some (values1301[i.val]'(by rw [values1301_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row098_lookup _).trans (OriginalRow227TriangleLookupRow098.block1301_lookup i)

theorem block1301_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 98 (385 + i.val) = (values1301[i.val]'(by rw [values1301_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1301_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1292_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1292_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1293_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1293_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1294_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1294_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1295_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1295_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1296_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1296_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1297_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1297_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1298_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1298_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1299_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1299_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1300_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1300_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1301_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098.block1301_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098
