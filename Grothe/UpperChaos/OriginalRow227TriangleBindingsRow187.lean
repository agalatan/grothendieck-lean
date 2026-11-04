import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow187

theorem block1947_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 187 (186 + i.val) = some (values1947[i.val]'(by rw [values1947_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row187_lookup _).trans (OriginalRow227TriangleLookupRow187.block1947_lookup i)

theorem block1947_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 187 (186 + i.val) = (values1947[i.val]'(by rw [values1947_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1947_lookup i)

theorem block1948_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 187 (218 + i.val) = some (values1948[i.val]'(by rw [values1948_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row187_lookup _).trans (OriginalRow227TriangleLookupRow187.block1948_lookup i)

theorem block1948_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 187 (218 + i.val) = (values1948[i.val]'(by rw [values1948_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1948_lookup i)

theorem block1949_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 187 (250 + i.val) = some (values1949[i.val]'(by rw [values1949_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row187_lookup _).trans (OriginalRow227TriangleLookupRow187.block1949_lookup i)

theorem block1949_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 187 (250 + i.val) = (values1949[i.val]'(by rw [values1949_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1949_lookup i)

theorem block1950_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 187 (282 + i.val) = some (values1950[i.val]'(by rw [values1950_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row187_lookup _).trans (OriginalRow227TriangleLookupRow187.block1950_lookup i)

theorem block1950_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 187 (282 + i.val) = (values1950[i.val]'(by rw [values1950_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1950_lookup i)

theorem block1951_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 187 (314 + i.val) = some (values1951[i.val]'(by rw [values1951_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row187_lookup _).trans (OriginalRow227TriangleLookupRow187.block1951_lookup i)

theorem block1951_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 187 (314 + i.val) = (values1951[i.val]'(by rw [values1951_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1951_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1947_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1947_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1948_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1948_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1949_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1949_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1950_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1950_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1951_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187.block1951_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187
