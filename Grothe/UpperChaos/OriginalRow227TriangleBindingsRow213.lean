import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow213

theorem block2043_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 213 (212 + i.val) = some (values2043[i.val]'(by rw [values2043_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row213_lookup _).trans (OriginalRow227TriangleLookupRow213.block2043_lookup i)

theorem block2043_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 213 (212 + i.val) = (values2043[i.val]'(by rw [values2043_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2043_lookup i)

theorem block2044_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 213 (244 + i.val) = some (values2044[i.val]'(by rw [values2044_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row213_lookup _).trans (OriginalRow227TriangleLookupRow213.block2044_lookup i)

theorem block2044_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 213 (244 + i.val) = (values2044[i.val]'(by rw [values2044_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2044_lookup i)

theorem block2045_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 213 (276 + i.val) = some (values2045[i.val]'(by rw [values2045_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row213_lookup _).trans (OriginalRow227TriangleLookupRow213.block2045_lookup i)

theorem block2045_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 213 (276 + i.val) = (values2045[i.val]'(by rw [values2045_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2045_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213.block2043_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213.block2043_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213.block2044_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213.block2044_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213.block2045_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213.block2045_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213
