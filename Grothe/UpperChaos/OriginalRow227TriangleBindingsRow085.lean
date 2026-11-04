import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow085

theorem block1155_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (84 + i.val) = some (values1155[i.val]'(by rw [values1155_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1155_lookup i)

theorem block1155_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (84 + i.val) = (values1155[i.val]'(by rw [values1155_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1155_lookup i)

theorem block1156_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (116 + i.val) = some (values1156[i.val]'(by rw [values1156_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1156_lookup i)

theorem block1156_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (116 + i.val) = (values1156[i.val]'(by rw [values1156_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1156_lookup i)

theorem block1157_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (148 + i.val) = some (values1157[i.val]'(by rw [values1157_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1157_lookup i)

theorem block1157_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (148 + i.val) = (values1157[i.val]'(by rw [values1157_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1157_lookup i)

theorem block1158_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (180 + i.val) = some (values1158[i.val]'(by rw [values1158_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1158_lookup i)

theorem block1158_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (180 + i.val) = (values1158[i.val]'(by rw [values1158_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1158_lookup i)

theorem block1159_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (212 + i.val) = some (values1159[i.val]'(by rw [values1159_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1159_lookup i)

theorem block1159_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (212 + i.val) = (values1159[i.val]'(by rw [values1159_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1159_lookup i)

theorem block1160_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (244 + i.val) = some (values1160[i.val]'(by rw [values1160_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1160_lookup i)

theorem block1160_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (244 + i.val) = (values1160[i.val]'(by rw [values1160_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1160_lookup i)

theorem block1161_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (276 + i.val) = some (values1161[i.val]'(by rw [values1161_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1161_lookup i)

theorem block1161_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (276 + i.val) = (values1161[i.val]'(by rw [values1161_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1161_lookup i)

theorem block1162_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (308 + i.val) = some (values1162[i.val]'(by rw [values1162_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1162_lookup i)

theorem block1162_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (308 + i.val) = (values1162[i.val]'(by rw [values1162_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1162_lookup i)

theorem block1163_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (340 + i.val) = some (values1163[i.val]'(by rw [values1163_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1163_lookup i)

theorem block1163_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (340 + i.val) = (values1163[i.val]'(by rw [values1163_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1163_lookup i)

theorem block1164_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 85 (372 + i.val) = some (values1164[i.val]'(by rw [values1164_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1164_lookup i)

theorem block1164_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 85 (372 + i.val) = (values1164[i.val]'(by rw [values1164_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1164_lookup i)

theorem block1165_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 85 (404 + i.val) = some (values1165[i.val]'(by rw [values1165_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row085_lookup _).trans (OriginalRow227TriangleLookupRow085.block1165_lookup i)

theorem block1165_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 85 (404 + i.val) = (values1165[i.val]'(by rw [values1165_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1165_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1155_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1155_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1156_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1156_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1157_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1157_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1158_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1158_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1159_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1159_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1160_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1160_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1161_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1161_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1162_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1162_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1163_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1163_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1164_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1164_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1165_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085.block1165_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085
