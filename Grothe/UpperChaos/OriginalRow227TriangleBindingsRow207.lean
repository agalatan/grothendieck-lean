import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow207

theorem block2025_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 207 (206 + i.val) = some (values2025[i.val]'(by rw [values2025_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row207_lookup _).trans (OriginalRow227TriangleLookupRow207.block2025_lookup i)

theorem block2025_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 207 (206 + i.val) = (values2025[i.val]'(by rw [values2025_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2025_lookup i)

theorem block2026_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 207 (238 + i.val) = some (values2026[i.val]'(by rw [values2026_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row207_lookup _).trans (OriginalRow227TriangleLookupRow207.block2026_lookup i)

theorem block2026_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 207 (238 + i.val) = (values2026[i.val]'(by rw [values2026_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2026_lookup i)

theorem block2027_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 207 (270 + i.val) = some (values2027[i.val]'(by rw [values2027_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row207_lookup _).trans (OriginalRow227TriangleLookupRow207.block2027_lookup i)

theorem block2027_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 207 (270 + i.val) = (values2027[i.val]'(by rw [values2027_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2027_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207.block2025_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207.block2025_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207.block2026_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207.block2026_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207.block2027_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207.block2027_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207
