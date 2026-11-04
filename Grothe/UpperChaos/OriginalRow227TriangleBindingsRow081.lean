import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow081

theorem block1111_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (80 + i.val) = some (values1111[i.val]'(by rw [values1111_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1111_lookup i)

theorem block1111_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (80 + i.val) = (values1111[i.val]'(by rw [values1111_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1111_lookup i)

theorem block1112_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (112 + i.val) = some (values1112[i.val]'(by rw [values1112_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1112_lookup i)

theorem block1112_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (112 + i.val) = (values1112[i.val]'(by rw [values1112_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1112_lookup i)

theorem block1113_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (144 + i.val) = some (values1113[i.val]'(by rw [values1113_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1113_lookup i)

theorem block1113_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (144 + i.val) = (values1113[i.val]'(by rw [values1113_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1113_lookup i)

theorem block1114_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (176 + i.val) = some (values1114[i.val]'(by rw [values1114_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1114_lookup i)

theorem block1114_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (176 + i.val) = (values1114[i.val]'(by rw [values1114_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1114_lookup i)

theorem block1115_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (208 + i.val) = some (values1115[i.val]'(by rw [values1115_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1115_lookup i)

theorem block1115_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (208 + i.val) = (values1115[i.val]'(by rw [values1115_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1115_lookup i)

theorem block1116_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (240 + i.val) = some (values1116[i.val]'(by rw [values1116_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1116_lookup i)

theorem block1116_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (240 + i.val) = (values1116[i.val]'(by rw [values1116_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1116_lookup i)

theorem block1117_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (272 + i.val) = some (values1117[i.val]'(by rw [values1117_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1117_lookup i)

theorem block1117_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (272 + i.val) = (values1117[i.val]'(by rw [values1117_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1117_lookup i)

theorem block1118_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (304 + i.val) = some (values1118[i.val]'(by rw [values1118_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1118_lookup i)

theorem block1118_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (304 + i.val) = (values1118[i.val]'(by rw [values1118_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1118_lookup i)

theorem block1119_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (336 + i.val) = some (values1119[i.val]'(by rw [values1119_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1119_lookup i)

theorem block1119_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (336 + i.val) = (values1119[i.val]'(by rw [values1119_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1119_lookup i)

theorem block1120_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 81 (368 + i.val) = some (values1120[i.val]'(by rw [values1120_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1120_lookup i)

theorem block1120_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 81 (368 + i.val) = (values1120[i.val]'(by rw [values1120_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1120_lookup i)

theorem block1121_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 81 (400 + i.val) = some (values1121[i.val]'(by rw [values1121_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row081_lookup _).trans (OriginalRow227TriangleLookupRow081.block1121_lookup i)

theorem block1121_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 81 (400 + i.val) = (values1121[i.val]'(by rw [values1121_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1121_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1111_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1111_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1112_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1112_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1113_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1113_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1114_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1114_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1115_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1115_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1116_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1116_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1117_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1117_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1118_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1118_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1119_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1119_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1120_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1120_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1121_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081.block1121_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081
