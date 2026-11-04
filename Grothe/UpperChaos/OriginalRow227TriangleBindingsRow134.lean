import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow134

theorem block1616_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (133 + i.val) = some (values1616[i.val]'(by rw [values1616_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1616_lookup i)

theorem block1616_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (133 + i.val) = (values1616[i.val]'(by rw [values1616_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1616_lookup i)

theorem block1617_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (165 + i.val) = some (values1617[i.val]'(by rw [values1617_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1617_lookup i)

theorem block1617_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (165 + i.val) = (values1617[i.val]'(by rw [values1617_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1617_lookup i)

theorem block1618_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (197 + i.val) = some (values1618[i.val]'(by rw [values1618_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1618_lookup i)

theorem block1618_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (197 + i.val) = (values1618[i.val]'(by rw [values1618_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1618_lookup i)

theorem block1619_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (229 + i.val) = some (values1619[i.val]'(by rw [values1619_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1619_lookup i)

theorem block1619_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (229 + i.val) = (values1619[i.val]'(by rw [values1619_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1619_lookup i)

theorem block1620_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (261 + i.val) = some (values1620[i.val]'(by rw [values1620_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1620_lookup i)

theorem block1620_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (261 + i.val) = (values1620[i.val]'(by rw [values1620_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1620_lookup i)

theorem block1621_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (293 + i.val) = some (values1621[i.val]'(by rw [values1621_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1621_lookup i)

theorem block1621_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (293 + i.val) = (values1621[i.val]'(by rw [values1621_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1621_lookup i)

theorem block1622_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 134 (325 + i.val) = some (values1622[i.val]'(by rw [values1622_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1622_lookup i)

theorem block1622_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 134 (325 + i.val) = (values1622[i.val]'(by rw [values1622_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1622_lookup i)

theorem block1623_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 134 (357 + i.val) = some (values1623[i.val]'(by rw [values1623_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row134_lookup _).trans (OriginalRow227TriangleLookupRow134.block1623_lookup i)

theorem block1623_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 134 (357 + i.val) = (values1623[i.val]'(by rw [values1623_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1623_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1616_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1616_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1617_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1617_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1618_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1618_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1619_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1619_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1620_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1620_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1621_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1621_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1622_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1622_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1623_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134.block1623_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134
