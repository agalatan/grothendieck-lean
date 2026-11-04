import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow114

theorem block1446_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (113 + i.val) = some (values1446[i.val]'(by rw [values1446_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1446_lookup i)

theorem block1446_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (113 + i.val) = (values1446[i.val]'(by rw [values1446_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1446_lookup i)

theorem block1447_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (145 + i.val) = some (values1447[i.val]'(by rw [values1447_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1447_lookup i)

theorem block1447_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (145 + i.val) = (values1447[i.val]'(by rw [values1447_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1447_lookup i)

theorem block1448_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (177 + i.val) = some (values1448[i.val]'(by rw [values1448_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1448_lookup i)

theorem block1448_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (177 + i.val) = (values1448[i.val]'(by rw [values1448_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1448_lookup i)

theorem block1449_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (209 + i.val) = some (values1449[i.val]'(by rw [values1449_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1449_lookup i)

theorem block1449_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (209 + i.val) = (values1449[i.val]'(by rw [values1449_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1449_lookup i)

theorem block1450_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (241 + i.val) = some (values1450[i.val]'(by rw [values1450_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1450_lookup i)

theorem block1450_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (241 + i.val) = (values1450[i.val]'(by rw [values1450_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1450_lookup i)

theorem block1451_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (273 + i.val) = some (values1451[i.val]'(by rw [values1451_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1451_lookup i)

theorem block1451_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (273 + i.val) = (values1451[i.val]'(by rw [values1451_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1451_lookup i)

theorem block1452_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (305 + i.val) = some (values1452[i.val]'(by rw [values1452_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1452_lookup i)

theorem block1452_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (305 + i.val) = (values1452[i.val]'(by rw [values1452_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1452_lookup i)

theorem block1453_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 114 (337 + i.val) = some (values1453[i.val]'(by rw [values1453_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1453_lookup i)

theorem block1453_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 114 (337 + i.val) = (values1453[i.val]'(by rw [values1453_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1453_lookup i)

theorem block1454_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 114 (369 + i.val) = some (values1454[i.val]'(by rw [values1454_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row114_lookup _).trans (OriginalRow227TriangleLookupRow114.block1454_lookup i)

theorem block1454_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 114 (369 + i.val) = (values1454[i.val]'(by rw [values1454_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1454_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1446_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1446_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1447_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1447_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1448_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1448_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1449_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1449_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1450_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1450_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1451_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1451_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1452_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1452_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1453_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1453_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1454_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114.block1454_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114
