import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow102

theorem block1332_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (101 + i.val) = some (values1332[i.val]'(by rw [values1332_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1332_lookup i)

theorem block1332_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (101 + i.val) = (values1332[i.val]'(by rw [values1332_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1332_lookup i)

theorem block1333_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (133 + i.val) = some (values1333[i.val]'(by rw [values1333_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1333_lookup i)

theorem block1333_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (133 + i.val) = (values1333[i.val]'(by rw [values1333_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1333_lookup i)

theorem block1334_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (165 + i.val) = some (values1334[i.val]'(by rw [values1334_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1334_lookup i)

theorem block1334_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (165 + i.val) = (values1334[i.val]'(by rw [values1334_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1334_lookup i)

theorem block1335_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (197 + i.val) = some (values1335[i.val]'(by rw [values1335_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1335_lookup i)

theorem block1335_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (197 + i.val) = (values1335[i.val]'(by rw [values1335_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1335_lookup i)

theorem block1336_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (229 + i.val) = some (values1336[i.val]'(by rw [values1336_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1336_lookup i)

theorem block1336_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (229 + i.val) = (values1336[i.val]'(by rw [values1336_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1336_lookup i)

theorem block1337_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (261 + i.val) = some (values1337[i.val]'(by rw [values1337_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1337_lookup i)

theorem block1337_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (261 + i.val) = (values1337[i.val]'(by rw [values1337_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1337_lookup i)

theorem block1338_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (293 + i.val) = some (values1338[i.val]'(by rw [values1338_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1338_lookup i)

theorem block1338_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (293 + i.val) = (values1338[i.val]'(by rw [values1338_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1338_lookup i)

theorem block1339_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (325 + i.val) = some (values1339[i.val]'(by rw [values1339_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1339_lookup i)

theorem block1339_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (325 + i.val) = (values1339[i.val]'(by rw [values1339_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1339_lookup i)

theorem block1340_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 102 (357 + i.val) = some (values1340[i.val]'(by rw [values1340_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1340_lookup i)

theorem block1340_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 102 (357 + i.val) = (values1340[i.val]'(by rw [values1340_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1340_lookup i)

theorem block1341_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 102 (389 + i.val) = some (values1341[i.val]'(by rw [values1341_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row102_lookup _).trans (OriginalRow227TriangleLookupRow102.block1341_lookup i)

theorem block1341_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 102 (389 + i.val) = (values1341[i.val]'(by rw [values1341_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1341_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1332_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1332_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1333_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1333_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1334_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1334_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1335_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1335_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1336_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1336_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1337_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1337_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1338_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1338_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1339_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1339_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1340_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1340_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1341_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102.block1341_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102
