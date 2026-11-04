import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow217

theorem block2055_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 217 (216 + i.val) = some (values2055[i.val]'(by rw [values2055_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row217_lookup _).trans (OriginalRow227TriangleLookupRow217.block2055_lookup i)

theorem block2055_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 217 (216 + i.val) = (values2055[i.val]'(by rw [values2055_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2055_lookup i)

theorem block2056_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 217 (248 + i.val) = some (values2056[i.val]'(by rw [values2056_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row217_lookup _).trans (OriginalRow227TriangleLookupRow217.block2056_lookup i)

theorem block2056_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 217 (248 + i.val) = (values2056[i.val]'(by rw [values2056_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2056_lookup i)

theorem block2057_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 217 (280 + i.val) = some (values2057[i.val]'(by rw [values2057_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row217_lookup _).trans (OriginalRow227TriangleLookupRow217.block2057_lookup i)

theorem block2057_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 217 (280 + i.val) = (values2057[i.val]'(by rw [values2057_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2057_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217.block2055_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217.block2055_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217.block2056_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217.block2056_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217.block2057_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217.block2057_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217
