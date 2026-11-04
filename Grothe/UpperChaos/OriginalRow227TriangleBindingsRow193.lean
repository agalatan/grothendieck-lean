import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow193

theorem block1972_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 193 (192 + i.val) = some (values1972[i.val]'(by rw [values1972_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row193_lookup _).trans (OriginalRow227TriangleLookupRow193.block1972_lookup i)

theorem block1972_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 193 (192 + i.val) = (values1972[i.val]'(by rw [values1972_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1972_lookup i)

theorem block1973_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 193 (224 + i.val) = some (values1973[i.val]'(by rw [values1973_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row193_lookup _).trans (OriginalRow227TriangleLookupRow193.block1973_lookup i)

theorem block1973_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 193 (224 + i.val) = (values1973[i.val]'(by rw [values1973_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1973_lookup i)

theorem block1974_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 193 (256 + i.val) = some (values1974[i.val]'(by rw [values1974_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row193_lookup _).trans (OriginalRow227TriangleLookupRow193.block1974_lookup i)

theorem block1974_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 193 (256 + i.val) = (values1974[i.val]'(by rw [values1974_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1974_lookup i)

theorem block1975_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 193 (288 + i.val) = some (values1975[i.val]'(by rw [values1975_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row193_lookup _).trans (OriginalRow227TriangleLookupRow193.block1975_lookup i)

theorem block1975_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 193 (288 + i.val) = (values1975[i.val]'(by rw [values1975_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1975_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1972_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1972_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1973_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1973_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1974_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1974_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1975_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193.block1975_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193
