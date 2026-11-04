import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow104

theorem block1352_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (103 + i.val) = some (values1352[i.val]'(by rw [values1352_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1352_lookup i)

theorem block1352_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (103 + i.val) = (values1352[i.val]'(by rw [values1352_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1352_lookup i)

theorem block1353_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (135 + i.val) = some (values1353[i.val]'(by rw [values1353_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1353_lookup i)

theorem block1353_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (135 + i.val) = (values1353[i.val]'(by rw [values1353_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1353_lookup i)

theorem block1354_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (167 + i.val) = some (values1354[i.val]'(by rw [values1354_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1354_lookup i)

theorem block1354_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (167 + i.val) = (values1354[i.val]'(by rw [values1354_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1354_lookup i)

theorem block1355_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (199 + i.val) = some (values1355[i.val]'(by rw [values1355_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1355_lookup i)

theorem block1355_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (199 + i.val) = (values1355[i.val]'(by rw [values1355_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1355_lookup i)

theorem block1356_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (231 + i.val) = some (values1356[i.val]'(by rw [values1356_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1356_lookup i)

theorem block1356_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (231 + i.val) = (values1356[i.val]'(by rw [values1356_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1356_lookup i)

theorem block1357_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (263 + i.val) = some (values1357[i.val]'(by rw [values1357_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1357_lookup i)

theorem block1357_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (263 + i.val) = (values1357[i.val]'(by rw [values1357_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1357_lookup i)

theorem block1358_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (295 + i.val) = some (values1358[i.val]'(by rw [values1358_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1358_lookup i)

theorem block1358_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (295 + i.val) = (values1358[i.val]'(by rw [values1358_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1358_lookup i)

theorem block1359_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (327 + i.val) = some (values1359[i.val]'(by rw [values1359_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1359_lookup i)

theorem block1359_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (327 + i.val) = (values1359[i.val]'(by rw [values1359_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1359_lookup i)

theorem block1360_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 104 (359 + i.val) = some (values1360[i.val]'(by rw [values1360_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1360_lookup i)

theorem block1360_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 104 (359 + i.val) = (values1360[i.val]'(by rw [values1360_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1360_lookup i)

theorem block1361_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 104 (391 + i.val) = some (values1361[i.val]'(by rw [values1361_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row104_lookup _).trans (OriginalRow227TriangleLookupRow104.block1361_lookup i)

theorem block1361_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 104 (391 + i.val) = (values1361[i.val]'(by rw [values1361_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1361_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1352_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1352_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1353_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1353_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1354_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1354_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1355_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1355_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1356_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1356_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1357_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1357_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1358_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1358_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1359_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1359_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1360_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1360_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1361_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104.block1361_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104
