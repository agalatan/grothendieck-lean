import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow084

theorem block1144_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (83 + i.val) = some (values1144[i.val]'(by rw [values1144_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1144_lookup i)

theorem block1144_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (83 + i.val) = (values1144[i.val]'(by rw [values1144_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1144_lookup i)

theorem block1145_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (115 + i.val) = some (values1145[i.val]'(by rw [values1145_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1145_lookup i)

theorem block1145_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (115 + i.val) = (values1145[i.val]'(by rw [values1145_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1145_lookup i)

theorem block1146_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (147 + i.val) = some (values1146[i.val]'(by rw [values1146_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1146_lookup i)

theorem block1146_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (147 + i.val) = (values1146[i.val]'(by rw [values1146_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1146_lookup i)

theorem block1147_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (179 + i.val) = some (values1147[i.val]'(by rw [values1147_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1147_lookup i)

theorem block1147_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (179 + i.val) = (values1147[i.val]'(by rw [values1147_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1147_lookup i)

theorem block1148_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (211 + i.val) = some (values1148[i.val]'(by rw [values1148_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1148_lookup i)

theorem block1148_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (211 + i.val) = (values1148[i.val]'(by rw [values1148_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1148_lookup i)

theorem block1149_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (243 + i.val) = some (values1149[i.val]'(by rw [values1149_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1149_lookup i)

theorem block1149_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (243 + i.val) = (values1149[i.val]'(by rw [values1149_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1149_lookup i)

theorem block1150_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (275 + i.val) = some (values1150[i.val]'(by rw [values1150_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1150_lookup i)

theorem block1150_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (275 + i.val) = (values1150[i.val]'(by rw [values1150_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1150_lookup i)

theorem block1151_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (307 + i.val) = some (values1151[i.val]'(by rw [values1151_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1151_lookup i)

theorem block1151_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (307 + i.val) = (values1151[i.val]'(by rw [values1151_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1151_lookup i)

theorem block1152_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (339 + i.val) = some (values1152[i.val]'(by rw [values1152_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1152_lookup i)

theorem block1152_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (339 + i.val) = (values1152[i.val]'(by rw [values1152_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1152_lookup i)

theorem block1153_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 84 (371 + i.val) = some (values1153[i.val]'(by rw [values1153_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1153_lookup i)

theorem block1153_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 84 (371 + i.val) = (values1153[i.val]'(by rw [values1153_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1153_lookup i)

theorem block1154_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 84 (403 + i.val) = some (values1154[i.val]'(by rw [values1154_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row084_lookup _).trans (OriginalRow227TriangleLookupRow084.block1154_lookup i)

theorem block1154_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 84 (403 + i.val) = (values1154[i.val]'(by rw [values1154_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1154_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1144_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1144_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1145_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1145_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1146_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1146_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1147_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1147_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1148_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1148_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1149_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1149_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1150_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1150_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1151_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1151_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1152_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1152_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1153_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1153_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1154_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084.block1154_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084
