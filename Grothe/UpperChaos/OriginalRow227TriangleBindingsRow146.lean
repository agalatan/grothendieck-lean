import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow146

theorem block1706_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 146 (145 + i.val) = some (values1706[i.val]'(by rw [values1706_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1706_lookup i)

theorem block1706_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 146 (145 + i.val) = (values1706[i.val]'(by rw [values1706_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1706_lookup i)

theorem block1707_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 146 (177 + i.val) = some (values1707[i.val]'(by rw [values1707_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1707_lookup i)

theorem block1707_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 146 (177 + i.val) = (values1707[i.val]'(by rw [values1707_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1707_lookup i)

theorem block1708_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 146 (209 + i.val) = some (values1708[i.val]'(by rw [values1708_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1708_lookup i)

theorem block1708_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 146 (209 + i.val) = (values1708[i.val]'(by rw [values1708_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1708_lookup i)

theorem block1709_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 146 (241 + i.val) = some (values1709[i.val]'(by rw [values1709_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1709_lookup i)

theorem block1709_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 146 (241 + i.val) = (values1709[i.val]'(by rw [values1709_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1709_lookup i)

theorem block1710_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 146 (273 + i.val) = some (values1710[i.val]'(by rw [values1710_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1710_lookup i)

theorem block1710_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 146 (273 + i.val) = (values1710[i.val]'(by rw [values1710_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1710_lookup i)

theorem block1711_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 146 (305 + i.val) = some (values1711[i.val]'(by rw [values1711_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1711_lookup i)

theorem block1711_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 146 (305 + i.val) = (values1711[i.val]'(by rw [values1711_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1711_lookup i)

theorem block1712_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 146 (337 + i.val) = some (values1712[i.val]'(by rw [values1712_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row146_lookup _).trans (OriginalRow227TriangleLookupRow146.block1712_lookup i)

theorem block1712_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 146 (337 + i.val) = (values1712[i.val]'(by rw [values1712_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1712_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1706_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1706_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1707_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1707_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1708_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1708_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1709_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1709_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1710_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1710_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1711_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1711_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1712_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146.block1712_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146
