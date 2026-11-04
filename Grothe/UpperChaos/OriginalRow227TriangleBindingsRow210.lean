import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow210

theorem block2034_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 210 (209 + i.val) = some (values2034[i.val]'(by rw [values2034_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row210_lookup _).trans (OriginalRow227TriangleLookupRow210.block2034_lookup i)

theorem block2034_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 210 (209 + i.val) = (values2034[i.val]'(by rw [values2034_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2034_lookup i)

theorem block2035_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 210 (241 + i.val) = some (values2035[i.val]'(by rw [values2035_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row210_lookup _).trans (OriginalRow227TriangleLookupRow210.block2035_lookup i)

theorem block2035_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 210 (241 + i.val) = (values2035[i.val]'(by rw [values2035_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2035_lookup i)

theorem block2036_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 210 (273 + i.val) = some (values2036[i.val]'(by rw [values2036_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row210_lookup _).trans (OriginalRow227TriangleLookupRow210.block2036_lookup i)

theorem block2036_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 210 (273 + i.val) = (values2036[i.val]'(by rw [values2036_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2036_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210.block2034_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210.block2034_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210.block2035_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210.block2035_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210.block2036_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210.block2036_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210
