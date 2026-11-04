import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow206

theorem block2022_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 206 (205 + i.val) = some (values2022[i.val]'(by rw [values2022_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row206_lookup _).trans (OriginalRow227TriangleLookupRow206.block2022_lookup i)

theorem block2022_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 206 (205 + i.val) = (values2022[i.val]'(by rw [values2022_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2022_lookup i)

theorem block2023_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 206 (237 + i.val) = some (values2023[i.val]'(by rw [values2023_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row206_lookup _).trans (OriginalRow227TriangleLookupRow206.block2023_lookup i)

theorem block2023_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 206 (237 + i.val) = (values2023[i.val]'(by rw [values2023_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2023_lookup i)

theorem block2024_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 206 (269 + i.val) = some (values2024[i.val]'(by rw [values2024_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row206_lookup _).trans (OriginalRow227TriangleLookupRow206.block2024_lookup i)

theorem block2024_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 206 (269 + i.val) = (values2024[i.val]'(by rw [values2024_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2024_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206.block2022_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206.block2022_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206.block2023_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206.block2023_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206.block2024_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206.block2024_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206
