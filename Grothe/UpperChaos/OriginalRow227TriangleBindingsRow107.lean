import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow107

theorem block1382_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (106 + i.val) = some (values1382[i.val]'(by rw [values1382_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1382_lookup i)

theorem block1382_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (106 + i.val) = (values1382[i.val]'(by rw [values1382_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1382_lookup i)

theorem block1383_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (138 + i.val) = some (values1383[i.val]'(by rw [values1383_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1383_lookup i)

theorem block1383_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (138 + i.val) = (values1383[i.val]'(by rw [values1383_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1383_lookup i)

theorem block1384_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (170 + i.val) = some (values1384[i.val]'(by rw [values1384_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1384_lookup i)

theorem block1384_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (170 + i.val) = (values1384[i.val]'(by rw [values1384_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1384_lookup i)

theorem block1385_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (202 + i.val) = some (values1385[i.val]'(by rw [values1385_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1385_lookup i)

theorem block1385_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (202 + i.val) = (values1385[i.val]'(by rw [values1385_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1385_lookup i)

theorem block1386_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (234 + i.val) = some (values1386[i.val]'(by rw [values1386_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1386_lookup i)

theorem block1386_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (234 + i.val) = (values1386[i.val]'(by rw [values1386_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1386_lookup i)

theorem block1387_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (266 + i.val) = some (values1387[i.val]'(by rw [values1387_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1387_lookup i)

theorem block1387_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (266 + i.val) = (values1387[i.val]'(by rw [values1387_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1387_lookup i)

theorem block1388_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (298 + i.val) = some (values1388[i.val]'(by rw [values1388_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1388_lookup i)

theorem block1388_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (298 + i.val) = (values1388[i.val]'(by rw [values1388_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1388_lookup i)

theorem block1389_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (330 + i.val) = some (values1389[i.val]'(by rw [values1389_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1389_lookup i)

theorem block1389_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (330 + i.val) = (values1389[i.val]'(by rw [values1389_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1389_lookup i)

theorem block1390_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 107 (362 + i.val) = some (values1390[i.val]'(by rw [values1390_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1390_lookup i)

theorem block1390_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 107 (362 + i.val) = (values1390[i.val]'(by rw [values1390_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1390_lookup i)

theorem block1391_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 107 (394 + i.val) = some (values1391[i.val]'(by rw [values1391_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row107_lookup _).trans (OriginalRow227TriangleLookupRow107.block1391_lookup i)

theorem block1391_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 107 (394 + i.val) = (values1391[i.val]'(by rw [values1391_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1391_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1382_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1382_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1383_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1383_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1384_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1384_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1385_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1385_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1386_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1386_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1387_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1387_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1388_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1388_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1389_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1389_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1390_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1390_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1391_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107.block1391_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107
