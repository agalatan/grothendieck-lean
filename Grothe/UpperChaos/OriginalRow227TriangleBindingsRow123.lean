import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow123

theorem block1527_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (122 + i.val) = some (values1527[i.val]'(by rw [values1527_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1527_lookup i)

theorem block1527_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (122 + i.val) = (values1527[i.val]'(by rw [values1527_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1527_lookup i)

theorem block1528_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (154 + i.val) = some (values1528[i.val]'(by rw [values1528_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1528_lookup i)

theorem block1528_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (154 + i.val) = (values1528[i.val]'(by rw [values1528_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1528_lookup i)

theorem block1529_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (186 + i.val) = some (values1529[i.val]'(by rw [values1529_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1529_lookup i)

theorem block1529_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (186 + i.val) = (values1529[i.val]'(by rw [values1529_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1529_lookup i)

theorem block1530_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (218 + i.val) = some (values1530[i.val]'(by rw [values1530_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1530_lookup i)

theorem block1530_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (218 + i.val) = (values1530[i.val]'(by rw [values1530_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1530_lookup i)

theorem block1531_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (250 + i.val) = some (values1531[i.val]'(by rw [values1531_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1531_lookup i)

theorem block1531_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (250 + i.val) = (values1531[i.val]'(by rw [values1531_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1531_lookup i)

theorem block1532_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (282 + i.val) = some (values1532[i.val]'(by rw [values1532_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1532_lookup i)

theorem block1532_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (282 + i.val) = (values1532[i.val]'(by rw [values1532_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1532_lookup i)

theorem block1533_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (314 + i.val) = some (values1533[i.val]'(by rw [values1533_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1533_lookup i)

theorem block1533_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (314 + i.val) = (values1533[i.val]'(by rw [values1533_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1533_lookup i)

theorem block1534_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 123 (346 + i.val) = some (values1534[i.val]'(by rw [values1534_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1534_lookup i)

theorem block1534_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 123 (346 + i.val) = (values1534[i.val]'(by rw [values1534_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1534_lookup i)

theorem block1535_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 123 (378 + i.val) = some (values1535[i.val]'(by rw [values1535_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row123_lookup _).trans (OriginalRow227TriangleLookupRow123.block1535_lookup i)

theorem block1535_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 123 (378 + i.val) = (values1535[i.val]'(by rw [values1535_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1535_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1527_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1527_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1528_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1528_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1529_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1529_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1530_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1530_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1531_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1531_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1532_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1532_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1533_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1533_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1534_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1534_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1535_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123.block1535_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123
