import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow090

theorem block1210_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (89 + i.val) = some (values1210[i.val]'(by rw [values1210_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1210_lookup i)

theorem block1210_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (89 + i.val) = (values1210[i.val]'(by rw [values1210_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1210_lookup i)

theorem block1211_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (121 + i.val) = some (values1211[i.val]'(by rw [values1211_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1211_lookup i)

theorem block1211_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (121 + i.val) = (values1211[i.val]'(by rw [values1211_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1211_lookup i)

theorem block1212_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (153 + i.val) = some (values1212[i.val]'(by rw [values1212_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1212_lookup i)

theorem block1212_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (153 + i.val) = (values1212[i.val]'(by rw [values1212_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1212_lookup i)

theorem block1213_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (185 + i.val) = some (values1213[i.val]'(by rw [values1213_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1213_lookup i)

theorem block1213_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (185 + i.val) = (values1213[i.val]'(by rw [values1213_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1213_lookup i)

theorem block1214_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (217 + i.val) = some (values1214[i.val]'(by rw [values1214_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1214_lookup i)

theorem block1214_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (217 + i.val) = (values1214[i.val]'(by rw [values1214_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1214_lookup i)

theorem block1215_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (249 + i.val) = some (values1215[i.val]'(by rw [values1215_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1215_lookup i)

theorem block1215_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (249 + i.val) = (values1215[i.val]'(by rw [values1215_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1215_lookup i)

theorem block1216_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (281 + i.val) = some (values1216[i.val]'(by rw [values1216_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1216_lookup i)

theorem block1216_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (281 + i.val) = (values1216[i.val]'(by rw [values1216_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1216_lookup i)

theorem block1217_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (313 + i.val) = some (values1217[i.val]'(by rw [values1217_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1217_lookup i)

theorem block1217_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (313 + i.val) = (values1217[i.val]'(by rw [values1217_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1217_lookup i)

theorem block1218_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (345 + i.val) = some (values1218[i.val]'(by rw [values1218_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1218_lookup i)

theorem block1218_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (345 + i.val) = (values1218[i.val]'(by rw [values1218_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1218_lookup i)

theorem block1219_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 90 (377 + i.val) = some (values1219[i.val]'(by rw [values1219_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1219_lookup i)

theorem block1219_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 90 (377 + i.val) = (values1219[i.val]'(by rw [values1219_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1219_lookup i)

theorem block1220_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 90 (409 + i.val) = some (values1220[i.val]'(by rw [values1220_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row090_lookup _).trans (OriginalRow227TriangleLookupRow090.block1220_lookup i)

theorem block1220_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 90 (409 + i.val) = (values1220[i.val]'(by rw [values1220_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1220_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1210_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1210_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1211_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1211_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1212_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1212_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1213_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1213_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1214_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1214_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1215_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1215_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1216_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1216_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1217_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1217_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1218_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1218_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1219_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1219_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1220_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090.block1220_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090
