import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow205

theorem block2019_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 205 (204 + i.val) = some (values2019[i.val]'(by rw [values2019_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row205_lookup _).trans (OriginalRow227TriangleLookupRow205.block2019_lookup i)

theorem block2019_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 205 (204 + i.val) = (values2019[i.val]'(by rw [values2019_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2019_lookup i)

theorem block2020_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 205 (236 + i.val) = some (values2020[i.val]'(by rw [values2020_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row205_lookup _).trans (OriginalRow227TriangleLookupRow205.block2020_lookup i)

theorem block2020_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 205 (236 + i.val) = (values2020[i.val]'(by rw [values2020_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2020_lookup i)

theorem block2021_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 205 (268 + i.val) = some (values2021[i.val]'(by rw [values2021_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row205_lookup _).trans (OriginalRow227TriangleLookupRow205.block2021_lookup i)

theorem block2021_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 205 (268 + i.val) = (values2021[i.val]'(by rw [values2021_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2021_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205.block2019_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205.block2019_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205.block2020_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205.block2020_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205.block2021_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205.block2021_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205
