import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow074

theorem block1032_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (73 + i.val) = some (values1032[i.val]'(by rw [values1032_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1032_lookup i)

theorem block1032_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (73 + i.val) = (values1032[i.val]'(by rw [values1032_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1032_lookup i)

theorem block1033_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (105 + i.val) = some (values1033[i.val]'(by rw [values1033_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1033_lookup i)

theorem block1033_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (105 + i.val) = (values1033[i.val]'(by rw [values1033_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1033_lookup i)

theorem block1034_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (137 + i.val) = some (values1034[i.val]'(by rw [values1034_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1034_lookup i)

theorem block1034_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (137 + i.val) = (values1034[i.val]'(by rw [values1034_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1034_lookup i)

theorem block1035_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (169 + i.val) = some (values1035[i.val]'(by rw [values1035_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1035_lookup i)

theorem block1035_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (169 + i.val) = (values1035[i.val]'(by rw [values1035_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1035_lookup i)

theorem block1036_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (201 + i.val) = some (values1036[i.val]'(by rw [values1036_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1036_lookup i)

theorem block1036_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (201 + i.val) = (values1036[i.val]'(by rw [values1036_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1036_lookup i)

theorem block1037_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (233 + i.val) = some (values1037[i.val]'(by rw [values1037_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1037_lookup i)

theorem block1037_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (233 + i.val) = (values1037[i.val]'(by rw [values1037_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1037_lookup i)

theorem block1038_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (265 + i.val) = some (values1038[i.val]'(by rw [values1038_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1038_lookup i)

theorem block1038_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (265 + i.val) = (values1038[i.val]'(by rw [values1038_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1038_lookup i)

theorem block1039_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (297 + i.val) = some (values1039[i.val]'(by rw [values1039_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1039_lookup i)

theorem block1039_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (297 + i.val) = (values1039[i.val]'(by rw [values1039_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1039_lookup i)

theorem block1040_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (329 + i.val) = some (values1040[i.val]'(by rw [values1040_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1040_lookup i)

theorem block1040_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (329 + i.val) = (values1040[i.val]'(by rw [values1040_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1040_lookup i)

theorem block1041_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (361 + i.val) = some (values1041[i.val]'(by rw [values1041_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1041_lookup i)

theorem block1041_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (361 + i.val) = (values1041[i.val]'(by rw [values1041_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1041_lookup i)

theorem block1042_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 74 (393 + i.val) = some (values1042[i.val]'(by rw [values1042_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1042_lookup i)

theorem block1042_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 74 (393 + i.val) = (values1042[i.val]'(by rw [values1042_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1042_lookup i)

theorem block1043_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 74 (425 + i.val) = some (values1043[i.val]'(by rw [values1043_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row074_lookup _).trans (OriginalRow227TriangleLookupRow074.block1043_lookup i)

theorem block1043_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 74 (425 + i.val) = (values1043[i.val]'(by rw [values1043_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1043_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1032_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1032_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1033_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1033_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1034_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1034_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1035_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1035_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1036_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1036_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1037_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1037_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1038_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1038_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1039_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1039_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1040_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1040_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1041_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1041_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1042_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1042_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1043_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074.block1043_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074
