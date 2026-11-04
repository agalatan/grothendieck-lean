import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow092

theorem block1232_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (91 + i.val) = some (values1232[i.val]'(by rw [values1232_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1232_lookup i)

theorem block1232_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (91 + i.val) = (values1232[i.val]'(by rw [values1232_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1232_lookup i)

theorem block1233_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (123 + i.val) = some (values1233[i.val]'(by rw [values1233_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1233_lookup i)

theorem block1233_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (123 + i.val) = (values1233[i.val]'(by rw [values1233_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1233_lookup i)

theorem block1234_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (155 + i.val) = some (values1234[i.val]'(by rw [values1234_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1234_lookup i)

theorem block1234_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (155 + i.val) = (values1234[i.val]'(by rw [values1234_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1234_lookup i)

theorem block1235_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (187 + i.val) = some (values1235[i.val]'(by rw [values1235_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1235_lookup i)

theorem block1235_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (187 + i.val) = (values1235[i.val]'(by rw [values1235_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1235_lookup i)

theorem block1236_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (219 + i.val) = some (values1236[i.val]'(by rw [values1236_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1236_lookup i)

theorem block1236_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (219 + i.val) = (values1236[i.val]'(by rw [values1236_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1236_lookup i)

theorem block1237_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (251 + i.val) = some (values1237[i.val]'(by rw [values1237_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1237_lookup i)

theorem block1237_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (251 + i.val) = (values1237[i.val]'(by rw [values1237_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1237_lookup i)

theorem block1238_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (283 + i.val) = some (values1238[i.val]'(by rw [values1238_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1238_lookup i)

theorem block1238_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (283 + i.val) = (values1238[i.val]'(by rw [values1238_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1238_lookup i)

theorem block1239_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (315 + i.val) = some (values1239[i.val]'(by rw [values1239_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1239_lookup i)

theorem block1239_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (315 + i.val) = (values1239[i.val]'(by rw [values1239_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1239_lookup i)

theorem block1240_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 92 (347 + i.val) = some (values1240[i.val]'(by rw [values1240_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1240_lookup i)

theorem block1240_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 92 (347 + i.val) = (values1240[i.val]'(by rw [values1240_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1240_lookup i)

theorem block1241_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 92 (379 + i.val) = some (values1241[i.val]'(by rw [values1241_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row092_lookup _).trans (OriginalRow227TriangleLookupRow092.block1241_lookup i)

theorem block1241_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 92 (379 + i.val) = (values1241[i.val]'(by rw [values1241_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1241_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1232_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1232_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1233_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1233_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1234_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1234_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1235_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1235_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1236_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1236_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1237_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1237_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1238_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1238_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1239_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1239_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1240_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1240_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1241_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092.block1241_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092
