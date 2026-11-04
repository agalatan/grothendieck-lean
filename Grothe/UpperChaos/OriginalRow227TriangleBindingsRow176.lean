import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow176

theorem block1892_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 176 (175 + i.val) = some (values1892[i.val]'(by rw [values1892_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row176_lookup _).trans (OriginalRow227TriangleLookupRow176.block1892_lookup i)

theorem block1892_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 176 (175 + i.val) = (values1892[i.val]'(by rw [values1892_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1892_lookup i)

theorem block1893_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 176 (207 + i.val) = some (values1893[i.val]'(by rw [values1893_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row176_lookup _).trans (OriginalRow227TriangleLookupRow176.block1893_lookup i)

theorem block1893_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 176 (207 + i.val) = (values1893[i.val]'(by rw [values1893_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1893_lookup i)

theorem block1894_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 176 (239 + i.val) = some (values1894[i.val]'(by rw [values1894_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row176_lookup _).trans (OriginalRow227TriangleLookupRow176.block1894_lookup i)

theorem block1894_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 176 (239 + i.val) = (values1894[i.val]'(by rw [values1894_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1894_lookup i)

theorem block1895_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 176 (271 + i.val) = some (values1895[i.val]'(by rw [values1895_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row176_lookup _).trans (OriginalRow227TriangleLookupRow176.block1895_lookup i)

theorem block1895_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 176 (271 + i.val) = (values1895[i.val]'(by rw [values1895_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1895_lookup i)

theorem block1896_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 176 (303 + i.val) = some (values1896[i.val]'(by rw [values1896_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row176_lookup _).trans (OriginalRow227TriangleLookupRow176.block1896_lookup i)

theorem block1896_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 176 (303 + i.val) = (values1896[i.val]'(by rw [values1896_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1896_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1892_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1892_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1893_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1893_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1894_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1894_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1895_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1895_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1896_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176.block1896_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176
