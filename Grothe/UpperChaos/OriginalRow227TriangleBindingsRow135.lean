import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow135

theorem block1624_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (134 + i.val) = some (values1624[i.val]'(by rw [values1624_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1624_lookup i)

theorem block1624_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (134 + i.val) = (values1624[i.val]'(by rw [values1624_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1624_lookup i)

theorem block1625_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (166 + i.val) = some (values1625[i.val]'(by rw [values1625_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1625_lookup i)

theorem block1625_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (166 + i.val) = (values1625[i.val]'(by rw [values1625_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1625_lookup i)

theorem block1626_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (198 + i.val) = some (values1626[i.val]'(by rw [values1626_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1626_lookup i)

theorem block1626_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (198 + i.val) = (values1626[i.val]'(by rw [values1626_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1626_lookup i)

theorem block1627_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (230 + i.val) = some (values1627[i.val]'(by rw [values1627_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1627_lookup i)

theorem block1627_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (230 + i.val) = (values1627[i.val]'(by rw [values1627_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1627_lookup i)

theorem block1628_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (262 + i.val) = some (values1628[i.val]'(by rw [values1628_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1628_lookup i)

theorem block1628_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (262 + i.val) = (values1628[i.val]'(by rw [values1628_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1628_lookup i)

theorem block1629_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (294 + i.val) = some (values1629[i.val]'(by rw [values1629_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1629_lookup i)

theorem block1629_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (294 + i.val) = (values1629[i.val]'(by rw [values1629_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1629_lookup i)

theorem block1630_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 135 (326 + i.val) = some (values1630[i.val]'(by rw [values1630_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1630_lookup i)

theorem block1630_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 135 (326 + i.val) = (values1630[i.val]'(by rw [values1630_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1630_lookup i)

theorem block1631_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 135 (358 + i.val) = some (values1631[i.val]'(by rw [values1631_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row135_lookup _).trans (OriginalRow227TriangleLookupRow135.block1631_lookup i)

theorem block1631_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 135 (358 + i.val) = (values1631[i.val]'(by rw [values1631_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1631_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1624_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1624_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1625_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1625_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1626_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1626_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1627_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1627_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1628_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1628_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1629_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1629_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1630_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1630_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1631_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135.block1631_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135
