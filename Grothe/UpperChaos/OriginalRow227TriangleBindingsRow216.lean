import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow216

theorem block2052_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 216 (215 + i.val) = some (values2052[i.val]'(by rw [values2052_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row216_lookup _).trans (OriginalRow227TriangleLookupRow216.block2052_lookup i)

theorem block2052_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 216 (215 + i.val) = (values2052[i.val]'(by rw [values2052_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2052_lookup i)

theorem block2053_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 216 (247 + i.val) = some (values2053[i.val]'(by rw [values2053_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row216_lookup _).trans (OriginalRow227TriangleLookupRow216.block2053_lookup i)

theorem block2053_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 216 (247 + i.val) = (values2053[i.val]'(by rw [values2053_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2053_lookup i)

theorem block2054_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 216 (279 + i.val) = some (values2054[i.val]'(by rw [values2054_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row216_lookup _).trans (OriginalRow227TriangleLookupRow216.block2054_lookup i)

theorem block2054_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 216 (279 + i.val) = (values2054[i.val]'(by rw [values2054_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2054_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216.block2052_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216.block2052_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216.block2053_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216.block2053_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216.block2054_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216.block2054_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216
