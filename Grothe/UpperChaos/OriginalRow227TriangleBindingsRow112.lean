import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow112

theorem block1428_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (111 + i.val) = some (values1428[i.val]'(by rw [values1428_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1428_lookup i)

theorem block1428_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (111 + i.val) = (values1428[i.val]'(by rw [values1428_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1428_lookup i)

theorem block1429_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (143 + i.val) = some (values1429[i.val]'(by rw [values1429_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1429_lookup i)

theorem block1429_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (143 + i.val) = (values1429[i.val]'(by rw [values1429_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1429_lookup i)

theorem block1430_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (175 + i.val) = some (values1430[i.val]'(by rw [values1430_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1430_lookup i)

theorem block1430_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (175 + i.val) = (values1430[i.val]'(by rw [values1430_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1430_lookup i)

theorem block1431_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (207 + i.val) = some (values1431[i.val]'(by rw [values1431_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1431_lookup i)

theorem block1431_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (207 + i.val) = (values1431[i.val]'(by rw [values1431_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1431_lookup i)

theorem block1432_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (239 + i.val) = some (values1432[i.val]'(by rw [values1432_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1432_lookup i)

theorem block1432_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (239 + i.val) = (values1432[i.val]'(by rw [values1432_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1432_lookup i)

theorem block1433_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (271 + i.val) = some (values1433[i.val]'(by rw [values1433_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1433_lookup i)

theorem block1433_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (271 + i.val) = (values1433[i.val]'(by rw [values1433_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1433_lookup i)

theorem block1434_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (303 + i.val) = some (values1434[i.val]'(by rw [values1434_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1434_lookup i)

theorem block1434_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (303 + i.val) = (values1434[i.val]'(by rw [values1434_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1434_lookup i)

theorem block1435_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 112 (335 + i.val) = some (values1435[i.val]'(by rw [values1435_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1435_lookup i)

theorem block1435_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 112 (335 + i.val) = (values1435[i.val]'(by rw [values1435_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1435_lookup i)

theorem block1436_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 112 (367 + i.val) = some (values1436[i.val]'(by rw [values1436_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row112_lookup _).trans (OriginalRow227TriangleLookupRow112.block1436_lookup i)

theorem block1436_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 112 (367 + i.val) = (values1436[i.val]'(by rw [values1436_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1436_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1428_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1428_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1429_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1429_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1430_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1430_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1431_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1431_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1432_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1432_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1433_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1433_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1434_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1434_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1435_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1435_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1436_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112.block1436_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112
