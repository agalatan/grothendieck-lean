import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow006

theorem block0096_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (5 + i.val) = some (values0096[i.val]'(by rw [values0096_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0096_lookup i)

theorem block0096_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (5 + i.val) = (values0096[i.val]'(by rw [values0096_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0096_lookup i)

theorem block0097_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (37 + i.val) = some (values0097[i.val]'(by rw [values0097_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0097_lookup i)

theorem block0097_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (37 + i.val) = (values0097[i.val]'(by rw [values0097_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0097_lookup i)

theorem block0098_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (69 + i.val) = some (values0098[i.val]'(by rw [values0098_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0098_lookup i)

theorem block0098_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (69 + i.val) = (values0098[i.val]'(by rw [values0098_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0098_lookup i)

theorem block0099_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (101 + i.val) = some (values0099[i.val]'(by rw [values0099_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0099_lookup i)

theorem block0099_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (101 + i.val) = (values0099[i.val]'(by rw [values0099_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0099_lookup i)

theorem block0100_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (133 + i.val) = some (values0100[i.val]'(by rw [values0100_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0100_lookup i)

theorem block0100_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (133 + i.val) = (values0100[i.val]'(by rw [values0100_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0100_lookup i)

theorem block0101_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (165 + i.val) = some (values0101[i.val]'(by rw [values0101_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0101_lookup i)

theorem block0101_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (165 + i.val) = (values0101[i.val]'(by rw [values0101_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0101_lookup i)

theorem block0102_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (197 + i.val) = some (values0102[i.val]'(by rw [values0102_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0102_lookup i)

theorem block0102_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (197 + i.val) = (values0102[i.val]'(by rw [values0102_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0102_lookup i)

theorem block0103_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (229 + i.val) = some (values0103[i.val]'(by rw [values0103_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0103_lookup i)

theorem block0103_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (229 + i.val) = (values0103[i.val]'(by rw [values0103_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0103_lookup i)

theorem block0104_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (261 + i.val) = some (values0104[i.val]'(by rw [values0104_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0104_lookup i)

theorem block0104_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (261 + i.val) = (values0104[i.val]'(by rw [values0104_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0104_lookup i)

theorem block0105_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (293 + i.val) = some (values0105[i.val]'(by rw [values0105_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0105_lookup i)

theorem block0105_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (293 + i.val) = (values0105[i.val]'(by rw [values0105_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0105_lookup i)

theorem block0106_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (325 + i.val) = some (values0106[i.val]'(by rw [values0106_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0106_lookup i)

theorem block0106_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (325 + i.val) = (values0106[i.val]'(by rw [values0106_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0106_lookup i)

theorem block0107_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (357 + i.val) = some (values0107[i.val]'(by rw [values0107_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0107_lookup i)

theorem block0107_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (357 + i.val) = (values0107[i.val]'(by rw [values0107_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0107_lookup i)

theorem block0108_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (389 + i.val) = some (values0108[i.val]'(by rw [values0108_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0108_lookup i)

theorem block0108_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (389 + i.val) = (values0108[i.val]'(by rw [values0108_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0108_lookup i)

theorem block0109_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (421 + i.val) = some (values0109[i.val]'(by rw [values0109_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0109_lookup i)

theorem block0109_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (421 + i.val) = (values0109[i.val]'(by rw [values0109_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0109_lookup i)

theorem block0110_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 6 (453 + i.val) = some (values0110[i.val]'(by rw [values0110_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0110_lookup i)

theorem block0110_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 6 (453 + i.val) = (values0110[i.val]'(by rw [values0110_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0110_lookup i)

theorem block0111_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 6 (485 + i.val) = some (values0111[i.val]'(by rw [values0111_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row006_lookup _).trans (OriginalRow227TriangleLookupRow006.block0111_lookup i)

theorem block0111_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 6 (485 + i.val) = (values0111[i.val]'(by rw [values0111_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0111_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0096_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0096_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0097_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0097_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0098_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0098_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0099_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0099_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0100_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0100_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0101_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0101_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0102_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0102_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0103_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0103_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0104_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0104_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0105_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0105_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0106_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0106_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0107_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0107_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0108_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0108_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0109_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0109_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0110_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0110_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0111_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006.block0111_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006
