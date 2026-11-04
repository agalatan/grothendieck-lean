import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow160

theorem block1800_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 160 (159 + i.val) = some (values1800[i.val]'(by rw [values1800_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row160_lookup _).trans (OriginalRow227TriangleLookupRow160.block1800_lookup i)

theorem block1800_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 160 (159 + i.val) = (values1800[i.val]'(by rw [values1800_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1800_lookup i)

theorem block1801_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 160 (191 + i.val) = some (values1801[i.val]'(by rw [values1801_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row160_lookup _).trans (OriginalRow227TriangleLookupRow160.block1801_lookup i)

theorem block1801_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 160 (191 + i.val) = (values1801[i.val]'(by rw [values1801_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1801_lookup i)

theorem block1802_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 160 (223 + i.val) = some (values1802[i.val]'(by rw [values1802_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row160_lookup _).trans (OriginalRow227TriangleLookupRow160.block1802_lookup i)

theorem block1802_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 160 (223 + i.val) = (values1802[i.val]'(by rw [values1802_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1802_lookup i)

theorem block1803_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 160 (255 + i.val) = some (values1803[i.val]'(by rw [values1803_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row160_lookup _).trans (OriginalRow227TriangleLookupRow160.block1803_lookup i)

theorem block1803_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 160 (255 + i.val) = (values1803[i.val]'(by rw [values1803_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1803_lookup i)

theorem block1804_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 160 (287 + i.val) = some (values1804[i.val]'(by rw [values1804_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row160_lookup _).trans (OriginalRow227TriangleLookupRow160.block1804_lookup i)

theorem block1804_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 160 (287 + i.val) = (values1804[i.val]'(by rw [values1804_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1804_lookup i)

theorem block1805_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 160 (319 + i.val) = some (values1805[i.val]'(by rw [values1805_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row160_lookup _).trans (OriginalRow227TriangleLookupRow160.block1805_lookup i)

theorem block1805_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 160 (319 + i.val) = (values1805[i.val]'(by rw [values1805_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1805_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1800_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1800_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1801_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1801_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1802_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1802_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1803_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1803_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1804_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1804_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1805_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160.block1805_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160
