import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow152

theorem block1748_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 152 (151 + i.val) = some (values1748[i.val]'(by rw [values1748_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1748_lookup i)

theorem block1748_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 152 (151 + i.val) = (values1748[i.val]'(by rw [values1748_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1748_lookup i)

theorem block1749_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 152 (183 + i.val) = some (values1749[i.val]'(by rw [values1749_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1749_lookup i)

theorem block1749_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 152 (183 + i.val) = (values1749[i.val]'(by rw [values1749_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1749_lookup i)

theorem block1750_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 152 (215 + i.val) = some (values1750[i.val]'(by rw [values1750_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1750_lookup i)

theorem block1750_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 152 (215 + i.val) = (values1750[i.val]'(by rw [values1750_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1750_lookup i)

theorem block1751_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 152 (247 + i.val) = some (values1751[i.val]'(by rw [values1751_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1751_lookup i)

theorem block1751_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 152 (247 + i.val) = (values1751[i.val]'(by rw [values1751_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1751_lookup i)

theorem block1752_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 152 (279 + i.val) = some (values1752[i.val]'(by rw [values1752_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1752_lookup i)

theorem block1752_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 152 (279 + i.val) = (values1752[i.val]'(by rw [values1752_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1752_lookup i)

theorem block1753_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 152 (311 + i.val) = some (values1753[i.val]'(by rw [values1753_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1753_lookup i)

theorem block1753_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 152 (311 + i.val) = (values1753[i.val]'(by rw [values1753_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1753_lookup i)

theorem block1754_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 152 (343 + i.val) = some (values1754[i.val]'(by rw [values1754_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row152_lookup _).trans (OriginalRow227TriangleLookupRow152.block1754_lookup i)

theorem block1754_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 152 (343 + i.val) = (values1754[i.val]'(by rw [values1754_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1754_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1748_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1748_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1749_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1749_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1750_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1750_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1751_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1751_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1752_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1752_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1753_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1753_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1754_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152.block1754_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152
