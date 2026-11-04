import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow219

theorem block2061_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 219 (218 + i.val) = some (values2061[i.val]'(by rw [values2061_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row219_lookup _).trans (OriginalRow227TriangleLookupRow219.block2061_lookup i)

theorem block2061_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 219 (218 + i.val) = (values2061[i.val]'(by rw [values2061_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2061_lookup i)

theorem block2062_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 219 (250 + i.val) = some (values2062[i.val]'(by rw [values2062_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row219_lookup _).trans (OriginalRow227TriangleLookupRow219.block2062_lookup i)

theorem block2062_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 219 (250 + i.val) = (values2062[i.val]'(by rw [values2062_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2062_lookup i)

theorem block2063_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 219 (282 + i.val) = some (values2063[i.val]'(by rw [values2063_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row219_lookup _).trans (OriginalRow227TriangleLookupRow219.block2063_lookup i)

theorem block2063_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 219 (282 + i.val) = (values2063[i.val]'(by rw [values2063_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2063_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219.block2061_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219.block2061_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219.block2062_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219.block2062_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219.block2063_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219.block2063_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219
