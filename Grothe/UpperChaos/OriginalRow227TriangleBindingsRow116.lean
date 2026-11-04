import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow116

theorem block1464_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (115 + i.val) = some (values1464[i.val]'(by rw [values1464_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1464_lookup i)

theorem block1464_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (115 + i.val) = (values1464[i.val]'(by rw [values1464_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1464_lookup i)

theorem block1465_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (147 + i.val) = some (values1465[i.val]'(by rw [values1465_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1465_lookup i)

theorem block1465_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (147 + i.val) = (values1465[i.val]'(by rw [values1465_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1465_lookup i)

theorem block1466_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (179 + i.val) = some (values1466[i.val]'(by rw [values1466_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1466_lookup i)

theorem block1466_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (179 + i.val) = (values1466[i.val]'(by rw [values1466_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1466_lookup i)

theorem block1467_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (211 + i.val) = some (values1467[i.val]'(by rw [values1467_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1467_lookup i)

theorem block1467_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (211 + i.val) = (values1467[i.val]'(by rw [values1467_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1467_lookup i)

theorem block1468_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (243 + i.val) = some (values1468[i.val]'(by rw [values1468_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1468_lookup i)

theorem block1468_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (243 + i.val) = (values1468[i.val]'(by rw [values1468_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1468_lookup i)

theorem block1469_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (275 + i.val) = some (values1469[i.val]'(by rw [values1469_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1469_lookup i)

theorem block1469_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (275 + i.val) = (values1469[i.val]'(by rw [values1469_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1469_lookup i)

theorem block1470_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (307 + i.val) = some (values1470[i.val]'(by rw [values1470_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1470_lookup i)

theorem block1470_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (307 + i.val) = (values1470[i.val]'(by rw [values1470_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1470_lookup i)

theorem block1471_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 116 (339 + i.val) = some (values1471[i.val]'(by rw [values1471_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1471_lookup i)

theorem block1471_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 116 (339 + i.val) = (values1471[i.val]'(by rw [values1471_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1471_lookup i)

theorem block1472_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 116 (371 + i.val) = some (values1472[i.val]'(by rw [values1472_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row116_lookup _).trans (OriginalRow227TriangleLookupRow116.block1472_lookup i)

theorem block1472_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 116 (371 + i.val) = (values1472[i.val]'(by rw [values1472_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1472_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1464_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1464_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1465_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1465_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1466_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1466_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1467_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1467_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1468_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1468_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1469_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1469_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1470_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1470_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1471_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1471_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1472_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116.block1472_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116
