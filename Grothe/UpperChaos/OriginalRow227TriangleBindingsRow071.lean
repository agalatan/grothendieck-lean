import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow071

theorem block0996_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (70 + i.val) = some (values0996[i.val]'(by rw [values0996_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block0996_lookup i)

theorem block0996_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (70 + i.val) = (values0996[i.val]'(by rw [values0996_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0996_lookup i)

theorem block0997_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (102 + i.val) = some (values0997[i.val]'(by rw [values0997_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block0997_lookup i)

theorem block0997_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (102 + i.val) = (values0997[i.val]'(by rw [values0997_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0997_lookup i)

theorem block0998_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (134 + i.val) = some (values0998[i.val]'(by rw [values0998_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block0998_lookup i)

theorem block0998_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (134 + i.val) = (values0998[i.val]'(by rw [values0998_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0998_lookup i)

theorem block0999_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (166 + i.val) = some (values0999[i.val]'(by rw [values0999_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block0999_lookup i)

theorem block0999_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (166 + i.val) = (values0999[i.val]'(by rw [values0999_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0999_lookup i)

theorem block1000_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (198 + i.val) = some (values1000[i.val]'(by rw [values1000_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1000_lookup i)

theorem block1000_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (198 + i.val) = (values1000[i.val]'(by rw [values1000_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1000_lookup i)

theorem block1001_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (230 + i.val) = some (values1001[i.val]'(by rw [values1001_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1001_lookup i)

theorem block1001_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (230 + i.val) = (values1001[i.val]'(by rw [values1001_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1001_lookup i)

theorem block1002_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (262 + i.val) = some (values1002[i.val]'(by rw [values1002_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1002_lookup i)

theorem block1002_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (262 + i.val) = (values1002[i.val]'(by rw [values1002_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1002_lookup i)

theorem block1003_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (294 + i.val) = some (values1003[i.val]'(by rw [values1003_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1003_lookup i)

theorem block1003_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (294 + i.val) = (values1003[i.val]'(by rw [values1003_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1003_lookup i)

theorem block1004_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (326 + i.val) = some (values1004[i.val]'(by rw [values1004_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1004_lookup i)

theorem block1004_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (326 + i.val) = (values1004[i.val]'(by rw [values1004_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1004_lookup i)

theorem block1005_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (358 + i.val) = some (values1005[i.val]'(by rw [values1005_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1005_lookup i)

theorem block1005_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (358 + i.val) = (values1005[i.val]'(by rw [values1005_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1005_lookup i)

theorem block1006_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 71 (390 + i.val) = some (values1006[i.val]'(by rw [values1006_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1006_lookup i)

theorem block1006_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 71 (390 + i.val) = (values1006[i.val]'(by rw [values1006_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1006_lookup i)

theorem block1007_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 71 (422 + i.val) = some (values1007[i.val]'(by rw [values1007_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row071_lookup _).trans (OriginalRow227TriangleLookupRow071.block1007_lookup i)

theorem block1007_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 71 (422 + i.val) = (values1007[i.val]'(by rw [values1007_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1007_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0996_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0996_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0997_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0997_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0998_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0998_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0999_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block0999_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1000_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1000_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1001_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1001_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1002_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1002_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1003_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1003_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1004_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1004_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1005_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1005_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1006_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1006_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1007_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071.block1007_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071
