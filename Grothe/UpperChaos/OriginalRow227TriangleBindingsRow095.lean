import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow095

theorem block1262_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (94 + i.val) = some (values1262[i.val]'(by rw [values1262_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1262_lookup i)

theorem block1262_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (94 + i.val) = (values1262[i.val]'(by rw [values1262_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1262_lookup i)

theorem block1263_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (126 + i.val) = some (values1263[i.val]'(by rw [values1263_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1263_lookup i)

theorem block1263_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (126 + i.val) = (values1263[i.val]'(by rw [values1263_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1263_lookup i)

theorem block1264_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (158 + i.val) = some (values1264[i.val]'(by rw [values1264_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1264_lookup i)

theorem block1264_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (158 + i.val) = (values1264[i.val]'(by rw [values1264_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1264_lookup i)

theorem block1265_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (190 + i.val) = some (values1265[i.val]'(by rw [values1265_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1265_lookup i)

theorem block1265_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (190 + i.val) = (values1265[i.val]'(by rw [values1265_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1265_lookup i)

theorem block1266_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (222 + i.val) = some (values1266[i.val]'(by rw [values1266_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1266_lookup i)

theorem block1266_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (222 + i.val) = (values1266[i.val]'(by rw [values1266_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1266_lookup i)

theorem block1267_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (254 + i.val) = some (values1267[i.val]'(by rw [values1267_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1267_lookup i)

theorem block1267_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (254 + i.val) = (values1267[i.val]'(by rw [values1267_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1267_lookup i)

theorem block1268_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (286 + i.val) = some (values1268[i.val]'(by rw [values1268_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1268_lookup i)

theorem block1268_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (286 + i.val) = (values1268[i.val]'(by rw [values1268_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1268_lookup i)

theorem block1269_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (318 + i.val) = some (values1269[i.val]'(by rw [values1269_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1269_lookup i)

theorem block1269_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (318 + i.val) = (values1269[i.val]'(by rw [values1269_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1269_lookup i)

theorem block1270_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 95 (350 + i.val) = some (values1270[i.val]'(by rw [values1270_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1270_lookup i)

theorem block1270_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 95 (350 + i.val) = (values1270[i.val]'(by rw [values1270_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1270_lookup i)

theorem block1271_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 95 (382 + i.val) = some (values1271[i.val]'(by rw [values1271_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row095_lookup _).trans (OriginalRow227TriangleLookupRow095.block1271_lookup i)

theorem block1271_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 95 (382 + i.val) = (values1271[i.val]'(by rw [values1271_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1271_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1262_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1262_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1263_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1263_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1264_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1264_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1265_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1265_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1266_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1266_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1267_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1267_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1268_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1268_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1269_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1269_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1270_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1270_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1271_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095.block1271_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095
