import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow208

theorem block2028_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 208 (207 + i.val) = some (values2028[i.val]'(by rw [values2028_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row208_lookup _).trans (OriginalRow227TriangleLookupRow208.block2028_lookup i)

theorem block2028_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 208 (207 + i.val) = (values2028[i.val]'(by rw [values2028_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2028_lookup i)

theorem block2029_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 208 (239 + i.val) = some (values2029[i.val]'(by rw [values2029_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row208_lookup _).trans (OriginalRow227TriangleLookupRow208.block2029_lookup i)

theorem block2029_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 208 (239 + i.val) = (values2029[i.val]'(by rw [values2029_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2029_lookup i)

theorem block2030_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 208 (271 + i.val) = some (values2030[i.val]'(by rw [values2030_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row208_lookup _).trans (OriginalRow227TriangleLookupRow208.block2030_lookup i)

theorem block2030_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 208 (271 + i.val) = (values2030[i.val]'(by rw [values2030_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2030_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208.block2028_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208.block2028_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208.block2029_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208.block2029_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208.block2030_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208.block2030_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208
