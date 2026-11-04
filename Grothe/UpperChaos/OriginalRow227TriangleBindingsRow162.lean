import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow162

theorem block1812_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 162 (161 + i.val) = some (values1812[i.val]'(by rw [values1812_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row162_lookup _).trans (OriginalRow227TriangleLookupRow162.block1812_lookup i)

theorem block1812_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 162 (161 + i.val) = (values1812[i.val]'(by rw [values1812_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1812_lookup i)

theorem block1813_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 162 (193 + i.val) = some (values1813[i.val]'(by rw [values1813_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row162_lookup _).trans (OriginalRow227TriangleLookupRow162.block1813_lookup i)

theorem block1813_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 162 (193 + i.val) = (values1813[i.val]'(by rw [values1813_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1813_lookup i)

theorem block1814_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 162 (225 + i.val) = some (values1814[i.val]'(by rw [values1814_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row162_lookup _).trans (OriginalRow227TriangleLookupRow162.block1814_lookup i)

theorem block1814_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 162 (225 + i.val) = (values1814[i.val]'(by rw [values1814_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1814_lookup i)

theorem block1815_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 162 (257 + i.val) = some (values1815[i.val]'(by rw [values1815_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row162_lookup _).trans (OriginalRow227TriangleLookupRow162.block1815_lookup i)

theorem block1815_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 162 (257 + i.val) = (values1815[i.val]'(by rw [values1815_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1815_lookup i)

theorem block1816_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 162 (289 + i.val) = some (values1816[i.val]'(by rw [values1816_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row162_lookup _).trans (OriginalRow227TriangleLookupRow162.block1816_lookup i)

theorem block1816_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 162 (289 + i.val) = (values1816[i.val]'(by rw [values1816_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1816_lookup i)

theorem block1817_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 162 (321 + i.val) = some (values1817[i.val]'(by rw [values1817_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row162_lookup _).trans (OriginalRow227TriangleLookupRow162.block1817_lookup i)

theorem block1817_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 162 (321 + i.val) = (values1817[i.val]'(by rw [values1817_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1817_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1812_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1812_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1813_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1813_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1814_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1814_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1815_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1815_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1816_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1816_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1817_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162.block1817_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162
