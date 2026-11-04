import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow173

theorem block1877_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 173 (172 + i.val) = some (values1877[i.val]'(by rw [values1877_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row173_lookup _).trans (OriginalRow227TriangleLookupRow173.block1877_lookup i)

theorem block1877_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 173 (172 + i.val) = (values1877[i.val]'(by rw [values1877_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1877_lookup i)

theorem block1878_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 173 (204 + i.val) = some (values1878[i.val]'(by rw [values1878_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row173_lookup _).trans (OriginalRow227TriangleLookupRow173.block1878_lookup i)

theorem block1878_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 173 (204 + i.val) = (values1878[i.val]'(by rw [values1878_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1878_lookup i)

theorem block1879_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 173 (236 + i.val) = some (values1879[i.val]'(by rw [values1879_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row173_lookup _).trans (OriginalRow227TriangleLookupRow173.block1879_lookup i)

theorem block1879_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 173 (236 + i.val) = (values1879[i.val]'(by rw [values1879_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1879_lookup i)

theorem block1880_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 173 (268 + i.val) = some (values1880[i.val]'(by rw [values1880_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row173_lookup _).trans (OriginalRow227TriangleLookupRow173.block1880_lookup i)

theorem block1880_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 173 (268 + i.val) = (values1880[i.val]'(by rw [values1880_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1880_lookup i)

theorem block1881_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 173 (300 + i.val) = some (values1881[i.val]'(by rw [values1881_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row173_lookup _).trans (OriginalRow227TriangleLookupRow173.block1881_lookup i)

theorem block1881_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 173 (300 + i.val) = (values1881[i.val]'(by rw [values1881_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1881_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1877_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1877_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1878_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1878_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1879_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1879_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1880_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1880_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1881_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173.block1881_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173
