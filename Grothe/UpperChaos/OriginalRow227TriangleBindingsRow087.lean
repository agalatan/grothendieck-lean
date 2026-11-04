import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow087

theorem block1177_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (86 + i.val) = some (values1177[i.val]'(by rw [values1177_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1177_lookup i)

theorem block1177_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (86 + i.val) = (values1177[i.val]'(by rw [values1177_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1177_lookup i)

theorem block1178_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (118 + i.val) = some (values1178[i.val]'(by rw [values1178_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1178_lookup i)

theorem block1178_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (118 + i.val) = (values1178[i.val]'(by rw [values1178_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1178_lookup i)

theorem block1179_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (150 + i.val) = some (values1179[i.val]'(by rw [values1179_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1179_lookup i)

theorem block1179_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (150 + i.val) = (values1179[i.val]'(by rw [values1179_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1179_lookup i)

theorem block1180_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (182 + i.val) = some (values1180[i.val]'(by rw [values1180_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1180_lookup i)

theorem block1180_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (182 + i.val) = (values1180[i.val]'(by rw [values1180_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1180_lookup i)

theorem block1181_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (214 + i.val) = some (values1181[i.val]'(by rw [values1181_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1181_lookup i)

theorem block1181_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (214 + i.val) = (values1181[i.val]'(by rw [values1181_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1181_lookup i)

theorem block1182_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (246 + i.val) = some (values1182[i.val]'(by rw [values1182_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1182_lookup i)

theorem block1182_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (246 + i.val) = (values1182[i.val]'(by rw [values1182_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1182_lookup i)

theorem block1183_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (278 + i.val) = some (values1183[i.val]'(by rw [values1183_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1183_lookup i)

theorem block1183_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (278 + i.val) = (values1183[i.val]'(by rw [values1183_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1183_lookup i)

theorem block1184_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (310 + i.val) = some (values1184[i.val]'(by rw [values1184_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1184_lookup i)

theorem block1184_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (310 + i.val) = (values1184[i.val]'(by rw [values1184_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1184_lookup i)

theorem block1185_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (342 + i.val) = some (values1185[i.val]'(by rw [values1185_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1185_lookup i)

theorem block1185_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (342 + i.val) = (values1185[i.val]'(by rw [values1185_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1185_lookup i)

theorem block1186_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 87 (374 + i.val) = some (values1186[i.val]'(by rw [values1186_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1186_lookup i)

theorem block1186_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 87 (374 + i.val) = (values1186[i.val]'(by rw [values1186_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1186_lookup i)

theorem block1187_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 87 (406 + i.val) = some (values1187[i.val]'(by rw [values1187_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row087_lookup _).trans (OriginalRow227TriangleLookupRow087.block1187_lookup i)

theorem block1187_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 87 (406 + i.val) = (values1187[i.val]'(by rw [values1187_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1187_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1177_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1177_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1178_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1178_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1179_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1179_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1180_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1180_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1181_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1181_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1182_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1182_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1183_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1183_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1184_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1184_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1185_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1185_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1186_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1186_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1187_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087.block1187_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087
