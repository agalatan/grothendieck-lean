import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow078

theorem block1078_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (77 + i.val) = some (values1078[i.val]'(by rw [values1078_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1078_lookup i)

theorem block1078_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (77 + i.val) = (values1078[i.val]'(by rw [values1078_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1078_lookup i)

theorem block1079_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (109 + i.val) = some (values1079[i.val]'(by rw [values1079_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1079_lookup i)

theorem block1079_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (109 + i.val) = (values1079[i.val]'(by rw [values1079_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1079_lookup i)

theorem block1080_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (141 + i.val) = some (values1080[i.val]'(by rw [values1080_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1080_lookup i)

theorem block1080_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (141 + i.val) = (values1080[i.val]'(by rw [values1080_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1080_lookup i)

theorem block1081_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (173 + i.val) = some (values1081[i.val]'(by rw [values1081_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1081_lookup i)

theorem block1081_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (173 + i.val) = (values1081[i.val]'(by rw [values1081_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1081_lookup i)

theorem block1082_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (205 + i.val) = some (values1082[i.val]'(by rw [values1082_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1082_lookup i)

theorem block1082_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (205 + i.val) = (values1082[i.val]'(by rw [values1082_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1082_lookup i)

theorem block1083_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (237 + i.val) = some (values1083[i.val]'(by rw [values1083_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1083_lookup i)

theorem block1083_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (237 + i.val) = (values1083[i.val]'(by rw [values1083_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1083_lookup i)

theorem block1084_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (269 + i.val) = some (values1084[i.val]'(by rw [values1084_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1084_lookup i)

theorem block1084_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (269 + i.val) = (values1084[i.val]'(by rw [values1084_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1084_lookup i)

theorem block1085_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (301 + i.val) = some (values1085[i.val]'(by rw [values1085_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1085_lookup i)

theorem block1085_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (301 + i.val) = (values1085[i.val]'(by rw [values1085_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1085_lookup i)

theorem block1086_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (333 + i.val) = some (values1086[i.val]'(by rw [values1086_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1086_lookup i)

theorem block1086_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (333 + i.val) = (values1086[i.val]'(by rw [values1086_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1086_lookup i)

theorem block1087_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 78 (365 + i.val) = some (values1087[i.val]'(by rw [values1087_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1087_lookup i)

theorem block1087_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 78 (365 + i.val) = (values1087[i.val]'(by rw [values1087_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1087_lookup i)

theorem block1088_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 78 (397 + i.val) = some (values1088[i.val]'(by rw [values1088_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row078_lookup _).trans (OriginalRow227TriangleLookupRow078.block1088_lookup i)

theorem block1088_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 78 (397 + i.val) = (values1088[i.val]'(by rw [values1088_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1088_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1078_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1078_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1079_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1079_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1080_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1080_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1081_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1081_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1082_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1082_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1083_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1083_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1084_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1084_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1085_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1085_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1086_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1086_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1087_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1087_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1088_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078.block1088_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078
