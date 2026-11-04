import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow194

theorem block1976_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 194 (193 + i.val) = some (values1976[i.val]'(by rw [values1976_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row194_lookup _).trans (OriginalRow227TriangleLookupRow194.block1976_lookup i)

theorem block1976_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 194 (193 + i.val) = (values1976[i.val]'(by rw [values1976_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1976_lookup i)

theorem block1977_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 194 (225 + i.val) = some (values1977[i.val]'(by rw [values1977_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row194_lookup _).trans (OriginalRow227TriangleLookupRow194.block1977_lookup i)

theorem block1977_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 194 (225 + i.val) = (values1977[i.val]'(by rw [values1977_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1977_lookup i)

theorem block1978_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 194 (257 + i.val) = some (values1978[i.val]'(by rw [values1978_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row194_lookup _).trans (OriginalRow227TriangleLookupRow194.block1978_lookup i)

theorem block1978_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 194 (257 + i.val) = (values1978[i.val]'(by rw [values1978_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1978_lookup i)

theorem block1979_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 194 (289 + i.val) = some (values1979[i.val]'(by rw [values1979_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row194_lookup _).trans (OriginalRow227TriangleLookupRow194.block1979_lookup i)

theorem block1979_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 194 (289 + i.val) = (values1979[i.val]'(by rw [values1979_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1979_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1976_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1976_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1977_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1977_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1978_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1978_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1979_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194.block1979_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194
