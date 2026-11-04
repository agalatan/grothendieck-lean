import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow076

theorem block1056_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (75 + i.val) = some (values1056[i.val]'(by rw [values1056_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1056_lookup i)

theorem block1056_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (75 + i.val) = (values1056[i.val]'(by rw [values1056_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1056_lookup i)

theorem block1057_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (107 + i.val) = some (values1057[i.val]'(by rw [values1057_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1057_lookup i)

theorem block1057_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (107 + i.val) = (values1057[i.val]'(by rw [values1057_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1057_lookup i)

theorem block1058_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (139 + i.val) = some (values1058[i.val]'(by rw [values1058_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1058_lookup i)

theorem block1058_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (139 + i.val) = (values1058[i.val]'(by rw [values1058_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1058_lookup i)

theorem block1059_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (171 + i.val) = some (values1059[i.val]'(by rw [values1059_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1059_lookup i)

theorem block1059_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (171 + i.val) = (values1059[i.val]'(by rw [values1059_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1059_lookup i)

theorem block1060_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (203 + i.val) = some (values1060[i.val]'(by rw [values1060_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1060_lookup i)

theorem block1060_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (203 + i.val) = (values1060[i.val]'(by rw [values1060_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1060_lookup i)

theorem block1061_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (235 + i.val) = some (values1061[i.val]'(by rw [values1061_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1061_lookup i)

theorem block1061_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (235 + i.val) = (values1061[i.val]'(by rw [values1061_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1061_lookup i)

theorem block1062_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (267 + i.val) = some (values1062[i.val]'(by rw [values1062_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1062_lookup i)

theorem block1062_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (267 + i.val) = (values1062[i.val]'(by rw [values1062_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1062_lookup i)

theorem block1063_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (299 + i.val) = some (values1063[i.val]'(by rw [values1063_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1063_lookup i)

theorem block1063_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (299 + i.val) = (values1063[i.val]'(by rw [values1063_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1063_lookup i)

theorem block1064_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (331 + i.val) = some (values1064[i.val]'(by rw [values1064_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1064_lookup i)

theorem block1064_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (331 + i.val) = (values1064[i.val]'(by rw [values1064_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1064_lookup i)

theorem block1065_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 76 (363 + i.val) = some (values1065[i.val]'(by rw [values1065_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1065_lookup i)

theorem block1065_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 76 (363 + i.val) = (values1065[i.val]'(by rw [values1065_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1065_lookup i)

theorem block1066_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 76 (395 + i.val) = some (values1066[i.val]'(by rw [values1066_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row076_lookup _).trans (OriginalRow227TriangleLookupRow076.block1066_lookup i)

theorem block1066_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 76 (395 + i.val) = (values1066[i.val]'(by rw [values1066_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1066_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1056_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1056_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1057_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1057_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1058_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1058_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1059_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1059_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1060_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1060_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1061_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1061_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1062_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1062_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1063_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1063_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1064_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1064_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1065_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1065_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1066_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076.block1066_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076
