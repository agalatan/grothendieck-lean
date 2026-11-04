import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow150

theorem block1734_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 150 (149 + i.val) = some (values1734[i.val]'(by rw [values1734_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1734_lookup i)

theorem block1734_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 150 (149 + i.val) = (values1734[i.val]'(by rw [values1734_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1734_lookup i)

theorem block1735_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 150 (181 + i.val) = some (values1735[i.val]'(by rw [values1735_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1735_lookup i)

theorem block1735_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 150 (181 + i.val) = (values1735[i.val]'(by rw [values1735_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1735_lookup i)

theorem block1736_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 150 (213 + i.val) = some (values1736[i.val]'(by rw [values1736_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1736_lookup i)

theorem block1736_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 150 (213 + i.val) = (values1736[i.val]'(by rw [values1736_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1736_lookup i)

theorem block1737_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 150 (245 + i.val) = some (values1737[i.val]'(by rw [values1737_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1737_lookup i)

theorem block1737_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 150 (245 + i.val) = (values1737[i.val]'(by rw [values1737_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1737_lookup i)

theorem block1738_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 150 (277 + i.val) = some (values1738[i.val]'(by rw [values1738_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1738_lookup i)

theorem block1738_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 150 (277 + i.val) = (values1738[i.val]'(by rw [values1738_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1738_lookup i)

theorem block1739_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 150 (309 + i.val) = some (values1739[i.val]'(by rw [values1739_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1739_lookup i)

theorem block1739_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 150 (309 + i.val) = (values1739[i.val]'(by rw [values1739_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1739_lookup i)

theorem block1740_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 150 (341 + i.val) = some (values1740[i.val]'(by rw [values1740_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row150_lookup _).trans (OriginalRow227TriangleLookupRow150.block1740_lookup i)

theorem block1740_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 150 (341 + i.val) = (values1740[i.val]'(by rw [values1740_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1740_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1734_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1734_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1735_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1735_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1736_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1736_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1737_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1737_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1738_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1738_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1739_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1739_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1740_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150.block1740_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150
