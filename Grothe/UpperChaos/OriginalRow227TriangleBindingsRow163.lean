import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow163

theorem block1818_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 163 (162 + i.val) = some (values1818[i.val]'(by rw [values1818_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row163_lookup _).trans (OriginalRow227TriangleLookupRow163.block1818_lookup i)

theorem block1818_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 163 (162 + i.val) = (values1818[i.val]'(by rw [values1818_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1818_lookup i)

theorem block1819_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 163 (194 + i.val) = some (values1819[i.val]'(by rw [values1819_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row163_lookup _).trans (OriginalRow227TriangleLookupRow163.block1819_lookup i)

theorem block1819_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 163 (194 + i.val) = (values1819[i.val]'(by rw [values1819_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1819_lookup i)

theorem block1820_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 163 (226 + i.val) = some (values1820[i.val]'(by rw [values1820_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row163_lookup _).trans (OriginalRow227TriangleLookupRow163.block1820_lookup i)

theorem block1820_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 163 (226 + i.val) = (values1820[i.val]'(by rw [values1820_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1820_lookup i)

theorem block1821_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 163 (258 + i.val) = some (values1821[i.val]'(by rw [values1821_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row163_lookup _).trans (OriginalRow227TriangleLookupRow163.block1821_lookup i)

theorem block1821_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 163 (258 + i.val) = (values1821[i.val]'(by rw [values1821_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1821_lookup i)

theorem block1822_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 163 (290 + i.val) = some (values1822[i.val]'(by rw [values1822_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row163_lookup _).trans (OriginalRow227TriangleLookupRow163.block1822_lookup i)

theorem block1822_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 163 (290 + i.val) = (values1822[i.val]'(by rw [values1822_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1822_lookup i)

theorem block1823_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 163 (322 + i.val) = some (values1823[i.val]'(by rw [values1823_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row163_lookup _).trans (OriginalRow227TriangleLookupRow163.block1823_lookup i)

theorem block1823_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 163 (322 + i.val) = (values1823[i.val]'(by rw [values1823_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1823_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1818_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1818_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1819_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1819_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1820_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1820_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1821_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1821_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1822_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1822_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1823_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163.block1823_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163
