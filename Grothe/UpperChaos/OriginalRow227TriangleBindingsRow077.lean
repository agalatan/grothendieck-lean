import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow077

theorem block1067_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (76 + i.val) = some (values1067[i.val]'(by rw [values1067_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1067_lookup i)

theorem block1067_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (76 + i.val) = (values1067[i.val]'(by rw [values1067_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1067_lookup i)

theorem block1068_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (108 + i.val) = some (values1068[i.val]'(by rw [values1068_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1068_lookup i)

theorem block1068_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (108 + i.val) = (values1068[i.val]'(by rw [values1068_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1068_lookup i)

theorem block1069_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (140 + i.val) = some (values1069[i.val]'(by rw [values1069_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1069_lookup i)

theorem block1069_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (140 + i.val) = (values1069[i.val]'(by rw [values1069_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1069_lookup i)

theorem block1070_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (172 + i.val) = some (values1070[i.val]'(by rw [values1070_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1070_lookup i)

theorem block1070_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (172 + i.val) = (values1070[i.val]'(by rw [values1070_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1070_lookup i)

theorem block1071_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (204 + i.val) = some (values1071[i.val]'(by rw [values1071_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1071_lookup i)

theorem block1071_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (204 + i.val) = (values1071[i.val]'(by rw [values1071_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1071_lookup i)

theorem block1072_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (236 + i.val) = some (values1072[i.val]'(by rw [values1072_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1072_lookup i)

theorem block1072_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (236 + i.val) = (values1072[i.val]'(by rw [values1072_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1072_lookup i)

theorem block1073_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (268 + i.val) = some (values1073[i.val]'(by rw [values1073_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1073_lookup i)

theorem block1073_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (268 + i.val) = (values1073[i.val]'(by rw [values1073_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1073_lookup i)

theorem block1074_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (300 + i.val) = some (values1074[i.val]'(by rw [values1074_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1074_lookup i)

theorem block1074_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (300 + i.val) = (values1074[i.val]'(by rw [values1074_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1074_lookup i)

theorem block1075_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (332 + i.val) = some (values1075[i.val]'(by rw [values1075_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1075_lookup i)

theorem block1075_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (332 + i.val) = (values1075[i.val]'(by rw [values1075_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1075_lookup i)

theorem block1076_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 77 (364 + i.val) = some (values1076[i.val]'(by rw [values1076_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1076_lookup i)

theorem block1076_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 77 (364 + i.val) = (values1076[i.val]'(by rw [values1076_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1076_lookup i)

theorem block1077_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 77 (396 + i.val) = some (values1077[i.val]'(by rw [values1077_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row077_lookup _).trans (OriginalRow227TriangleLookupRow077.block1077_lookup i)

theorem block1077_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 77 (396 + i.val) = (values1077[i.val]'(by rw [values1077_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1077_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1067_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1067_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1068_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1068_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1069_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1069_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1070_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1070_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1071_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1071_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1072_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1072_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1073_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1073_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1074_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1074_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1075_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1075_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1076_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1076_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1077_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077.block1077_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077
