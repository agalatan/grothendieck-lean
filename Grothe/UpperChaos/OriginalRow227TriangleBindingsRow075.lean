import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow075

theorem block1044_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (74 + i.val) = some (values1044[i.val]'(by rw [values1044_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1044_lookup i)

theorem block1044_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (74 + i.val) = (values1044[i.val]'(by rw [values1044_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1044_lookup i)

theorem block1045_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (106 + i.val) = some (values1045[i.val]'(by rw [values1045_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1045_lookup i)

theorem block1045_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (106 + i.val) = (values1045[i.val]'(by rw [values1045_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1045_lookup i)

theorem block1046_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (138 + i.val) = some (values1046[i.val]'(by rw [values1046_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1046_lookup i)

theorem block1046_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (138 + i.val) = (values1046[i.val]'(by rw [values1046_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1046_lookup i)

theorem block1047_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (170 + i.val) = some (values1047[i.val]'(by rw [values1047_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1047_lookup i)

theorem block1047_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (170 + i.val) = (values1047[i.val]'(by rw [values1047_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1047_lookup i)

theorem block1048_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (202 + i.val) = some (values1048[i.val]'(by rw [values1048_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1048_lookup i)

theorem block1048_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (202 + i.val) = (values1048[i.val]'(by rw [values1048_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1048_lookup i)

theorem block1049_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (234 + i.val) = some (values1049[i.val]'(by rw [values1049_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1049_lookup i)

theorem block1049_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (234 + i.val) = (values1049[i.val]'(by rw [values1049_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1049_lookup i)

theorem block1050_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (266 + i.val) = some (values1050[i.val]'(by rw [values1050_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1050_lookup i)

theorem block1050_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (266 + i.val) = (values1050[i.val]'(by rw [values1050_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1050_lookup i)

theorem block1051_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (298 + i.val) = some (values1051[i.val]'(by rw [values1051_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1051_lookup i)

theorem block1051_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (298 + i.val) = (values1051[i.val]'(by rw [values1051_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1051_lookup i)

theorem block1052_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (330 + i.val) = some (values1052[i.val]'(by rw [values1052_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1052_lookup i)

theorem block1052_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (330 + i.val) = (values1052[i.val]'(by rw [values1052_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1052_lookup i)

theorem block1053_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (362 + i.val) = some (values1053[i.val]'(by rw [values1053_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1053_lookup i)

theorem block1053_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (362 + i.val) = (values1053[i.val]'(by rw [values1053_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1053_lookup i)

theorem block1054_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 75 (394 + i.val) = some (values1054[i.val]'(by rw [values1054_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1054_lookup i)

theorem block1054_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 75 (394 + i.val) = (values1054[i.val]'(by rw [values1054_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1054_lookup i)

theorem block1055_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 75 (426 + i.val) = some (values1055[i.val]'(by rw [values1055_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row075_lookup _).trans (OriginalRow227TriangleLookupRow075.block1055_lookup i)

theorem block1055_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 75 (426 + i.val) = (values1055[i.val]'(by rw [values1055_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1055_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1044_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1044_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1045_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1045_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1046_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1046_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1047_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1047_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1048_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1048_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1049_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1049_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1050_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1050_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1051_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1051_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1052_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1052_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1053_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1053_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1054_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1054_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1055_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075.block1055_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075
