import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow212

theorem block2040_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 212 (211 + i.val) = some (values2040[i.val]'(by rw [values2040_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row212_lookup _).trans (OriginalRow227TriangleLookupRow212.block2040_lookup i)

theorem block2040_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 212 (211 + i.val) = (values2040[i.val]'(by rw [values2040_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2040_lookup i)

theorem block2041_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 212 (243 + i.val) = some (values2041[i.val]'(by rw [values2041_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row212_lookup _).trans (OriginalRow227TriangleLookupRow212.block2041_lookup i)

theorem block2041_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 212 (243 + i.val) = (values2041[i.val]'(by rw [values2041_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2041_lookup i)

theorem block2042_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 212 (275 + i.val) = some (values2042[i.val]'(by rw [values2042_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row212_lookup _).trans (OriginalRow227TriangleLookupRow212.block2042_lookup i)

theorem block2042_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 212 (275 + i.val) = (values2042[i.val]'(by rw [values2042_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2042_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212.block2040_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212.block2040_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212.block2041_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212.block2041_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212.block2042_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212.block2042_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212
