import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow197

theorem block1988_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 197 (196 + i.val) = some (values1988[i.val]'(by rw [values1988_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row197_lookup _).trans (OriginalRow227TriangleLookupRow197.block1988_lookup i)

theorem block1988_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 197 (196 + i.val) = (values1988[i.val]'(by rw [values1988_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1988_lookup i)

theorem block1989_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 197 (228 + i.val) = some (values1989[i.val]'(by rw [values1989_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row197_lookup _).trans (OriginalRow227TriangleLookupRow197.block1989_lookup i)

theorem block1989_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 197 (228 + i.val) = (values1989[i.val]'(by rw [values1989_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1989_lookup i)

theorem block1990_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 197 (260 + i.val) = some (values1990[i.val]'(by rw [values1990_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row197_lookup _).trans (OriginalRow227TriangleLookupRow197.block1990_lookup i)

theorem block1990_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 197 (260 + i.val) = (values1990[i.val]'(by rw [values1990_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1990_lookup i)

theorem block1991_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 197 (292 + i.val) = some (values1991[i.val]'(by rw [values1991_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row197_lookup _).trans (OriginalRow227TriangleLookupRow197.block1991_lookup i)

theorem block1991_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 197 (292 + i.val) = (values1991[i.val]'(by rw [values1991_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1991_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1988_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1988_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1989_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1989_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1990_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1990_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1991_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197.block1991_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197
