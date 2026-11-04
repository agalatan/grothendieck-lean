import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow188

theorem block1952_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 188 (187 + i.val) = some (values1952[i.val]'(by rw [values1952_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row188_lookup _).trans (OriginalRow227TriangleLookupRow188.block1952_lookup i)

theorem block1952_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 188 (187 + i.val) = (values1952[i.val]'(by rw [values1952_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1952_lookup i)

theorem block1953_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 188 (219 + i.val) = some (values1953[i.val]'(by rw [values1953_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row188_lookup _).trans (OriginalRow227TriangleLookupRow188.block1953_lookup i)

theorem block1953_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 188 (219 + i.val) = (values1953[i.val]'(by rw [values1953_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1953_lookup i)

theorem block1954_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 188 (251 + i.val) = some (values1954[i.val]'(by rw [values1954_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row188_lookup _).trans (OriginalRow227TriangleLookupRow188.block1954_lookup i)

theorem block1954_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 188 (251 + i.val) = (values1954[i.val]'(by rw [values1954_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1954_lookup i)

theorem block1955_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 188 (283 + i.val) = some (values1955[i.val]'(by rw [values1955_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row188_lookup _).trans (OriginalRow227TriangleLookupRow188.block1955_lookup i)

theorem block1955_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 188 (283 + i.val) = (values1955[i.val]'(by rw [values1955_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1955_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1952_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1952_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1953_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1953_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1954_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1954_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1955_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188.block1955_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188
