import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow189

theorem block1956_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 189 (188 + i.val) = some (values1956[i.val]'(by rw [values1956_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row189_lookup _).trans (OriginalRow227TriangleLookupRow189.block1956_lookup i)

theorem block1956_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 189 (188 + i.val) = (values1956[i.val]'(by rw [values1956_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1956_lookup i)

theorem block1957_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 189 (220 + i.val) = some (values1957[i.val]'(by rw [values1957_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row189_lookup _).trans (OriginalRow227TriangleLookupRow189.block1957_lookup i)

theorem block1957_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 189 (220 + i.val) = (values1957[i.val]'(by rw [values1957_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1957_lookup i)

theorem block1958_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 189 (252 + i.val) = some (values1958[i.val]'(by rw [values1958_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row189_lookup _).trans (OriginalRow227TriangleLookupRow189.block1958_lookup i)

theorem block1958_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 189 (252 + i.val) = (values1958[i.val]'(by rw [values1958_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1958_lookup i)

theorem block1959_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 189 (284 + i.val) = some (values1959[i.val]'(by rw [values1959_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row189_lookup _).trans (OriginalRow227TriangleLookupRow189.block1959_lookup i)

theorem block1959_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 189 (284 + i.val) = (values1959[i.val]'(by rw [values1959_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1959_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1956_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1956_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1957_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1957_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1958_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1958_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1959_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189.block1959_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189
