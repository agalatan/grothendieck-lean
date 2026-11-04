import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow103

theorem block1342_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (102 + i.val) = some (values1342[i.val]'(by rw [values1342_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1342_lookup i)

theorem block1342_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (102 + i.val) = (values1342[i.val]'(by rw [values1342_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1342_lookup i)

theorem block1343_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (134 + i.val) = some (values1343[i.val]'(by rw [values1343_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1343_lookup i)

theorem block1343_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (134 + i.val) = (values1343[i.val]'(by rw [values1343_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1343_lookup i)

theorem block1344_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (166 + i.val) = some (values1344[i.val]'(by rw [values1344_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1344_lookup i)

theorem block1344_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (166 + i.val) = (values1344[i.val]'(by rw [values1344_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1344_lookup i)

theorem block1345_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (198 + i.val) = some (values1345[i.val]'(by rw [values1345_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1345_lookup i)

theorem block1345_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (198 + i.val) = (values1345[i.val]'(by rw [values1345_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1345_lookup i)

theorem block1346_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (230 + i.val) = some (values1346[i.val]'(by rw [values1346_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1346_lookup i)

theorem block1346_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (230 + i.val) = (values1346[i.val]'(by rw [values1346_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1346_lookup i)

theorem block1347_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (262 + i.val) = some (values1347[i.val]'(by rw [values1347_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1347_lookup i)

theorem block1347_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (262 + i.val) = (values1347[i.val]'(by rw [values1347_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1347_lookup i)

theorem block1348_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (294 + i.val) = some (values1348[i.val]'(by rw [values1348_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1348_lookup i)

theorem block1348_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (294 + i.val) = (values1348[i.val]'(by rw [values1348_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1348_lookup i)

theorem block1349_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (326 + i.val) = some (values1349[i.val]'(by rw [values1349_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1349_lookup i)

theorem block1349_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (326 + i.val) = (values1349[i.val]'(by rw [values1349_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1349_lookup i)

theorem block1350_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 103 (358 + i.val) = some (values1350[i.val]'(by rw [values1350_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1350_lookup i)

theorem block1350_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 103 (358 + i.val) = (values1350[i.val]'(by rw [values1350_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1350_lookup i)

theorem block1351_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 103 (390 + i.val) = some (values1351[i.val]'(by rw [values1351_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row103_lookup _).trans (OriginalRow227TriangleLookupRow103.block1351_lookup i)

theorem block1351_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 103 (390 + i.val) = (values1351[i.val]'(by rw [values1351_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1351_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1342_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1342_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1343_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1343_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1344_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1344_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1345_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1345_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1346_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1346_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1347_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1347_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1348_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1348_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1349_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1349_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1350_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1350_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1351_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103.block1351_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103
