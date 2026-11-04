import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow138

theorem block1648_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (137 + i.val) = some (values1648[i.val]'(by rw [values1648_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1648_lookup i)

theorem block1648_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (137 + i.val) = (values1648[i.val]'(by rw [values1648_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1648_lookup i)

theorem block1649_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (169 + i.val) = some (values1649[i.val]'(by rw [values1649_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1649_lookup i)

theorem block1649_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (169 + i.val) = (values1649[i.val]'(by rw [values1649_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1649_lookup i)

theorem block1650_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (201 + i.val) = some (values1650[i.val]'(by rw [values1650_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1650_lookup i)

theorem block1650_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (201 + i.val) = (values1650[i.val]'(by rw [values1650_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1650_lookup i)

theorem block1651_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (233 + i.val) = some (values1651[i.val]'(by rw [values1651_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1651_lookup i)

theorem block1651_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (233 + i.val) = (values1651[i.val]'(by rw [values1651_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1651_lookup i)

theorem block1652_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (265 + i.val) = some (values1652[i.val]'(by rw [values1652_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1652_lookup i)

theorem block1652_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (265 + i.val) = (values1652[i.val]'(by rw [values1652_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1652_lookup i)

theorem block1653_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (297 + i.val) = some (values1653[i.val]'(by rw [values1653_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1653_lookup i)

theorem block1653_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (297 + i.val) = (values1653[i.val]'(by rw [values1653_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1653_lookup i)

theorem block1654_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 138 (329 + i.val) = some (values1654[i.val]'(by rw [values1654_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1654_lookup i)

theorem block1654_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 138 (329 + i.val) = (values1654[i.val]'(by rw [values1654_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1654_lookup i)

theorem block1655_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 138 (361 + i.val) = some (values1655[i.val]'(by rw [values1655_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row138_lookup _).trans (OriginalRow227TriangleLookupRow138.block1655_lookup i)

theorem block1655_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 138 (361 + i.val) = (values1655[i.val]'(by rw [values1655_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1655_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1648_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1648_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1649_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1649_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1650_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1650_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1651_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1651_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1652_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1652_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1653_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1653_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1654_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1654_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1655_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138.block1655_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138
