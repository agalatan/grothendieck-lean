import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow128

theorem block1568_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (127 + i.val) = some (values1568[i.val]'(by rw [values1568_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1568_lookup i)

theorem block1568_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (127 + i.val) = (values1568[i.val]'(by rw [values1568_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1568_lookup i)

theorem block1569_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (159 + i.val) = some (values1569[i.val]'(by rw [values1569_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1569_lookup i)

theorem block1569_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (159 + i.val) = (values1569[i.val]'(by rw [values1569_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1569_lookup i)

theorem block1570_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (191 + i.val) = some (values1570[i.val]'(by rw [values1570_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1570_lookup i)

theorem block1570_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (191 + i.val) = (values1570[i.val]'(by rw [values1570_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1570_lookup i)

theorem block1571_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (223 + i.val) = some (values1571[i.val]'(by rw [values1571_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1571_lookup i)

theorem block1571_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (223 + i.val) = (values1571[i.val]'(by rw [values1571_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1571_lookup i)

theorem block1572_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (255 + i.val) = some (values1572[i.val]'(by rw [values1572_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1572_lookup i)

theorem block1572_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (255 + i.val) = (values1572[i.val]'(by rw [values1572_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1572_lookup i)

theorem block1573_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (287 + i.val) = some (values1573[i.val]'(by rw [values1573_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1573_lookup i)

theorem block1573_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (287 + i.val) = (values1573[i.val]'(by rw [values1573_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1573_lookup i)

theorem block1574_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 128 (319 + i.val) = some (values1574[i.val]'(by rw [values1574_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1574_lookup i)

theorem block1574_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 128 (319 + i.val) = (values1574[i.val]'(by rw [values1574_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1574_lookup i)

theorem block1575_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 128 (351 + i.val) = some (values1575[i.val]'(by rw [values1575_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row128_lookup _).trans (OriginalRow227TriangleLookupRow128.block1575_lookup i)

theorem block1575_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 128 (351 + i.val) = (values1575[i.val]'(by rw [values1575_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1575_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1568_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1568_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1569_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1569_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1570_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1570_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1571_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1571_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1572_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1572_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1573_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1573_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1574_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1574_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1575_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128.block1575_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128
