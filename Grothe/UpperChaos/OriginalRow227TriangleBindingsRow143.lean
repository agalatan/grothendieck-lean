import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow143

theorem block1685_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 143 (142 + i.val) = some (values1685[i.val]'(by rw [values1685_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1685_lookup i)

theorem block1685_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 143 (142 + i.val) = (values1685[i.val]'(by rw [values1685_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1685_lookup i)

theorem block1686_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 143 (174 + i.val) = some (values1686[i.val]'(by rw [values1686_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1686_lookup i)

theorem block1686_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 143 (174 + i.val) = (values1686[i.val]'(by rw [values1686_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1686_lookup i)

theorem block1687_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 143 (206 + i.val) = some (values1687[i.val]'(by rw [values1687_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1687_lookup i)

theorem block1687_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 143 (206 + i.val) = (values1687[i.val]'(by rw [values1687_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1687_lookup i)

theorem block1688_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 143 (238 + i.val) = some (values1688[i.val]'(by rw [values1688_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1688_lookup i)

theorem block1688_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 143 (238 + i.val) = (values1688[i.val]'(by rw [values1688_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1688_lookup i)

theorem block1689_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 143 (270 + i.val) = some (values1689[i.val]'(by rw [values1689_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1689_lookup i)

theorem block1689_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 143 (270 + i.val) = (values1689[i.val]'(by rw [values1689_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1689_lookup i)

theorem block1690_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 143 (302 + i.val) = some (values1690[i.val]'(by rw [values1690_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1690_lookup i)

theorem block1690_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 143 (302 + i.val) = (values1690[i.val]'(by rw [values1690_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1690_lookup i)

theorem block1691_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 143 (334 + i.val) = some (values1691[i.val]'(by rw [values1691_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row143_lookup _).trans (OriginalRow227TriangleLookupRow143.block1691_lookup i)

theorem block1691_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 143 (334 + i.val) = (values1691[i.val]'(by rw [values1691_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1691_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1685_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1685_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1686_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1686_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1687_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1687_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1688_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1688_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1689_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1689_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1690_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1690_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1691_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143.block1691_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143
