import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow129

theorem block1576_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (128 + i.val) = some (values1576[i.val]'(by rw [values1576_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1576_lookup i)

theorem block1576_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (128 + i.val) = (values1576[i.val]'(by rw [values1576_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1576_lookup i)

theorem block1577_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (160 + i.val) = some (values1577[i.val]'(by rw [values1577_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1577_lookup i)

theorem block1577_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (160 + i.val) = (values1577[i.val]'(by rw [values1577_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1577_lookup i)

theorem block1578_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (192 + i.val) = some (values1578[i.val]'(by rw [values1578_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1578_lookup i)

theorem block1578_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (192 + i.val) = (values1578[i.val]'(by rw [values1578_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1578_lookup i)

theorem block1579_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (224 + i.val) = some (values1579[i.val]'(by rw [values1579_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1579_lookup i)

theorem block1579_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (224 + i.val) = (values1579[i.val]'(by rw [values1579_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1579_lookup i)

theorem block1580_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (256 + i.val) = some (values1580[i.val]'(by rw [values1580_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1580_lookup i)

theorem block1580_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (256 + i.val) = (values1580[i.val]'(by rw [values1580_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1580_lookup i)

theorem block1581_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (288 + i.val) = some (values1581[i.val]'(by rw [values1581_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1581_lookup i)

theorem block1581_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (288 + i.val) = (values1581[i.val]'(by rw [values1581_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1581_lookup i)

theorem block1582_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 129 (320 + i.val) = some (values1582[i.val]'(by rw [values1582_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1582_lookup i)

theorem block1582_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 129 (320 + i.val) = (values1582[i.val]'(by rw [values1582_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1582_lookup i)

theorem block1583_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 129 (352 + i.val) = some (values1583[i.val]'(by rw [values1583_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row129_lookup _).trans (OriginalRow227TriangleLookupRow129.block1583_lookup i)

theorem block1583_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 129 (352 + i.val) = (values1583[i.val]'(by rw [values1583_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1583_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1576_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1576_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1577_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1577_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1578_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1578_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1579_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1579_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1580_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1580_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1581_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1581_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1582_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1582_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1583_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129.block1583_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129
