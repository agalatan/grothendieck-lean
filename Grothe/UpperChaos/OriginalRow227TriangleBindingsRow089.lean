import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow089

theorem block1199_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (88 + i.val) = some (values1199[i.val]'(by rw [values1199_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1199_lookup i)

theorem block1199_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (88 + i.val) = (values1199[i.val]'(by rw [values1199_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1199_lookup i)

theorem block1200_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (120 + i.val) = some (values1200[i.val]'(by rw [values1200_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1200_lookup i)

theorem block1200_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (120 + i.val) = (values1200[i.val]'(by rw [values1200_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1200_lookup i)

theorem block1201_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (152 + i.val) = some (values1201[i.val]'(by rw [values1201_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1201_lookup i)

theorem block1201_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (152 + i.val) = (values1201[i.val]'(by rw [values1201_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1201_lookup i)

theorem block1202_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (184 + i.val) = some (values1202[i.val]'(by rw [values1202_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1202_lookup i)

theorem block1202_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (184 + i.val) = (values1202[i.val]'(by rw [values1202_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1202_lookup i)

theorem block1203_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (216 + i.val) = some (values1203[i.val]'(by rw [values1203_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1203_lookup i)

theorem block1203_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (216 + i.val) = (values1203[i.val]'(by rw [values1203_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1203_lookup i)

theorem block1204_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (248 + i.val) = some (values1204[i.val]'(by rw [values1204_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1204_lookup i)

theorem block1204_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (248 + i.val) = (values1204[i.val]'(by rw [values1204_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1204_lookup i)

theorem block1205_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (280 + i.val) = some (values1205[i.val]'(by rw [values1205_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1205_lookup i)

theorem block1205_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (280 + i.val) = (values1205[i.val]'(by rw [values1205_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1205_lookup i)

theorem block1206_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (312 + i.val) = some (values1206[i.val]'(by rw [values1206_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1206_lookup i)

theorem block1206_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (312 + i.val) = (values1206[i.val]'(by rw [values1206_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1206_lookup i)

theorem block1207_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (344 + i.val) = some (values1207[i.val]'(by rw [values1207_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1207_lookup i)

theorem block1207_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (344 + i.val) = (values1207[i.val]'(by rw [values1207_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1207_lookup i)

theorem block1208_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 89 (376 + i.val) = some (values1208[i.val]'(by rw [values1208_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1208_lookup i)

theorem block1208_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 89 (376 + i.val) = (values1208[i.val]'(by rw [values1208_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1208_lookup i)

theorem block1209_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 89 (408 + i.val) = some (values1209[i.val]'(by rw [values1209_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row089_lookup _).trans (OriginalRow227TriangleLookupRow089.block1209_lookup i)

theorem block1209_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 89 (408 + i.val) = (values1209[i.val]'(by rw [values1209_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1209_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1199_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1199_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1200_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1200_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1201_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1201_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1202_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1202_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1203_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1203_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1204_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1204_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1205_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1205_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1206_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1206_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1207_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1207_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1208_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1208_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1209_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089.block1209_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089
