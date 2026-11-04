import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow166

theorem block1836_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 166 (165 + i.val) = some (values1836[i.val]'(by rw [values1836_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row166_lookup _).trans (OriginalRow227TriangleLookupRow166.block1836_lookup i)

theorem block1836_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 166 (165 + i.val) = (values1836[i.val]'(by rw [values1836_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1836_lookup i)

theorem block1837_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 166 (197 + i.val) = some (values1837[i.val]'(by rw [values1837_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row166_lookup _).trans (OriginalRow227TriangleLookupRow166.block1837_lookup i)

theorem block1837_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 166 (197 + i.val) = (values1837[i.val]'(by rw [values1837_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1837_lookup i)

theorem block1838_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 166 (229 + i.val) = some (values1838[i.val]'(by rw [values1838_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row166_lookup _).trans (OriginalRow227TriangleLookupRow166.block1838_lookup i)

theorem block1838_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 166 (229 + i.val) = (values1838[i.val]'(by rw [values1838_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1838_lookup i)

theorem block1839_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 166 (261 + i.val) = some (values1839[i.val]'(by rw [values1839_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row166_lookup _).trans (OriginalRow227TriangleLookupRow166.block1839_lookup i)

theorem block1839_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 166 (261 + i.val) = (values1839[i.val]'(by rw [values1839_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1839_lookup i)

theorem block1840_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 166 (293 + i.val) = some (values1840[i.val]'(by rw [values1840_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row166_lookup _).trans (OriginalRow227TriangleLookupRow166.block1840_lookup i)

theorem block1840_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 166 (293 + i.val) = (values1840[i.val]'(by rw [values1840_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1840_lookup i)

theorem block1841_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 166 (325 + i.val) = some (values1841[i.val]'(by rw [values1841_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row166_lookup _).trans (OriginalRow227TriangleLookupRow166.block1841_lookup i)

theorem block1841_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 166 (325 + i.val) = (values1841[i.val]'(by rw [values1841_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1841_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1836_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1836_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1837_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1837_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1838_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1838_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1839_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1839_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1840_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1840_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1841_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166.block1841_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166
