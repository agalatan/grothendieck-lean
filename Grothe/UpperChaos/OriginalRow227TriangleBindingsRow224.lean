import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow224

theorem block2072_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 224 (223 + i.val) = some (values2072[i.val]'(by rw [values2072_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row224_lookup _).trans (OriginalRow227TriangleLookupRow224.block2072_lookup i)

theorem block2072_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 224 (223 + i.val) = (values2072[i.val]'(by rw [values2072_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2072_lookup i)

theorem block2073_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 224 (255 + i.val) = some (values2073[i.val]'(by rw [values2073_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row224_lookup _).trans (OriginalRow227TriangleLookupRow224.block2073_lookup i)

theorem block2073_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 224 (255 + i.val) = (values2073[i.val]'(by rw [values2073_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2073_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224.block2072_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224.block2072_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224.block2073_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224.block2073_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224
