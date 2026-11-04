import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow080

theorem block1100_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (79 + i.val) = some (values1100[i.val]'(by rw [values1100_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1100_lookup i)

theorem block1100_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (79 + i.val) = (values1100[i.val]'(by rw [values1100_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1100_lookup i)

theorem block1101_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (111 + i.val) = some (values1101[i.val]'(by rw [values1101_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1101_lookup i)

theorem block1101_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (111 + i.val) = (values1101[i.val]'(by rw [values1101_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1101_lookup i)

theorem block1102_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (143 + i.val) = some (values1102[i.val]'(by rw [values1102_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1102_lookup i)

theorem block1102_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (143 + i.val) = (values1102[i.val]'(by rw [values1102_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1102_lookup i)

theorem block1103_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (175 + i.val) = some (values1103[i.val]'(by rw [values1103_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1103_lookup i)

theorem block1103_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (175 + i.val) = (values1103[i.val]'(by rw [values1103_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1103_lookup i)

theorem block1104_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (207 + i.val) = some (values1104[i.val]'(by rw [values1104_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1104_lookup i)

theorem block1104_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (207 + i.val) = (values1104[i.val]'(by rw [values1104_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1104_lookup i)

theorem block1105_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (239 + i.val) = some (values1105[i.val]'(by rw [values1105_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1105_lookup i)

theorem block1105_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (239 + i.val) = (values1105[i.val]'(by rw [values1105_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1105_lookup i)

theorem block1106_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (271 + i.val) = some (values1106[i.val]'(by rw [values1106_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1106_lookup i)

theorem block1106_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (271 + i.val) = (values1106[i.val]'(by rw [values1106_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1106_lookup i)

theorem block1107_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (303 + i.val) = some (values1107[i.val]'(by rw [values1107_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1107_lookup i)

theorem block1107_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (303 + i.val) = (values1107[i.val]'(by rw [values1107_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1107_lookup i)

theorem block1108_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (335 + i.val) = some (values1108[i.val]'(by rw [values1108_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1108_lookup i)

theorem block1108_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (335 + i.val) = (values1108[i.val]'(by rw [values1108_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1108_lookup i)

theorem block1109_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 80 (367 + i.val) = some (values1109[i.val]'(by rw [values1109_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1109_lookup i)

theorem block1109_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 80 (367 + i.val) = (values1109[i.val]'(by rw [values1109_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1109_lookup i)

theorem block1110_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 80 (399 + i.val) = some (values1110[i.val]'(by rw [values1110_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row080_lookup _).trans (OriginalRow227TriangleLookupRow080.block1110_lookup i)

theorem block1110_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 80 (399 + i.val) = (values1110[i.val]'(by rw [values1110_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1110_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1100_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1100_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1101_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1101_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1102_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1102_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1103_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1103_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1104_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1104_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1105_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1105_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1106_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1106_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1107_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1107_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1108_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1108_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1109_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1109_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1110_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080.block1110_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080
