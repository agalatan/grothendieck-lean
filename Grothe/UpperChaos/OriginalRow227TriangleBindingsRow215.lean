import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow215

theorem block2049_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 215 (214 + i.val) = some (values2049[i.val]'(by rw [values2049_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row215_lookup _).trans (OriginalRow227TriangleLookupRow215.block2049_lookup i)

theorem block2049_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 215 (214 + i.val) = (values2049[i.val]'(by rw [values2049_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2049_lookup i)

theorem block2050_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 215 (246 + i.val) = some (values2050[i.val]'(by rw [values2050_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row215_lookup _).trans (OriginalRow227TriangleLookupRow215.block2050_lookup i)

theorem block2050_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 215 (246 + i.val) = (values2050[i.val]'(by rw [values2050_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2050_lookup i)

theorem block2051_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 215 (278 + i.val) = some (values2051[i.val]'(by rw [values2051_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row215_lookup _).trans (OriginalRow227TriangleLookupRow215.block2051_lookup i)

theorem block2051_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 215 (278 + i.val) = (values2051[i.val]'(by rw [values2051_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2051_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215.block2049_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215.block2049_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215.block2050_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215.block2050_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215.block2051_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215.block2051_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215
