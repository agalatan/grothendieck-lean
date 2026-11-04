import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow110

theorem block1410_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (109 + i.val) = some (values1410[i.val]'(by rw [values1410_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1410_lookup i)

theorem block1410_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (109 + i.val) = (values1410[i.val]'(by rw [values1410_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1410_lookup i)

theorem block1411_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (141 + i.val) = some (values1411[i.val]'(by rw [values1411_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1411_lookup i)

theorem block1411_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (141 + i.val) = (values1411[i.val]'(by rw [values1411_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1411_lookup i)

theorem block1412_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (173 + i.val) = some (values1412[i.val]'(by rw [values1412_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1412_lookup i)

theorem block1412_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (173 + i.val) = (values1412[i.val]'(by rw [values1412_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1412_lookup i)

theorem block1413_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (205 + i.val) = some (values1413[i.val]'(by rw [values1413_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1413_lookup i)

theorem block1413_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (205 + i.val) = (values1413[i.val]'(by rw [values1413_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1413_lookup i)

theorem block1414_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (237 + i.val) = some (values1414[i.val]'(by rw [values1414_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1414_lookup i)

theorem block1414_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (237 + i.val) = (values1414[i.val]'(by rw [values1414_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1414_lookup i)

theorem block1415_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (269 + i.val) = some (values1415[i.val]'(by rw [values1415_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1415_lookup i)

theorem block1415_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (269 + i.val) = (values1415[i.val]'(by rw [values1415_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1415_lookup i)

theorem block1416_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (301 + i.val) = some (values1416[i.val]'(by rw [values1416_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1416_lookup i)

theorem block1416_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (301 + i.val) = (values1416[i.val]'(by rw [values1416_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1416_lookup i)

theorem block1417_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 110 (333 + i.val) = some (values1417[i.val]'(by rw [values1417_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1417_lookup i)

theorem block1417_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 110 (333 + i.val) = (values1417[i.val]'(by rw [values1417_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1417_lookup i)

theorem block1418_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 110 (365 + i.val) = some (values1418[i.val]'(by rw [values1418_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row110_lookup _).trans (OriginalRow227TriangleLookupRow110.block1418_lookup i)

theorem block1418_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 110 (365 + i.val) = (values1418[i.val]'(by rw [values1418_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1418_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1410_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1410_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1411_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1411_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1412_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1412_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1413_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1413_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1414_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1414_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1415_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1415_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1416_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1416_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1417_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1417_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1418_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110.block1418_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110
