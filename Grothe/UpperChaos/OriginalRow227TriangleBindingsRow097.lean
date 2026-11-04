import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow097

theorem block1282_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (96 + i.val) = some (values1282[i.val]'(by rw [values1282_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1282_lookup i)

theorem block1282_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (96 + i.val) = (values1282[i.val]'(by rw [values1282_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1282_lookup i)

theorem block1283_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (128 + i.val) = some (values1283[i.val]'(by rw [values1283_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1283_lookup i)

theorem block1283_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (128 + i.val) = (values1283[i.val]'(by rw [values1283_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1283_lookup i)

theorem block1284_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (160 + i.val) = some (values1284[i.val]'(by rw [values1284_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1284_lookup i)

theorem block1284_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (160 + i.val) = (values1284[i.val]'(by rw [values1284_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1284_lookup i)

theorem block1285_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (192 + i.val) = some (values1285[i.val]'(by rw [values1285_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1285_lookup i)

theorem block1285_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (192 + i.val) = (values1285[i.val]'(by rw [values1285_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1285_lookup i)

theorem block1286_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (224 + i.val) = some (values1286[i.val]'(by rw [values1286_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1286_lookup i)

theorem block1286_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (224 + i.val) = (values1286[i.val]'(by rw [values1286_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1286_lookup i)

theorem block1287_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (256 + i.val) = some (values1287[i.val]'(by rw [values1287_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1287_lookup i)

theorem block1287_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (256 + i.val) = (values1287[i.val]'(by rw [values1287_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1287_lookup i)

theorem block1288_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (288 + i.val) = some (values1288[i.val]'(by rw [values1288_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1288_lookup i)

theorem block1288_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (288 + i.val) = (values1288[i.val]'(by rw [values1288_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1288_lookup i)

theorem block1289_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (320 + i.val) = some (values1289[i.val]'(by rw [values1289_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1289_lookup i)

theorem block1289_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (320 + i.val) = (values1289[i.val]'(by rw [values1289_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1289_lookup i)

theorem block1290_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 97 (352 + i.val) = some (values1290[i.val]'(by rw [values1290_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1290_lookup i)

theorem block1290_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 97 (352 + i.val) = (values1290[i.val]'(by rw [values1290_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1290_lookup i)

theorem block1291_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 97 (384 + i.val) = some (values1291[i.val]'(by rw [values1291_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row097_lookup _).trans (OriginalRow227TriangleLookupRow097.block1291_lookup i)

theorem block1291_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 97 (384 + i.val) = (values1291[i.val]'(by rw [values1291_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1291_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1282_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1282_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1283_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1283_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1284_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1284_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1285_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1285_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1286_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1286_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1287_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1287_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1288_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1288_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1289_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1289_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1290_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1290_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1291_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097.block1291_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097
